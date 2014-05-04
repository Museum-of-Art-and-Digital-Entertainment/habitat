/*
	griddle -- Ghu's Region Internal Database Description LanguagE
 */

#include "griddleDefs.h"
int yydebug;

#define argcheck(i,m) if (++i >= argc) { error(m); exit(1); }
#define argfile(fd,m,t)	{						\
			fileName = *args++;				\
			if (strcmp(fileName, "-") == 0)			\
				fd = stdout;				\
			else if ((fd = fopen(fileName, t)) == NULL)	\
				systemError(m, fileName);		\
			}
#define argfiler(fd,m) argfile(fd,m,"r")
#define argfilew(fd,m) argfile(fd,m,"w")

main(argc, argv)
  int	 argc;
  char	*argv[];
{
	int i;
	int yyparse();
	boolean initialize();

	if (!initialize(argc, argv))
		exit(1);
#ifndef FRED
	if (indirFile == NULL)
		yyparse();
	else
		indirectGriddle();
#else
	yyparse();
#endif
	readClassFile();
#ifndef FRED
	while (cvInput != NULL) {
		inputContentsVector(cvInput->string);
		cvInput = cvInput->nextString;
	}
	if (cvFile != NULL)
		outputContentsVector();
#else
	doFredStuff();
#endif
}

  void
resetRegionCounters()
{
	int	i;

	for (i=0; i<objectCount; ++i) {
		if (noidArray[i] != NULL) {
			freeObject(noidArray[i]);
			noidArray[i] = NULL;
		}
	}
	globalIdCounter = 1001;
	objectCount = 0;
	rawCount = 0;
	useStartCount = 0;
}

  boolean
initialize(argc, argv)
  int	 argc;
  char	*argv[];
{
	int	  i;
	int	  j;
	char	**args;
	char	 *arg;
	boolean	  inputFilesGiven;
	char	 *defineFileName;
	char	 *fileName;

	char		 *getenv();
	void		  queueInputFile();
	boolean		  openFirstFile();
	stringList	 *buildStringList();

	griFile = NULL;
	rawFile = NULL;
	indirFile = NULL;
	cvFile = NULL;
	cvInput = NULL;
	fredModeLexing = FALSE;
	debug = FALSE;
	yydebug = FALSE;
	testMode = FALSE;
	objectBase = 0;
	sortObjects = FALSE;
	insideDefinition = FALSE;
	objectCount = 0;
	resetRegionCounters();
	inputStack = NULL;
	announceIncludes = FALSE;
	inputFilesGiven = FALSE;
	assignRelativeIds = FALSE;
	indirectPass = 0;
	setKeywordMinlengths();

	for (i=0; i<MAXCLASS+1; ++i)
		classDefs[i] = NULL;

	args = argv + 1;
	if ((defineFileName = getenv("GHUDEFINES")) == NULL)
		queueInputFile("/u0/habitat/defines.ghu");
	else
		queueInputFile(defineFileName);
	if ((classFileName = getenv("CLASSINFO")) == NULL)
		classFileName = "/u0/habitat/class.dat";
	for (i=1; i<argc; i++) {
		arg = *args++;
		if (*arg != '-') {
#ifndef FRED
			queueInputFile(arg);
			inputFilesGiven = TRUE;
			continue;
#else
			error("illegal parameter '%s'\n", arg);
			exit(1);
#endif
		}
		for (j=1; arg[j]!='\0'; j++) switch (arg[j]) {
		case 'D':
			debug = TRUE;
			continue;

		case 'I':
			announceIncludes = TRUE;
			continue;

		case 'R':
			assignRelativeIds = TRUE;
			continue;
#ifndef FRED
		case 'c':
			argcheck(i, "no cv output file name after -c\n");
			argfilew(cvFile, "can't open cv file %s\n");
			continue;

		case 'v':
			argcheck(i, "no cv input file name after -v\n");
			cvInput = buildStringList(cvInput, *args++);
			continue;

		case 'g':
		case 'l':
			argcheck(i,"no gri file name after -g\n");
			argfilew(griFile, "can't open gri output file %s\n");
			continue;

		case 'i':
			argcheck(i, "no indirect file name after -i\n");
			argfiler(indirFile, "can't open indirect file %s\n");
			continue;

		case 'r':
		case 'o':
			argcheck(i,"no raw file name after -r\n");
			argfilew(rawFile, "can't open raw output file %s\n");
			continue;
#endif
		case 'Y':
			yydebug = TRUE;
			continue;

		case 't':
			testMode = TRUE;
			continue;

		default:
			error("bad command line flag -%c\n", arg[j]);
			exit(1);
		}
	}
#ifndef FRED
	if(inputFilesGiven && indirFile != NULL) {
		error("input files and indirect file given at the same time");
		exit(1);
	} if (!inputFilesGiven && cvInput == NULL && indirFile == NULL)
		queueInputFile("-");
#endif

	for (i=0; i<MAXNOID; ++i)
		noidArray[i] = NULL;
	if (indirFile == NULL)
		return(openFirstFile(FALSE));
}

  int
hash(s)
  char	*s;
{
	int	result;

	result = 0;
	while (*s != '\0')
		result = (result << 1) ^ *s++;
	return(result & (HASH_MAX - 1));
}

  symbol *
insertSymbol(name)
  char	*name;
{
	symbol	*newSymbol;
	int	 hashval;
	symbol	*mptr;
	symbol	*oldmptr;
	int	 cmp;

	newSymbol = typeAlloc(symbol);
	newSymbol->name = malloc(strlen(name) + 1);
	newSymbol->type = NON_SYM;
	newSymbol->codeNumber = 0;
	strcpy(newSymbol->name, name);
	hashval = hash(name);
	mptr = symbolTable[hashval];
	oldmptr = NULL;
	while (mptr != NULL) {
		if ((cmp = strcmp(name, mptr->name)) == 0) {
			error("Hey, symbol %s already in table!", name);
			exit(1);
		} else if (cmp > 0) {
			break;
		} else {
			oldmptr = mptr;
			mptr = mptr->next;
		}
	}
	if (oldmptr == NULL)
		symbolTable[hashval] = newSymbol;
	else
		oldmptr->next = newSymbol;
	newSymbol->next = mptr;
	return(newSymbol);
}

  symbol *
lookupSymbol(name)
  char	*name;
{
	symbol	*result;
	int	 cmp;

	result = symbolTable[hash(name)];
	while (result != NULL) {
		if ((cmp = strcmp(name, result->name)) == 0)
			return(result);
		else if (cmp > 0)
			result = NULL;
		else
			result = result->next;
	}
	return(insertSymbol(name));
}

  void
yyerror(s)
  char *s;
{
	error("\"%s\", line %d: %s\n", currentFileName, currentLineNumber, s);
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

  boolean
openFirstFile(fredMode)
  boolean fredMode;
{
	if (inputStack == NULL || strcmp(inputStack->saveName, "-") == 0) {
		inputStack = typeAlloc(fileList);
		inputStack->saveName = "<standard input>";
		inputStack->fyle = stdin;
		inputStack->saveLine = 1;
		inputStack->next = NULL;
	} else {
		if ((inputStack->fyle = fopen(inputStack->saveName,
							"r")) == NULL) {
			if (!fredMode)
				error("can't open input file %s\n",
					inputStack->saveName);
			free(inputStack);
			inputStack = NULL;
			return(FALSE);
		}
	}
	currentInput = inputStack->fyle;
	currentLineNumber = inputStack->saveLine;
	currentFileName = inputStack->saveName;
	purgeUnget();
	return(TRUE);
}

error(msg, arg1, arg2, arg3)
  char	*msg;
  int	arg1, arg2, arg3;
{
	fprintf(stderr, "error: ");
	fprintf(stderr, msg, arg1, arg2, arg3);
}

systemError(msg, arg1, arg2, arg3)
  char	*msg;
  int	arg1, arg2, arg3;
{
	error(msg, arg1, arg2, arg3);
	perror("Unix says");
	exit(1);
}

  void
translate(s, c1, c2)
  char	*s;
  char	 c1;
  char	 c2;
{
	for (; *s != '\0'; ++s)
		if (*s == c1)
			*s = c2;
}

  char *
saveString(s)
  char *s;
{
	char	*result;

	result = (char *)malloc(strlen(s) + 1);
	strcpy(result, s);
	return(result);
}
