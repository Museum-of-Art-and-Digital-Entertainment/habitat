
# line 12 "muddle.y"

#include "muddleTypes.h"
#include "muddleGlobals.h"

# define CLASS 257
# define IMAGE 258
# define SOUND 259
# define ACTION 260
# define HEAD 261
# define BYTE 262
# define WORD 263
# define Identifier 264
# define Number 265
# define String 266
# define ENDFILE 267
#define yyclearin yychar = -1
#define yyerrok yyerrflag = 0
extern int yychar;
extern short yyerrflag;
#ifndef YYMAXDEPTH
#define YYMAXDEPTH 150
#endif
#ifndef YYSTYPE
#define YYSTYPE int
#endif
YYSTYPE yylval, yyval;
# define YYERRCODE 256

# line 256 "muddle.y"


#include <stdio.h>

yyerror(s)
  char	*s;
{
	error("parser error: %s\n", s);
}
short yyexca[] ={
-1, 1,
	0, -1,
	-2, 0,
-1, 57,
	58, 16,
	-2, 45,
	};
# define YYNPROD 49
# define YYLAST 161
short yyact[]={

  60,   6,  15,  16,  17,  18,  19,  20,  14,  15,
  16,  17,  18,  19,  20,  14,  62,  39,  15,  16,
  17,  18,  19,  20,  66,  43,  57,  44,  44,  65,
  58,  49,  35,  24,  33,  38,  64,  25,   8,  54,
  59,  48,   5,   7,   3,  42,  41,  21,  40,  53,
  31,  37,  30,  29,  28,  27,  26,  13,  12,  11,
  10,   9,  51,  34,  23,  32,  22,   4,   2,  36,
   1,   0,   0,  50,   0,  55,  52,   0,  56,  45,
  46,  47,   0,   0,   0,   0,   0,   0,   0,  55,
   0,   0,  56,  63,  61,   0,   0,   0,   0,   0,
  67,   0,   0,   0,   0,   0,   0,   0,   0,   0,
   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
   0,   0,   0,  15,  16,  17,  18,  19,  20,  14,
   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
   0,   0,   0,   0,   0,  57,   0,  44,  43,   0,
  44 };
short yypact[]={

-256,-1000,-256,-1000,-1000,-1000,-231,-1000, -21,-1000,
-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,
-1000,-1000, -89,-233,-1000,-240,-106,-106,-106,-106,
-234,-234,-1000,-249,-1000,-1000,-1000,-1000,-1000,-238,
-235,-1000,-1000,-1000,-1000,-1000,-1000,-1000,  -4,-1000,
  -4,-125,-1000,-109,-1000,-1000, -22,-1000,-236,-241,
-1000,-1000,-1000,-1000,-239,-1000,-1000,-1000 };
short yypgo[]={

   0,  70,  68,  44,  67,  42,  66,  65,  64,  63,
  62,  43,  38,  61,  60,  59,  58,  57,  56,  51,
  55,  54,  53,  52,  41,  50,  35,  49,  39,  48,
  46,  45 };
short yyr1[]={

   0,   1,   2,   2,   3,   3,   4,   6,   6,   8,
   9,   7,  10,  10,   5,   5,  12,  11,  11,  11,
  11,  11,  18,  13,  20,  14,  21,  15,  22,  16,
  23,  17,  25,  17,  19,  19,  27,  27,  28,  28,
  26,  26,  26,  29,  30,  30,  31,  24,  24 };
short yyr2[]={

   0,   1,   1,   2,   1,   1,   3,   1,   2,   1,
   1,   3,   1,   2,   1,   3,   1,   1,   1,   1,
   1,   1,   0,   3,   0,   3,   0,   3,   0,   3,
   0,   3,   0,   3,   1,   3,   1,   2,   1,   3,
   1,   2,   3,   1,   1,   1,   1,   1,   3 };
short yychk[]={

-1000,  -1,  -2,  -3,  -4,  -5, 257, -11, -12, -13,
 -14, -15, -16, -17, 264, 258, 259, 260, 261, 262,
 263,  -3,  -6,  -8, 264,  58, -18, -20, -21, -22,
 -23, -25,  -7, 123,  -9, 265, -11, -19, -26, 123,
 -29, -30, -31, 264, 266, -19, -19, -19, -24, 265,
 -24, -10,  -5, -27, -28, -26, -12, 264, 265,  44,
 125,  -5, 125, -28,  58, 265, 265, -26 };
short yydef[]={

   0,  -2,   1,   2,   4,   5,   0,  14,   0,  17,
  18,  19,  20,  21,  16,  22,  24,  26,  28,  30,
  32,   3,   0,   7,   9,   0,   0,   0,   0,   0,
   0,   0,   6,   0,   8,  10,  15,  23,  34,   0,
  40,  43,  44,  45,  46,  25,  27,  29,  31,  47,
  33,   0,  12,   0,  36,  38,   0,  -2,  41,   0,
  11,  13,  35,  37,   0,  42,  48,  39 };
#ifndef lint
static	char yaccpar_sccsid[] = "@(#)yaccpar 1.1 83/07/20 SMI"; /* from UCB 4.1 83/02/11 */
#endif

#
# define YYFLAG -1000
# define YYERROR goto yyerrlab
# define YYACCEPT return(0)
# define YYABORT return(1)

/*	parser for yacc output	*/

#ifdef YYDEBUG
int yydebug = 0; /* 1 for debugging */
#endif
YYSTYPE yyv[YYMAXDEPTH]; /* where the values are stored */
int yychar = -1; /* current input token number */
int yynerrs = 0;  /* number of errors */
short yyerrflag = 0;  /* error recovery flag */

yyparse() {

	short yys[YYMAXDEPTH];
	short yyj, yym;
	register YYSTYPE *yypvt;
	register short yystate, *yyps, yyn;
	register YYSTYPE *yypv;
	register short *yyxi;

	yystate = 0;
	yychar = -1;
	yynerrs = 0;
	yyerrflag = 0;
	yyps= &yys[-1];
	yypv= &yyv[-1];

 yystack:    /* put a state and value onto the stack */

#ifdef YYDEBUG
	if( yydebug  ) printf( "state %d, char 0%o\n", yystate, yychar );
#endif
		if( ++yyps> &yys[YYMAXDEPTH] ) { yyerror( "yacc stack overflow" ); return(1); }
		*yyps = yystate;
		++yypv;
		*yypv = yyval;

 yynewstate:

	yyn = yypact[yystate];

	if( yyn<= YYFLAG ) goto yydefault; /* simple state */

	if( yychar<0 ) if( (yychar=yylex())<0 ) yychar=0;
	if( (yyn += yychar)<0 || yyn >= YYLAST ) goto yydefault;

	if( yychk[ yyn=yyact[ yyn ] ] == yychar ){ /* valid shift */
		yychar = -1;
		yyval = yylval;
		yystate = yyn;
		if( yyerrflag > 0 ) --yyerrflag;
		goto yystack;
		}

 yydefault:
	/* default state action */

	if( (yyn=yydef[yystate]) == -2 ) {
		if( yychar<0 ) if( (yychar=yylex())<0 ) yychar = 0;
		/* look through exception table */

		for( yyxi=yyexca; (*yyxi!= (-1)) || (yyxi[1]!=yystate) ; yyxi += 2 ) ; /* VOID */

		while( *(yyxi+=2) >= 0 ){
			if( *yyxi == yychar ) break;
			}
		if( (yyn = yyxi[1]) < 0 ) return(0);   /* accept */
		}

	if( yyn == 0 ){ /* error */
		/* error ... attempt to resume parsing */

		switch( yyerrflag ){

		case 0:   /* brand new error */

			yyerror( "syntax error" );
		yyerrlab:
			++yynerrs;

		case 1:
		case 2: /* incompletely recovered error ... try again */

			yyerrflag = 3;

			/* find a state where "error" is a legal shift action */

			while ( yyps >= yys ) {
			   yyn = yypact[*yyps] + YYERRCODE;
			   if( yyn>= 0 && yyn < YYLAST && yychk[yyact[yyn]] == YYERRCODE ){
			      yystate = yyact[yyn];  /* simulate a shift of "error" */
			      goto yystack;
			      }
			   yyn = yypact[*yyps];

			   /* the current yyps has no shift onn "error", pop stack */

#ifdef YYDEBUG
			   if( yydebug ) printf( "error recovery pops state %d, uncovers %d\n", *yyps, yyps[-1] );
#endif
			   --yyps;
			   --yypv;
			   }

			/* there is no state on the stack with an error shift ... abort */

	yyabort:
			return(1);


		case 3:  /* no shift yet; clobber input char */

#ifdef YYDEBUG
			if( yydebug ) printf( "error recovery discards char %d\n", yychar );
#endif

			if( yychar == 0 ) goto yyabort; /* don't discard EOF, quit */
			yychar = -1;
			goto yynewstate;   /* try again in the same state */

			}

		}

	/* reduction by production yyn */

#ifdef YYDEBUG
		if( yydebug ) printf("reduce %d\n",yyn);
#endif
		yyps -= yyr2[yyn];
		yypvt = yypv;
		yypv -= yyr2[yyn];
		yyval = yypv[1];
		yym=yyn;
			/* consult goto table to find next state */
		yyn = yyr1[yyn];
		yyj = yypgo[yyn] + *yyps + 1;
		if( yyj>=YYLAST || yychk[ yystate = yyact[yyj] ] != -yyn ) yystate = yyact[yypgo[yyn]];
		switch(yym){
			
case 4:
# line 44 "muddle.y"
{
	noteClass(yypvt[-0]);
} break;
case 6:
# line 52 "muddle.y"
{
	yyval = buildClass(yypvt[-1], yypvt[-0]);
} break;
case 7:
# line 59 "muddle.y"
{
	yyval = buildClassHeader(yypvt[-0], NO_TAG);
} break;
case 8:
# line 63 "muddle.y"
{
	yyval = buildClassHeader(yypvt[-1], yypvt[-0]);
} break;
case 9:
# line 70 "muddle.y"
{
	yyval = yypvt[-0];
} break;
case 10:
# line 77 "muddle.y"
{
	yyval = yypvt[-0];
} break;
case 11:
# line 84 "muddle.y"
{
	yyval = yypvt[-1];
} break;
case 12:
# line 91 "muddle.y"
{
	yyval = buildItemList(NULL, yypvt[-0]);
} break;
case 13:
# line 95 "muddle.y"
{
	yyval = buildItemList(yypvt[-1], yypvt[-0]);
} break;
case 14:
# line 102 "muddle.y"
{
	yyval = yypvt[-0];
} break;
case 15:
# line 106 "muddle.y"
{
	newSymbol(yypvt[-2], listify(currentItemKind), yypvt[-0]);
	yyval = addLabelToItem(yypvt[-2], yypvt[-0]);
} break;
case 16:
# line 114 "muddle.y"
{
	yyval = yypvt[-0];
} break;
case 22:
# line 128 "muddle.y"
{currentItemKind=IMAGE_ITEM;} break;
case 23:
# line 129 "muddle.y"
{
	yyval = buildItem(NULL, IMAGE_LIST_ITEM, yypvt[-0], NO_TAG);
} break;
case 24:
# line 135 "muddle.y"
{currentItemKind=SOUND_ITEM;} break;
case 25:
# line 136 "muddle.y"
{
	yyval = buildItem(NULL, SOUND_LIST_ITEM, yypvt[-0], NO_TAG);
} break;
case 26:
# line 142 "muddle.y"
{currentItemKind=ACTION_ITEM;} break;
case 27:
# line 143 "muddle.y"
{
	yyval = buildItem(NULL, ACTION_LIST_ITEM, yypvt[-0], NO_TAG);
} break;
case 28:
# line 149 "muddle.y"
{currentItemKind=HEAD_ITEM;} break;
case 29:
# line 150 "muddle.y"
{
	yyval = buildItem(NULL, HEAD_LIST_ITEM, yypvt[-0], NO_TAG);
} break;
case 30:
# line 156 "muddle.y"
{currentItemKind=BYTE_ITEM;} break;
case 31:
# line 157 "muddle.y"
{
	yyval = buildItem(NULL, BYTE_LIST_ITEM, yypvt[-0], NO_TAG);
} break;
case 32:
# line 160 "muddle.y"
{currentItemKind=WORD_ITEM;} break;
case 33:
# line 161 "muddle.y"
{
	yyval = buildItem(NULL, WORD_LIST_ITEM, yypvt[-0], NO_TAG);
} break;
case 34:
# line 168 "muddle.y"
{
	yyval = buildItemList(NULL, yypvt[-0]);
} break;
case 35:
# line 172 "muddle.y"
{
	yyval = yypvt[-1];
} break;
case 36:
# line 179 "muddle.y"
{
	yyval = buildItemList(NULL, yypvt[-0]);
} break;
case 37:
# line 183 "muddle.y"
{
	yyval = buildItemList(yypvt[-1], yypvt[-0]);
} break;
case 38:
# line 190 "muddle.y"
{
	yyval = yypvt[-0];
} break;
case 39:
# line 194 "muddle.y"
{
	newSymbol(yypvt[-2], currentItemKind, yypvt[-0]);
	yyval = addLabelToItem(yypvt[-2], yypvt[-0]);
} break;
case 40:
# line 202 "muddle.y"
{
	yyval = addWidthInfo(yypvt[-0], 0, 0);
} break;
case 41:
# line 206 "muddle.y"
{
	yyval = addWidthInfo(yypvt[-1], yypvt[-0], 0);
} break;
case 42:
# line 210 "muddle.y"
{
	yyval = addWidthInfo(yypvt[-2], yypvt[-1], yypvt[-0]);
} break;
case 43:
# line 217 "muddle.y"
{
	if (((itemSourceType *)yypvt[-0])->source == FILE_SOURCE &&
			(int)currentItemKind < (int)ACTION_LIST_ITEM)
		yyval = buildItem(NULL, currentItemKind, yypvt[-0],
			maxItem[(int)currentItemKind]++);
	else
		yyval = buildItem(NULL, currentItemKind, yypvt[-0], NO_TAG);
} break;
case 44:
# line 229 "muddle.y"
{
	yyval = buildItemSource(yypvt[-0], FILE_SOURCE);
} break;
case 45:
# line 233 "muddle.y"
{
	yyval = buildItemSource(yypvt[-0], NAME_SOURCE);
} break;
case 46:
# line 240 "muddle.y"
{
	yyval = yypvt[-0];
} break;
case 47:
# line 247 "muddle.y"
{
	yyval = buildNumberList(NULL, yypvt[-0]);
} break;
case 48:
# line 251 "muddle.y"
{
	yyval = buildNumberList(yypvt[-2], yypvt[-0]);
} break;
		}
		goto yystack;  /* stack new state and value */

	}
