D			[0-9]
L			[a-zA-Z_]
H			[a-fA-F0-9]

%{
#include <stdio.h>
#include "y.tab.h"

extern int  yylval;
char	   *decodeString();

%}

%%
"/*"			{ comment(); }

"action"		{ yylval = 0; return(ACTION); }
"byte"			{ yylval = 0; return(BYTE); }
"class"			{ yylval = 0; return(CLASS); }
"head"			{ yylval = 0; return(HEAD); }
"image"			{ yylval = 0; return(IMAGE); }
"sound"			{ yylval = 0; return(SOUND); }
"word"			{ yylval = 0; return(WORD); }

{L}({L}|{D})*		{ yylval = buildString(yytext);
			  return(Identifier); }

-?0[xX]{H}+		{ yylval = decodeNumber(&yytext[2], 16);
			  return(Number); }
-?0{D}+			{ yylval = decodeNumber(&yytext[1], 8);
			  return(Number); }
-?{D}+			{ yylval = decodeNumber(yytext, 10); return(Number); }

\"(\\\"|[^"])*\"	{ yylval = (int)decodeString(yytext);
			  return(String); }

"{"			{ yylval = 0; return('{'); }
"}"			{ yylval = 0; return('}'); }
","			{ yylval = 0; return(','); }
":"			{ yylval = 0; return(':'); }

[ \t\v\n\f]		{ ; }
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

	if ((c1 = input()) != '/' && c != 0)
	{
		unput(c1);
		goto loop;
	}
}

  int
decodeNumber(string, radix)
  char	*string;
  int	 radix;
{
	int	result;
	int	sign;

	result = 0;
	if (*string == '-') {
		sign = -1;
		++string;
	} else
		sign = 1;
	while (*string != '\0')
		result = result * radix + decodeDigit(*string++, radix);
	return(result * sign);
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
	string[strlen(string) - 1] = '\0';
	return((char *)buildString(&string[1]));
}

