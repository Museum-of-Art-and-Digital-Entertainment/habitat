D			[0-9]
L			[a-zA-Z_.]
H			[a-fA-F0-9]

%{
#include <stdio.h>
#include "y.tab.h"
#include "plexTypes.h"
#include "plexGlobals.h"

extern int  yylval;
char	   *decodeString();

#undef input
#undef unput
%}

%%
"/*"			{ comment(); }
"."			{ yylval = 0; return('.'); }

"start"			{ yylval = 0; return(START); }
"include"		{ yylval = 0; return(INCLUDE); }
"shuffle"		{ yylval = 0; return(SHUFFLE); }

{L}({L}|{D})*		{ if ((yylval = lookupSymbol(yytext)) == NULL)
				yylval = newSymbol(buildString(yytext), NULL);
			  return(Identifier); }

0[xX]{H}+		{ yylval = decodeNumber(&yytext[2],16,strlen(yytext));
			  return(Number); }
0{D}+			{ yylval = decodeNumber(&yytext[1], 8,strlen(yytext));
			  return(Number); }
{D}+			{ yylval = decodeNumber(yytext, 10, strlen(yytext));
			  return(Number); }

\"(\\\"|[^"])*\"	{ yylval = (int)decodeString(yytext);
			  return(String); }

" "			{ yylval = 0; return(' '); }
\t			{ yylval = 0; return('\t'); }
","			{ yylval = 0; return(','); }
":"			{ yylval = 0; return(':'); }
"|"			{ yylval = 0; return('|'); }
"/"			{ yylval = 0; return('/'); }
\\			{ yylval = 0; return('\\'); }
"!"			{ yylval = 0; return('!'); }
"<"			{ yylval = 0; return('<'); }
">"			{ yylval = 0; return('>'); }
"*"			{ yylval = 0; return('*'); }
"$"			{ yylval = 0; return('$'); }
"="			{ yylval = 0; return('='); }
"?"			{ yylval = 0; return('?'); }
"^"			{ yylval = 0; return('^'); }
"+"			{ yylval = 0; return('+'); }
"-"			{ yylval = 0; return('-'); }
"#"			{ yylval = 0; return('#'); }
"("			{ yylval = 0; return('('); }
")"			{ yylval = 0; return(')'); }
"["			{ yylval = 0; return('['); }
"]"			{ yylval = 0; return(']'); }
\n			{ yylval = 0; return(EOL); }

.			{ ; /* ignore bad characters */ }

%%

yywrap()
{
	return(1);
}

comment()
{
	char c, c1;

loop:
	while ((c = input()) != '*' && c != 0)
		;

	if ((c1 = input()) != '/' && c != 0) {
		unput(c1);
		goto loop;
	}
}

  int
decodeNumber(string, radix, count)
  char	*string;
  int	 radix;
{
	numberType	*result;
	int		 resultValue;

	resultValue = 0;
	while (*string != '\0')
		resultValue = resultValue * radix + decodeDigit(*string++,
			radix);
	result = typeAlloc(numberType);
	result->value = resultValue;
	result->count = count;
	return((int) result);
}

  int
decodeDigit(digit, radix)
  char	digit;
  int	radix;
{
	if (radix <= 10)
		return (digit - '0');
	else if ('a' <= digit && digit <= 'f')
		return (digit - 'a' + 10);
	else if ('A' <= digit && digit <= 'F')
		return (digit - 'A' + 10);
	else
		return (digit - '0');
}

  char *
decodeString(string)
  char	*string;
{
	int	i;

	string[strlen(string) - 1] = '\0';
	for (i=0; string[i]!='\0'; ++i)
		;
	return((char *)buildString(&string[1]));
}

input()
{
	char		 result;
	fileList	*oldInputStack;

	result = getc(currentInput);
	if (result == '\n')
		++currentLineNumber;
	else if (result == EOF) {
		if (inputStack == NULL) {
/*			if (debug) printf("in(EOF)\n");*/
			return(0);
		} else {
			if (announceIncludes) {
				fprintf(stderr, "<-\n");
				fflush(stderr);
			}
			fclose(currentInput);
			currentInput = inputStack->fyle;
			if (currentInput == NULL) {
				if ((currentInput = fopen(inputStack->
						saveName, "r")) == NULL) {
					error("can't open input file %s\n",
						inputStack->saveName);
					perror("Unix sez");
				}
			}
			currentFileName = inputStack->saveName;
			currentLineNumber = inputStack->saveLine;
			oldInputStack = inputStack;
			inputStack = inputStack->next;
			free(oldInputStack);
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
	if (c == '\n')
		--currentLineNumber;
	ungetc(c, currentInput);
}
