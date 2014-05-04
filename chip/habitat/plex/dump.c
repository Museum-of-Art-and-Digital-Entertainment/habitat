/* 
   dump.c: Diagnostic output for Plex.

   Chip Morningstar, Lucasfilm Ltd., 2-February-1987
 */

#include "plexTypes.h"
#include "plexGlobals.h"

int	 tabCount = 0;

dumpNodeList(nodeList, height)
  spanLineType	**nodeList;
  int		  height;
{
	int	i;

	for (i=0; i<height; ++i)
		dumpNodeLine(nodeList[i]);
}

dumpEntryList(entryList)
  nodeType	*entryList[E];
{
	int	i;

	for (i=0; i<E; ++i)
		dumpNodes(entryList[i]);
	printf("\n");
}

dumpNodes(nodeList)
  nodeType	*nodeList;
{
	if (nodeList != NULL) printf("-");
	while (nodeList != NULL) {
		dumpNode(nodeList);
		nodeList = nodeList->next;
		if (nodeList != NULL) printf(" ");
	}
}

dumpNodeLine(nodeLine)
  spanLineType	*nodeLine;
{
	if (nodeLine == NULL)
		return;
	printf("-");
	for(; nodeLine != NULL; nodeLine=nodeLine->next) {
		dumpNode(nodeLine->span->node);
		if (nodeLine->next != NULL) printf(" ");
	}
}

dumpNode(node)
  nodeType	*node;
{
	int	i;

	printNodeName(node, 5);
	printf("(");
	for (i=0; i<E; ++i) {
		dumpOutList(node->out[i], i);
		if (i != E-1) printf(", ");
	}
	printf(") {");
	for (i=0; i<E; ++i) {
		printf("%d", node->inCount[i]);
		if (i != E-1) printf(", ");
	}
	printf("} / %d ", node->rotation);
	switch(node->selection) {
		Case    USE_SEL: printf(" \n");
		Case RANDOM_SEL: printf("?\n");
		Case PERIOD_SEL: printf("*\n");
		Case  ENTRY_SEL: printf("@\n");
		Default: error("BOTCH: bad selection type in dumpNode\n");
	}
}

dumpOutList(pathlist, direction)
  pathType	*pathlist;
  int		 direction;
{
	bool	multipleExits;

	if (pathlist == NULL) {
		printf("0");
		return;
	} else if (pathlist->next != NULL) {
		multipleExits = TRUE;
		printf("[");
	} else
		multipleExits = FALSE;

	while (pathlist != NULL) {
		printNodeName(pathlist->toNode, pathlist->toDir);
		printf(":%d", pathlist->ord);
		pathlist = pathlist->next;
		if (pathlist != NULL)
			printf(", ");
		else if (multipleExits)
			printf("]");
	}
}

printNodeName(node, dir)
  nodeType	*node;
{
	static char *dirs[] = { "W", "N", "E", "S" };

	if (node == NULL)
		printf("<NULL>");
	else if (node->selection == ENTRY_SEL)
		printf("entry%s.%d", dirs[node->rotation], node->ordinal);
	else
		printf("%s.%d", node->symbol->name, node->ordinal);
	if (dir != 5)
		printf("-%s", dirs[dir]);
}

tab()
{
	int	i;

	for (i=0; i<tabCount; ++i)
		printf("    ");
}

  void
symbolName(node, entry)
  instanceType		*node;
  int			 entry;
{
	symbolType	*symbol;

	symbol = node->subUnion.symbol;
	if (symbol == NULL) {
		printf("<entry-%d>", node->entryNumber);
		if (entry < E) printf("[%d]", entry);
	} else
		printf("%s", symbol->name);
}

dumpInstance(instance, entry)
  instanceType	*instance;
  int		 entry;
{
	int	i;

	tab();
	if (instance->terminal) {
		symbolName(instance, entry);
		printf(".%d (", instance->ordinal);
	} else
		printf("( {%d} (", instance->ordinal);
	for (i=0; i<E; ++i) {
		dumpInstanceOutlist(instance->out[i]);
		if (i < E-1) printf(", ");
	}
	printf(") / %d <<", instance->rotation);
	for (i=0; i<E; ++i) {
		printf("%d", instance->inCount[i]);
		if (i < E-1) printf(", ");
	}
	printf(">>\n");
	if (!instance->terminal) {
		++tabCount;
		dumpInstanceSubtree(instance->subUnion.subTree);
		--tabCount;
		tab(); printf(")\n");
	}
	fflush(stdout);
}

dumpInstanceOutlist(outlist)
  instancePathType	*outlist;
{
	bool	bracketFlag;

	if (outlist == NULL) {
		printf("0");
		return;
	} else if (outlist->next != NULL) {
		printf("[");
		bracketFlag = TRUE;
	} else
		bracketFlag = FALSE;
	while (outlist != NULL) {
		if (outlist->toNode == NULL) {
			printf("0");
		} else if (outlist->toNode->terminal) {
			symbolName(outlist->toNode, 5);
			printf(".%d-%d", outlist->toNode->ordinal,
				outlist->ord);
		} else
			printf("{%d}-%d", outlist->toNode->ordinal, outlist->
				ord);
		outlist = outlist->next;
		if (outlist != NULL) printf(", ");
	}
	if (bracketFlag) printf("]");
}

dumpInstanceSubtree(subTree)
  subInstanceType	*subTree;
{
	int		 i;
	instanceType	*instance;

	for (i=0; i<subTree->height; ++i)
		for (instance=subTree->subLines[i]; instance!=NULL;
				instance=instance->next)
			dumpInstance(instance, 5);
	for (i=0; i<E; ++i)
		for (instance=subTree->entry[i]; instance!=NULL;
				instance=instance->next)
			dumpInstance(instance, i);
}

  void
printValue(value)
  valueType	*value;
{
	if (value->dataType == INT_VALUE)
		printf("%d", value->valueUnion.intValue);
	else
		printf("\"%s\"", value->valueUnion.stringValue);
}

  void
printValueList(valueList)
  valueListType	*valueList;
{
	if (valueList != NULL) {
		printf("(");
		while (valueList != NULL) {
			printValue(valueList->value);
			valueList = valueList->next;
			if (valueList != NULL)
				printf(", ");
		}
		printf(")");
	}
}
