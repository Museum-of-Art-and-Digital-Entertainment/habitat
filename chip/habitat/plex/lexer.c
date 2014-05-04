# include "stdio.h"
# define U(x) x
# define NLSTATE yyprevious=YYNEWLINE
# define BEGIN yybgin = yysvec + 1 +
# define INITIAL 0
# define YYLERR yysvec
# define YYSTATE (yyestate-yysvec-1)
# define YYOPTIM 1
# define YYLMAX 200
# define output(c) putc(c,yyout)
# define input() (((yytchar=yysptr>yysbuf?U(*--yysptr):getc(yyin))==10?(yylineno++,yytchar):yytchar)==EOF?0:yytchar)
# define unput(c) {yytchar= (c);if(yytchar=='\n')yylineno--;*yysptr++=yytchar;}
# define yymore() (yymorfg=1)
# define ECHO fprintf(yyout, "%s",yytext)
# define REJECT { nstr = yyreject(); goto yyfussy;}
int yyleng; extern char yytext[];
int yymorfg;
extern char *yysptr, yysbuf[];
int yytchar;
FILE *yyin ={stdin}, *yyout ={stdout};
extern int yylineno;
struct yysvf { 
	struct yywork *yystoff;
	struct yysvf *yyother;
	int *yystops;};
struct yysvf *yyestate;
extern struct yysvf yysvec[], *yybgin;
#include <stdio.h>
#include "y.tab.h"
#include "plexTypes.h"
#include "plexGlobals.h"

extern int  yylval;
char	   *decodeString();

#undef input
#undef unput
# define YYNEWLINE 10
yylex(){
int nstr; extern int yyprevious;
while((nstr = yylook()) >= 0)
yyfussy: switch(nstr){
case 0:
if(yywrap()) return(0); break;
case 1:
		{ comment(); }
break;
case 2:
		{ yylval = 0; return('.'); }
break;
case 3:
		{ yylval = 0; return(START); }
break;
case 4:
	{ yylval = 0; return(INCLUDE); }
break;
case 5:
	{ yylval = 0; return(SHUFFLE); }
break;
case 6:
	{ if ((yylval = lookupSymbol(yytext)) == NULL)
				yylval = newSymbol(buildString(yytext), NULL);
			  return(Identifier); }
break;
case 7:
	{ yylval = decodeNumber(&yytext[2],16,strlen(yytext));
			  return(Number); }
break;
case 8:
		{ yylval = decodeNumber(&yytext[1], 8,strlen(yytext));
			  return(Number); }
break;
case 9:
		{ yylval = decodeNumber(yytext, 10, strlen(yytext));
			  return(Number); }
break;
case 10:
{ yylval = (int)decodeString(yytext);
			  return(String); }
break;
case 11:
		{ yylval = 0; return(' '); }
break;
case 12:
		{ yylval = 0; return('\t'); }
break;
case 13:
		{ yylval = 0; return(','); }
break;
case 14:
		{ yylval = 0; return(':'); }
break;
case 15:
		{ yylval = 0; return('|'); }
break;
case 16:
		{ yylval = 0; return('/'); }
break;
case 17:
		{ yylval = 0; return('\\'); }
break;
case 18:
		{ yylval = 0; return('!'); }
break;
case 19:
		{ yylval = 0; return('<'); }
break;
case 20:
		{ yylval = 0; return('>'); }
break;
case 21:
		{ yylval = 0; return('*'); }
break;
case 22:
		{ yylval = 0; return('$'); }
break;
case 23:
		{ yylval = 0; return('='); }
break;
case 24:
		{ yylval = 0; return('?'); }
break;
case 25:
		{ yylval = 0; return('^'); }
break;
case 26:
		{ yylval = 0; return('+'); }
break;
case 27:
		{ yylval = 0; return('-'); }
break;
case 28:
		{ yylval = 0; return('#'); }
break;
case 29:
		{ yylval = 0; return('('); }
break;
case 30:
		{ yylval = 0; return(')'); }
break;
case 31:
		{ yylval = 0; return('['); }
break;
case 32:
		{ yylval = 0; return(']'); }
break;
case 33:
		{ yylval = 0; return(EOL); }
break;
case 34:
		{ ; /* ignore bad characters */ }
break;
case -1:
break;
default:
fprintf(yyout,"bad switch yylook %d",nstr);
} return(0); }
/* end of yylex */

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
int yyvstop[] ={
0,

34,
0,

12,
34,
0,

33,
0,

11,
34,
0,

18,
34,
0,

34,
0,

28,
34,
0,

22,
34,
0,

29,
34,
0,

30,
34,
0,

21,
34,
0,

26,
34,
0,

13,
34,
0,

27,
34,
0,

2,
6,
34,
0,

16,
34,
0,

9,
34,
0,

9,
34,
0,

14,
34,
0,

19,
34,
0,

23,
34,
0,

20,
34,
0,

24,
34,
0,

6,
34,
0,

31,
34,
0,

17,
34,
0,

32,
34,
0,

25,
34,
0,

6,
34,
0,

6,
34,
0,

15,
34,
0,

10,
0,

6,
0,

1,
0,

8,
9,
0,

9,
0,

6,
0,

6,
0,

6,
0,

10,
0,

7,
0,

6,
0,

6,
0,

6,
0,

6,
0,

6,
0,

6,
0,

6,
0,

6,
0,

3,
6,
0,

6,
0,

6,
0,

4,
6,
0,

5,
6,
0,
0};
# define YYTYPE char
struct yywork { YYTYPE verify, advance; } yycrank[] ={
0,0,	0,0,	1,3,	0,0,	
0,0,	0,0,	0,0,	0,0,	
0,0,	0,0,	1,4,	1,5,	
0,0,	0,0,	0,0,	0,0,	
0,0,	0,0,	0,0,	0,0,	
0,0,	0,0,	0,0,	0,0,	
0,0,	0,0,	0,0,	0,0,	
0,0,	0,0,	0,0,	0,0,	
0,0,	1,6,	1,7,	1,8,	
1,9,	1,10,	0,0,	0,0,	
36,45,	1,11,	1,12,	1,13,	
1,14,	1,15,	1,16,	1,17,	
1,18,	1,19,	1,20,	1,20,	
1,20,	1,20,	1,20,	1,20,	
1,20,	1,20,	1,20,	1,21,	
18,38,	1,22,	1,23,	1,24,	
1,25,	0,0,	1,26,	0,0,	
0,0,	0,0,	0,0,	0,0,	
1,26,	1,26,	1,26,	1,26,	
1,26,	1,26,	1,26,	1,26,	
1,26,	1,26,	1,26,	1,26,	
1,26,	1,26,	1,26,	1,26,	
1,26,	1,26,	1,26,	1,26,	
1,27,	1,28,	1,29,	1,30,	
1,26,	34,36,	36,36,	45,36,	
0,0,	0,0,	44,49,	2,4,	
1,26,	1,26,	1,31,	1,26,	
1,26,	1,26,	1,26,	1,26,	
1,26,	1,26,	1,26,	1,26,	
1,32,	1,26,	1,26,	1,26,	
1,26,	31,42,	1,26,	1,26,	
42,47,	1,33,	2,6,	2,7,	
32,43,	2,9,	2,10,	43,48,	
47,50,	48,51,	2,11,	2,12,	
2,13,	2,14,	2,15,	2,16,	
32,44,	2,18,	49,52,	2,20,	
2,20,	2,20,	2,20,	2,20,	
2,20,	2,20,	2,20,	2,20,	
2,21,	50,53,	2,22,	2,23,	
2,24,	2,25,	51,54,	52,55,	
53,56,	54,57,	56,58,	57,59,	
0,0,	2,26,	2,26,	2,26,	
2,26,	2,26,	2,26,	2,26,	
2,26,	2,26,	2,26,	2,26,	
2,26,	2,26,	2,26,	2,26,	
2,26,	2,26,	0,0,	2,26,	
2,26,	2,27,	2,28,	2,29,	
2,30,	2,26,	0,0,	0,0,	
0,0,	0,0,	0,0,	0,0,	
0,0,	2,26,	2,26,	2,31,	
2,26,	2,26,	2,26,	2,26,	
2,26,	2,26,	2,26,	2,26,	
2,26,	2,32,	2,26,	2,26,	
2,26,	2,26,	8,34,	2,26,	
2,26,	0,0,	2,33,	0,0,	
0,0,	0,0,	0,0,	8,34,	
0,0,	0,0,	0,0,	19,39,	
19,39,	19,39,	19,39,	19,39,	
19,39,	19,39,	19,39,	19,39,	
19,39,	20,41,	20,41,	20,41,	
20,41,	20,41,	20,41,	20,41,	
20,41,	20,41,	20,41,	8,35,	
39,39,	39,39,	39,39,	39,39,	
39,39,	39,39,	39,39,	39,39,	
39,39,	39,39,	0,0,	8,34,	
0,0,	8,34,	0,0,	0,0,	
0,0,	0,0,	0,0,	19,40,	
0,0,	0,0,	0,0,	0,0,	
0,0,	0,0,	0,0,	0,0,	
0,0,	0,0,	8,34,	0,0,	
0,0,	0,0,	0,0,	0,0,	
0,0,	0,0,	0,0,	17,37,	
0,0,	17,37,	17,37,	17,37,	
17,37,	17,37,	17,37,	17,37,	
17,37,	17,37,	17,37,	19,40,	
0,0,	8,34,	0,0,	0,0,	
0,0,	8,36,	17,37,	17,37,	
17,37,	17,37,	17,37,	17,37,	
17,37,	17,37,	17,37,	17,37,	
17,37,	17,37,	17,37,	17,37,	
17,37,	17,37,	17,37,	17,37,	
17,37,	17,37,	17,37,	17,37,	
17,37,	17,37,	17,37,	17,37,	
0,0,	0,0,	0,0,	0,0,	
17,37,	0,0,	17,37,	17,37,	
17,37,	17,37,	17,37,	17,37,	
17,37,	17,37,	17,37,	17,37,	
17,37,	17,37,	17,37,	17,37,	
17,37,	17,37,	17,37,	17,37,	
17,37,	17,37,	17,37,	17,37,	
17,37,	17,37,	17,37,	17,37,	
40,46,	40,46,	40,46,	40,46,	
40,46,	40,46,	40,46,	40,46,	
40,46,	40,46,	0,0,	0,0,	
0,0,	0,0,	0,0,	0,0,	
0,0,	40,46,	40,46,	40,46,	
40,46,	40,46,	40,46,	0,0,	
0,0,	0,0,	0,0,	0,0,	
0,0,	0,0,	0,0,	0,0,	
0,0,	0,0,	0,0,	0,0,	
0,0,	0,0,	0,0,	0,0,	
0,0,	0,0,	0,0,	0,0,	
0,0,	0,0,	0,0,	0,0,	
0,0,	40,46,	40,46,	40,46,	
40,46,	40,46,	40,46,	0,0,	
0,0};
struct yysvf yysvec[] ={
0,	0,	0,
yycrank+-1,	0,		0,	
yycrank+-94,	yysvec+1,	0,	
yycrank+0,	0,		yyvstop+1,
yycrank+0,	0,		yyvstop+3,
yycrank+0,	0,		yyvstop+6,
yycrank+0,	0,		yyvstop+8,
yycrank+0,	0,		yyvstop+11,
yycrank+-213,	0,		yyvstop+14,
yycrank+0,	0,		yyvstop+16,
yycrank+0,	0,		yyvstop+19,
yycrank+0,	0,		yyvstop+22,
yycrank+0,	0,		yyvstop+25,
yycrank+0,	0,		yyvstop+28,
yycrank+0,	0,		yyvstop+31,
yycrank+0,	0,		yyvstop+34,
yycrank+0,	0,		yyvstop+37,
yycrank+241,	0,		yyvstop+40,
yycrank+18,	0,		yyvstop+44,
yycrank+179,	0,		yyvstop+47,
yycrank+189,	0,		yyvstop+50,
yycrank+0,	0,		yyvstop+53,
yycrank+0,	0,		yyvstop+56,
yycrank+0,	0,		yyvstop+59,
yycrank+0,	0,		yyvstop+62,
yycrank+0,	0,		yyvstop+65,
yycrank+0,	yysvec+17,	yyvstop+68,
yycrank+0,	0,		yyvstop+71,
yycrank+0,	0,		yyvstop+74,
yycrank+0,	0,		yyvstop+77,
yycrank+0,	0,		yyvstop+80,
yycrank+11,	yysvec+17,	yyvstop+83,
yycrank+24,	yysvec+17,	yyvstop+86,
yycrank+0,	0,		yyvstop+89,
yycrank+-5,	yysvec+8,	0,	
yycrank+0,	0,		yyvstop+92,
yycrank+-6,	yysvec+8,	0,	
yycrank+0,	yysvec+17,	yyvstop+94,
yycrank+0,	0,		yyvstop+96,
yycrank+200,	0,		yyvstop+98,
yycrank+316,	0,		0,	
yycrank+0,	yysvec+20,	yyvstop+101,
yycrank+25,	yysvec+17,	yyvstop+103,
yycrank+14,	yysvec+17,	yyvstop+105,
yycrank+5,	yysvec+17,	yyvstop+107,
yycrank+-7,	yysvec+8,	yyvstop+109,
yycrank+0,	yysvec+40,	yyvstop+111,
yycrank+24,	yysvec+17,	yyvstop+113,
yycrank+31,	yysvec+17,	yyvstop+115,
yycrank+28,	yysvec+17,	yyvstop+117,
yycrank+36,	yysvec+17,	yyvstop+119,
yycrank+56,	yysvec+17,	yyvstop+121,
yycrank+43,	yysvec+17,	yyvstop+123,
yycrank+60,	yysvec+17,	yyvstop+125,
yycrank+53,	yysvec+17,	yyvstop+127,
yycrank+0,	yysvec+17,	yyvstop+129,
yycrank+61,	yysvec+17,	yyvstop+132,
yycrank+62,	yysvec+17,	yyvstop+134,
yycrank+0,	yysvec+17,	yyvstop+136,
yycrank+0,	yysvec+17,	yyvstop+139,
0,	0,	0};
struct yywork *yytop = yycrank+418;
struct yysvf *yybgin = yysvec+1;
char yymatch[] ={
00  ,01  ,01  ,01  ,01  ,01  ,01  ,01  ,
01  ,01  ,012 ,01  ,01  ,01  ,01  ,01  ,
01  ,01  ,01  ,01  ,01  ,01  ,01  ,01  ,
01  ,01  ,01  ,01  ,01  ,01  ,01  ,01  ,
01  ,01  ,'"' ,01  ,01  ,01  ,01  ,01  ,
01  ,01  ,01  ,01  ,01  ,01  ,'.' ,01  ,
'0' ,'0' ,'0' ,'0' ,'0' ,'0' ,'0' ,'0' ,
'0' ,'0' ,01  ,01  ,01  ,01  ,01  ,01  ,
01  ,'A' ,'A' ,'A' ,'A' ,'A' ,'A' ,'.' ,
'.' ,'.' ,'.' ,'.' ,'.' ,'.' ,'.' ,'.' ,
'.' ,'.' ,'.' ,'.' ,'.' ,'.' ,'.' ,'.' ,
'X' ,'.' ,'.' ,01  ,01  ,01  ,01  ,'.' ,
01  ,'A' ,'A' ,'A' ,'A' ,'A' ,'A' ,'.' ,
'.' ,'.' ,'.' ,'.' ,'.' ,'.' ,'.' ,'.' ,
'.' ,'.' ,'.' ,'.' ,'.' ,'.' ,'.' ,'.' ,
'X' ,'.' ,'.' ,01  ,01  ,01  ,01  ,01  ,
0};
char yyextra[] ={
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0};
int yylineno =1;
# define YYU(x) x
# define NLSTATE yyprevious=YYNEWLINE
char yytext[YYLMAX];
struct yysvf *yylstate [YYLMAX], **yylsp, **yyolsp;
char yysbuf[YYLMAX];
char *yysptr = yysbuf;
int *yyfnd;
extern struct yysvf *yyestate;
int yyprevious = YYNEWLINE;
yylook(){
	register struct yysvf *yystate, **lsp;
	register struct yywork *yyt;
	struct yysvf *yyz;
	int yych;
	struct yywork *yyr;
# ifdef LEXDEBUG
	int debug;
# endif
	char *yylastch;
	/* start off machines */
# ifdef LEXDEBUG
	debug = 0;
# endif
	if (!yymorfg)
		yylastch = yytext;
	else {
		yymorfg=0;
		yylastch = yytext+yyleng;
		}
	for(;;){
		lsp = yylstate;
		yyestate = yystate = yybgin;
		if (yyprevious==YYNEWLINE) yystate++;
		for (;;){
# ifdef LEXDEBUG
			if(debug)fprintf(yyout,"state %d\n",yystate-yysvec-1);
# endif
			yyt = yystate->yystoff;
			if(yyt == yycrank){		/* may not be any transitions */
				yyz = yystate->yyother;
				if(yyz == 0)break;
				if(yyz->yystoff == yycrank)break;
				}
			*yylastch++ = yych = input();
		tryagain:
# ifdef LEXDEBUG
			if(debug){
				fprintf(yyout,"char ");
				allprint(yych);
				putchar('\n');
				}
# endif
			yyr = yyt;
			if ( (int)yyt > (int)yycrank){
				yyt = yyr + yych;
				if (yyt <= yytop && yyt->verify+yysvec == yystate){
					if(yyt->advance+yysvec == YYLERR)	/* error transitions */
						{unput(*--yylastch);break;}
					*lsp++ = yystate = yyt->advance+yysvec;
					goto contin;
					}
				}
# ifdef YYOPTIM
			else if((int)yyt < (int)yycrank) {		/* r < yycrank */
				yyt = yyr = yycrank+(yycrank-yyt);
# ifdef LEXDEBUG
				if(debug)fprintf(yyout,"compressed state\n");
# endif
				yyt = yyt + yych;
				if(yyt <= yytop && yyt->verify+yysvec == yystate){
					if(yyt->advance+yysvec == YYLERR)	/* error transitions */
						{unput(*--yylastch);break;}
					*lsp++ = yystate = yyt->advance+yysvec;
					goto contin;
					}
				yyt = yyr + YYU(yymatch[yych]);
# ifdef LEXDEBUG
				if(debug){
					fprintf(yyout,"try fall back character ");
					allprint(YYU(yymatch[yych]));
					putchar('\n');
					}
# endif
				if(yyt <= yytop && yyt->verify+yysvec == yystate){
					if(yyt->advance+yysvec == YYLERR)	/* error transition */
						{unput(*--yylastch);break;}
					*lsp++ = yystate = yyt->advance+yysvec;
					goto contin;
					}
				}
			if ((yystate = yystate->yyother) && (yyt= yystate->yystoff) != yycrank){
# ifdef LEXDEBUG
				if(debug)fprintf(yyout,"fall back to state %d\n",yystate-yysvec-1);
# endif
				goto tryagain;
				}
# endif
			else
				{unput(*--yylastch);break;}
		contin:
# ifdef LEXDEBUG
			if(debug){
				fprintf(yyout,"state %d char ",yystate-yysvec-1);
				allprint(yych);
				putchar('\n');
				}
# endif
			;
			}
# ifdef LEXDEBUG
		if(debug){
			fprintf(yyout,"stopped at %d with ",*(lsp-1)-yysvec-1);
			allprint(yych);
			putchar('\n');
			}
# endif
		while (lsp-- > yylstate){
			*yylastch-- = 0;
			if (*lsp != 0 && (yyfnd= (*lsp)->yystops) && *yyfnd > 0){
				yyolsp = lsp;
				if(yyextra[*yyfnd]){		/* must backup */
					while(yyback((*lsp)->yystops,-*yyfnd) != 1 && lsp > yylstate){
						lsp--;
						unput(*yylastch--);
						}
					}
				yyprevious = YYU(*yylastch);
				yylsp = lsp;
				yyleng = yylastch-yytext+1;
				yytext[yyleng] = 0;
# ifdef LEXDEBUG
				if(debug){
					fprintf(yyout,"\nmatch ");
					sprint(yytext);
					fprintf(yyout," action %d\n",*yyfnd);
					}
# endif
				return(*yyfnd++);
				}
			unput(*yylastch);
			}
		if (yytext[0] == 0  /* && feof(yyin) */)
			{
			yysptr=yysbuf;
			return(0);
			}
		yyprevious = yytext[0] = input();
		if (yyprevious>0)
			output(yyprevious);
		yylastch=yytext;
# ifdef LEXDEBUG
		if(debug)putchar('\n');
# endif
		}
	}
yyback(p, m)
	int *p;
{
if (p==0) return(0);
while (*p)
	{
	if (*p++ == m)
		return(1);
	}
return(0);
}
	/* the following are only used in the lex library */
yyinput(){
	return(input());
	}
yyoutput(c)
  int c; {
	output(c);
	}
yyunput(c)
   int c; {
	unput(c);
	}
