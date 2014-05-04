/* 
   buildStuff.c: Routines to build parse-tree data structures for Muddle.

   Chip Morningstar, Lucasfilm Ltd., 4-March-1986
 */

#include "muddleTypes.h"

  classType *
buildClass(header, body)
  classType	*header;
  itemListType	*body;
{
	header->body = body;
	return(header);
}

  classType *
buildClassHeader(name, tag)
  char	*name;
  int	 tag;
{
	classType	*result;

	result = typeAlloc(classType);
	result->name = name;
	result->tag = tag;
	return(result);
}

  numberListHeaderType *
buildNumberList(numberList, newNumber)
  numberListHeaderType	*numberList;
  int			 newNumber;
{
	numberListHeaderType	*result;
	numberListType		*newEntry;

	if (numberList == NULL) {
		result = typeAlloc(numberListHeaderType);
		result->number = newNumber;
		result->nextNumber = NULL;
		result->tail = (numberListType *)result;
		return(result);
	} else {
		newEntry = typeAlloc(numberListType);
		newEntry->number = newNumber;
		newEntry->nextNumber = NULL;
		numberList->tail->nextNumber = newEntry;
		numberList->tail = newEntry;
		return(numberList);
	}
}

  itemListHeaderType *
buildItemList(itemList, newItem)
  itemListHeaderType	*itemList;
  itemType		*newItem;
{
	itemListHeaderType	*result;
	itemListType		*newEntry;

	if (itemList == NULL) {
		result = typeAlloc(itemListHeaderType);
		result->item = newItem;
		result->nextItem = NULL;
		result->tail = (itemListType *)result;
	} else {
		newEntry = typeAlloc(itemListType);
		newEntry->item = newItem;
		newEntry->nextItem = NULL;
		itemList->tail->nextItem = newEntry;
		itemList->tail = newEntry;
		result = itemList;
	}
	return(result);
}

  itemType *
addLabelToItem(label, item)
  char		*label;
  itemType	*item;
{
	item->label = label;
	return(item);
}

  itemType *
buildItem(label, itemKind, itemSource, tag)
  char		*label;
  itemKindType	 itemKind;
  itemSourceType *itemSource;
  int		 tag;
{
	itemType	*result;

	result = typeAlloc(itemType);
	result->label = label;
	result->itemKind = itemKind;
	result->itemSource = itemSource;
	result->tag = tag;
	result->width = 0;
	result->flipOffset = 0;
	return(result);
}

  itemType *
addWidthInfo(item, width, flipOffset)
  itemType	*item;
  int		 width;
  int		 flipOffset;
{
	item->width = width;
	item->flipOffset = flipOffset;
	return(item);
}

  itemSourceType *
buildItemSource(string, source)
  char			*string;
  sourceKindType	 source;
{
	itemSourceType	*result;

	result = typeAlloc(itemSourceType);
	result->string = string;
	result->source = source;
	return(result);
}

  char *
buildString(string)
  char	*string;
{
	char	*result;

	result = (char *) malloc(strlen(string) + 1);
	strcpy(result, string);
	return(result);
}
