/* 
   join.c: Subtree joiner for Plex.

   Chip Morningstar, Lucasfilm Ltd., 5-February-1987
 */

#include "plexTypes.h"
#include "plexGlobals.h"

#define r(i) (((i)+rotation)%E)

joinInstance(instance, parent)
  instanceType	*instance;
  instanceType	*parent;
{
	int	i;

	instance->parent = parent;
	if (!instance->terminal)
		joinInstanceSubtree(instance->subUnion.subTree, instance);
}

joinInstanceSubtree(subTree, parent)
  subInstanceType	*subTree;
  instanceType		*parent;
{
	int		 i;
	instanceType	*instance;

	for (i=0; i<subTree->height; ++i)
		for (instance=subTree->subLines[i]; instance!=NULL;
				instance=instance->next)
			joinInstance(instance, parent);
	for (i=0; i<E; ++i)
		for (instance=subTree->entry[i]; instance!=NULL;
				instance=instance->next)
			joinInstance(instance, parent);
}

attachEntries(instance)
  instanceType	*instance;
{
	int	i;

	if (instance->terminal)
		for (i=0; i<E; ++i)
			attachExit(instance, i);
	else
		attachSubtree(instance->subUnion.subTree);
}

attachExit(instance, dir)
  instanceType		*instance;
  int			 dir;
{
    static int		 rotation = E;	/* maintain positive modulus */
    bool		 goingDown;
    int			 originalDir;
    int			 entryCounter;
    instanceType	*entryPtr;
    instanceType	*previousNode;
    instanceType	*theNode;
    instancePathType	*nodePtr;

    if (instance->out[dir] == NULL || instance->subUnion.symbol == NULL)
	return;
    goingDown = FALSE;
    entryCounter = 0;
    theNode = instance->out[dir]->toNode;
    originalDir = dir;
    dir += instance->rotation;
    previousNode = instance;
    while (theNode != NULL && (!theNode->terminal || theNode->subUnion.symbol
	    == NULL)) {
	if (theNode->subUnion.symbol != NULL) {
	    if (previousNode->subUnion.symbol != NULL) {
		if (theNode->parent == previousNode->parent)
		    goingDown = TRUE;
	    } else {
		if (theNode->parent == previousNode->parent->parent)
		    goingDown = TRUE;
	    }
	}
	previousNode = theNode;
	if (goingDown) {
	    entryPtr = theNode->subUnion.subTree->entry[r(dir - theNode->
		rotation + 2)];
	    while (entryCounter-- > 0)
		entryPtr = entryPtr->next;
	    if (entryPtr == NULL) {
		error("error: non-existent entry point (attaching to '%s')\n",
			instance->subUnion.symbol->name);
		nodePtr = NULL;
	    } else
		nodePtr = entryPtr->out[r(dir - theNode->rotation)];
	} else {
	    if (theNode->parent->parent == NULL)/*new*/
		nodePtr = NULL;/*new*/
	    else/*new*/
		nodePtr = theNode->parent->out[r(dir - theNode->parent->
		    parent->rotation)];
	    entryCounter = theNode->entryNumber;
	    while (nodePtr != NULL && entryCounter-- > 0)
		nodePtr = nodePtr->next;
	}
	if (nodePtr != NULL) {
	    theNode = nodePtr->toNode;
	    entryCounter = nodePtr->ord;
	} else
	    theNode = NULL;
    }
    instance->out[originalDir]->toNode = theNode;
}

attachSubtree(subTree, parent)
  subInstanceType    *subTree;
  instanceType	     *parent;
{
	int		 i;
	instanceType	*instance;

	for (i=0; i<subTree->height; ++i)
		for (instance=subTree->subLines[i]; instance!=NULL;
				instance=instance->next)
			attachEntries(instance);
}
