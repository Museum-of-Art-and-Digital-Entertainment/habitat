/* 
   puddle.c: Differential post processor for Muddle

   Chip Morningstar, 23-February-1987
 */

#include <stdio.h>

typedef int		bool;
#define	TRUE	1
#define FALSE	0

typedef unsigned short	word;
typedef unsigned char	byte;

#define typeAlloc(type)	((type *) malloc(sizeof(type)))
#define byteAlloc(size) ((byte *) malloc(size))
#define makeWord(lo, hi) ((lo) | ((hi) << 8))

#define TABLE_SIZE	256

typedef struct {
	word	 offset[TABLE_SIZE];
	byte	*data;
} datTable;

datTable	oldData;
datTable	newData;
datTable	compositeData;
int		compTop;

typedef struct {
	int	location;
	int	size;
} chunkType;

chunkType	holeTable[TABLE_SIZE + 1];
int		holeCount;

void  combineTables();
void  copyRes();
bool  differentRes();
void  error();
void  fatalError();
int   fileSize();
void  fillHole();
void  findHoles();
byte  inputByte();
int   inputDatFile();
word  inputWord();
FILE *openFile();
void  outputByte();
void  outputDatFile();
void  outputWord();
int   resSize();

main(argc, argv)
  int	 argc;
  char	*argv[];
{
	int	 oldSize;
	int	 newSize;
	FILE	*outfyle;
	int	 i;

	if (argc < 3)
		fatalError("too few input files given\n");
	else if (argc > 4)
		fatalError("too many parameters\n");
	oldSize = inputDatFile(argv[1], "old .dat file", &oldData);
	newSize = inputDatFile(argv[2], "new .dat file", &newData);
	if (argc == 4)
		outfyle = openFile(argv[3], "wb", "output .dat file");
	else
		outfyle = stdout;
	findHoles(&oldData, &newData);
	compositeData.data = byteAlloc(oldSize + newSize);
	compTop = oldSize;
	for (i=0; i<oldSize; ++i)
		compositeData.data[i] = oldData.data[i];
	for (i=0; i<TABLE_SIZE; ++i)
		compositeData.offset[i] = oldData.offset[i];
	combineTables(&oldData, &newData, &compositeData);
	outputDatFile(&compositeData, outfyle);
}

  void
outputDatFile(table, fyle)
  datTable	*table;
  FILE		*fyle;
{
	int	 i;
	word	 aWord;

	for (i=0; i<TABLE_SIZE; ++i) {
		aWord = table->offset[i];
		if (aWord != 0xFFFF)
			aWord += TABLE_SIZE * sizeof(word);
		outputWord(aWord, fyle);
	}
	for (i=0; i<compTop; ++i)
		outputByte(table->data[i], fyle);
}

  int
inputDatFile(fileName, fileDescription, table)
  char		*fileName;
  char		*fileDescription;
  datTable	*table;
{
	FILE	*infyle;
	int	 i;
	int	 size;
	word	 aWord;

	infyle = openFile(fileName, "rb", fileDescription);
	for (i=0; i<TABLE_SIZE; ++i) {
		aWord = inputWord(infyle);
		if (aWord != 0xFFFF)
			aWord -= TABLE_SIZE * sizeof(word);
		table->offset[i] = aWord;
	}
	size = fileSize(fileName) - (TABLE_SIZE * sizeof(word));
	table->data = byteAlloc(size);
	for (i=0; i<size; ++i)
		table->data[i] = inputByte(infyle);
	fclose(infyle);
	return(size);
}

  void
combineTables(old, new, comp)
  datTable	*old;
  datTable	*new;
  datTable	*comp;
{
    int		i, j;
    bool	holeFilled;
    int		newSize;

    /*
       OK, here's the drill: compare corresponding resources in the old and
       new tables.  If they're the same, we want to use the old resource in
       the composite table.  If they're different, then we have two cases:
       it will fit in one of our holes or it won't.  If it will fit in one of
       our existing holes, then we need to put it there and reduce the size of
       the hole accordingly (if the hole's size shrinks to zero, it
       disappears, but that's OK and we do nothing special).  If it won't fit
       in a hole, then we have to append it onto the end of the file.  The
       problem with this is we don't know how much space to allocate onto the
       end until it's too late...so to be safe we assume ALL the new resources
       are really new and allocate a huge chunk of space, and then just don't
       use all of it.  Got it?
    */
    for (i=0; i<TABLE_SIZE; ++i) {
	if (differentRes(old, new, i)) {
	    newSize = resSize(new, i);
	    holeFilled = FALSE;
	    for (j=0; j<holeCount; ++j) {
		if (holeTable[j].size >= newSize) {
		    fillHole(comp, holeTable[j].location, new, i);
		    holeTable[j].size -= newSize;
		    holeFilled = TRUE;
		    break;
		}
	    }
	    if (!holeFilled) {
		fillHole(comp, compTop, new, i);
		compTop += newSize;
	    }
	} else {
	    copyRes(comp, old, i);
	}
    }
}

  void
copyRes(to, from, index)
  datTable	*to;
  datTable	*from;
  int		 index;
{
	int	 size;
	byte	*toPtr;
	byte	*fromPtr;

	size = resSize(from, index);
	if (size == 0) {
		to->offset[index] = 0xFFFF;
	} else {
		toPtr = to->data + to->offset[index];
		fromPtr = from->data + from->offset[index];
		while (size-- > 0)
			*toPtr++ = *fromPtr++;
	}
}

  void
fillHole(to, location, from, index)
  datTable	*to;
  int		 location;
  datTable	*from;
  int		 index;
{
	to->offset[index] = location;
	copyRes(to, from, index);
}

  bool
differentRes(oldTable, newTable, index)
  datTable	*oldTable;
  datTable	*newTable;
  int		 index;
{
	int	oldSize;
	int	newSize;
	int	i;

	oldSize = resSize(oldTable, index);
	newSize = resSize(newTable, index);

	if (oldSize != newSize)
		return(TRUE);
	for (i=0; i<oldSize; ++i) {
		if (oldTable->data[oldTable->offset[index] + i] !=
				newTable->data[newTable->offset[index] + i]) {
			return(TRUE);
		}
	}
	return(FALSE);
}

  int
resSize(table, index)
  datTable	*table;
  int		 index;
{
	int	offset;

	offset = table->offset[index];
	if (offset == 0xFFFF)
		return(0);
	return(makeWord(table->data[offset], table->data[offset + 1]));
}

  int
compareChunks(chunk1, chunk2)
  chunkType	*chunk1;
  chunkType	*chunk2;
{
	if (chunk1->location < chunk2->location)
		return(-1);
	else if (chunk1->location > chunk2->location)
		return(1);
	else
		return(0);
}

  void
findHoles(old, new)
  datTable	*old;
  datTable	*new;
{
    int		 i;
    chunkType	 resTab[TABLE_SIZE];
    int		 resCount;
    int		 endLocation;

    resCount = 0;
    for (i=0; i<TABLE_SIZE; ++i)
	if (old->offset[i] != 0xFFFF && !differentRes(old, new, i)) {
	    resTab[resCount].location = old->offset[i];
	    resTab[resCount].size = resSize(old, i);
	    resCount++;
	}
    qsort(resTab, resCount, sizeof(chunkType), compareChunks);
    holeCount = 0;
    endLocation = 0;
    for (i=0; i<resCount; ++i) {
	if (resTab[i].location > endLocation) {
	    holeTable[holeCount].location = endLocation;
	    holeTable[holeCount].size = resTab[i].location - endLocation;
	    ++holeCount;
	}
	endLocation = resTab[i].location + resTab[i].size;
    }
}


#include <sys/types.h>
#include <sys/stat.h>

  int
fileSize(name)
  char	*name;
{
	struct stat	statbuf;

	if (stat(name, &statbuf) != 0) {
		error("can't read file '%s'\n", name);
		perror("Unix says");
		return(-1);
	} else
		return(statbuf.st_size);
}

  void
outputByte(aByte, fyle)
  byte	 aByte;
  FILE	*fyle;
{
	putc(aByte, fyle);
}

  void
outputWord(aWord, fyle)
  word	 aWord;
  FILE	*fyle;
{
	outputByte(aWord & 0xFF, fyle);
	outputByte((aWord >> 8) & 0xFF, fyle);
}

  byte
inputByte(fyle)
  FILE	*fyle;
{
	return(getc(fyle));
}

  word
inputWord(fyle)
  FILE	*fyle;
{
	byte	lo, hi;

	lo = inputByte(fyle);
	hi = inputByte(fyle);
	return(makeWord(lo, hi));
}

  FILE *
openFile(fileName, mode, description)
  char	*fileName;
  char	*mode;
  char	*description;
{
	FILE	*result;

	if ((result = fopen(fileName, mode)) == NULL)
		fatalError("unable to open %s '%s'\n", description, fileName);
	return(result);
}

  void
error(message, arg1, arg2, arg3)
  char	*message;
  int	 arg1;
  int	 arg2;
  int	 arg3;
{
	fprintf(stderr, message, arg1, arg2, arg3);
}

  void
fatalError(message, arg1, arg2, arg3)
  char	*message;
  int	 arg1;
  int	 arg2;
  int	 arg3;
{
	fprintf(stderr, "fatal error: ");
	error(message, arg1, arg2, arg3);
	exit(1);
}
