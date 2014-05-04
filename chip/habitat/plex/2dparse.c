/* 
   2dparse.c: 2-D parser for Plex.

   Chip Morningstar, Lucasfilm Ltd., 26-January-1987
 */

#include "plexTypes.h"
#include "plexGlobals.h"

  spanLineType *
whiteSpanLine(width)
  int	width;
{
	spanLineType	*newSpanLine;
	spanType	*buildSpan();

	newSpanLine = typeAlloc(spanLineType);
	newSpanLine->next = NULL;
	newSpanLine->span = buildSpan(width, WHITE_SPAN);
	return(newSpanLine);
}

  int
spanWidth(span)
  spanType	*span;
{
	if (span->kind == NODE_SPAN)
		return(((parseNodeType *)(span->count))->count);
	else if (span->kind == V_SPAN)
		return(1);
	else
		return(span->count);
}

  spanLineType *
mergeFillerSpans(spanLine, previousEntry)
  spanLineType	*spanLine;
  spanLineType	*previousEntry;
{
	parseNodeType	*theNode;
	spanLineType	*nextEntry;

	if ((nextEntry = spanLine->next) != NULL) {
		if (spanLine->span->kind == FILLER_SPAN) {
			if (nextEntry->span->kind == NODE_SPAN) {
				theNode = (parseNodeType *)
					(nextEntry->span->count);
				theNode->count += spanLine->span->count;
				previousEntry->next = nextEntry;
				free(spanLine->span);
				free(spanLine);
				return(mergeFillerSpans(nextEntry,
					previousEntry));
			}
		} else if (spanLine->span->kind == NODE_SPAN) {
			if (nextEntry->span->kind == FILLER_SPAN) {
				theNode = (parseNodeType *)
					(spanLine->span->count);
				theNode->count += nextEntry->span->count;
				spanLine->next = nextEntry->next;
				free(nextEntry->span);
				free(nextEntry);
				return(mergeFillerSpans(spanLine,
					previousEntry));
			}
		}
	}
	return(spanLine);
}

  int
countWidth(spanLineHead)
  genericListHead	*spanLineHead;
{
	int		 result;
	genericList	*iptr;
	genericList	*oldIptr;

	result = 0;

	/*
	   WARNING: Tricky kludge!!!  The following statement assumes that the
	   'first' field of a genericListHead type has the same offset as the
	   'next' field of a genericList type. (There's no reason it
	   shouldn't, unless somebody changes one of the struct declarations
	   or this gets ported to a machine where pointer sizes can vary.
	   Anyhow, beware!)
	*/
	oldIptr = (genericList *)spanLineHead;

	for (iptr=spanLineHead->first; iptr!=NULL; iptr=iptr->next) {
		iptr = (genericList *)mergeFillerSpans(iptr, oldIptr);
		result += spanWidth(iptr->data);
		oldIptr = iptr;
	}
	return(result);
}

  int
countEntries(spanLineHead, maxWidthPtr)
  genericListHead	*spanLineHead;
  int			*maxWidthPtr;
{
	int		 result;
	genericList	*iptr;
	int		 width;

	result = 0;
	*maxWidthPtr = 0;
	for (iptr=spanLineHead->first; iptr!=NULL; iptr=iptr->next) {
		++result;
		if ((width = countWidth(iptr->data)) > *maxWidthPtr)
			*maxWidthPtr = width;
	}
	return(result);
}

  spanLineType *
normalizeWidth(maxWidth, spanLine)
  int		 maxWidth;
  spanLineType	*spanLine;
{
	spanLineType	*originalSpanLine;
	spanLineType	*oldSpanLine;
	int		 width;

	originalSpanLine = spanLine;
	width = 0;
	oldSpanLine = NULL;
	for (; spanLine!=NULL; spanLine=spanLine->next) {
		width += spanWidth(spanLine->span);
		oldSpanLine = spanLine;
	}
	if (oldSpanLine == NULL)
		return(whiteSpanLine(maxWidth));
	else {
		if (oldSpanLine->span->kind == WHITE_SPAN)
			oldSpanLine->span->count += (maxWidth - width);
		else if (maxWidth != width)
			oldSpanLine->next = whiteSpanLine(maxWidth - width);
		return(originalSpanLine);
	}
}

  spanLineType **
separateLines(spanList, lineCountPtr, widthPtr)
  genericListHead	*spanList;
  int			*lineCountPtr;
  int			*widthPtr;
{
	int		  lineCount;
	int		  i;
	spanLineType	**lineDisplay;
	genericList	 *iptr;
	genericList	 *oldIptr;
	int		  maxWidth;

	lineCount = countEntries(spanList, &maxWidth);
	++maxWidth;
	lineDisplay = typeAllocMulti(spanLineType *, lineCount+2);
	for (i=1, iptr=spanList->first; i<=lineCount; ++i) {
		lineDisplay[i] = normalizeWidth(maxWidth, (spanLineType *)
			(((genericListHead *)(iptr->data))->first));
		oldIptr = iptr;
		free(iptr->data);
		iptr = iptr->next;
		free(oldIptr);
	}
	free(spanList);
	lineDisplay[0] = whiteSpanLine(maxWidth);
	lineDisplay[lineCount+1] = whiteSpanLine(maxWidth);
	*lineCountPtr = lineCount;
	*widthPtr = maxWidth;
	return(lineDisplay);
}

  plexProductionType *
plexParse(spanList)
  genericListHead	*spanList;
{
	spanLineType		**lineDisplay;
	int			  lineCount;
	int			  width;
	nodeType		**entryList;
	spanLineType		**nodeList;
	plexProductionType	 *result;
	spanLineType		**findNodes();

	lineDisplay = separateLines(spanList, &lineCount, &width);
	if (mapInput) {
		dumpPlex(lineDisplay, lineCount, width);
		fflush(stdout);
	}
	entryList = typeAllocMulti(nodeType *, E);
	nodeList = findNodes(lineDisplay, lineCount, width, entryList);
	result = typeAlloc(plexProductionType);
	result->nodeList = nodeList;
	result->entryList = entryList;
	result->height = lineCount;
	return(result);
}

dumpPlex(lines, height, width)
  spanLineType	**lines;
  int		  height;
  int		  width;
{
	int	y;

	for (y=0; y<=height+1; ++y)
		dumpLine(lines[y], width);
	printf("\n");
}

dumpLine(line, width)
  spanLineType	*line;
  int		 width;
{
	printf("\t");
	for (; line!=NULL; line=line->next)
		dumpSpan(line->span);
	printf("\n");
}

dumpSpan(span)
  spanType	*span;
{
	int	size;
	char	spanChar;

	if (span->kind == NODE_SPAN) {
		size = ((parseNodeType *)(span->count))->count;
		spanChar = 'x';
	} else {
		size = span->count;
		switch (span->kind) {
			Case WHITE_SPAN:
				spanChar = '.';
			Case H_SPAN:
				spanChar = '-';
			Case V_SPAN:
				size = 1;
				spanChar = '|';
			Case X_SPAN:
				spanChar = '+';
			Case FILLER_SPAN:
				spanChar = '#';
			Case END_SPAN:
				spanChar = '^';
			Default:
				error("This can't happen!\n");
		}
	}
	if (size == 0) printf("$");
	while (size-- > 0)
		printf("%c", spanChar);
}
