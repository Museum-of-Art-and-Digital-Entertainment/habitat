/* 
   2danalyze.c: 2-D pattern analyzer for Plex.

   Chip Morningstar, Lucasfilm Ltd., 26-January-1987
 */

#include "plexTypes.h"
#include "plexGlobals.h"

static int	ordinal;
static int	ordinalW, ordinalN, ordinalE, ordinalS;

genericList	*reverseList();

  void
mergeFillerNodes(uline, bline, width)
  spanLineType	*uline;
  spanLineType	*bline;
  int		 width;
{
    int		 x;

    int		 ubase,   bbase;
    spanKind	 ukind,   bkind;
    spanType	*uspan,  *bspan;
    nodeType	*uNode,	 *bNode;
    spanType	*chaser, *newChaser;
    bool	 newBusiness;

    nodeType	*buildNode();

    ubase = bbase = 0;
    uspan = uline->span;
    ukind = uspan->kind;
    bspan = bline->span;
    bkind = bspan->kind;
    newBusiness = TRUE;
    for (x=0; x<width; ++x) {
	if (x == spanWidth(uspan) + ubase) {
	    ubase += spanWidth(uspan);
	    uline = uline->next;
	    uspan = uline->span;
	    ukind = uspan->kind;
	    newBusiness = TRUE;
	}
	if (x == spanWidth(bspan) + bbase) {
	    bbase += spanWidth(bspan);
	    bline = bline->next;
	    bspan = bline->span;
	    bkind = bspan->kind;
	    newBusiness = TRUE;
	}
	bNode = bspan->node;
	uNode = uspan->node;
	if (bkind == NODE_SPAN) {
	    /* create bottom node */
	    if (bbase == x) {
		bNode = buildNode(bspan->count, ordinal++);
		bspan->node = bNode;
	    }
	}
	if (newBusiness) {
		if (bkind == FILLER_SPAN && ukind == NODE_SPAN) {
			/* start chain downward */
			bspan->node = uNode;
		} else if (bkind == NODE_SPAN && ukind == FILLER_SPAN) {
			/* fixup backtraced nodes */
			chaser = uspan;
			while (chaser != NULL) {
				chaser->node = bNode;
				newChaser = chaser->backPointer;
				chaser->backPointer = NULL;
				chaser = newChaser;
			}
		} else if (bkind == FILLER_SPAN && ukind == FILLER_SPAN) {
			if (uNode != NULL) {
				/* continue chain downward */
				bspan->node = uNode;
			} else {
				/* setup backtrace pointer */
				bspan->backPointer = uspan;
			}
		}
	}
	newBusiness = FALSE;
    }
}

  void
verticallyAnalyzeLine(uline, bline, width, entryList)
  spanLineType	*uline;
  spanLineType	*bline;
  int		 width;
  nodeType	*entryList[E];
{
    int		 x;
    nodeType	*entry;

    int		 ubase,   bbase;
    spanKind	 ukind,   bkind;
    spanType	*uspan,  *bspan;
    nodeType	*uNode,	 *bNode;
    pathType	*uPathD, *bPathD,
		*uPathU, *bPathU;

    nodeType	*buildNode();
    pathType	*buildPath();

    ubase = bbase = 0;
    uspan = uline->span;
    ukind = uspan->kind;
    bspan = bline->span;
    bkind = bspan->kind;
    for (x=0; x<width; ++x) {
	if (x == spanWidth(uspan)+ubase) {
	    ubase += spanWidth(uspan);
	    uline = uline->next;
	    uspan = uline->span;
	    ukind = uspan->kind;
	}
	if (x == spanWidth(bspan)+bbase) {
	    bbase += spanWidth(bspan);
	    bline = bline->next;
	    bspan = bline->span;
	    bkind = bspan->kind;
	}
	bPathD = bspan->pathD;
	bPathU = bspan->pathU;
	bNode = bspan->node;
	uPathD = uspan->pathD;
	uPathU = uspan->pathU;
	uNode = uspan->node;

	switch (ukind) {
	    Case NODE_SPAN:
	    case FILLER_SPAN:
		if (bkind == V_SPAN || bkind == X_SPAN) {
			/* vertical pathway start at top node */
			bPathD = buildPath(uNode, EAST,  NULL, NONE);
			bPathU = buildPath( NULL, NONE, uNode, EAST);
			bPathD->next = uNode->out[EAST];
			uNode->out[EAST] = bPathD;
			bPathU->ord = uNode->inCount[EAST];
			uNode->inCount[EAST] += 1;
			bspan->pathD = bPathD;
			bspan->pathU = bPathU;
		} else if (bkind == END_SPAN) {
			/* directional pathway start towards top node */
			/*...later...*/
		} /* else {
			do nothing;
		} */
	    Case WHITE_SPAN:
		if (bkind == V_SPAN || bkind == X_SPAN) {
			/* vertical pathway start at new West entry */
			entry = buildNode(NULL, ordinalW++);
/*			entry->rotation = WEST;*/
			entry->next = entryList[WEST];
			entryList[WEST] = entry;

			bPathD = buildPath(entry, WEST, NULL, NONE);
			bPathU = buildPath(NULL, NONE, entry, WEST);
			bPathD->next = NULL;
			entry->out[EAST] = bPathD;
			entry->inCount[EAST] = 1;
			bspan->pathD = bPathD;
			bspan->pathU = bPathU;
		} else if (bkind == END_SPAN) {
			/* directional pathway start towards new West entry */
			/*...later...*/
		} /* else {
			do nothing;
		} */
	    Case H_SPAN:
		if (bkind == V_SPAN || bkind == X_SPAN) {
			error("horizontal path touches vertical path");
		} else if (bkind == END_SPAN) {
			/* check for bend in directional path */
			/*...later...*/
		} /* else {
			do nothing;
		} */
	    Case V_SPAN:
	    case X_SPAN:
		if (bkind == V_SPAN || bkind == X_SPAN) {
			/* continue vertical pathway */
			bspan->pathD = uPathD;
			bspan->pathU = uPathU;
		} else if (bkind == NODE_SPAN || bkind == FILLER_SPAN) {
			/* end pathway at bottom node */
			uPathD->toNode = uPathU->fromNode = bspan->node;
			uPathD->toDir  = uPathU->fromDir  = WEST;
			uPathU->next = bspan->node->out[WEST];
			bspan->node->out[WEST] = uPathU;
			uPathD->ord = bspan->node->inCount[WEST];
			bspan->node->inCount[WEST] += 1;
		} else if (bkind == WHITE_SPAN) {
			/* end pathway at new East entry */
			entry = buildNode(NULL, ordinalE++);
/*			entry->rotation = EAST;*/
			entry->next = entryList[EAST];
			entryList[EAST] = entry;

			uPathD->toNode = uPathU->fromNode = entry;
			uPathD->toDir  = uPathU->fromDir  = WEST;
			uPathU->next = NULL;
			entry->out[WEST] = uPathU;
			entry->inCount[WEST] = 1;
		} else if (bkind == H_SPAN) {
			error("vertical path touches horizontal path");
		} else /* if (bkind == END_SPAN) */ {
			/* continue vertical pathway, make it directional */
			/*...later...*/
		}
	    Case END_SPAN:
		if (bkind == V_SPAN || bkind == X_SPAN) {
			/* continue vertical directional path */
			/*...later...*/
		} else if (bkind == NODE_SPAN) {
			/* end path at bottom node, make directional */
			/*...later...*/
		} else if (bkind == WHITE_SPAN) {
			/* end path at new East entry, make directional */
			/*...later...*/
		} else if (bkind == H_SPAN) {
			/* check for bend in pathway */
			/*...later...*/
		} else if (bkind == FILLER_SPAN) {
			/* end path at node conn. to bot. filler, make dir. */
			/*...later...*/
		} else /* if (bkind == END_SPAN) */ {
			/* signal error */
			error("vertically adjacent end markers\n");
		}
	    Default:
		error("BOTCH: illegal span kind in analyzeLine (1)\n");
	}
    }
}

  spanLineType *
horizontallyAnalyzeLine(bline, width, entryList)
  spanLineType	*bline;
  int		 width;
  nodeType	*entryList[E];
{
    spanLineType *line;
    spanLineType *result, *chaser;
    spanLineType *newSpanLine;
    nodeType	*entry;

    spanKind	 lkind,   rkind;
    spanType	*lspan,  *rspan;
    pathType	*lPathU, *rPathU;
    pathType	*lPathD, *rPathD;
    nodeType	*lNode,  *rNode;

    nodeType	*buildNode();
    pathType	*buildPath();

    static spanType	 falseSpan = { 1, WHITE_SPAN };
    static spanLineType  falseLine = { NULL, &falseSpan };

    falseLine.next = bline;
    line = &falseLine;
    result = NULL;
    chaser = NULL;
    for (; line!=NULL && line->next!=NULL; line=line->next) {
	lspan = line->span;
	rspan = line->next->span;
	lkind = lspan->kind;
	rkind = rspan->kind;
	lNode = lspan->node;
	rNode = rspan->node;
	lPathD = lspan->pathD;
	lPathU = lspan->pathU;
	rPathD = rspan->pathD;
	rPathU = rspan->pathU;
	switch (lkind) {
	    Case NODE_SPAN:
		newSpanLine = typeAlloc(spanLineType);
		*newSpanLine = *line;
		newSpanLine->next = NULL;
		if (result == NULL)
			result = chaser = newSpanLine;
		else {
			chaser->next = newSpanLine;
			chaser = newSpanLine;
		}
	    /* *** WARNING: case fall through!!! *** */
	    case FILLER_SPAN:
		if (rkind == H_SPAN || rkind == X_SPAN) {
		    /* horizontal pathway start at left node */
		    rPathD = buildPath(lNode, NORTH,  NULL,  NONE);
		    rPathU = buildPath( NULL,  NONE, lNode, NORTH);
		    rPathD->next = lNode->out[NORTH];
		    lNode->out[NORTH] = rPathD;
		    rPathU->ord = lNode->inCount[NORTH];
		    lNode->inCount[NORTH] += 1;
		    rspan->pathD = rPathD;
		    rspan->pathU = rPathU;
		} else if (rkind == FILLER_SPAN) {
		    /* this cant happen! */
		    error("BOTCH: filler span next to node span\n");
		} else if (rkind == END_SPAN) {
		    /* directional pathway start towards left node */
		    /*...later...*/
		} /* else {
		    do nothing;
		} */
	    Case WHITE_SPAN:
		if (rkind == H_SPAN || rkind == X_SPAN) {
		    /* horizontal pathway start at new South entry */
		    entry = buildNode(NULL, ordinalS++);
/*		    entry->rotation = SOUTH;*/
		    entry->next = entryList[SOUTH];
		    entryList[SOUTH] = entry;

		    rPathD = buildPath(entry, NORTH,  NULL,  NONE);
		    rPathU = buildPath( NULL,  NONE, entry, NORTH);
		    rPathD->next = NULL;
		    entry->out[NORTH] = rPathD;
		    entry->inCount[NORTH] = 1;
		    rspan->pathD = rPathD;
		    rspan->pathU = rPathU;
		} else if (rkind == END_SPAN) {
		    /* directional pathway start towards new South entry */
		    /*...later...*/
		} /* else {
		    do nothing;
		} */
	    Case H_SPAN:
	    case X_SPAN:
		if (rkind == H_SPAN || rkind == X_SPAN) {
		    /* continue horizontal pathway */
		    rspan->pathD = lPathD;
		    rspan->pathU = lPathU;
		} else if (rkind == NODE_SPAN || rkind == FILLER_SPAN) {
		    /* end pathway at right node */
		    lPathD->toNode = lPathU->fromNode = rspan->node;
		    lPathD->toDir  = lPathU->fromDir  = SOUTH;
		    lPathU->next = rspan->node->out[SOUTH];
		    rspan->node->out[SOUTH] = lPathU;
		    lPathD->ord = rspan->node->inCount[SOUTH];
		    rspan->node->inCount[SOUTH] += 1;
		} else if (rkind == WHITE_SPAN) {
		    /* end pathway at new North entry */
		    entry = buildNode(NULL, ordinalN++);
/*		    entry->rotation = NORTH;*/
		    entry->next = entryList[NORTH];
		    entryList[NORTH] = entry;

		    lPathD->toNode = lPathU->fromNode = entry;
		    lPathD->toDir  = lPathD->fromDir  = SOUTH;
		    lPathU->next = NULL;
		    entry->out[SOUTH] = lPathU;
		    entry->inCount[SOUTH] = 1;
		} else if (rkind == V_SPAN) {
		    error("horizontal path runs into vertical path");
		} else if (rkind == END_SPAN) {
		    /* continue horizontal pathway, make it directional */
		    /*...later...*/
		}
	    Case V_SPAN:
		if (rkind == H_SPAN || rkind == X_SPAN) {
		    error("vertical path meets horizontal path");
		} else if (rkind == END_SPAN) {
		    /* check for bend in directional path */
		    /*...later...*/
		} /* else {
		    do nothing;
		} */
	    Case END_SPAN:
		if (rkind == H_SPAN || rkind == X_SPAN) {
		    /* start directional horizontal pathway */
		    /*...later...*/
		} else if (rkind == NODE_SPAN) {
		    /* end directional pathway connected to right node */
		    /*...later...*/
		} else if (rkind == WHITE_SPAN) {
		    /* start directional horizontal path at new West entry */
		    /*...later...*/
		} else if (rkind == V_SPAN) {
		    /* check for bend in directional pathway */
		    /*...later...*/
		} else if (rkind == FILLER_SPAN) {
		    /* end directional path at node conn. to right filler */
		    /*...later...*/
		} else if (rkind == END_SPAN) {
		    /* signal error */
		    error("horizontally adjacent end markers\n");
		}
	    Default:
		error("BOTCH: illegal span kind in analyzeLine (2)\n");
	}
    }
    return(result);
}

  spanLineType **
findNodes(lines, height, width, entryList)
  spanLineType	**lines;
  int		  height;
  int		  width;
  nodeType	 *entryList[E];
{
	int		  i;
	spanLineType	**nodeList;

	for (i=0; i<E; ++i)
		entryList[i] = NULL;
	nodeList = typeAllocMulti(spanLineType *, height+1);
	ordinal = 0;
	ordinalW = ordinalN = ordinalE = ordinalS = 0;
	for (i=0; i<=height; ++i)
	    mergeFillerNodes(lines[i], lines[i+1], width);
	for (i=0; i<=height; ++i) {
	    verticallyAnalyzeLine(lines[i], lines[i+1], width, entryList);
	    nodeList[i] = horizontallyAnalyzeLine(lines[i+1], width,
		entryList);
	}
	reverseOutLists(nodeList, height);
	for (i=0; i<E; ++i)
		entryList[i] = (nodeType *)reverseList(entryList[i]);
	if (mapInput) {
		dumpNodeList(nodeList, height);
		dumpEntryList(entryList);
		fflush(stdout);
	}
	return(nodeList);
}

reverseOutLists(nodeList, height)
  spanLineType	**nodeList;
  int		  height;
{
	int	i;

	for (i=0; i<height; ++i)
		reverseNodeLine(nodeList[i]);
}

reverseNodeLine(nodeLine)
  spanLineType	*nodeLine;
{
	for (; nodeLine != NULL; nodeLine=nodeLine->next)
		reverseNode(nodeLine->span->node);
}

reverseNode(node)
  nodeType	*node;
{
	int	i;

	for (i=0; i<E; ++i)
		node->out[i] = (pathType *)reverseList(node->out[i]);
}

  genericList *
reverseList(list)
  genericList	*list;
{
	genericList	*temptr;
	genericList	*temptr2;

	temptr = NULL;
	while (list != NULL) {
		temptr2 = temptr;
		temptr = list;
		list = list->next;
		temptr->next = temptr2;
	}
	return(temptr);
}
