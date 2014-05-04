/* 
   main.c: Main for Plex.

   Chip Morningstar, Lucasfilm Ltd., 26-January-1987
 */

#include "plexTypes.h"
#include "plexGlobals.h"

int yydebug;

main(argc, argv)
  int	 argc;
  char	*argv[];
{
	void	initializeStuff();

	initializeStuff(argc, argv);
	yyparse();
}

  void
initializeStuff(argc, argv)
  int	 argc;
  char	*argv[];
{
	int	  i;
	int	  j;
	char	**args;
	char	 *arg;
	char	 *fileName;
	void	  queueInputFile();
	void	  openFirstFile();

	srandom(getpid());
	currentLineNumber = 0;
	for (i=0; i<HASH_TABLE_SIZE; ++i) {
		symbolTable[i] = NULL;
	}
	inputStack = NULL;
	announceIncludes = FALSE;
	mapInput = FALSE;
	dumpTrees = FALSE;
	dumpInstance1 = dumpInstance2 = dumpInstance3 = FALSE;
	args = argv + 1;
	for (i=1; i<argc; i++) {
		arg = *args++;
		if (*arg != '-') {
			queueInputFile(arg);
			continue;
		}
		for (j=1; arg[j]!='\0'; j++) switch (arg[j]) {
		case 'D':
			yydebug = TRUE;
			continue;

		case 'I':
			announceIncludes = TRUE;
			continue;

		case '1':
			dumpInstance1 = TRUE;
			continue;

		case '2':
			dumpInstance2 = TRUE;
			continue;

		case '3':
			dumpInstance3 = TRUE;
			continue;

		case 'M':
			mapInput = TRUE;
			continue;

		case 'T':
			dumpTrees = TRUE;
			continue;

		default:
			fprintf(stderr, "bad command line flag -%c\n", arg[j]);
			exit(1);
		}
	}
	openFirstFile();
}

  void
error(message, arg1, arg2, arg3)
  char	*message;
  int	 arg1;
  int	 arg2;
  int	 arg3;
{
	fprintf(stderr, message, arg1, arg2, arg3);
}

  void
fatalError(message, arg1, arg2, arg3)
  char	*message;
  int	 arg1;
  int	 arg2;
  int	 arg3;
{
	fprintf(stderr, "fatal error: ");
	error(message, arg1, arg2, arg3);
	exit(1);
}

  int
randomNumber(range)
  int	range;
{
	return((abs(random()) >> 2) % range);
}

  void
queueInputFile(name)
  char	*name;
{
	fileList	*newFileName;

	newFileName = typeAlloc(fileList);
	newFileName->saveName = name;
	newFileName->fyle = NULL;
	newFileName->next = NULL;
	newFileName->saveLine = 1;
	if (inputStack == NULL) {
		inputStack = bottomOfInputStack = newFileName;
	} else {
		bottomOfInputStack->next = newFileName;
		bottomOfInputStack = newFileName;
	}
}

  void
openFirstFile()
{
	if (inputStack == NULL) {
		inputStack = typeAlloc(fileList);
		inputStack->saveName = "<standard input>";
		inputStack->fyle = stdin;
		inputStack->saveLine = 1;
		inputStack->next = NULL;
	} else {
		if ((inputStack->fyle = fopen(inputStack->saveName,
							"r")) == NULL) {
			error("can't open input file %s\n",
				inputStack->saveName);
			perror("Unix sez");
		}
	}
	currentInput = inputStack->fyle;
	currentLineNumber = inputStack->saveLine;
	currentFileName = inputStack->saveName;
}
