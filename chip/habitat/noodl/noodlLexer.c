/*
   noodlLexer.c -- Lexical analyzer for the Noodl preprocessor.

   Chip Morningstar, Lucasfilm Ltd., 2-January-1986
 */

#include "y.tab.h"
#include "noodlTypes.h"

extern int	yylval;
int		lineNumber;

/*

   There's only four different types of lexical critters, so this should be
   pretty easy (famous last words): identifiers (the usual), the sole keyword
   "class", numbers (decimal only, also the usual), and C code (anything
   between "{" and "}").

   The only tricky thing is C code.  We have to count nested brackets and
   beware to NOT count the ones inside quotes!

   Also, of course, we discard comments and whitespace outside of bracketed C
   code.
 */

#define isDigit(c) ('0'<=c && c<='9')
#define isAlphabetic(c) (('a'<=c && c<='z') || ('A'<=c && c<='Z') || c=='_')
#define isAlphanumeric(c) (isDigit(c) || isAlphabetic(c))
#define isWhitespace(c) (c==' ' || c=='\t' || c=='\n')

  char
getCharacter()
{
	char	result;

	result = getc(stdin);
	if (result == '\n')
		++lineNumber;
	return(result);
}

  void
ungetCharacter(c)
  char	c;
{
	if (c == '\n')
		--lineNumber;
	ungetc(c, stdin);
}

  char
skipComment()
{
	char	previousC;
	char	c;

	c = '\0';
	do {
		previousC = c;
		c = getCharacter();
	} while (!((c=='/' && previousC=='*') || c==EOF));
	if (c==EOF) {
		error(UNCLOSED_COMMENT_ERROR);
		return(c);
	} else
		return(getCharacter());
}

  char
getCharacterSkippingWhitespaceAndComments()
{
	char	c;
	char	c2;

	do {
		c = getCharacter();
		if (c == '/') {
			c2 = getCharacter();
			if (c2 == '*')
				c = skipComment();
			else
				(ungetCharacter(c2));
		}
	} while (isWhitespace(c));
}

  int
lexNumber(c)
  char	c;
{
	yylval = 0;
	while (isDigit(c)) {
		yylval = yylval * 10 + c - '0';
		c = getCharacter();
	}
	ungetCharacter(c);
/*printf("...lexer returns Number %d\n", yylval);*/
	return(Number);
}

  int
lexIdentifier(c)
  char	c;
{
	char	snarfBuffer[BUFFER_SIZE];
	int	i;

	i = 0;
	while (isAlphanumeric(c)) {
		if (i < BUFFER_SIZE)
			snarfBuffer[i++] = c;
		c = getCharacter();
	}
	snarfBuffer[i++] = '\0';
	ungetCharacter(c);
	yylval = 0;
	if (strcmp(snarfBuffer, "class") == 0) {
		return(CLASS);
	} else if (strcmp(snarfBuffer, "objects") == 0) {
		return(OBJECT);
	} else {
		yylval = malloc(i);
		strcpy(yylval, snarfBuffer);
		return(Identifier);
	}
}

int	hugePtr;
char	hugeBuffer[HUGE_BUFFER_SIZE];

  void
spanString(endc)
  char	endc;
{
	char	previousC;
	char	c;

	c = '\0';
	do {
		previousC = c;
		hugeBuffer[hugePtr++] = c = getCharacter();
	} while (!((c==endc && previousC!='\\') || c==EOF));
	if (c==EOF) {
		error(UNCLOSED_STRING_ERROR);
		ungetCharacter(c);
	}
}

  void
spanComment()
{
	char	previousC;
	char	c;

	hugeBuffer[hugePtr++] = '*';
	c = '\0';
	do {
		previousC = c;
		hugeBuffer[hugePtr++] = c = getCharacter();
	} while (!((c=='/' && previousC=='*') || c==EOF));
	if (c==EOF) {
		error(UNCLOSED_COMMENT_ERROR);
		ungetCharacter(c);
	}
}

  int
lexCCode()
{
	int	nestDepth;
	char	c;
	char	c2;

	nestDepth = 1;
	hugePtr = 0;
	while (nestDepth > 0) {
		hugeBuffer[hugePtr++] = c = getCharacter();
		if (c == '{')
			++nestDepth;
		else if (c == '}')
			--nestDepth;
		else if (c == '"')
			spanString('"');
		else if (c == '\'')
			spanString('\'');
		else if (c == '/') {
			c2 = getCharacter();
			if (c2 == '*')
				spanComment();
			else
				ungetCharacter(c2);
		} else if (c == EOF) {
			error(UNCLOSED_CCODE_ERROR);
			ungetCharacter(c);
			break;
		}
	}
	hugeBuffer[--hugePtr] = '\0';
	yylval = malloc(hugePtr + 1);
	strcpy(yylval, hugeBuffer);
/*printf("...lexer returns CCode {%s}\n", yylval);*/
	return(CCode);
}

bool passedEnd = FALSE;

  int
yylex()
{
	char	c;

	c = getCharacterSkippingWhitespaceAndComments();
	if (isDigit(c))
		return(lexNumber(c));
	else if (isAlphabetic(c))
		return(lexIdentifier(c));
	else if (c == '{')
		return(lexCCode());
	else {
/*printf("...lexer returns character '%c'\n", c);*/
		if (c == EOF) {
			if (passedEnd) {
				return(0);
			} else {
				passedEnd = TRUE;
				return(ENDFILE);
			}
		}
		return(c);
	}
}
