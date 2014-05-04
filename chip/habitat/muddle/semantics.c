/* 
   semantics.c: Routines to do the guts of Muddle.

   Chip Morningstar, Lucasfilm Ltd., 4-March-1986
 */

#include "muddleTypes.h"
#include "muddleGlobals.h"

int	 dataSize;
int	 numberOfImages;
int	 numberOfSounds;
int	 numberOfActions;
int	 numberOfHeads = 0;
byte	*dataPtr;
byte	*imagePtr;
byte	*soundPtr;
byte	*actionPtr;
byte	*headPtr;
char	*mostRecentLabel = "<top of file>";

  void
noteClass(class)
  classType	*class;
{
	static classType	*inputClassesTail;

	class->nextClass = NULL;
	if (inputClasses == NULL) {
		inputClasses = class;
	} else {
		inputClassesTail->nextClass = class;
	}
	inputClassesTail = class;
}

  void
processClasses(classes)
  classType	*classes;
{
	void	processOneClass();

	images.nextFreeEntry = maxItem[(int)IMAGE_ITEM];
	actions.nextFreeEntry = maxItem[(int)ACTION_ITEM];
	sounds.nextFreeEntry = maxItem[(int)SOUND_ITEM];
	heads.nextFreeEntry = maxItem[(int)HEAD_ITEM];

	while (classes != NULL) {
		processOneClass(classes);
		classes = classes->nextClass;
	}
}

  void
processOneClass(class)
  classType	*class;
{
	int	size;
	void	assignClassNumber();
	void	fillInClassDescriptor();

	class->classDescriptor = byteAlloc(size = computeClassSize(class));
	assignClassNumber(class);
	fillInClassDescriptor(class, size);
}

  void
assignClassNumber(class)
  classType	*class;
{
	if (class->tag != NO_TAG) {
		if (class->tag >= TABLE_SIZE) {
			error("class %s: requested class number %d too high\n", class->name, class->tag);
		} else if (theClasses[class->tag] != NULL) {
			error("class %s: requested class number %d already assigned\n", class->name, class->tag);
		} else {
			theClasses[class->tag] = class;
			return;
		}
	}
	while (nextFreeClass < TABLE_SIZE && theClasses[nextFreeClass] != NULL)
		nextFreeClass++;
	if (nextFreeClass >= TABLE_SIZE)
		fatalError("more than %d classes\n", TABLE_SIZE);
	theClasses[nextFreeClass] = class;
	class->tag = nextFreeClass;
	nextFreeClass++;
}

  void
fillInClassDescriptor(class, size)
  classType	*class;
  int		 size;
{
	classDescriptorHeaderType	*header;
	void				 fillInFromItemList();

	classTable[class->tag] = size;
	header = (classDescriptorHeaderType *)class->classDescriptor;
	header->classDescriptorLength = size;
	header->type = TYPE_CLASS;
	header->offset = class->tag;
	header->numberOfImages = numberOfImages;
	header->numberOfSounds = numberOfSounds;
	header->numberOfActions = numberOfActions;
	header->offsetToImages = SIZEOF_CLASS_DESCRIPTOR_HEADER_TYPE + dataSize;
	header->offsetToSounds = header->offsetToImages + numberOfImages;
	header->offsetToActions = header->offsetToSounds + numberOfSounds;
	dataPtr = (byte *)header + SIZEOF_CLASS_DESCRIPTOR_HEADER_TYPE;
	imagePtr = dataPtr + dataSize;
	soundPtr = imagePtr + numberOfImages;
	actionPtr = soundPtr + numberOfSounds;
	fillInFromItemList(class->body);
}

  int
computeClassSize(class)
  classType	*class;
{
	int	size;

	numberOfImages = 0;
	numberOfSounds = 0;
	numberOfActions = 0;
/*	numberOfHeads = 0;*/
	dataSize = 0;
	size = SIZEOF_CLASS_DESCRIPTOR_HEADER_TYPE;
	size += countItemListSize(class->body);
	return(size);
}

  int
countItemListSize(itemList)
  itemListType	*itemList;
{
	int	size;

	size = 0;
	while (itemList != NULL) {
		size += countItemSize(itemList->item);
		itemList = itemList->nextItem;
	}
	return(size);
}

  int
countItemSize(item)
  itemType	*item;
{
	int	result;

	switch (item->itemKind) {
	case BYTE_ITEM:
		dataSize += sizeof(byte);
		return(sizeof(byte));

	case ACTION_ITEM:
		numberOfActions++;
		return(sizeof(byte));

	case HEAD_ITEM:
		numberOfHeads++;
		return(0);

	case IMAGE_ITEM:
		numberOfImages++;
		return(sizeof(byte));

	case SOUND_ITEM:
		numberOfSounds++;
		return(sizeof(byte));

	case WORD_ITEM:
		dataSize += sizeof(word);
		return(sizeof(word));

	case BYTE_LIST_ITEM:
		result = countNumberListSize(item->itemSource) * sizeof(byte);
		dataSize += result;
		return(result);

	case WORD_LIST_ITEM:
		result = countNumberListSize(item->itemSource) * sizeof(word);
		dataSize += result;
		return(result);

	case ACTION_LIST_ITEM:
	case HEAD_LIST_ITEM:
	case IMAGE_LIST_ITEM:
	case SOUND_LIST_ITEM:
		return(countItemListSize(item->itemSource));

	default:
		fatalError("bad item type %d in countItemSize (internal botch)\n", item->itemKind);
	}
}

  void
fillInFromItemList(itemList)
  itemListType	*itemList;
{
	void	fillInFromItem();

	while (itemList != NULL) {
		fillInFromItem(itemList->item);
		itemList = itemList->nextItem;
	}
}

  void
fillInFromItem(item)
  itemType	*item;
{
	void	fillInBytes();
	void	fillInWords();
	byte	lookupThing();

	if (item->label != NULL)
		mostRecentLabel = item->label;

	switch (item->itemKind) {
	case ACTION_ITEM:
		*actionPtr++ = lookupThing(item->itemSource, ACTION_ITEM,
			item->tag, 0, 0);
		break;

	case HEAD_ITEM:
		lookupThing(item->itemSource, HEAD_ITEM, item->tag, 0, 0);
		break;

	case BYTE_LIST_ITEM:
		fillInBytes(item->itemSource);
		break;

	case IMAGE_ITEM:
		*imagePtr++ = lookupThing(item->itemSource, IMAGE_ITEM,
			item->tag, item->width, item->flipOffset);
		break;

	case SOUND_ITEM:
		*soundPtr++ = lookupThing(item->itemSource, SOUND_ITEM,
			item->tag, 0, 0);
		break;

 	case WORD_LIST_ITEM:
		fillInWords(item->itemSource);
		break;

	case ACTION_LIST_ITEM:
	case HEAD_LIST_ITEM:
	case IMAGE_LIST_ITEM:
	case SOUND_LIST_ITEM:
		fillInFromItemList(item->itemSource);
		break;

	default:
		fatalError("bad item type %d in fillInFromItem (internal botch)\n", item->itemKind);
	}
}

  void
fillInByte(aByte)
  int	aByte;
{
	if (aByte > 0xFF) {
		error("value %d too large to fit in a byte, most recent label = %s\n", aByte, mostRecentLabel);
		aByte = 0;
	}
	*dataPtr++ = aByte;
}

  void
fillInBytes(bytes)
  numberListType	*bytes;
{
	while (bytes != NULL) {
		fillInByte(bytes->number);
		bytes = bytes->nextNumber;
	}
}

  void
fillInWord(aWord)
  int	aWord;
{
	if (aWord > 0xFFFF) {
		error("value %d too large to fit in a word, most recent label = %s\n", aWord, mostRecentLabel);
		aWord = 0;
	}
	fillInByte(aWord & 0xFF);
	fillInByte((aWord >> 8) & 0xFF);
}

  void
fillInWords(words)
  numberListType	*words;
{
	while (words != NULL) {
		fillInWord(words->number);
		words = words->nextNumber;
	}
}

  byte
lookupThing(source, itemKind, tag, width, flipOffset)
  itemSourceType	*source;
  itemKindType		 itemKind;
  int			 tag;
  int			 width;
  int			 flipOffset;
{
	byte		 result;
	symbolType	*symbol;
	byte		 installOrLookupItem();
	symbolType	*lookupSymbol();

	while (source->source == NAME_SOURCE) {
		symbol = lookupSymbol(source->string);
		if (symbol == NULL) {
			error("symbol %s undefined\n", source->string);
			return(0);
		} else if (symbol->itemKind != itemKind) {
			error("symbol %s is the wrong kind of thing\n",
				source->string);
			return(0);
		} else {
			source = symbol->item->itemSource;
			tag = symbol->item->tag;
			width = symbol->item->width;
			flipOffset = symbol->item->flipOffset;
		}
	}
	result = installOrLookupItem(source->string, itemKind, tag);
	if (itemKind == IMAGE_ITEM) {
		widthTable[result] = width;
		flipOffsetTable[result] = flipOffset;
	}
	return(result);
}

  byte
installOrLookupItem(fileName, itemKind, tag)
  char		*fileName;
  itemKindType	 itemKind;
  int		 tag;
{
	byte	tableItem();

	switch (itemKind) {
	case ACTION_ITEM:
		return(tableItem(&actions, fileName, tag));

	case HEAD_ITEM:
		return(tableItem(&heads, fileName, tag));

	case IMAGE_ITEM:
		return(tableItem(&images, fileName, tag));

	case SOUND_ITEM:
		return(tableItem(&sounds, fileName, tag));

	case BYTE_ITEM:
	case WORD_ITEM:
		fatalError("data item inside installOrLookupItem(%s)\n", fileName);

	case ACTION_LIST_ITEM:
	case BYTE_LIST_ITEM:
	case HEAD_LIST_ITEM:
	case IMAGE_LIST_ITEM:
	case SOUND_LIST_ITEM:
	case WORD_LIST_ITEM:
		fatalError("list item inside installOrLookupItem(%s)\n",
			fileName);

	default:
		fatalError("unknown item %d inside installOrLookupItem(%s)\n",
			itemKind, fileName);
		exit(1);
	}
}

  byte
tableItem(itemTable, fileName, tag)
  itemTableType	*itemTable;
  char		*fileName;
  int		 tag;
{
	int	i;

	for (i=0; i<TABLE_SIZE; ++i) {
		if (itemTable->fileNames[i] == NULL)
			continue;
		else if (strcmp(itemTable->fileNames[i], fileName) == 0) {
/*			if (tag != NO_TAG && tag != i)
				error("warning: %s using already assigned number %d instead of %d\n",
					fileName, i, tag);*/
			return(i);
		}
	}
	if (tag != NO_TAG) {
		if (itemTable->fileNames[tag] != NULL) {
			error("warning: %s number %d already used\n", itemTable->name,
				tag);
			tag = itemTable->nextFreeEntry++;
		}
	} else {
		tag = itemTable->nextFreeEntry++;
	}
	if (tag >= TABLE_SIZE)
		fatalError("more than %d %ss\n", TABLE_SIZE, itemTable->name);
	itemTable->fileNames[tag] = fileName;
	return(tag);
}

  int
countNumberListSize(numberList)
  numberListType	*numberList;
{
	int	result;

	result = 0;
	while (numberList != NULL) {
		result++;
		numberList = numberList->nextNumber;
	}
	return(result);
}
