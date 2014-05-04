#include "griddleDefs.h"
#include "y.tab.h"

extern int yylval;
int yydebug;

typedef enum {
	C_SKIP, C_ZERO, C_DIG, C_ALPH, C_QUOTE, C_APOSTROPHE, C_LIT, C_SLASH,
	C_NL
} charType;

static charType char_type[128] = {
/*       EOF     Soh     Stx     Etx     Eot     Enq     Ack     Bell       */
/*  0 */ C_LIT,  C_SKIP, C_SKIP, C_SKIP, C_SKIP, C_SKIP, C_SKIP, C_SKIP,
/*       Backsp  HTab    Newline VTab    Newpage Return  So      Si         */
/*  8 */ C_SKIP, C_SKIP, C_NL,   C_SKIP, C_SKIP, C_SKIP, C_SKIP, C_SKIP,
/*       Dle     Dc1     Dc2     Dc3     Dc4     Nak     Syn     Etb        */
/* 16 */ C_SKIP, C_SKIP, C_SKIP, C_SKIP, C_SKIP, C_SKIP, C_SKIP, C_SKIP,
/*       Can     Em      Sub     Escape  Fs      Gs      Rs      Us         */
/* 24 */ C_SKIP, C_SKIP, C_SKIP, C_SKIP, C_SKIP, C_SKIP, C_SKIP, C_SKIP,
/*       Space   !       "        #      $       %       &       '          */
/* 32 */ C_SKIP, C_SKIP, C_QUOTE, C_LIT, C_SKIP, C_LIT,  C_LIT,  C_APOSTROPHE,
/*       (       )       *       +       ,       -       .       /          */
/* 40 */ C_LIT,  C_LIT,  C_LIT,  C_LIT,  C_LIT,  C_LIT,  C_SKIP, C_SLASH,
/*       0       1       2       3       4       5       6       7          */
/* 48 */ C_DIG,  C_DIG,  C_DIG,  C_DIG,  C_DIG,  C_DIG,  C_DIG,  C_DIG,
/*       8       9       :       ;       <       =       >       ?          */
/* 56 */ C_DIG,  C_DIG,  C_LIT,  C_SKIP, C_SKIP, C_LIT,  C_SKIP, C_SKIP,
/*       @       A       B       C       D       E       F       G          */
/* 64 */ C_SKIP, C_ALPH, C_ALPH, C_ALPH, C_ALPH, C_ALPH, C_ALPH, C_ALPH,
/*       H       I       J       J       L       M       N       O          */
/* 72 */ C_ALPH, C_ALPH, C_ALPH, C_ALPH, C_ALPH, C_ALPH, C_ALPH, C_ALPH,
/*       P       Q       R       S       T       U       V       W          */
/* 80 */ C_ALPH, C_ALPH, C_ALPH, C_ALPH, C_ALPH, C_ALPH, C_ALPH, C_ALPH,
/*       X       Y       Z       [       \       ]       ^       _          */
/* 88 */ C_ALPH, C_ALPH, C_ALPH, C_SKIP, C_SKIP, C_SKIP, C_LIT,  C_ALPH,
/*       `       a       b       c       d       e       f       g          */
/* 96 */ C_SKIP, C_ALPH, C_ALPH, C_ALPH, C_ALPH, C_ALPH, C_ALPH, C_ALPH,
/*       h       i       j       k       l       m       n       o          */
/*104 */ C_ALPH, C_ALPH, C_ALPH, C_ALPH, C_ALPH, C_ALPH, C_ALPH, C_ALPH,
/*       p       q       r       s       t       u       v       w          */
/*112 */ C_ALPH, C_ALPH, C_ALPH, C_ALPH, C_ALPH, C_ALPH, C_ALPH, C_ALPH,
/*       x       y       z       {       |       }       `       Del        */
/*120 */ C_ALPH, C_ALPH, C_ALPH, C_LIT,  C_LIT,  C_LIT,  C_SKIP, C_SKIP
};

static int litCode[128] = {
/*       EOF     Soh     Stx     Etx     Eot     Enq     Ack     Bell       */
/*  0 */ 0,      0,      0,      0,      0,      0,      0,      0,     
/*       Backsp  HTab    Newline VTab    Newpage Return  So      Si         */
/*  8 */ 0,      0,      0,      0,      0,      0,      0,      0,     
/*       Dle     Dc1     Dc2     Dc3     Dc4     Nak     Syn     Etb        */
/* 16 */ 0,      0,      0,      0,      0,      0,      0,      0,     
/*       Can     Em      Sub     Escape  Fs      Gs      Rs      Us         */
/* 24 */ 0,      0,      0,      0,      0,      0,      0,      0,     
/*       Space   !       "       #       $       %       &       '          */
/* 32 */ 0,      0,      0,      '#',    0,      MOD,    AND,    0,
/*       (       )       *       +       ,       -       .       /          */
/* 40 */ '(',    ')',    MUL,    ADD,    ',',    SUB,    0,      0,
/*       0       1       2       3       4       5       6       7          */
/* 48 */ 0,      0,      0,      0,      0,      0,      0,      0,    
/*       8       9       :       ;       <       =       >       ?          */
/* 56 */ 0,      0,      ':',    0,      0,      '=',    0,      0,     
/*       @       A       B       C       D       E       F       G          */
/* 64 */ 0,      0,      0,      0,      0,      0,      0,      0,     
/*       H       I       J       J       L       M       N       O          */
/* 72 */ 0,      0,      0,      0,      0,      0,      0,      0,     
/*       P       Q       R       S       T       U       V       W          */
/* 80 */ 0,      0,      0,      0,      0,      0,      0,      0,     
/*       X       Y       Z       [       \       ]       ^       _          */
/* 88 */ 0,      0,      0,      0,      0,      0,      XOR,    0,     
/*       `       a       b       c       d       e       f       g          */
/* 96 */ 0,      0,      0,      0,      0,      0,      0,      0,     
/*       h       i       j       k       l       m       n       o          */
/*104 */ 0,      0,      0,      0,      0,      0,      0,      0,     
/*       p       q       r       s       t       u       v       w          */
/*112 */ 0,      0,      0,      0,      0,      0,      0,      0,     
/*       x       y       z       {       |       }       `       Del        */
/*120 */ 0,      0,      0,      '{',    OR,     '}',    0,      0
};

static boolean newline = TRUE;
static boolean oldnewline;

char yytext[256];

yylex()
{
	char	c;

	for (;;) {
		c = input();
		oldnewline = newline;
		newline = FALSE;
		switch (char_type[c]) {
			Case C_SLASH:
				if (oldnewline) {
					parseRawline();
					return(Rawline);
				}
				c = input();
				if (c == '*')
					comment();
				else {
					unput(c);
					return(DIV);
				}

			Case C_ZERO:
				c = input();
				if (c == 'x' || c == 'X')
					parseNumber(16, input());
				else if (c == 'b' || c == 'B')
					parseNumber(2, input());
				else if (c == 'q' || c == 'Q')
					parseNumber(4, input());
				else
					parseNumber(8, c);
				return(Number);

			Case C_DIG:
				parseNumber(10, c);
				return(Number);

			Case C_ALPH:
				parseName(c);
				if ((yylval = matchKeyword(yytext)) != 0)
					return(yylval);
				yylval = lookupSymbol(yytext);
/*				  if (debug)
				     printf("lexer: Name '%s'\n", yytext);*/
				 return(Name);

			Case C_QUOTE:
				lexString('"');
				string();
				return(String);

			Case C_APOSTROPHE:
				lexString('\'');
				c = input();
				if (c == 'b' || c == 'B') {
					bitString();
					return(BitString);
				} else {
					string();
					unput(c);
					return(String);
				}

			Case C_LIT:
				return(litCode[c]);

			Case C_NL:
				newline = TRUE;
		}
	}
}

parseName(c)
  char c;
{
	char	*cptr;

	cptr = yytext;
	while (char_type[c] == C_DIG || char_type[c] == C_ALPH) {
		*cptr++ = c;
		c = input();
	}
	*cptr = '\0';
	unput(c);
}

comment()
{
	char c, c1;

loop:
	while ((c = input()) != '*' && c != 0)
		;

	if ((c1 = input()) != '/' && c != 0)
	{
		unput(c1);
		goto loop;
	}
}

parseNumber(base, c)
  int	base;
  char  c;
{
	yylval = 0;
	while (isDigit(c, base)) {
		yylval = yylval * base + digitValue(c);
		c = input();
	}
	unput(c);
/*	if (debug)
		printf("lexer: Number (%d) = %d\n", base, yylval);*/
}

skipToEol()
{
	char	c;

	while ((c = input()) != '\n' && c != 0)
		;
	unput(c);
}

  int
getHexByte()
{
	char	c1, c2;

	while ((c1 = input()) == '\\' || c1 == ' ')
		if (c1 == '\\')
			c1 = input();
	if (c1 == '\n' || c1 == 0) {
		unput(c1);
		return(-1);
	} else if (!isDigit(c1, 16)) {
		error("illegal hex digit '%c'\n", c1);
		skipToEol();
		return(-2);
	}
	c2 = input();
	if (c2 == '\n' || c2 == 0) {
		unput(c1);
		error("bad hex digit parity\n");
		return(-2);
	} else if (!isDigit(c2, 16)) {
		error("illegal hex digit '%c'\n", c2);
		skipToEol();
		return(-2);
	}
	return(digitValue(c1) * 16 + digitValue(c2));
}

getHexString(buf, size)
  byte	*buf;
  int	 size;
{
	int	i;
	int	aByte;
	char	c;

	for (i=0; i<size; ++i) {
		aByte = getHexByte();
		if (aByte < 0) break;
		buf[i] = aByte;
	}
	if (aByte < 0) {
		error("raw line short\n");
		for (; i<size; ++i)
			buf[i] = 0;
	} else if (getHexByte() >= 0) {
		error("raw line long\n");
		skipToEol();
	}
}

parseRawline()
{
	object	*result;
	char	 hexString[1500];
	int	 length;

	result = typeAlloc(object);
	parseNumber(10, input());
	result->class = yylval;
	result->stateVector = (byte *)malloc(classDefs[yylval+1]->size);
	getHexString(result->stateVector, classDefs[yylval+1]->size);
	yylval = (int)result;
/*	if (debug)
		printf("lexer: Rawline class=%d addr=%x\n", result->class, result);*/
}

  boolean
isDigit(c, base)
  char	c;
  int	base;
{
	if (base <= 10)
		return('0' <= c && c <= '0' - 1 + base);
	else
		return( ('0' <= c && c <= '9') ||
			('a' <= c && c <= 'f') ||
			('A' <= c && c <= 'F') );
}

  int
digitValue(c)
  char	c;
{
	if ('0'<=c && c<='9')
		return(c - '0');
	else if ('a'<=c && c<='f')
		return(c - 'a' + 10);
	else
		return(c - 'A' + 10);
}

#define FORMFEED	 12
#define HALF_SPACE	128
#define DOUBLE_SPACE	143
#define INC_WIDTH	129
#define DEC_WIDTH	130
#define INC_HEIGHT	131
#define DEC_HEIGHT	132
#define HALF_SIZE	133
#define CHAR_RETURN	134
#define DN_HALF_CHAR	139
#define INVERSE		140
#define CURSOR_RIGHT	135
#define CURSOR_LEFT	136
#define CURSOR_UP	137
#define CURSOR_DOWN	138

static struct {
	char	inChar;
	char	outChar;
} escapes[] = {
	'n',  '\n',		't',  '\t',		'b',  '\b',
	'r',  '\r',		'f',  FORMFEED,		'e',  ESCAPE,
	'\\', '\\',		'\'', '\'',		'"',  '"',
	' ',  HALF_SPACE,	'#',  DOUBLE_SPACE,	'+',  INC_WIDTH,
	'-',  DEC_WIDTH,	'(',  INC_HEIGHT,	')',  DEC_HEIGHT,
	'h',  HALF_SIZE,	'd',  DN_HALF_CHAR,	'i',  INVERSE,
	'>',  CURSOR_LEFT,	'<',  CURSOR_RIGHT,	'^',  CURSOR_UP,
	'v',  CURSOR_DOWN,	'R',  CHAR_RETURN,	'\0', 0
};

  char
unescape()
{
	int	 i;
	char	 result;
	char	 c;

	c = input();
	if (c == '^') {
		result = input() & 0x3F;
	} else if (c == 'x') {
		result = 0;
		for (i=0; i<2; ++i) {
			c = input();
			if (isDigit(c, 16))
				result = result * 16 + digitValue(c);
			else
				unput(c);
		}
	} else if ('0' <= c && c <= '7') {
		result = digitValue(c);
		for (i=0; i<2; ++i) {
			c = input();
			if ('0' <= c && c <= '7')
				result = result * 8 + digitValue(c);
			else
				unput(c);
		}
	} else for (i=0; escapes[i].inChar!='\0'; ++i) {
		result = c;
		if (c == escapes[i].inChar) {
			result = escapes[i].outChar;
			break;
		}
	}
	return(result);
}

  char *
escape(c)
  char	c;
{
	int	i;
	static char result[5];

	if (' ' <= c && c <= '~')
		sprintf(result, "%c", c);
	else if (c == 0)
		sprintf(result, "\\0");
	else {
		sprintf(result, "\\%o", (byte)c);
		for (i=0; escapes[i].outChar!='\0'; ++i)
			if (c == escapes[i].outChar) {
				sprintf(result, "\\%c", escapes[i].inChar);
				break;
			}
	}
	return(result);
}

lexString(end)
  char	end;
{
	char	*str;
	char	 c;

	str = yytext;
	for (c = input(); c != end; c = input())
		if (c == '\\')
			*str++ = unescape();
		else
			*str++ = c;
	*str = '\0';
}

string()
{
	int	 len;
	char	*str;
	char	*inptr;

	str = malloc(strlen(yytext) + 1);
	yylval = (int)str;
	strcpy(str, yytext);
/*	if (debug)
		printf("lexer: String '%s'\n", yylval);*/
}

bitString()
{
	int	 len;
	byte	*str;
	int	 i;

	len = strlen(yytext);
	str = (byte *)malloc(((len+7) >> 3) + 1);
	yylval = (int)str;
	*str++ = len;
	for (i=0; i<((len+7) >> 3); ++i)
		str[i] = 0;
	for (i=0; i<len; ++i)
		str[i>>3] |= (yytext[i] == '0' ? 0 : 1) << (7 - (i&7));
/*	if (debug)
		printf("lexer: BitString, length=%d\n", len);*/
}

static char  lineBuf[500] = "";
static char *inptr = lineBuf;
static char  ungot;
static boolean	ungetFlag = FALSE;

purgeUnget()
{
	ungetFlag = FALSE;
}

input()
{
	char		 result;
	fileList	*oldInputStack;

	if (fredModeLexing)
		return(*fredLexString++);
	else if (ungetFlag) {
		ungetFlag = FALSE;
		return(ungot);
	}
	result = *inptr++;
	if (result == '\0') {
		if (fgets(lineBuf, 500, currentInput) == NULL) {
			result = EOF;
			--inptr;
		} else {
			inptr = lineBuf;
#ifndef FRED
			if (indirFile != NULL)
				replaceParams(lineBuf);
#endif
			result = *inptr++;
		}
	}
	if (result == '\n')
		++currentLineNumber;
	else if (result == EOF) {
		oldInputStack = inputStack;
		inputStack = inputStack->next;
		free(oldInputStack);
		ungetFlag = FALSE;
		if (announceIncludes) {
			fprintf(stderr, "<-\n");
			fflush(stderr);
		}
		fclose(currentInput);
		if (inputStack == NULL) {
/*			if (debug) printf("in(EOF)\n");*/
			return(0);
		} else {
			currentInput = inputStack->fyle;
			currentFileName = inputStack->saveName;
			if (currentInput == NULL) {
				if (strcmp(inputStack->saveName, "-") == 0) {
					currentInput = stdin;
					currentFileName = "<standard input>";
				} else if ((currentInput = fopen(inputStack->
						saveName, "r")) == NULL) {
				     systemError("can't open input file %s\n",
					inputStack->saveName);
				}
				inputStack->fyle = currentInput;
			}
			currentLineNumber = inputStack->saveLine;
			return(input());
		}
	}
/*	if (debug) printf("in(%c)\n", result);*/
	return(result);
}

unput(c)
  char	c;
{
/*	if (debug) printf("un(%c)\n", c);*/
	if (fredModeLexing)
		--fredLexString;
	else {
		ungetFlag = TRUE;
		ungot = c;
	}
}

static struct {
	char	*string;
	int	 token;
	int	 minlength;
} keywords[] = {
/*0*/	"a",	      A,         0,	"ava/id",     AVAID,     0,
/*2*/	"bin15",      BIN15,     0,	"bin31",      BIN31,     0,
/*4*/	"bit",        BIT,       0,	"byte",       BYTE,      0,
/*6*/	"ch/aracter", CHARACTER, 0,	"de/fine",    DEFINE,    0,
/*8*/	"endd/efine", ENDDEFINE, 0,	"ent/ity",    ENTITY,    0,
/*10*/	"fat/word",   FATWORD,   0,	"include",    INCLUDE,   0,
/*12*/	"int/eger",   BIN15,     0,	"lo/ng",      BIN31,     0,
/*14*/	"o",	      O,	 0,	"obj/id",     OBJID,     0,
/*16*/	"r",	      R,	 0,	"reg/id",     REGID,     0,
/*18*/	"use",	      USE,	 0,     "var/string", VARSTRING, 0,
/*20*/	"wo/rds",     WORDS,     0,	NULL,         0,         0
};

static int keystart[26] = {
	/* a */ 0,   /* b */ 2,   /* c */ 6,   /* d */ 7,   /* e */ 8,
	/* f */ 10,  /* g */ -1,  /* h */ -1,  /* i */ 11,  /* j */ -1,
	/* k */ -1,  /* l */ 13,  /* m */ -1,  /* n */ -1,  /* o */ 14,
	/* p */ -1,  /* q */ -1,  /* r */ 16,  /* s */ -1,  /* t */ -1,
	/* u */ 18,  /* v */ 19,  /* w */ 20,  /* x */ -1,  /* y */ -1,
	/* z */ -1 };
static int keyend[26] = {
	/* a */ 1,   /* b */ 5,   /* c */ 6,   /* d */ 7,   /* e */ 9,
	/* f */ 10,  /* g */ -1,  /* h */ -1,  /* i */ 12,  /* j */ -1,
	/* k */ -1,  /* l */ 13,  /* m */ -1,  /* n */ -1,  /* o */ 15,
	/* p */ -1,  /* q */ -1,  /* r */ 17,  /* s */ -1,  /* t */ -1,
	/* u */ 18,  /* v */ 19,  /* w */ 20,  /* x */ -1,  /* y */ -1,
	/* z */ -1 };
	

setKeywordMinlengths()
{
	char	*trailer;
	char	*index();
	int	 i;

	for (i = 0; keywords[i].string != NULL; ++i) {
		trailer = index(keywords[i].string, '/');
		if (trailer == NULL) {
			keywords[i].minlength = strlen(keywords[i].string);
		} else {
			keywords[i].minlength = trailer - keywords[i].string;
			strcpy(trailer, trailer + 1);
		}
	}
}

  int
matchKeyword(s)
  char	*s;
{
	register int i;
	register int firstc;
	int len;

	firstc = *s - 'a';
	if (firstc < 0 || 25 < firstc || keystart[firstc] == -1)
		return(0);
	len = strlen(s);
	for (i = keystart[firstc]; i <= keyend[firstc]; ++i) {
		if (len >= keywords[i].minlength &&
				strncmp(s, keywords[i].string, len) == 0)
			return(keywords[i].token);
	}
	return(0);
}
