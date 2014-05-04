/* 
   print.c: Final output for Plex.

   Chip Morningstar, Lucasfilm Ltd., 9-February-1987
 */

#include "plexTypes.h"
#include "plexGlobals.h"

static char	*dirs[E] = { "w", "n", "e", "s" };

#define r(i) ((i) % E)

  void
printArgList(valueList)
  valueListType	*valueList;
{
	if (valueList != NULL)
		while (valueList != NULL) {
			printValue(valueList->value);
			valueList = valueList->next;
			if (valueList != NULL)
				printf(" ");
		}
}

printInstance(instance)
  instanceType	*instance;
{
	int		 i;
	symbolType	*symbol;

	if (instance->terminal) {
		symbol = instance->subUnion.symbol;
		if (symbol != NULL) {
			printf("%s r=%d ", symbol->name, instance->rotation);
			for (i=0; i<E; ++i)
				printInstanceOut(instance->out[r(i + E -
					instance->parent->rotation)], i);
			printf("/");
			if (instance->argList != NULL)
				printArgList(instance->argList);
			printf("\n");
		}
	} else {
		printInstanceSubtree(instance->subUnion.subTree);
	}
}

printInstanceOut(outlist, dir)
  instancePathType	*outlist;
  int			 dir;
{

	printf("%s=", dirs[dir]);
	if (outlist == NULL || outlist->toNode == NULL)
		printf("0 ");
	else if (outlist->next == NULL)
		printf("%d ", outlist->toNode->ordinal + 1);
	else {
		printf("(");
		while (outlist != NULL) {
			printf("%d", outlist->toNode->ordinal + 1);
			outlist = outlist->next;
			if (outlist != NULL)
				printf(" ");
		}
		printf(") ");
	}
}

printInstanceSubtree(subTree)
  subInstanceType	*subTree;
{
	int		 i;
	instanceType	*instance;

	for (i=0; i<subTree->height; ++i)
		for (instance=subTree->subLines[i]; instance!=NULL;
				instance=instance->next)
			printInstance(instance);
}
