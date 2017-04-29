/* 
   output.c: Output routines for Muddle.

   Chip Morningstar, 6-March-1986
 */

#include "muddleTypes.h"
#include "muddleGlobals.h"

void outputByte();
void outputWord();

static FILE	*outputFile;
int		 imageBase;
int		 actionBase;
int		 soundBase;
int		 headBase;
int		 numberOfHeads;
static int	 maxClass;

static int	 funnyBytes[3];
static int	 celWidth;

#define MAGIC_MIN 4
#define MAGIC_MAX 6
#define MAGIC_OFFSET 8
#define MAGIC_OFFSET_AGAIN 2

  byte
computeChecksum(buf, length)
  byte	*buf;
  int	 length;
{
	byte	result;

	result = 0;
	while (length--)
		result ^= *buf++;
	return(result);
}

  void
outputResults()
{
	void	outputClasses();
	void	outputThings();
	void	outputPl1Classes();
	void	outputPl1Widths();

	outputClasses();
	outputThings(&actions, TYPE_ACTION);
	outputThings(&images, TYPE_IMAGE);
	outputThings(&sounds, TYPE_SOUND);
	outputThings(&heads, TYPE_HEAD);
	outputPl1Classes();
	outputPl1Widths();
}

  void
outputClasses()
{
	int	i;
	bool	gapFlag;
	int	offset;
	int	size;
	void	outputOneClass();
	void	printClass();
	void	outputWord();
	void	outputBlock();

	offset = TABLE_SIZE * sizeof(word);
	outputFile = classFile;
	printf("{\n\t\"Classes\": [\n");
	gapFlag = FALSE;
	for (i=0; i<TABLE_SIZE; ++i) {
		if (theClasses[i] == NULL) {
			outputWord(0xFFFF);
			if (!gapFlag) {
				gapFlag = TRUE;
			}
			printf("\t\t{ \"index\":%3d, \"length\": 0, \"class\":null }", i);
		} else {
			outputWord(offset);
			size = ((classDescriptorHeaderType *)
				   theClasses[i]->classDescriptor)->
				   classDescriptorLength;
			offset += size;
			gapFlag = FALSE;
			printf("\t\t{ \"index\":%3d, \"length\":%2d, \"class\":\"%s\" }", i, size, theClasses[i]->name);
			fprintf(classEquatesFile, "define %s = %d\n",
				theClasses[i]->name, i);
		}
		if (i<TABLE_SIZE-1) {
			printf (",");
		}
		printf("\n");
	}
	printf("\t],\n\n");
	for (i=0; i<TABLE_SIZE; ++i)
		if (theClasses[i] != NULL) {
			outputOneClass(i);
			printClass(i);
		}
	fclose(classFile);
	fclose(classEquatesFile);
}

  void
printClass(index)
  int	index;
{
	classType			*class;
	classDescriptorHeaderType	*descriptor;
	byte				*dataPtr;
	int				 i;
	void				 printThing();

	class = theClasses[index];
	printf("\t\"%s\": {\n\t\t\"index\":%d,\n", class->name, index);
	descriptor = (classDescriptorHeaderType *)class->classDescriptor;
	printf("\t\t\"length\":%d,\n", descriptor->classDescriptorLength);
	printf("\t\t\"num images\":%d,\n", descriptor->numberOfImages);
	printf("\t\t\"num sounds\":%d,\n", descriptor->numberOfSounds);
	printf("\t\t\"num actions\":%d,\n", descriptor->numberOfActions);
	printf("\t\t\"images offset\":%d,\n", descriptor->offsetToImages);
	printf("\t\t\"sounds offset\":%d,\n", descriptor->offsetToSounds);
	printf("\t\t\"actions offset\":%d,\n", descriptor->offsetToActions);
	printf("\t\t\"data\": [\n");
	dataPtr = class->classDescriptor + SIZEOF_CLASS_DESCRIPTOR_HEADER_TYPE;
	if (dataPtr == class->classDescriptor + descriptor->offsetToImages)
		printf(" ],\n");
	else
	{
		while (dataPtr < class->classDescriptor + descriptor->offsetToImages)
		{
			printf("\t\t\t%d", *dataPtr++);
			if (dataPtr < (class->classDescriptor + descriptor->offsetToImages))
				printf(",");
			printf("\n");
		}
		printf("\t\t],\n");
	}
	printf("\t\t\"images\": [");
	if (descriptor->numberOfImages == 0)
		printf(" ],\n");
	else
	{
		printf("\n");
		for (i=0; i<descriptor->numberOfImages; ++i)
		{
			printThing(i, &images, *dataPtr++);
			if (i < descriptor->numberOfImages-1)
				printf(",");
			printf("\n");
		}
		printf("\t\t],\n");
	}
	printf("\t\t\"sounds\": [");
	if (descriptor->numberOfSounds == 0)
		printf(" ],\n");
	else
	{
		printf("\n");
		for (i=0; i<descriptor->numberOfSounds; ++i)
		{
			printThing(i, &sounds, *dataPtr++);
			if (i < descriptor->numberOfSounds-1)
				printf(",");
			printf("\n");
		}
		printf("\t\t],\n");
	}
	printf("\t\t\"actions\": [");
	if (descriptor->numberOfActions == 0)
		printf(" ]\n");
	else
	{
		printf("\n");
		for (i=0; i<descriptor->numberOfActions; ++i)
		{
			printThing(i, &actions, *dataPtr++);
			if (i < descriptor->numberOfActions-1)
				printf(",");
			printf("\n");
		}
		printf("\t\t]\n");
	}
	printf("\t},\n\n");
}

  void
outputOneClass(index)
  int	index;
{
	classType			*class;
	classDescriptorHeaderType	*descriptor;
	byte				*dataPtr;
	int				 i;
	void				 outputByte();
	void				 outputWord();

	class = theClasses[index];
	descriptor = (classDescriptorHeaderType *)class->classDescriptor;
	outputWord(descriptor->classDescriptorLength);
	outputByte(descriptor->type);
	outputByte(descriptor->offset);
	outputByte(computeChecksum(&(descriptor->numberOfImages),
		descriptor->classDescriptorLength - 5));
	outputByte(descriptor->numberOfImages);
	outputByte(descriptor->numberOfSounds);
	outputByte(descriptor->numberOfActions);
	outputByte(descriptor->offsetToImages);
	outputByte(descriptor->offsetToSounds);
	outputByte(descriptor->offsetToActions);
	dataPtr = class->classDescriptor + SIZEOF_CLASS_DESCRIPTOR_HEADER_TYPE;
	while (dataPtr < class->classDescriptor + descriptor->offsetToImages)
		outputByte(*dataPtr++);
	for (i=0; i<descriptor->numberOfImages; ++i)
		outputByte(*dataPtr++);
	for (i=0; i<descriptor->numberOfSounds; ++i)
		outputByte(*dataPtr++);
	for (i=0; i<descriptor->numberOfActions; ++i)
		outputByte(*dataPtr++);
}

  void
outputThings(thing, type)
  itemTableType	*thing;
  byte		 type;
{
	int	i;
	bool	gapFlag;
	int	offset;
	int	size;
	void	outputWord();
	void	outputFileData();

	printf("\t\"%s\": [\n", thing->name);
	outputFile = thing->outputFile;
	offset = TABLE_SIZE * sizeof(word);
	gapFlag = FALSE;
	for (i=0; i<TABLE_SIZE; ++i)
	{
		if (thing->fileNames[i] == NULL)
		{
			outputWord(0xFFFF);
			thing->table[i] = 0;
			if (!gapFlag) {
				gapFlag = TRUE;
			}
			printf("\t\t{ \"index\":%3d, \"length\":   0, \"filename\":null }", i);
		}
		else
		{
			size = fileSize(thing->fileNames[i]);
			if (size == -1) {
				thing->fileNames[i] = NULL;
				outputWord(0xFFFF);
				thing->table[i] = 0;
			} else {
				outputWord(offset);
				thing->table[i] = size;
				offset += size + 5;
			}
			gapFlag = FALSE;
			printf("\t\t{ \"index\":%3d, \"length\":%4d, \"filename\":\"%s\" }", i, size, thing->fileNames[i]);
		}
		if (i<TABLE_SIZE-1) {
			printf (",");
		}
		printf("\n");
	}
	printf("\t]");
	if (thing->name[0] != 'H')
		printf (",\n\n");
	else
		printf("\n}\n");

	for (i=0; i<TABLE_SIZE; ++i)
	{
		if (thing->fileNames[i] != NULL)
		{
			outputWord(thing->table[i] + 5);
			outputByte(type);
			outputByte(0);
			outputFileData(thing->table[i], thing->fileNames[i]);
			if (type == TYPE_IMAGE) {
				imageXLeftTable[i]  = funnyBytes[0] & ~3;
				imageXRightTable[i] = funnyBytes[1] & ~3;
				imageYTable[i]      = funnyBytes[2];
				imageCelWidthTable[i] = celWidth;
			}
		}
	}
	fclose(outputFile);
}

  void
printThing(number, itemTable, index)
  int		 number;
  itemTableType	*itemTable;
  byte		 index;
{
	printf("\t\t\t{ \"index\":%3d, \"ref index\":%3d, \"filename\":\"%s\" }", number, index,
		itemTable->fileNames[index]);
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
outputByte(aByte)
  int	aByte;
{
	putc(aByte, outputFile);
}

  void
outputWord(aWord)
  int	aWord;
{
	outputByte(aWord & 0xFF);
	outputByte((aWord >> 8) & 0xFF);
}

  void
outputBlock(block, length)
  byte	*block;
  int	 length;
{
	while (length-- > 0)
		outputByte(*block++);
}

  void
outputFileData(size, fileName)
  int	 size;
  char	*fileName;
{
	FILE	*inputFile;
	int	 i;
	int	 funnyOffset, funnyOffsetAgain;
	byte	 b;
	byte	 hugeBuffer[64000];
	byte	*bufptr;

	if ((inputFile = fopen(fileName, "rb")) == NULL) {
		error("couldn't open data file '%s'\n", fileName);
		perror("Unix says");
		outputByte(0);	/* null checksum */
		while (size-- > 0)
			outputByte(0);
	} else {
		funnyOffset = -1;
		funnyOffsetAgain = -1;
		bufptr = hugeBuffer;
		for (i=0; i<size; ++i) {
			b = getc(inputFile);
			if (MAGIC_MIN <= i && i<=MAGIC_MAX)
				funnyBytes[i - MAGIC_MIN] = (char)b;
			else if (i == 0)
				funnyOffset = (b & 0x1F) + MAGIC_OFFSET;
			else if (i == funnyOffset)
				funnyOffsetAgain = b + MAGIC_OFFSET_AGAIN;
			else if (i == funnyOffsetAgain)
				celWidth = 8 * (char)b;
			*bufptr++ = b;
		}
		outputByte(computeChecksum(hugeBuffer, size));
		fwrite(hugeBuffer, sizeof(byte), size, outputFile);
		fclose(inputFile);
	}
}

  void
outputPl1Widths()
{
	int	tabCounter;
	int	i, j;
	int	totalImages;
	int	imageCounter;
	int	base;
	int	increment;

    totalImages = totalImageCount();
    fprintf(widthFile, "%%replace MAX_CLASS_NUMBER by %d;\n", maxClass);
    fprintf(widthFile, "%%replace NUMBER_OF_IMAGES by %d;\n\n", totalImages);

    fprintf(widthFile, "declare image_base(0:MAX_CLASS_NUMBER) external static binary(15) init(");
    base = 1;
    tabCounter = 1;
    for (i=0; i<=maxClass; ++i) {
	if (--tabCounter == 0) {
	    fprintf(widthFile, "\n                        ");
	    tabCounter = 8;
	}
	increment = imageCount(i);
	if (increment == 0)
		fprintf(widthFile, "%3d", 0);
	else
		fprintf(widthFile, "%3d", base);
	base += increment;
	if (i != maxClass) fprintf(widthFile, ", ");
    }
    fprintf(widthFile, "\n                );\n");

    fprintf(widthFile, "declare image_width(0:NUMBER_OF_IMAGES) external static binary(15) init( 0,");
    tabCounter = 1;
    imageCounter = 0;
    for (i=0; i<=maxClass; ++i) {
	for (j=0; j<imageCount(i); ++j) {
	    if (--tabCounter == 0) {
	        fprintf(widthFile, "\n                        ");
	        tabCounter = 8;
	    }
	    fprintf(widthFile, "%3d", computeImageWidth(i, j));
	    if (++imageCounter != totalImages) fprintf(widthFile, ", ");
	}
    }
    fprintf(widthFile, "\n                );\n");

    fprintf(widthFile, "declare image_flipOffset(0:NUMBER_OF_IMAGES) external static binary(15) init( 0,");
    tabCounter = 1;
    imageCounter = 0;
    for (i=0; i<=maxClass; ++i) {
	for (j=0; j<imageCount(i); ++j) {
	    if (--tabCounter == 0) {
	        fprintf(widthFile, "\n                        ");
	        tabCounter = 8;
	    }
	    fprintf(widthFile, "%3d", computeImageFlipOffset(i, j));
	    if (++imageCounter != totalImages) fprintf(widthFile, ", ");
	}
    }
    fprintf(widthFile, "\n                );\n");

    fprintf(widthFile, "declare image_x_left(0:NUMBER_OF_IMAGES) external static binary(15) init( 0,");
    tabCounter = 1;
    imageCounter = 0;
    for (i=0; i<=maxClass; ++i) {
	for (j=0; j<imageCount(i); ++j) {
	    if (--tabCounter == 0) {
	        fprintf(widthFile, "\n                        ");
	        tabCounter = 8;
	    }
	    fprintf(widthFile, "%3d", computeImageXLeft(i, j));
	    if (++imageCounter != totalImages) fprintf(widthFile, ", ");
	}
    }
    fprintf(widthFile, "\n                );\n");

    fprintf(widthFile, "declare image_x_right(0:NUMBER_OF_IMAGES) external static binary(15) init( 0,");
    tabCounter = 1;
    imageCounter = 0;
    for (i=0; i<=maxClass; ++i) {
	for (j=0; j<imageCount(i); ++j) {
	    if (--tabCounter == 0) {
	        fprintf(widthFile, "\n                        ");
	        tabCounter = 8;
	    }
	    fprintf(widthFile, "%3d", computeImageXRight(i, j));
	    if (++imageCounter != totalImages) fprintf(widthFile, ", ");
	}
    }
    fprintf(widthFile, "\n                );\n");

    fprintf(widthFile, "declare image_y(0:NUMBER_OF_IMAGES) external static binary(15) init( 0,");
    tabCounter = 1;
    imageCounter = 0;
    for (i=0; i<=maxClass; ++i) {
	for (j=0; j<imageCount(i); ++j) {
	    if (--tabCounter == 0) {
	        fprintf(widthFile, "\n                        ");
	        tabCounter = 8;
	    }
	    fprintf(widthFile, "%3d", computeImageY(i, j));
	    if (++imageCounter != totalImages) fprintf(widthFile, ", ");
	}
    }
    fprintf(widthFile, "\n                );\n");

    fprintf(widthFile, "declare image_celWidth(0:NUMBER_OF_IMAGES) external static binary(15) init( 0,");
    tabCounter = 1;
    imageCounter = 0;
    for (i=0; i<=maxClass; ++i) {
	for (j=0; j<imageCount(i); ++j) {
	    if (--tabCounter == 0) {
	        fprintf(widthFile, "\n                        ");
	        tabCounter = 8;
	    }
	    fprintf(widthFile, "%3d", computeImageCelWidth(i, j));
	    if (++imageCounter != totalImages) fprintf(widthFile, ", ");
	}
    }
    fprintf(widthFile, "\n                );\n");
}

  int
computeImageWidth(cl, im)
  int	cl;
  int	im;
{
	classDescriptorHeaderType	*descriptor;
	byte				*dataPtr;

	descriptor = (classDescriptorHeaderType *)theClasses[cl]->
		classDescriptor;
	dataPtr = ((byte *) descriptor) + descriptor->offsetToImages;
     	return(widthTable[dataPtr[im]]);
}

  int
computeImageFlipOffset(cl, im)
  int	cl;
  int	im;
{
	classDescriptorHeaderType	*descriptor;
	byte				*dataPtr;

	descriptor = (classDescriptorHeaderType *)theClasses[cl]->
		classDescriptor;
	dataPtr = ((byte *) descriptor) + descriptor->offsetToImages;
     	return(flipOffsetTable[dataPtr[im]]);
}

  int
computeImageXLeft(cl, im)
  int	cl;
  int	im;
{
	classDescriptorHeaderType	*descriptor;
	byte				*dataPtr;

	descriptor = (classDescriptorHeaderType *)theClasses[cl]->
		classDescriptor;
	dataPtr = ((byte *) descriptor) + descriptor->offsetToImages;
     	return(imageXLeftTable[dataPtr[im]]);
}

  int
computeImageXRight(cl, im)
  int	cl;
  int	im;
{
	classDescriptorHeaderType	*descriptor;
	byte				*dataPtr;

	descriptor = (classDescriptorHeaderType *)theClasses[cl]->
		classDescriptor;
	dataPtr = ((byte *) descriptor) + descriptor->offsetToImages;
     	return(imageXRightTable[dataPtr[im]]);
}

  int
computeImageY(cl, im)
  int	cl;
  int	im;
{
	classDescriptorHeaderType	*descriptor;
	byte				*dataPtr;

	descriptor = (classDescriptorHeaderType *)theClasses[cl]->
		classDescriptor;
	dataPtr = ((byte *) descriptor) + descriptor->offsetToImages;
     	return(imageYTable[dataPtr[im]]);
}

  int
computeImageCelWidth(cl, im)
  int	cl;
  int	im;
{
	classDescriptorHeaderType	*descriptor;
	byte				*dataPtr;

	descriptor = (classDescriptorHeaderType *)theClasses[cl]->
		classDescriptor;
	dataPtr = ((byte *) descriptor) + descriptor->offsetToImages;
     	return(imageCelWidthTable[dataPtr[im]]);
}

  void
outputPl1Classes()
{
	int	tabCounter;
	int	i, j;
	int	resCount;

    maxClass = computeMaxClass();
    resCount = computeResourceCount();
    fprintf(pl1File, "%%replace MAX_CLASS_NUMBER by %d;\n", maxClass);
    fprintf(pl1File, "%%replace MAX_CLASS_NUMBER_PLUS_1 by %d;\n",
	maxClass + 1);
    fprintf(pl1File, "%%replace NUMBER_OF_RESOURCES by %d;\n\n", resCount);

    fprintf(pl1File, "declare 1 classes(0:MAX_CLASS_NUMBER) external static,\n");
    fprintf(pl1File, "         2        resources     pointer init((MAX_CLASS_NUMBER_PLUS_1)null()),\n");
    fprintf(pl1File, "         2        instance_size binary(15) init(");
    tabCounter = 1;
    for (i=0; i<=maxClass; ++i) {
	if (--tabCounter == 0) {
	    fprintf(pl1File, "\n                        ");
	    tabCounter = 8;
	}
	fprintf(pl1File, "%3d", computeInstanceSize(i));
	if (i != maxClass) fprintf(pl1File, ", ");
    }
    fprintf(pl1File, "\n                ),\n");
    fprintf(pl1File, "         2        image_count   binary(15) init(");
    tabCounter = 1;
    for (i=0; i<=maxClass; ++i) {
	if (--tabCounter == 0) {
	    fprintf(pl1File, "\n                        ");
	    tabCounter = 8;
	}
	fprintf(pl1File, "%3d", imageCount(i));
	if (i != maxClass) fprintf(pl1File, ", ");
    }
    fprintf(pl1File, "\n                ),\n");

    fprintf(pl1File, "         2        class_size    binary(15) init(");
    tabCounter = 1;
    for (i=0; i<=maxClass; ++i) {
	if (--tabCounter == 0) {
	    fprintf(pl1File, "\n                        ");
	    tabCounter = 8;
	}
	fprintf(pl1File, "%3d", computeClassDescriptorSize(i));
	if (i != maxClass) fprintf(pl1File, ", ");
    }
    fprintf(pl1File, "\n                );\n");

/*    fprintf(pl1File, "declare class_ref_count(0:MAX_CLASS_NUMBER) static binary(15)\n");
    fprintf(pl1File, "                         init((MAX_CLASS_NUMBER_PLUS_1) 0);\n\n");*/

    fprintf(pl1File, "declare 1 class based(class_ptr),\n");
    fprintf(pl1File, "         2        resources       pointer,\n");
    fprintf(pl1File, "         2        instance_size   binary(15),\n");
    fprintf(pl1File, "         2        image_count     binary(15),\n");
    fprintf(pl1File, "         2        class_size      binary(15);\n");
    fprintf(pl1File, "declare class_ptr external static pointer;\n\n");

    fprintf(pl1File, "declare resource_size(NUMBER_OF_RESOURCES) external static binary(15) init(");
    tabCounter = 1;
    for (i=0; i<resCount; ++i) {
	if (--tabCounter == 0) {
	    fprintf(pl1File, "\n                        ");
	    tabCounter = 8;
	}
	fprintf(pl1File, "%3d", computeResourceSize(i));
	if (i != resCount-1) fprintf(pl1File, ", ");
    }
    fprintf(pl1File, "\n                );\n");
/*    fprintf(pl1File, "declare resource_ref_count(NUMBER_OF_RESOURCES) static binary(15)\n");
    fprintf(pl1File, "                         init((NUMBER_OF_RESOURCES) 0);\n\n");*/

    for (i=0; i<=maxClass; ++i) {
	if (theClasses[i] != NULL) {
	    resCount = countResources(i);
	    fprintf(pl1File, "declare class_%d_resource_array(%d) external static binary(15) init(",
		i, resCount + 1);
	    tabCounter = 1;
	    for (j=0; j<resCount; ++j) {
		if (--tabCounter == 0) {
		    fprintf(pl1File, "\n                        ");
		    tabCounter = 8;
		}
		fprintf(pl1File, "%3d, ", resourceNumber(i, j));
	    }
	    fprintf(pl1File, "\n                0);\n");
	}
    }
    fprintf(pl1File, "\ninitialize_resource_pointers: procedure;\n");
    for (i=0; i<=maxClass; ++i) {
	if (theClasses[i] != NULL) {
	    fprintf(pl1File, "        classes(%d).resources = addr(class_%d_resource_array);\n",
		i, i);
	}
    }
    fprintf(pl1File, "end initialize_resource_pointers;\n");
}

  int
computeClassDescriptorSize(cl)
  int	cl;
{
	if (theClasses[cl] != NULL)
		return (((classDescriptorHeaderType *)theClasses[cl]->
			classDescriptor)->classDescriptorLength);
	else
		return (0);
}

  int
computeMaxClass()
{
	int	result;

	result = TABLE_SIZE;
	while (theClasses[--result] == NULL && result > 0)
		;
	return(result);
}

  int
countResources(cl)
  int	cl;
{
	classDescriptorHeaderType	*descriptor;

	if (theClasses[cl] != NULL) {
		descriptor = (classDescriptorHeaderType *)theClasses[cl]->
			classDescriptor;
		if (cl == CLASS_HEAD) {
			return(descriptor->numberOfSounds + descriptor->
				numberOfActions + numberOfHeads);
		} else {
			return(descriptor->numberOfImages + descriptor->
				numberOfSounds + descriptor->numberOfActions);
		}
	} else
		return (0);
}

  int
imageCount(cl)
  int	cl;
{
	classDescriptorHeaderType	*descriptor;

	if (theClasses[cl] != NULL) {
		if (cl == CLASS_HEAD) {
			return(numberOfHeads);
		} else {
			descriptor = (classDescriptorHeaderType *)
				theClasses[cl]->classDescriptor;
			return(descriptor->numberOfImages);
		}
	} else
		return (0);
}

  int
computeInstanceSize(cl)
  int	cl;
{
	byte				*dataPtr;

	if (theClasses[cl] != NULL) {
		dataPtr = theClasses[cl]->classDescriptor +
			SIZEOF_CLASS_DESCRIPTOR_HEADER_TYPE;
		return(*dataPtr);
	} else
		return(0);
}

  int
totalImageCount()
{
	int				 i;
	int				 result;

	result = 0;
	for (i=0; i<=maxClass; ++i)
		result += imageCount(i);
	return(result);
}

  int
computeResourceCount()
{
	imageBase = 0;
	actionBase = imageBase + countTable(&images);
	soundBase = actionBase + countTable(&actions);
	headBase = soundBase + countTable(&sounds);
	return(headBase + countTable(&heads));
}

  int
countTable(table)
  itemTableType *table;
{
	int	result;
	int	i;

	result = 0;
	for (i=TABLE_SIZE-1; i>=0; --i)
		if (table->fileNames[i] != NULL)
			break;
/*	for (i=0; i<TABLE_SIZE; ++i)
		if (table->fileNames[i] != NULL)
			++result;*/
	return(i+1);
}

  int
resourceNumber(cl, res)
  int	cl;
  int	res;
{
	classDescriptorHeaderType	*descriptor;
	byte				*dataPtr;
	int				 resBase;
	int				 offset;
	int				 imageCount;

	if (theClasses[cl] != NULL) {
		descriptor = (classDescriptorHeaderType *)theClasses[cl]->
			classDescriptor;
		imageCount = descriptor->numberOfImages;
		if (cl == CLASS_HEAD) {
			if (res < numberOfHeads) {
				return(headBase + res + 1);
			} else {
				res = res - numberOfHeads + imageCount;
			}
		}
		if (res < (offset = imageCount))
			resBase = imageBase;
		else if (res < (offset = offset + descriptor->numberOfSounds))
			resBase = soundBase;
		else if (res < offset + descriptor->numberOfActions)
			resBase = actionBase;
		else
			resBase = headBase;
		dataPtr = theClasses[cl]->classDescriptor +
			descriptor->offsetToImages;
		return(resBase + dataPtr[res] + 1);
	} else {
		return(0);
	}
}

  int
computeResourceSize(res)
  int	res;
{
	int	result;

	if (res < actionBase)
		result = images.table[res];
	else if (res < soundBase)
		result = actions.table[res - actionBase];
	else if (res < headBase)
		result = sounds.table[res - soundBase];
	else
		result = heads.table[res - headBase];
	result += 5;
	return(result);
}
