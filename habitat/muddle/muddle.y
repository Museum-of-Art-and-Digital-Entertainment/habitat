/* 
   Muddle: MicroCosm Ultimate Database Definition Language (Eventually) -- A
   tool for creating the home system disk database for MicroCosm.

   Now that MicroCosm is Habitat, I suppose we should change the name to
   Huddle, but that's just *too* athletic for us.

   Chip Morningstar, Lucasfilm Ltd., 4-March-1986
 */

%{

#include "muddleTypes.h"
#include "muddleGlobals.h"

%}

/* Tokens are recognized by the lexer. */
%token CLASS		/* The keyword 'class' */
%token IMAGE		/* The keyword 'image' */
%token SOUND		/* The keyword 'sound' */
%token ACTION		/* The keyword 'action' */
%token HEAD		/* The keyword 'head' */
%token BYTE		/* The keyword 'byte' */
%token WORD		/* The keyword 'word' */
%token Identifier	/* The usual */
%token Number		/* Ditto */
%token String		/* And ditto */
%token ENDFILE		/* The end of the input */

%%

muddle:
		muddleDescription 
 ;

muddleDescription:
		muddleThing
 |		muddleDescription muddleThing
 ;

muddleThing:
		classDefinition
{
	noteClass($1);
}
 |		classElement
 ;

classDefinition:
		CLASS classHeader classBody
{
	$$ = buildClass($2, $3);
}
 ;

classHeader:
		className
{
	$$ = buildClassHeader($1, NO_TAG);
}
 |		className classNumber
{
	$$ = buildClassHeader($1, $2);
}
 ;

className:
		Identifier
{
	$$ = $1;
}
 ;

classNumber:
		Number
{
	$$ = $1;
}
 ;

classBody:
		'{' classElementList '}'
{
	$$ = $2;
}
 ;

classElementList:
		classElement
{
	$$ = buildItemList(NULL, $1);
}
 |		classElementList classElement
{
	$$ = buildItemList($1, $2);
}
 ;

classElement:
		basicClassElement
{
	$$ = $1;
}
 |		label ':' basicClassElement
{
	newSymbol($1, listify(currentItemKind), $3);
	$$ = addLabelToItem($1, $3);
}
 ;

label:
		Identifier
{
	$$ = $1;
}
 ;

basicClassElement:
		imageElement	/* da */
 |		soundElement	/* da */
 |		actionElement	/* da */
 |		headElement	/* da */
 |		dataElement	/* da */
 ;

imageElement:
		IMAGE {currentItemKind=IMAGE_ITEM;} itemSpecifier
{
	$$ = buildItem(NULL, IMAGE_LIST_ITEM, $3, NO_TAG);
}
 ;

soundElement:
		SOUND {currentItemKind=SOUND_ITEM;} itemSpecifier
{
	$$ = buildItem(NULL, SOUND_LIST_ITEM, $3, NO_TAG);
}
 ;

actionElement:
		ACTION {currentItemKind=ACTION_ITEM;} itemSpecifier
{
	$$ = buildItem(NULL, ACTION_LIST_ITEM, $3, NO_TAG);
}
 ;

headElement:
		HEAD {currentItemKind=HEAD_ITEM;} itemSpecifier
{
	$$ = buildItem(NULL, HEAD_LIST_ITEM, $3, NO_TAG);
}
 ;

dataElement:
		BYTE {currentItemKind=BYTE_ITEM;} numberList
{
	$$ = buildItem(NULL, BYTE_LIST_ITEM, $3, NO_TAG);
}
 |		WORD {currentItemKind=WORD_ITEM;} numberList
{
	$$ = buildItem(NULL, WORD_LIST_ITEM, $3, NO_TAG);
}
 ;

itemSpecifier:
		item
{
	$$ = buildItemList(NULL, $1);
}
 |		'{' itemList '}'
{
	$$ = $2;
}
 ;

itemList:
		listItem
{
	$$ = buildItemList(NULL, $1);
}
 |		itemList listItem
{
	$$ = buildItemList($1, $2);
}
 ;

listItem:
		item
{
	$$ = $1;
}
 |		label ':' item
{
	newSymbol($1, currentItemKind, $3);
	$$ = addLabelToItem($1, $3);
}
 ;

item:
		itemEntry
{
	$$ = addWidthInfo($1, 0, 0);
}
 |		itemEntry Number
{
	$$ = addWidthInfo($1, $2, 0);
}
 |		itemEntry Number Number
{
	$$ = addWidthInfo($1, $2, $3);
}
 ;

itemEntry:
		itemSource
{
	if (((itemSourceType *)$1)->source == FILE_SOURCE &&
			(int)currentItemKind < (int)ACTION_LIST_ITEM)
		$$ = buildItem(NULL, currentItemKind, $1,
			maxItem[(int)currentItemKind]++);
	else
		$$ = buildItem(NULL, currentItemKind, $1, NO_TAG);
}
 ;

itemSource:
		fileName
{
	$$ = buildItemSource($1, FILE_SOURCE);
}
 |		Identifier
{
	$$ = buildItemSource($1, NAME_SOURCE);
}
 ;

fileName:
		String
{
	$$ = $1;
}
 ;

numberList:
		Number
{
	$$ = buildNumberList(NULL, $1);
}
 |		numberList ',' Number
{
	$$ = buildNumberList($1, $3);
}
 ;

%%

#include <stdio.h>

yyerror(s)
  char	*s;
{
	error("parser error: %s\n", s);
}
