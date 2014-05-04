/* 
   execute.c: Statement execution for Plex.

   Chip Morningstar, Lucasfilm Ltd., 26-January-1987
 */

#include "plexTypes.h"
#include "plexGlobals.h"

#define r(i) (((i)+rotation)%E)

static int	 instanceOrdinal = 0;
static int	 subInstanceOrdinal = 0;
static int	 entryOrdinal = 0;

int	 	 tabCount;

  void
executeIncludeStatement(filename)
  char	*filename;
{
	fileList	*newFile;

	if (announceIncludes) {
		fprintf(stderr, "->%s\n", filename);
		fflush(stderr);
	}
	newFile = typeAlloc(fileList);
	newFile->next = inputStack;
	newFile->saveName = currentFileName;
	newFile->saveLine = currentLineNumber;
	newFile->fyle = currentInput;
	inputStack = newFile;
	if ((currentInput = fopen(filename, "r")) == NULL)
		fatalError("unable to open include file '%s'\n", filename);
	currentFileName = filename;
	currentLineNumber = 1;
}

  void
executeStartStatement(startSymbol)
  symbolType	*startSymbol;
{
	int		 i;
	bool		 terminal;
	instanceType	*result;
	instanceType	*buildInstance();
	subInstanceType	*expandSymbol();

	if (dumpTrees)
		printf("start on %s\n", startSymbol->name);
	result = buildInstance();
	result->rotation = 0;
	result->ordinal = -1;
	result->argList = NULL;
	if (dumpTrees)
		printf("==>%s\n", startSymbol->name);
	result->subUnion.subTree = expandSymbol(startSymbol, 0, USE_SEL,
		&(result->terminal), NULL);
	if (dumpTrees) {
		printf("<==\n");
		fflush(stdout);
	}
	if (dumpInstance1) {
		printf("instance 1 start\n");
		dumpInstance(result);
		printf("instance 1 end\n");
		fflush(stdout);
	}
	joinInstance(result, NULL);
	if (dumpInstance2) {
		printf("instance 2 start\n");
		dumpInstance(result);
		printf("instance 2 end\n");
		fflush(stdout);
	}
	attachEntries(result, NULL);
	if (dumpInstance3) {
		printf("instance 3 start\n");
		dumpInstance(result);
		printf("instance 3 end\n");
		fflush(stdout);
	}
	printf("%d\n", instanceOrdinal);
	printInstance(result);
}

  subInstanceType *
expandSymbol(symbol, rotation, selection, terminalPtr, argList)
  symbolType	*symbol;
  int		 rotation;
  selectionKind	 selection;
  bool		*terminalPtr;
  valueListType	*argList;
{
    subInstanceType	*result;
    productionType	*production;
    setType		*set;
    int			 i;
    symbolType		*useNode();
    subInstanceType	*expandProduction();

    result = NULL;
    *terminalPtr = TRUE;
    if (symbol == NULL || (production = symbol->binding) == NULL) {
	result = (subInstanceType *) useNode(symbol, rotation, argList);
    } else if (production->prodKind == SET_PROD) {
	set = production->productionUnion.set;
	switch (selection) {
	    Case RANDOM_SEL:
		result = expandSymbol(set->symbols[randomNumber(set->card)],
			rotation, USE_SEL, terminalPtr, argList);
	    Case PERIOD_SEL:
		result = expandSymbol(set->symbols[set->counter], rotation,
			USE_SEL, terminalPtr, argList);
		set->counter = (set->counter + 1) % set->card;
	    Case USE_SEL:
		error("set used without a selection operator\n");
	    Case ENTRY_SEL:
		error("BOTCH: set flagged as ENTRY_SEL in expandSymbol\n");
	    Default:
		error("BOTCH: bad selection type in expandSymbol\n");
	}
    } else if (production->prodKind == SPAN_PROD) {
	if (selection != USE_SEL)
	    error("selection operator '%c' used on production %s\n",
		selection==RANDOM_SEL ? '?' : selection == PERIOD_SEL ? '@' :
		'E', symbol->name);
	else {
	    result = expandProduction(production->productionUnion.plexProd,
		rotation, argList);
	    *terminalPtr = FALSE;
	}
    } else {
	error("can't use or operate on an array or value");
    }
    return(result);
}

  subInstanceType *
expandProduction(production, rotation, argList)
  plexProductionType	*production;
  int			 rotation;
  valueListType		*argList;
{
	subInstanceType	*result;
	int		 i;
	void		 expandInstances();
	void		 establishInstances();

	establishInstances(production->nodeList, production->height,
		production->entryList);
	expandInstances(production->nodeList, production->height,
		production->entryList, rotation, argList);
	result = typeAlloc(subInstanceType);
	result->subLines = typeAllocMulti(instanceType *,
		production->height);
	result->height = production->height;
	for (i=0; i<production->height; ++i)
		if (production->nodeList[i] == NULL)
			result->subLines[i] = NULL;
		else
			result->subLines[i] =
				production->nodeList[i]->span->node->instance;
	result->entry = typeAllocMulti(instanceType *, E);
	for (i=0; i<E; ++i) {
		if (production->entryList[i] == NULL)
			result->entry[i] = NULL;
		else
			result->entry[i] = production->entryList[i]->instance;
	}
	return(result);
}

  symbolType *
useNode(symbol, rotation, argList)
  symbolType	*symbol;
  int		 rotation;
  valueListType *argList;
{
	if (dumpTrees) {
		++tabCount;
		tab();
		if (symbol == NULL)
			printf("*** <entry>");
		else
			printf("*** %s", symbol->name);
		printValueList(argList);
		printf(" / %d\n", rotation);
		--tabCount;
	}
	return(symbol);
}

  void
expandInstances(nodeList, height, entryList, rotation, argList)
  spanLineType	**nodeList;
  int		  height;
  nodeType	 *entryList[E];
  int		  rotation;
  valueListType	 *argList;
{
    int			 i;
    spanLineType	*nodeLine;
    nodeType		*node;
    void		 expandNode();

    for (i=0; i<height; ++i)
	for (nodeLine=nodeList[i]; nodeLine!=NULL; nodeLine=nodeLine->next) {
	    if (nodeLine->next != NULL)
		nodeLine->span->node->instance->next =
		    nodeLine->next->span->node->instance;
	    expandNode(nodeLine->span->node, rotation, argList);
	}
    for (i=0; i<E; ++i)
	for (node=entryList[i]; node!=NULL; node=node->next) {
	    if (node->next != NULL)
		node->instance->next = node->next->instance;
	    expandNode(node, rotation, argList);
	}
}

  void
establishInstances(nodeList, height, entryList)
  spanLineType	**nodeList;
  int		  height;
  nodeType	 *entryList[E];
{
    int			 i;
    spanLineType	*nodeLine;
    nodeType		*node;
    instanceType	*buildInstance();

    for (i=0; i<height; ++i)
	for (nodeLine=nodeList[i]; nodeLine!=NULL; nodeLine=nodeLine->next)
	    nodeLine->span->node->instance = buildInstance();
    for (i=0; i<E; ++i)
	for (node=entryList[i]; node!=NULL; node=node->next)
	    node->instance = buildInstance();
}

  void
expandNode(node, rotation, argList)
  nodeType	*node;
  int		 rotation;
  valueListType *argList;
{
	int			 i;
	instanceType		*instance;
	valueListType		*subArgList;
	instancePathType	*expandOutList();
	valueListType		*evaluateArgList();
	int			 saveDotValue;

	instance = node->instance;
	for (i=0; i<E; ++i) {
		instance->out[i] = expandOutList(node->out[i]);
		instance->inCount[i] = node->inCount[i];
	}
	rotation = (rotation + node->rotation) % E;
	instance->rotation = rotation;

	if (dumpTrees) {
		++tabCount;
		tab(); printf("-->"); printNodeName(node, 5);
		printValueList(argList);
		printf("\n");
	}

	subArgList = evaluateArgList(node->argList, argList);
	saveDotValue = currentDotValue;
	if (node->symbol == NULL)
		currentDotValue = 0;
	else
		currentDotValue = node->symbol->dotValue++;
	instance->argList = subArgList;
	instance->subUnion.subTree = expandSymbol(node->symbol, rotation,
		node->selection, &(instance->terminal), subArgList);
	currentDotValue = saveDotValue;
	if (instance->terminal) {
		if (instance->subUnion.symbol == NULL) {
			instance->entryNumber = node->ordinal;
			instance->ordinal = entryOrdinal++;
		} else {
			instance->ordinal = instanceOrdinal++;
		}
	} else {
		freeArgList(subArgList);
		instance->ordinal = subInstanceOrdinal++;
	}

	if (dumpTrees) {
		tab(); printf("<--\n");
		fflush(stdout);
		--tabCount;
	}
}

  instancePathType *
expandOutList(outlist)
  pathType	*outlist;
{
	instancePathType	*result;

	if (outlist == NULL)
		return(NULL);
	result = typeAlloc(instancePathType);
	result->next = expandOutList(outlist->next);
	result->toNode = outlist->toNode->instance;
	result->ord = outlist->ord;
	result->downFlag = FALSE;
	return(result);
}
