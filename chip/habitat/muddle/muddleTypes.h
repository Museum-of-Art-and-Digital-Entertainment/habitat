/* 
   muddleTypes.h: Type and constant definitions for Muddle.

   Chip Morningstar, Lucasfilm Ltd., 4-March-1986
 */

#include <stdio.h>

typedef int		bool;
#define	TRUE	1
#define FALSE	0

typedef unsigned short	word;
typedef unsigned char	byte;

#define typeAlloc(type)	((type *) malloc(sizeof(type)))
#define byteAlloc(size) ((byte *) malloc(size))

#define TABLE_SIZE	256

#define NO_TAG		-1

typedef enum {
	ACTION_ITEM, BYTE_ITEM, IMAGE_ITEM, SOUND_ITEM, WORD_ITEM, HEAD_ITEM,
	ACTION_LIST_ITEM, BYTE_LIST_ITEM, IMAGE_LIST_ITEM, SOUND_LIST_ITEM,
	 WORD_LIST_ITEM, HEAD_LIST_ITEM
			} itemKindType;

typedef enum {
	FILE_SOURCE, NAME_SOURCE
			} sourceKindType;


typedef struct {
	char		*string;
	sourceKindType	 source;
			} itemSourceType;

typedef struct {
	char		*label;
	itemKindType	 itemKind;
	itemSourceType	*itemSource;
	int		 tag;
	int		 width;
	int		 flipOffset;
			} itemType;

typedef struct itemListStruct {
	itemType		*item;
	struct itemListStruct	*nextItem;
			} itemListType;

typedef struct {
	itemType		*item;
	itemListType		*nextItem;
	itemListType		*tail;
			} itemListHeaderType;

typedef struct classStruct {
	char			*name;
	int			 tag;
	itemListType		*body;
	struct classStruct	*nextClass;
	byte			*classDescriptor;
			} classType;

typedef struct {
	word			 classDescriptorLength;
	byte			 type;
	byte			 offset;
	byte			 checksum;
	byte			 numberOfImages;
	byte			 numberOfSounds;
	byte			 numberOfActions;
	byte			 offsetToImages;
	byte			 offsetToSounds;
	byte			 offsetToActions;
			} classDescriptorHeaderType;
#define SIZEOF_CLASS_DESCRIPTOR_HEADER_TYPE 11

#define STANDARD_CLASS_SIZE sizeof(classDescriptorHeaderType)

typedef struct numberListStruct {
	int			 number;
	struct numberListStruct	*nextNumber;
			} numberListType;

typedef struct {
	int			 number;
	numberListType		*nextNumber;
	numberListType		*tail;
			} numberListHeaderType;

typedef struct symbolStruct {
	char			*name;
	itemKindType		 itemKind;
	itemType		*item;
	struct symbolStruct	*next;
			} symbolType;

typedef struct {
	word			  table[TABLE_SIZE];
	char			 *fileNames[TABLE_SIZE];
	FILE			 *outputFile;
	int			  nextFreeEntry;
	char			 *name;
} itemTableType;

#define TYPE_OBJECT 0
#define TYPE_CLASS 1
#define TYPE_IMAGE 2
#define TYPE_ACTION 3
#define TYPE_SOUND 4
#define TYPE_HEAD 5

#define CLASS_HEAD 127
