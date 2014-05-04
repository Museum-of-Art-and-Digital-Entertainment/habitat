
# line 2 "plex.y"
#include "plexTypes.h"
#include "plexGlobals.h"
# define EOL 257
# define Identifier 258
# define Number 259
# define String 260
# define START 261
# define INCLUDE 262
# define SHUFFLE 263
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

# line 392 "plex.y"


yyerror(s)
  char	*s;
{
	error("%s on line %d of \"%s\"\n", s, currentLineNumber,
		currentFileName);
}
short yyexca[] ={
-1, 1,
	0, -1,
	-2, 0,
-1, 2,
	0, 1,
	-2, 5,
	};
# define YYNPROD 83
# define YYLAST 261
short yyact[]={

  56, 114,  67,  62,   9,  18,  75,  10,  11,  43,
  77,  61,  18,  57,  25,  59,  74, 105, 133,  98,
  69,  42, 132, 112, 111,  84,  45,  33,  17,  32,
  71,  66,  12,  16, 119,  17, 107, 127,  79,  70,
  35, 104,  27,  28,  29,  88, 103,  41, 104, 101,
  40, 102, 116, 103, 119, 117,  89,  37,  38,  39,
  60,  92,  63,  47, 106,  26, 104, 101,  90, 102,
  96, 103,  34,  78,  87,  81,  81,  81,  36,  18,
  14,  82,  83, 118,  18,  65,  85,   3,  93,  68,
  94,  95,  58,  91,  31,  55,  54,  24,  97, 131,
  30,  99,  17, 100,  53,  52,  44,  17, 108, 109,
  86,  51, 104, 101, 110, 102,  50, 103, 125, 104,
 101,  49, 102,  48, 103,  85,  46,  23,  22, 115,
 113,  20, 120, 121, 122, 123,  19, 124,   8,  67,
   7,   6,   5,  81,   4,  80, 128,  13, 126,   2,
 129,   1, 130,   0,   0,   0,   0,   0,   0,   0,
   0, 134,   0,   0,   0,   0,   0,   0,   0,   0,
   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
   0,   0,   0,   0,   0,   0,  64,   0,  76,  73,
  72,  21,   0,   0,   0,   0,   0,   0,   0,   0,
   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
   0,   0,   0,  15,   0,   0,   0,   0,   0,   0,
  15 };
short yypact[]={

-254,-1000,   3,-1000,-1000,-1000,-1000,-1000, -26,   3,
   3,   3,-254,   3,-1000,-1000,-1000,-1000,-1000,-228,
-230,  69,-1000,-1000,   3,   3,   3, -11,-237,-251,
-1000,-1000,-1000,  69,-231,-1000, -32,-261,-238, -30,
   3,  75,  75,  75,-232,  69, -32,-1000,-1000,  42,
   0,-1000,-1000,  21,-1000,  28,-1000,-1000,-1000,-1000,
-1000,-1000,-1000,-1000,-1000,   3,-1000,-239,   3,-1000,
   3,  24,-1000,-1000,-1000,-242, -27, -30, -30,-1000,
  75,-1000,-233,-234,  69,-1000,-1000,-1000,-1000,-1000,
 -30,-1000,-1000,-1000,-1000,-1000,-1000,-124,-1000,  11,
 -10, -30, -30, -30, -30,-1000, -30,-1000,  77,  70,
-1000,-1000,-1000,  -4,-1000,-1000,-1000,   3,-1000,   3,
  -1,  -1,-1000,-1000,   6,-1000,-235,-1000,  10,-240,
 -30,-1000,-1000,-1000,  24 };
short yypgo[]={

   0, 151, 149,  87,  32, 147,  38, 145,  80,  33,
 144, 142, 141, 140, 138, 136,  30, 131,  72, 128,
 127,  40, 126,  63, 123, 121, 116, 111, 105, 104,
  96,  95,  39,  93,  89,  85,  31 };
short yyr1[]={

   0,   1,   2,   2,   4,   4,   6,   6,   5,   5,
   7,   7,   8,   8,   9,   9,   3,   3,   3,   3,
  12,  13,  10,  11,  14,  15,  15,  15,  15,  18,
  18,  21,  22,  22,  23,  23,  23,  23,  23,  23,
  23,  25,  25,  26,  26,  27,  27,  27,  28,  29,
  29,  30,  24,  24,  31,  31,  33,  33,  33,  33,
  33,  19,  20,  17,  35,  35,  36,  34,  34,  16,
  16,  16,  16,  16,  16,  16,  16,  16,  16,  16,
  16,  32,  32 };
short yyr2[]={

   0,   1,   1,   3,   1,   0,   1,   0,   1,   2,
   1,   2,   1,   1,   1,   1,   1,   1,   1,   1,
   5,   5,   3,   7,   4,   4,   3,   1,   1,   1,
   3,   2,   1,   2,   1,   1,   1,   1,   1,   1,
   1,   1,   2,   1,   2,   1,   1,   1,   1,   1,
   2,   1,   1,   4,   1,   2,   1,   1,   1,   1,
   1,   5,   5,   5,   1,   3,   2,   1,   5,   1,
   1,   1,   2,   4,   2,   1,   3,   3,   3,   3,
   3,   1,   5 };
short yychk[]={

-1000,  -1,  -2,  -3, -10, -11, -12, -13, -14, 258,
 261, 262,  -4,  -5,  -8, 257,  -9,  32,   9, -15,
 -17, 257, -19, -20, 123,  40,  91,  -4,  -4,  -4,
  -3,  -8, 257, 257, -18, -21,   9,  -4,  -4,  -4,
  61,  58, 258, 260, -18, 257, -22, -23, -24, -25,
 -26, -27, -28, -29, -30, -31,  32,  45, 124,  47,
  92,  43,  35,  94, 258, -35, -36, 263, -34, 258,
 -32, -16, 260, 259,  46,  36, 258,  40,  -4,  -6,
  -7,  -9,  -6,  -6, 257, -21, -23,  32,  45,  35,
  40, -33,  33,  60,  62,  63,  42,  -4, 258,  -4,
  -4,  43,  45,  47,  42, 259,  91,  63, -16, -16,
  -9, 257, 257, -32, 125, -36,  41,  44,  93,  44,
 -16, -16, -16, -16, -16,  41,  -6,  41,  -4,  -4,
  -4,  93, 257, 258, -16 };
short yydef[]={

   0,  -2,  -2,   2,  16,  17,  18,  19,   0,   5,
   5,   5,   0,   4,   8,  12,  13,  14,  15,   0,
   0,   0,  27,  28,   5,   5,   5,   0,   0,   0,
   3,   9,  22,   0,   0,  29,   0,   0,   0,   0,
   5,   7,   7,   7,   0,  26,  31,  32,  34,  35,
  36,  37,  38,  39,  40,  52,  41,  43,  45,  46,
  47,  48,  49,  51,  54,   5,  64,   0,   5,  67,
   5,  81,  69,  70,  71,   0,  75,   0,   0,  24,
   6,  10,   0,   0,  25,  30,  33,  42,  44,  50,
   0,  55,  56,  57,  58,  59,  60,   0,  66,   0,
   0,   0,   0,   0,   0,  72,   0,  74,   0,   7,
  11,  20,  21,   5,  63,  65,  61,   5,  62,   5,
  77,  78,  79,  80,   0,  76,   0,  53,   0,   0,
   0,  73,  23,  68,  82 };
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
			
case 20:
# line 61 "plex.y"
{
	executeStartStatement(yypvt[-2]);
} break;
case 21:
# line 68 "plex.y"
{
	executeIncludeStatement(yypvt[-2]);
} break;
case 22:
# line 75 "plex.y"
{
	bindSymbol(yypvt[-2], yypvt[-1]);
} break;
case 23:
# line 82 "plex.y"
{
	bindSymbol(yypvt[-6], buildProduction(evaluateExpr(yypvt[-2]), NAME_PROD));
} break;
case 24:
# line 89 "plex.y"
{
	yyval = yypvt[-3];
} break;
case 25:
# line 96 "plex.y"
{
	yyval = buildProduction(plexParse(yypvt[-1], yypvt[-3]), SPAN_PROD);
} break;
case 26:
# line 100 "plex.y"
{
	yyval = buildProduction(plexParse(yypvt[-1], NULL), SPAN_PROD);
} break;
case 27:
# line 104 "plex.y"
{
	yyval = buildProduction(yypvt[-0], SET_PROD);
} break;
case 28:
# line 108 "plex.y"
{
	yyval = buildProduction(yypvt[-0], ARRAY_PROD);
} break;
case 29:
# line 115 "plex.y"
{
	yyval = buildSpanList(NULL, yypvt[-0]);
} break;
case 30:
# line 119 "plex.y"
{
	yyval = buildSpanList(yypvt[-2], yypvt[-0]);
} break;
case 31:
# line 126 "plex.y"
{
	yyval = yypvt[-0];
} break;
case 32:
# line 133 "plex.y"
{
	yyval = buildSpanLine(NULL, yypvt[-0]);
} break;
case 33:
# line 137 "plex.y"
{
	yyval = buildSpanLine(yypvt[-1], yypvt[-0]);
} break;
case 34:
# line 144 "plex.y"
{
	yyval = buildSpan(yypvt[-0], NODE_SPAN);
} break;
case 35:
# line 148 "plex.y"
{
	yyval = buildSpan(yypvt[-0], WHITE_SPAN);
} break;
case 36:
# line 152 "plex.y"
{
	yyval = buildSpan(yypvt[-0], H_SPAN);
} break;
case 37:
# line 156 "plex.y"
{
	yyval = buildSpan(yypvt[-0], V_SPAN);
} break;
case 38:
# line 160 "plex.y"
{
	yyval = buildSpan(yypvt[-0], X_SPAN);
} break;
case 39:
# line 164 "plex.y"
{
	yyval = buildSpan(yypvt[-0], FILLER_SPAN);
} break;
case 40:
# line 168 "plex.y"
{
	yyval = buildSpan(yypvt[-0], END_SPAN);
} break;
case 41:
# line 175 "plex.y"
{
	yyval = 1;
} break;
case 42:
# line 179 "plex.y"
{
	yyval = yypvt[-1] + 1;
} break;
case 43:
# line 186 "plex.y"
{
	yyval = 1;
} break;
case 44:
# line 190 "plex.y"
{
	yyval = yypvt[-1] + 1;
} break;
case 45:
# line 197 "plex.y"
{
	yyval = (int) CENTER_VERT;
} break;
case 46:
# line 201 "plex.y"
{
	yyval = (int) LEFT_VERT;
} break;
case 47:
# line 205 "plex.y"
{
	yyval = (int) RIGHT_VERT;
} break;
case 48:
# line 212 "plex.y"
{
	yyval = 1;
} break;
case 49:
# line 219 "plex.y"
{
	yyval = 1;
} break;
case 50:
# line 223 "plex.y"
{
	yyval = yypvt[-1] + 1;
} break;
case 51:
# line 230 "plex.y"
{
	yyval = 1;
} break;
case 52:
# line 237 "plex.y"
{
	yyval = buildParseNode(yypvt[-0], NULL);
} break;
case 53:
# line 241 "plex.y"
{
	yyval = buildParseNode(yypvt[-3], yypvt[-1]);
} break;
case 54:
# line 248 "plex.y"
{
	yyval = buildPrimNode(yypvt[-0], IDENTITY_OP);
} break;
case 55:
# line 252 "plex.y"
{
	yyval = buildPrimNode(yypvt[-1], yypvt[-0]);
} break;
case 56:
# line 259 "plex.y"
{
	yyval = (int) INVERT_OP;
} break;
case 57:
# line 263 "plex.y"
{
	yyval = (int) CCW_OP;
} break;
case 58:
# line 267 "plex.y"
{
	yyval = (int) CW_OP;
} break;
case 59:
# line 271 "plex.y"
{
	yyval = (int) RANDOM_OP;
} break;
case 60:
# line 275 "plex.y"
{
	yyval = (int) PERIOD_OP;
} break;
case 61:
# line 282 "plex.y"
{
	yyval = buildSet(yypvt[-2]);
} break;
case 62:
# line 289 "plex.y"
{
	yyval = buildArray(yypvt[-2]);
} break;
case 63:
# line 296 "plex.y"
{
	yyval = yypvt[-2];
} break;
case 64:
# line 303 "plex.y"
{
	yyval = buildPreambleStatementList(NULL, yypvt[-0]);
} break;
case 65:
# line 307 "plex.y"
{
	yyval = buildPreambleStatementList(yypvt[-2], yypvt[-0]);
} break;
case 66:
# line 314 "plex.y"
{
	yyval = buildPreambleStatement(SHUFFLE_STATEMENT, yypvt[-0]);
} break;
case 67:
# line 321 "plex.y"
{
	yyval = buildIdentifierList(NULL, yypvt[-0]);
} break;
case 68:
# line 325 "plex.y"
{
	yyval = buildIdentifierList(yypvt[-4], yypvt[-0]);
} break;
case 69:
# line 332 "plex.y"
{
	yyval = buildExpr(STRING_EXPR, yypvt[-0], 0);
} break;
case 70:
# line 336 "plex.y"
{
	yyval = buildExpr(NUMBER_EXPR, yypvt[-0], 0);
} break;
case 71:
# line 340 "plex.y"
{
	yyval = buildExpr(DOT_EXPR, 0, 0);
} break;
case 72:
# line 344 "plex.y"
{
	yyval = buildExpr(PARAM_EXPR, yypvt[-0], 0);
} break;
case 73:
# line 348 "plex.y"
{
	yyval = buildExpr(ARRAY_EXPR, yypvt[-3], yypvt[-1]);
} break;
case 74:
# line 352 "plex.y"
{
	yyval = buildExpr(RARRAY_EXPR, yypvt[-1], 0);
} break;
case 75:
# line 356 "plex.y"
{
	yyval = buildExpr(NAME_EXPR, yypvt[-0], 0);
} break;
case 76:
# line 360 "plex.y"
{
	yyval = buildExpr(NESTED_EXPR, yypvt[-1], 0);
} break;
case 77:
# line 364 "plex.y"
{
	yyval = buildExpr(ADD_EXPR, yypvt[-2], yypvt[-0]);
} break;
case 78:
# line 368 "plex.y"
{
	yyval = buildExpr(SUB_EXPR, yypvt[-2], yypvt[-0]);
} break;
case 79:
# line 372 "plex.y"
{
	yyval = buildExpr(DIV_EXPR, yypvt[-2], yypvt[-0]);
} break;
case 80:
# line 376 "plex.y"
{
	yyval = buildExpr(MUL_EXPR, yypvt[-2], yypvt[-0]);
} break;
case 81:
# line 383 "plex.y"
{
	yyval = buildExprList(NULL, yypvt[-0]);
} break;
case 82:
# line 387 "plex.y"
{
	yyval = buildExprList(yypvt[-4], yypvt[-0]);
} break;
		}
		goto yystack;  /* stack new state and value */

	}
