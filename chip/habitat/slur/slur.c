/* 

   slur: Stupid Little Utility for Riddle

   Turns contents vectors from Aric's region editor into riddle fragments.

   Chip Morningstar
   Lucasfilm Ltd.
   18-June-1986

 */

#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>
#include "class_defs.h"

typedef unsigned char	byte;
typedef unsigned short	word;
typedef int		bool;
#define TRUE		1
#define FALSE		0

typedef struct {
		byte	class;
		byte	isContainer;
		byte	style;
		byte	x;
		byte	y;
		byte	orientation;
		byte	animationState;
		byte	containedBy;
} object;

#define THE_REGION	0

#if 0
#define SIZE_OFFSET	12	/* was 11, then we added LRC checking */
#else
#define SIZE_OFFSET	11	/* Make it work with slur/class2.dat */
#endif

#define CLASS_MAX	256
int	 classSizes[CLASS_MAX];
char	*className[CLASS_MAX] = {
#include "classNames.h"
};

#define OBJECT_MAX	256
object	*objects[OBJECT_MAX];

int	 currentContainer;
char	*regionName = NULL;
int	 tabLevel;

char	*northNeighbor = NULL;
char	*southNeighbor = NULL;
char	*eastNeighbor = NULL;
char	*westNeighbor = NULL;
char	*direction = NULL;
char	*teleportAddress = NULL;
bool	 turfFlag = FALSE;
bool	 shortenObjs = FALSE;
bool	 debugLog = FALSE;

char	*classFileName = "class.dat";
FILE	*classFyle;

FILE	*cvFyle;
FILE	*ofyle;

#define CV_MAX		256
byte	 contentsVector[CV_MAX];

int	fileIsValid();
void	examineObjects();
void	initialize();
void	inputContentsVector();
int	inputContentsVectorChunk();
void	inputData();
void	inputNoidClassList();
/* byte	*malloc(); */
void	repairObject();
void	outputObject();
void	outputRiddleFragment();
byte	readByte();
void	readClassFile();
word	readWord();
void	tab();
void	outputObjectDebug();

  int
main(argc, argv)
  int	 argc;
  char	*argv[];
{
	cvFyle = stdin;
	ofyle = stdout;

	initialize(argc, argv);
	readClassFile();
	inputContentsVector();
	outputRiddleFragment();
}

  void
initialize(argc, argv)
  int	 argc;
  char	*argv[];
{
	int	i;
	int	j;
	char   **args;
	char	*arg;

	for (i=0; i<OBJECT_MAX; ++i) {
		objects[i] = NULL;
	}

	args = argv + 1;
	for (i=1; i<argc; i++) {
		arg = *args++;
		if (*arg != '-') {
			if ((cvFyle = fopen(arg, "r")) == NULL) {
				fprintf(stderr, "slur: can't open cv file '%s'\n", arg);
				exit(1);
			}

			if (!fileIsValid(arg)) {
				fprintf(stderr, "slur: cv file is empty or invalid\n");
				exit(1);
			}
			continue;
		}
		for (j=1; arg[j]!='\0'; j++) switch (arg[j]) {

		case 'c':
			if (++i >= argc) {
				fprintf(stderr, "slur: no class file name given on line after '-c'\n");
				exit(1);
			} else {
				classFileName = *args++;
			}

			if (!fileIsValid(classFileName)) {
				fprintf(stderr, "slur: class file is empty or invalid\n");
				exit(1);
			}
			continue;

		case 'o':
			if (++i >= argc) {
				fprintf(stderr, "slur: no output file name given online after '-o'\n");
				exit(1);
			} else if ((ofyle = fopen(*args, "w")) == NULL) {
				fprintf(stderr, "slur: can't open output file '%s'\n", *args);
				exit(1);
			}
			args++;
			continue;

		case 't':
			turfFlag = TRUE;
			continue;
		case 'r':
			if (++i >= argc) {
				fprintf(stderr, "slur: no region name given on line after '-r'\n");
				exit(1);
			} else {
				regionName = *args++;
			}
			continue;

		case 'd':
			if (++i >= argc) {
				fprintf(stderr, "slur: no orientation direction given on line after '-d'\n");
				exit(1);
			} else {
				direction = *args++;
			}
			continue;

		case 'n':
			if (++i >= argc) {
				fprintf(stderr, "slur: no north neighbor name given on line after '-n'\n");
				exit(1);
			} else {
				northNeighbor = *args++;
			}
			continue;

		case 's':
			if (++i >= argc) {
				fprintf(stderr, "slur: no south neighbor name given on line after '-s'\n");
				exit(1);
			} else {
				southNeighbor = *args++;
			}
			continue;

		case 'e':
			if (++i >= argc) {
				fprintf(stderr, "slur: no east neighbor name given on line after '-e'\n");
				exit(1);
			} else {
				eastNeighbor = *args++;
			}
			continue;

		case 'w':
			if (++i >= argc) {
				fprintf(stderr, "slur: no west name given on line after '-w'\n");
				exit(1);
			} else {
				westNeighbor = *args++;
			}
			continue;

		case 'p':
			if (++i >= argc) {
				fprintf(stderr, "slur: no teleport address given on line after '-p'\n");
				exit(1);
			} else {
				teleportAddress = *args++;
			}
			continue;

		case 'S':
			shortenObjs = TRUE;
			continue;

		case 'v':
			debugLog = TRUE;
			continue;

		default:
			fprintf(stderr, "slur: bad command line flag '%s'\n",
				arg);
			continue;
		}
	}

	if ((classFyle = fopen(classFileName, "r")) == NULL) {
		fprintf(stderr, "slur: can't open class file '%s'\n",
			classFileName);
		exit(1);
	}
}

  int
fileIsValid(path)
  char *path;
{
	struct stat sb;

	if (stat(path, &sb) == 0) {
		if (sb.st_size > 0)
			return(TRUE);
	}
	return(FALSE);
}

  void
readClassFile()
{
	int	 i;

	for (i=0; i<CLASS_MAX; ++i)
		classSizes[i] = readWord(classFyle);
	for (i=0; i<CLASS_MAX; ++i) {
		if (classSizes[i] == 0xFFFF)
			classSizes[i] = 0;
		else {
			fseek(classFyle, classSizes[i]+SIZE_OFFSET, 0);
			classSizes[i] = readByte(classFyle) & 0x7F;
		}
	}
}

  void
inputContentsVector()
{
	currentContainer = THE_REGION;
	while ((currentContainer = inputContentsVectorChunk()) != 0)
		;
}

  int
inputContentsVectorChunk()
{
	int ret;

	inputNoidClassList();
	inputData();

	if (debugLog)
	    fprintf(stderr, "last offset %ld\n", ftell(cvFyle));

	/* Some files use 0xAA as padding at the end */
	ret = readByte(cvFyle);
	if (ret == 0xaa)
		ret = 0;
	return(ret);
}

  void
inputNoidClassList()
{
	byte	*cvPtr;

	cvPtr = contentsVector;
	while ((*cvPtr++ = readByte(cvFyle)) != 0)
		*cvPtr++ = readByte(cvFyle);
}

  void
inputData()
{
	byte	*cvPtr;
	byte	*optr;
	int	 size;
	int	 noid;
	int	 class;
	cvPtr = contentsVector;
	while (*cvPtr != 0) {
		noid = *cvPtr++;
		class = *cvPtr++;
		size = classSizes[class];
		optr = malloc(size + 1);
		objects[noid] = (object *)optr;
		*optr++ = class;
		*optr++ = FALSE;
		if (debugLog) {
			fprintf(stderr, "* noid %d class %d size %d: ",
			    noid, class, size);
		}

		/*
		 * There's a mismatch between what the class table says the
		 * sizes should be and what they are. It appears Chip made
		 * a change to make tables a container at some point, but
		 * some of the .reg files we have were created before that
		 * change. So we need to decide whether to trust these sizes
		 * or override and use shorter ones.
		 *
		 * TODO: auto-detect these since first 3 bytes should be 00
		 */
		if (shortenObjs) {
			if ((class == CLASS_TABLE || class == CLASS_CHAIR) &&
			    size == 9)
			    size = 6;
			else if ((class == CLASS_PICTURE) && size == 8)
			    size = 6;
		}

		while (size-- > 0) {
			*optr = readByte(cvFyle);
			if (debugLog)
				fprintf(stderr, "%02x ", *optr);
			optr++;
		}
		if (debugLog) {
		    fprintf(stderr, "\n");
		    outputObjectDebug(objects[noid]);
		}
	}
}

  byte
readByte(fyle)
  FILE	*fyle;
{
	return((byte)getc(fyle));
}

  word
readWord(fyle)
  FILE	*fyle;
{
	byte	lo;
	byte	hi;

	lo = readByte(fyle);
	hi = readByte(fyle);
	return((hi << 8) + lo);
}

  void
outputRiddleFragment()
{
	int	i;

	examineObjects();
	if (regionName == NULL)
		fprintf(ofyle, "@region {\n");
	else
		fprintf(ofyle, "@region $ %s {\n", regionName);
	if (northNeighbor != NULL)
		fprintf(ofyle, "    north: %s.l;\n", northNeighbor);
	if (southNeighbor != NULL)
		fprintf(ofyle, "    south: %s.l;\n", southNeighbor);
	if (eastNeighbor != NULL)
		fprintf(ofyle, "    east: %s.l;\n", eastNeighbor);
	if (westNeighbor != NULL)
		fprintf(ofyle, "    west: %s.l;\n", westNeighbor);
	if (turfFlag)
		fprintf(ofyle, "    region_owner: 0.l;\n");
	if (direction != NULL)
		fprintf(ofyle, "    region_orientation: %s;\n", direction);
	fprintf(ofyle, "    [\n");
	tabLevel = 2;
	for (i=0; i<OBJECT_MAX; ++i)
		if (objects[i] != NULL && objects[i]->containedBy == 0) {
			repairObject(objects[i]);
			outputObject(objects[i]);
		}
	fprintf(ofyle, "    ]\n");
	fprintf(ofyle, "}\n");
}

  void
examineObjects()
{
	int	i;

	for (i=0; i<OBJECT_MAX; ++i) {
		if (objects[i] != NULL)
			objects[i]->isContainer = FALSE;
	}
	for (i=0; i<OBJECT_MAX; ++i) {
		if (objects[i] != NULL && objects[i]->containedBy != 0)
			objects[objects[i]->containedBy]->isContainer = TRUE;
	}
}

#define OPEN_BIT 0x01
#define CLOSED_BIT 0x00
#define UNLOCKED_BIT 0x02
#define LOCKED_BIT 0x00
#define OPEN OPEN_BIT | UNLOCKED_BIT
#define CLOSED CLOSED_BIT | UNLOCKED_BIT
#define LOCKED CLOSED_BIT | LOCKED_BIT

  void
repairObject(obj)
  object	*obj;
{
	byte	*dataPtr;

	dataPtr = ((byte *)obj) + 8;
	switch (obj->class) {

		case CLASS_BAG:
		case CLASS_BOX:
		case CLASS_CHEST:
		case CLASS_DOOR:
		case CLASS_HOLE:
		case CLASS_SAFE:
			dataPtr[0] = CLOSED;
			break;
		case CLASS_COUNTERTOP:
		case CLASS_DISPLAY_CASE:
		case CLASS_GARBAGE_CAN:
		case CLASS_TABLE:
		case CLASS_VENDO_FRONT:
		case CLASS_VENDO_INSIDE:
		case CLASS_PAWN_MACHINE:
		case CLASS_GLUE:
		case CLASS_CRAT_IN_A_BOX:
			dataPtr[0] = OPEN;
			break;
		case CLASS_BED:
		case CLASS_CHAIR:
		case CLASS_COUCH:
			dataPtr[0] = OPEN;
			break;
		case CLASS_AMULET:
		case CLASS_GEMSTONE:
		case CLASS_MAGIC_STAFF:
		case CLASS_MAGIC_WAND:
		case CLASS_RING:
			dataPtr[0] = 1;
			break;
		case CLASS_AQUARIUM:
		case CLASS_BOTTLE:
			dataPtr[0] = obj->animationState;
			break;
		case CLASS_DRUGS:
			dataPtr[0] = 5;
			break;
		case CLASS_ESCAPE_DEVICE:
			dataPtr[0] = 3;
			break;
		case CLASS_FAKE_GUN:
			dataPtr[0] = obj->animationState;
		case CLASS_FLASHLIGHT:
			dataPtr[0] = 0;
			break;
		case CLASS_FLOOR_LAMP:
			dataPtr[0] = 1;
			break;
		case CLASS_KEY:
			dataPtr[0] = dataPtr[1] = 0xFF;
			break;
		case CLASS_KNICK_KNACK:
			dataPtr[1] = 0;
			dataPtr[0] = 0;
			break;
		case CLASS_PLANT:
		case CLASS_ROCK:
			dataPtr[0] = 1;
			break;
		case CLASS_TOKENS:
			dataPtr[0] = 10;
			dataPtr[1] = 0;
			break;
	}
}

  void
outputObject(obj)
  object	*obj;
{
	byte	*dataPtr;
	int	 i;

	tab();
	fprintf(ofyle, "@%s { ", className[obj->class]);
	fprintf(ofyle, "x:%d; y:%d; or:%d; ", obj->x, obj->y, obj->orientation);
	if (obj->style != 0)
		fprintf(ofyle, "style:%d; ", obj->style);
	if (obj->animationState != 0)
		fprintf(ofyle, "gr_state:%d; ", obj->animationState);
	if (classSizes[obj->class] == 6) {
		fprintf(ofyle, "}\n");
		return;
	} else {
		dataPtr = ((byte *)obj) + 8;
		fprintf(ofyle, "\n"); tabLevel++;
		for (i=7; i<=classSizes[obj->class]; ++i) {
			tab(); fprintf(ofyle, "%d:%d;\n", i+1, *dataPtr++);
		}

#ifdef DUMP_TELEPORT_ADDRESSES
		/*
		 * Teleports and elevators have an additional list of
		 * addresses in this form of a parameter:
		 *
		 *     teleport_address: 32, 32, 32, ... ;
		 *
		 * However, we don't have any .reg files that provide any
		 * useful data for these. Instead, it's just 20 empty values
		 * (all 32). We don't print these by default, relying on later
		 * processing steps to add in useful addresses.
		 */
		if (obj->class == CLASS_TELEPORT_BOOTH || obj->class ==
				CLASS_ELEVATOR) {
			i = 0;
			tab(); fprintf(ofyle, "teleport_address: ");
			if (teleportAddress != NULL) {
			    for (; i<20 & teleportAddress[i]!='\0'; ++i) {
				if (i < 19)
				   fprintf(ofyle, "%d, ", teleportAddress[i]);
				else
				   fprintf(ofyle, "%d;\n",teleportAddress[i]);
			    }
			}
			for (; i<20; ++i) {
				if (i < 19)
					fprintf(ofyle, "%d, ", ' ');
				else
					fprintf(ofyle, "%d;\n", ' ');
			}
		}
#endif /* DUMP_TELEPORT_ADDRESSES */

		tabLevel--;
	}
	if (obj->isContainer) {
		tabLevel++;
		fprintf(ofyle, "\n"); tab(); fprintf(ofyle, "[\n");
		tabLevel++;
		for (i=0; i<OBJECT_MAX; ++i) {
			if (objects[i] != NULL && objects[objects[i]->
					containedBy] == obj) {
				repairObject(objects[i]);
				outputObject(objects[i]);
			}
		}
		tabLevel--;
		tab(); fprintf(ofyle, "]\n");
		tabLevel--;
	}
	tab(); fprintf(ofyle, "}\n");
}

  void
tab()
{
	int	i;

	for (i=tabLevel; i>0; --i)
		fprintf(ofyle, "    ");
}

/*
 * Dump an object to stderr, saving and restoring the previous output file
 * handle in between. This is needed because parse errors tend to make slur
 * crash before it can generate useful output on valid objects.
 */
  void
outputObjectDebug(obj)
  object	*obj;
{
	FILE	*ofyleBackup;

	ofyleBackup = ofyle;
	ofyle = stderr;
	outputObject(obj);
	ofyle = ofyleBackup;
}
