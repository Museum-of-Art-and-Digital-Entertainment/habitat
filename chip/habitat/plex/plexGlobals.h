/* 
   plexGlobals.h: Global variables for Plex.

   Chip Morningstar, Lucasfilm Ltd., 26-January-1987
 */

#define HASH_TABLE_SIZE 512
#define HASH_TABLE_MASK 0x1FF
static symbolType	*symbolTable[HASH_TABLE_SIZE];

spanType	*dbSpan;
spanLineType	*dbSpanLine;
spanListType	*dbSpanList;
parseNodeType	*dbParseNode;
int		 currentDotValue;

fileList	*inputStack;
fileList	*bottomOfInputStack;
FILE		*currentInput;
int		 currentLineNumber;
char		*currentFileName;
bool		 announceIncludes;
bool		 mapInput;
bool		 dumpTrees;
bool		 dumpInstance1, dumpInstance2, dumpInstance3;
