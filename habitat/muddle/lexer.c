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

extern int  yylval;
char	   *decodeString();

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
	{ yylval = 0; return(ACTION); }
break;
case 3:
		{ yylval = 0; return(BYTE); }
break;
case 4:
		{ yylval = 0; return(CLASS); }
break;
case 5:
		{ yylval = 0; return(HEAD); }
break;
case 6:
		{ yylval = 0; return(IMAGE); }
break;
case 7:
		{ yylval = 0; return(SOUND); }
break;
case 8:
		{ yylval = 0; return(WORD); }
break;
case 9:
	{ yylval = buildString(yytext);
			  return(Identifier); }
break;
case 10:
	{ yylval = decodeNumber(&yytext[2], 16);
			  return(Number); }
break;
case 11:
		{ yylval = decodeNumber(&yytext[1], 8);
			  return(Number); }
break;
case 12:
		{ yylval = decodeNumber(yytext, 10); return(Number); }
break;
case 13:
{ yylval = (int)decodeString(yytext);
			  return(String); }
break;
case 14:
		{ yylval = 0; return('{'); }
break;
case 15:
		{ yylval = 0; return('}'); }
break;
case 16:
		{ yylval = 0; return(','); }
break;
case 17:
		{ yylval = 0; return(':'); }
break;
case 18:
	{ ; }
break;
case 19:
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

int yyvstop[] ={
0,

19,
0,

18,
19,
0,

18,
0,

19,
0,

16,
19,
0,

19,
0,

19,
0,

12,
19,
0,

12,
19,
0,

17,
19,
0,

9,
19,
0,

9,
19,
0,

9,
19,
0,

9,
19,
0,

9,
19,
0,

9,
19,
0,

9,
19,
0,

9,
18,
19,
0,

9,
19,
0,

14,
19,
0,

15,
19,
0,

13,
0,

12,
0,

12,
0,

1,
0,

11,
12,
0,

9,
0,

9,
0,

9,
0,

9,
0,

9,
0,

9,
0,

9,
0,

9,
0,

13,
0,

10,
0,

9,
0,

9,
0,

9,
0,

9,
0,

9,
0,

9,
0,

9,
0,

9,
0,

3,
9,
0,

9,
0,

5,
9,
0,

9,
0,

9,
0,

8,
9,
0,

9,
0,

4,
9,
0,

6,
9,
0,

7,
9,
0,

2,
9,
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
0,0,	0,0,	0,0,	1,6,	
0,0,	0,0,	26,40,	0,0,	
0,0,	0,0,	0,0,	0,0,	
0,0,	1,7,	1,8,	9,29,	
1,9,	1,10,	1,11,	1,11,	
1,11,	1,11,	1,11,	1,11,	
1,11,	1,11,	1,11,	1,12,	
11,28,	28,28,	0,0,	0,0,	
0,0,	0,0,	1,13,	0,0,	
2,7,	2,8,	0,0,	2,9,	
1,13,	2,11,	2,11,	2,11,	
2,11,	2,11,	2,11,	2,11,	
2,11,	2,11,	2,12,	0,0,	
6,24,	0,0,	0,0,	0,0,	
0,0,	1,13,	0,0,	0,0,	
6,24,	6,24,	0,0,	24,26,	
26,26,	0,0,	1,14,	1,15,	
1,16,	40,26,	14,33,	35,44,	
17,36,	1,17,	1,18,	36,45,	
37,46,	43,50,	45,52,	16,35,	
18,37,	42,49,	19,38,	21,39,	
1,19,	6,25,	46,53,	1,20,	
1,21,	2,14,	2,15,	2,16,	
1,22,	15,34,	1,23,	33,42,	
2,17,	2,18,	34,43,	6,24,	
38,47,	39,48,	44,51,	47,54,	
48,55,	49,56,	51,57,	2,19,	
53,58,	54,59,	56,60,	2,21,	
0,0,	0,0,	0,0,	2,22,	
6,24,	2,23,	0,0,	0,0,	
0,0,	0,0,	6,24,	8,27,	
8,28,	8,28,	8,28,	8,28,	
8,28,	8,28,	8,28,	8,28,	
8,28,	0,0,	0,0,	0,0,	
0,0,	0,0,	0,0,	6,24,	
0,0,	0,0,	0,0,	6,26,	
10,30,	10,30,	10,30,	10,30,	
10,30,	10,30,	10,30,	10,30,	
10,30,	10,30,	30,30,	30,30,	
30,30,	30,30,	30,30,	30,30,	
30,30,	30,30,	30,30,	30,30,	
0,0,	0,0,	0,0,	0,0,	
0,0,	6,24,	13,32,	13,32,	
13,32,	13,32,	13,32,	13,32,	
13,32,	13,32,	13,32,	13,32,	
0,0,	0,0,	0,0,	0,0,	
10,31,	0,0,	0,0,	13,32,	
13,32,	13,32,	13,32,	13,32,	
13,32,	13,32,	13,32,	13,32,	
13,32,	13,32,	13,32,	13,32,	
13,32,	13,32,	13,32,	13,32,	
13,32,	13,32,	13,32,	13,32,	
13,32,	13,32,	13,32,	13,32,	
13,32,	0,0,	0,0,	0,0,	
10,31,	13,32,	0,0,	13,32,	
13,32,	13,32,	13,32,	13,32,	
13,32,	13,32,	13,32,	13,32,	
13,32,	13,32,	13,32,	13,32,	
13,32,	13,32,	13,32,	13,32,	
13,32,	13,32,	13,32,	13,32,	
13,32,	13,32,	13,32,	13,32,	
13,32,	31,41,	31,41,	31,41,	
31,41,	31,41,	31,41,	31,41,	
31,41,	31,41,	31,41,	0,0,	
0,0,	0,0,	0,0,	0,0,	
0,0,	0,0,	31,41,	31,41,	
31,41,	31,41,	31,41,	31,41,	
0,0,	0,0,	0,0,	0,0,	
0,0,	0,0,	0,0,	0,0,	
0,0,	0,0,	0,0,	0,0,	
0,0,	0,0,	0,0,	0,0,	
0,0,	0,0,	0,0,	0,0,	
0,0,	0,0,	0,0,	0,0,	
0,0,	0,0,	31,41,	31,41,	
31,41,	31,41,	31,41,	31,41,	
0,0};
struct yysvf yysvec[] ={
0,	0,	0,
yycrank+-1,	0,		0,	
yycrank+-24,	yysvec+1,	0,	
yycrank+0,	0,		yyvstop+1,
yycrank+0,	0,		yyvstop+3,
yycrank+0,	0,		yyvstop+6,
yycrank+-83,	0,		yyvstop+8,
yycrank+0,	0,		yyvstop+10,
yycrank+107,	0,		yyvstop+13,
yycrank+5,	0,		yyvstop+15,
yycrank+128,	0,		yyvstop+17,
yycrank+12,	yysvec+8,	yyvstop+20,
yycrank+0,	0,		yyvstop+23,
yycrank+154,	0,		yyvstop+26,
yycrank+3,	yysvec+13,	yyvstop+29,
yycrank+4,	yysvec+13,	yyvstop+32,
yycrank+3,	yysvec+13,	yyvstop+35,
yycrank+3,	yysvec+13,	yyvstop+38,
yycrank+3,	yysvec+13,	yyvstop+41,
yycrank+3,	yysvec+13,	yyvstop+44,
yycrank+0,	yysvec+13,	yyvstop+47,
yycrank+4,	yysvec+13,	yyvstop+51,
yycrank+0,	0,		yyvstop+54,
yycrank+0,	0,		yyvstop+57,
yycrank+-3,	yysvec+6,	0,	
yycrank+0,	0,		yyvstop+60,
yycrank+-4,	yysvec+6,	0,	
yycrank+0,	yysvec+10,	yyvstop+62,
yycrank+13,	yysvec+8,	yyvstop+64,
yycrank+0,	0,		yyvstop+66,
yycrank+138,	0,		yyvstop+68,
yycrank+229,	0,		0,	
yycrank+0,	yysvec+13,	yyvstop+71,
yycrank+11,	yysvec+13,	yyvstop+73,
yycrank+14,	yysvec+13,	yyvstop+75,
yycrank+6,	yysvec+13,	yyvstop+77,
yycrank+10,	yysvec+13,	yyvstop+79,
yycrank+11,	yysvec+13,	yyvstop+81,
yycrank+15,	yysvec+13,	yyvstop+83,
yycrank+19,	yysvec+13,	yyvstop+85,
yycrank+-9,	yysvec+6,	yyvstop+87,
yycrank+0,	yysvec+31,	yyvstop+89,
yycrank+8,	yysvec+13,	yyvstop+91,
yycrank+8,	yysvec+13,	yyvstop+93,
yycrank+19,	yysvec+13,	yyvstop+95,
yycrank+10,	yysvec+13,	yyvstop+97,
yycrank+15,	yysvec+13,	yyvstop+99,
yycrank+25,	yysvec+13,	yyvstop+101,
yycrank+36,	yysvec+13,	yyvstop+103,
yycrank+26,	yysvec+13,	yyvstop+105,
yycrank+0,	yysvec+13,	yyvstop+107,
yycrank+23,	yysvec+13,	yyvstop+110,
yycrank+0,	yysvec+13,	yyvstop+112,
yycrank+39,	yysvec+13,	yyvstop+115,
yycrank+41,	yysvec+13,	yyvstop+117,
yycrank+0,	yysvec+13,	yyvstop+119,
yycrank+32,	yysvec+13,	yyvstop+122,
yycrank+0,	yysvec+13,	yyvstop+124,
yycrank+0,	yysvec+13,	yyvstop+127,
yycrank+0,	yysvec+13,	yyvstop+130,
yycrank+0,	yysvec+13,	yyvstop+133,
0,	0,	0};
struct yywork *yytop = yycrank+331;
struct yysvf *yybgin = yysvec+1;
char yymatch[] ={
00  ,01  ,01  ,01  ,01  ,01  ,01  ,01  ,
01  ,011 ,012 ,01  ,011 ,01  ,01  ,01  ,
01  ,01  ,01  ,01  ,01  ,01  ,01  ,01  ,
01  ,01  ,01  ,01  ,01  ,01  ,01  ,01  ,
011 ,01  ,'"' ,01  ,01  ,01  ,01  ,01  ,
01  ,01  ,01  ,01  ,01  ,01  ,01  ,01  ,
'0' ,'0' ,'0' ,'0' ,'0' ,'0' ,'0' ,'0' ,
'0' ,'0' ,01  ,01  ,01  ,01  ,01  ,01  ,
01  ,'A' ,'A' ,'A' ,'A' ,'A' ,'A' ,'G' ,
'G' ,'G' ,'G' ,'G' ,'G' ,'G' ,'G' ,'G' ,
'G' ,'G' ,'G' ,'G' ,'G' ,'G' ,'G' ,'G' ,
'X' ,'G' ,'G' ,01  ,01  ,01  ,01  ,'G' ,
01  ,'A' ,'A' ,'A' ,'A' ,'A' ,'A' ,'G' ,
'G' ,'G' ,'G' ,'G' ,'G' ,'G' ,'G' ,'G' ,
'G' ,'G' ,'G' ,'G' ,'G' ,'G' ,'v' ,'G' ,
'X' ,'G' ,'G' ,01  ,01  ,01  ,01  ,01  ,
0};
char yyextra[] ={
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
