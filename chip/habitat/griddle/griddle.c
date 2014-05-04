
# line 2 "griddle.y"
#include "griddleDefs.h"
# define Name 257
# define Number 258
# define String 259
# define BitString 260
# define Rawline 261
# define INCLUDE 262
# define DEFINE 263
# define ENDDEFINE 264
# define USE 265
# define AVAID 266
# define BIN15 267
# define BIN31 268
# define BIT 269
# define BYTE 270
# define CHARACTER 271
# define ENTITY 272
# define FATWORD 273
# define OBJID 274
# define REGID 275
# define VARSTRING 276
# define WORDS 277
# define A 278
# define O 279
# define R 280
# define OR 281
# define XOR 282
# define AND 283
# define ADD 284
# define SUB 285
# define MUL 286
# define DIV 287
# define MOD 288
# define UMINUS 289
# define NOT 290
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
short yyexca[] ={
-1, 1,
	0, -1,
	-2, 0,
	};
# define YYNPROD 60
# define YYLAST 287
short yyact[]={

  21,  73,  29,  36,  37,  35,  30,  31,  32,  33,
  34,  95,  37,  35,  30,  31,  32,  33,  34,  62,
  32,  33,  34,  15,  36,  37,  35,  30,  31,  32,
  33,  34,  35,  30,  31,  32,  33,  34,  30,  31,
  32,  33,  34,  85,  79,  80,  81,  88,  78,  87,
  86,  84,  83,  89,  82,   8,  52,  52,  96,  12,
   9,  10,  74,  11,  67,  53,  27,  46, 102,  93,
  77,  46,  65,  92,  94,  14,  99,  66,  76,  72,
  16,  51,  50,  45,  28,  97,   2,  48,  13,   7,
   6,  38,  39,  40,  41,  42,  43,  71,   5,   4,
  54,  55,  56,  57,  58,  59,  60,  61,   3,   1,
   0,   0,   0,   0,   0,   0,  64,   0,   0,   0,
   0,   0,   0,   0,   0,   0,   0,   0,  63,  47,
   0,  69,   0,  47,  70,   0,   0,   0,   0,   0,
   0,   0,  90,  75,   0,   0,  91,   0,   0,   0,
   0,   0,   0,   0,   0,   0,   0,   0,   0,  36,
  37,  35,  30,  31,  32,  33,  34, 100,  98,  75,
 101,   0,   0,   0,   0,   0, 103,   0,   0,   0,
   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
  67,   0,   0,   0,  67,   0,   0,   0,   0,   0,
   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
   0,   0,   0,   0,   0,   0,   0,  17,  18,  19,
  20,   0,   0,   0,   0,   0,   0,   0,   0,   0,
   0,   0,   0,   0,   0,   0,   0,   0,  24,  25,
  26,   0,   0,   0,   0,  22,   0,   0,   0,   0,
  23,  36,  37,  35,  30,  31,  32,  33,  34,  36,
  37,  35,  30,  31,  32,  33,  34,  44,   0,   0,
   0,   0,   0,   0,   0,   0,   0,   0,  53,  53,
   0,   0,   0,   0,   0,  68,  49 };
short yypact[]={

-202,-202,-1000,-1000,-1000,-1000,-1000,-1000,  14,-236,
 -40,-191,-1000,-1000, -40,-1000,-257,-1000,-1000,-1000,
-1000, -40, -40, -40, -40, -40, -40,  10,-278,  22,
 -40, -40, -40, -40, -40, -40, -40, -40, -22,-1000,
-1000,-278,-278,-278,   6,-1000, -40,-193,  21,-1000,
-1000,-1000,-192,  39,-266,-266,-1000,-1000,-1000,-246,
-270,-251,-1000,-1000,-122, -63,-1000,  20,-1000,-1000,
-1000,-223, -40,-193,-1000,-1000, -40,  13,-1000,-1000,
-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,
 -30, -67,  41,-278, -40,  18,-1000, -40,  41,-223,
-278,   7, -40,  41 };
short yypgo[]={

   0, 109,  86, 108,  99,  98,  90,  89,  69,  87,
  82,  81,  70,  73,  83,  72,  77 };
short yyr1[]={

   0,   1,   1,   2,   2,   2,   2,   2,   7,   3,
   4,   5,   5,   9,   9,  10,  10,  11,  11,  11,
  11,  12,  12,  12,  12,  12,  12,  12,  12,  12,
  12,  12,  12,   6,   6,  14,  14,  15,  15,  16,
  13,  13,   8,   8,   8,   8,   8,   8,   8,   8,
   8,   8,   8,   8,   8,   8,   8,   8,   8,   8 };
short yyr2[]={

   0,   1,   2,   1,   1,   1,   1,   1,   1,   3,
   2,   5,   4,   1,   2,   1,   2,   3,   6,   5,
   8,   1,   1,   1,   1,   1,   1,   1,   1,   1,
   1,   1,   1,   4,   3,   5,   3,   1,   2,   3,
   1,   3,   1,   1,   1,   1,   3,   2,   2,   2,
   2,   2,   3,   3,   3,   3,   3,   3,   3,   3 };
short yychk[]={

-1000,  -1,  -2,  -3,  -4,  -5,  -6,  -7, 257, 262,
 263, 265, 261,  -2,  61, 259,  -8, 257, 258, 259,
 260,  40, 285, 290, 278, 279, 280, 257,  -8, 259,
 284, 285, 286, 287, 288, 283, 281, 282,  -8,  -8,
  -8,  -8,  -8,  -8, 257, -14,  61, 123,  -9, 264,
 -10, -11,  35, 257,  -8,  -8,  -8,  -8,  -8,  -8,
  -8,  -8,  41, -14,  -8, -15, -16, 257, 264, -10,
 -11,  58,  40, 123, 125, -16,  58, -12, 271, 267,
 268, 269, 277, 275, 274, 266, 273, 272, 270, 276,
  -8, -15, -13,  -8,  61,  41, 125,  44, -13,  58,
  -8, -12,  61, -13 };
short yydef[]={

   0,  -2,   1,   3,   4,   5,   6,   7,   0,   0,
   0,   0,   8,   2,   0,  10,   0,  42,  43,  44,
  45,   0,   0,   0,   0,   0,   0,   0,   9,   0,
   0,   0,   0,   0,   0,   0,   0,   0,   0,  47,
  48,  49,  50,  51,   0,  34,   0,   0,   0,  12,
  13,  15,   0,   0,  52,  53,  54,  55,  56,  57,
  58,  59,  46,  33,   0,   0,  37,   0,  11,  14,
  16,   0,   0,   0,  36,  38,   0,  17,  21,  22,
  23,  24,  25,  26,  27,  28,  29,  30,  31,  32,
   0,   0,  39,  40,   0,   0,  35,   0,  19,   0,
  41,  18,   0,  20 };
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
			
case 8:
# line 35 "griddle.y"
{
	executeRawline(yypvt[-0]);
} break;
case 9:
# line 42 "griddle.y"
{
	executeAssignment(yypvt[-2], yypvt[-0]);
} break;
case 10:
# line 49 "griddle.y"
{
	executeInclude(yypvt[-0]);
} break;
case 11:
# line 56 "griddle.y"
{
	yyval = executeDefine(yypvt[-3], yypvt[-2], yypvt[-1]);
} break;
case 12:
# line 60 "griddle.y"
{
	yyval = executeDefine(yypvt[-2], yypvt[-1], NULL);
} break;
case 13:
# line 67 "griddle.y"
{
	yyval = buildFieldList(NULL, yypvt[-0]);
} break;
case 14:
# line 71 "griddle.y"
{
	yyval = buildFieldList(yypvt[-1], yypvt[-0]);
} break;
case 15:
# line 78 "griddle.y"
{
	yyval = yypvt[-0];
} break;
case 16:
# line 82 "griddle.y"
{
	yyval = invisifyField(yypvt[-0]);
} break;
case 17:
# line 89 "griddle.y"
{
	yyval = buildField(yypvt[-2], buildExpr(NUM_EXPR, 1), yypvt[-0], NULL);
} break;
case 18:
# line 93 "griddle.y"
{
	yyval = buildField(yypvt[-5], yypvt[-3], yypvt[-0], NULL);
} break;
case 19:
# line 97 "griddle.y"
{
	yyval = buildField(yypvt[-4], buildExpr(NUM_EXPR, 1), yypvt[-2], yypvt[-0]);
} break;
case 20:
# line 101 "griddle.y"
{
	yyval = buildField(yypvt[-7], yypvt[-5], yypvt[-2], yypvt[-0]);
} break;
case 21:
# line 107 "griddle.y"
{ yyval = (int) FIELD_CHARACTER;	} break;
case 22:
# line 108 "griddle.y"
{ yyval = (int) FIELD_BIN15;	} break;
case 23:
# line 109 "griddle.y"
{ yyval = (int) FIELD_BIN31;	} break;
case 24:
# line 110 "griddle.y"
{ yyval = (int) FIELD_BIT;		} break;
case 25:
# line 111 "griddle.y"
{ yyval = (int) FIELD_WORDS;	} break;
case 26:
# line 112 "griddle.y"
{ yyval = (int) FIELD_REGID;	} break;
case 27:
# line 113 "griddle.y"
{ yyval = (int) FIELD_OBJID;	} break;
case 28:
# line 114 "griddle.y"
{ yyval = (int) FIELD_AVAID;	} break;
case 29:
# line 115 "griddle.y"
{ yyval = (int) FIELD_FATWORD;	} break;
case 30:
# line 116 "griddle.y"
{ yyval = (int) FIELD_ENTITY;	} break;
case 31:
# line 117 "griddle.y"
{ yyval = (int) FIELD_BYTE;	} break;
case 32:
# line 118 "griddle.y"
{ yyval = (int) FIELD_VARSTRING;	} break;
case 33:
# line 123 "griddle.y"
{
	executeUse(yypvt[-2], yypvt[-1], yypvt[-0]);
} break;
case 34:
# line 127 "griddle.y"
{
	executeUse(yypvt[-1], NULL, yypvt[-0]);
} break;
case 35:
# line 134 "griddle.y"
{
	yyval = buildObjectTail(yypvt[-3], yypvt[-1]);
} break;
case 36:
# line 138 "griddle.y"
{
	yyval = buildObjectTail(NULL, yypvt[-1]);
} break;
case 37:
# line 145 "griddle.y"
{
	yyval = buildPropertyList(NULL, yypvt[-0]);
} break;
case 38:
# line 149 "griddle.y"
{
	yyval = buildPropertyList(yypvt[-1], yypvt[-0]);
} break;
case 39:
# line 156 "griddle.y"
{
	yyval = buildProperty(yypvt[-2], yypvt[-0]);
} break;
case 40:
# line 163 "griddle.y"
{
	yyval = buildExprList(NULL, yypvt[-0]);
} break;
case 41:
# line 167 "griddle.y"
{
	yyval = buildExprList(yypvt[-2], yypvt[-0]);
} break;
case 42:
# line 174 "griddle.y"
{
	yyval = buildExpr(ID_EXPR, yypvt[-0]);
} break;
case 43:
# line 178 "griddle.y"
{
	yyval = buildExpr(NUM_EXPR, yypvt[-0]);
} break;
case 44:
# line 182 "griddle.y"
{
	yyval = buildExpr(STRING_EXPR, yypvt[-0]);
} break;
case 45:
# line 186 "griddle.y"
{
	yyval = buildExpr(BITSTRING_EXPR, yypvt[-0]);
} break;
case 46:
# line 190 "griddle.y"
{
	yyval = buildExpr(EXPR_EXPR, yypvt[-1]);
} break;
case 47:
# line 194 "griddle.y"
{
	yyval = buildExpr(UNOP_EXPR, UMINUS, yypvt[-0]);
} break;
case 48:
# line 198 "griddle.y"
{
	yyval = buildExpr(UNOP_EXPR, NOT, yypvt[-0]);
} break;
case 49:
# line 202 "griddle.y"
{
	yyval = buildExpr(UNOP_EXPR, A, yypvt[-0]);
} break;
case 50:
# line 206 "griddle.y"
{
	yyval = buildExpr(UNOP_EXPR, O, yypvt[-0]);
} break;
case 51:
# line 210 "griddle.y"
{
	yyval = buildExpr(UNOP_EXPR, R, yypvt[-0]);
} break;
case 52:
# line 214 "griddle.y"
{
	yyval = buildExpr(BIN_EXPR, yypvt[-2], ADD, yypvt[-0]);
} break;
case 53:
# line 218 "griddle.y"
{
	yyval = buildExpr(BIN_EXPR, yypvt[-2], SUB, yypvt[-0]);
} break;
case 54:
# line 222 "griddle.y"
{
	yyval = buildExpr(BIN_EXPR, yypvt[-2], MUL, yypvt[-0]);
} break;
case 55:
# line 226 "griddle.y"
{
	yyval = buildExpr(BIN_EXPR, yypvt[-2], DIV, yypvt[-0]);
} break;
case 56:
# line 230 "griddle.y"
{
	yyval = buildExpr(BIN_EXPR, yypvt[-2], MOD, yypvt[-0]);
} break;
case 57:
# line 234 "griddle.y"
{
	yyval = buildExpr(BIN_EXPR, yypvt[-2], AND, yypvt[-0]);
} break;
case 58:
# line 238 "griddle.y"
{
	yyval = buildExpr(BIN_EXPR, yypvt[-2], OR, yypvt[-0]);
} break;
case 59:
# line 242 "griddle.y"
{
	yyval = buildExpr(BIN_EXPR, yypvt[-2], XOR, yypvt[-0]);
} break;
		}
		goto yystack;  /* stack new state and value */

	}
