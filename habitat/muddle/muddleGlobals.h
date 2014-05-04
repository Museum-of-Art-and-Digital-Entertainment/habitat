/* 
   muddleGlobals.h: Global variables for Muddle.

   Chip Morningstar, Lucasfilm Ltd., 4-March-1986
 */

FILE		*classFile;
FILE		*classEquatesFile;
FILE		*pl1File;
FILE		*widthFile;

word		 classTable[TABLE_SIZE];
classType	*theClasses[TABLE_SIZE];
classType	*inputClasses;
int		 nextFreeClass;

int		 widthTable[TABLE_SIZE];
int		 flipOffsetTable[TABLE_SIZE];
int		 imageXLeftTable[TABLE_SIZE];
int		 imageXRightTable[TABLE_SIZE];
int		 imageYTable[TABLE_SIZE];
int		 imageCelWidthTable[TABLE_SIZE];

itemTableType	 images;
itemTableType	 sounds;
itemTableType	 actions;
itemTableType	 heads;

itemKindType	 currentItemKind;
int		 maxItem[(int)ACTION_LIST_ITEM];

#define HASH_TABLE_SIZE 512
#define HASH_TABLE_MASK 0x1FF
static symbolType	*symbolTable[HASH_TABLE_SIZE];
