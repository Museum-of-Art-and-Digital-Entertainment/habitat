%{
#include "plexTypes.h"
#include "plexGlobals.h"
%}

%token EOL
%token Identifier Number String
%token START INCLUDE SHUFFLE

%left '+' '-'
%left '*' '/'

%%
specification:
		statementList
 ;

statementList:
		statement
 |		statementList _ statement
 ;

/* "_" represents optional whitespace */
_:		whitespaceList
 |		/* null string */
 ;

__:		fillerList
 |		/* null string */
 ;

whitespaceList:
		whitespaceChar
 |		whitespaceList whitespaceChar
 ;

fillerList:
		fillerChar
 |		fillerList fillerChar
 ;

whitespaceChar:
		EOL
 |		fillerChar
 ;

fillerChar:
		' '
 |		'\t'
 ;

statement:
		productionStatement
 |		nameStatement
 |		startStatement
 |		includeStatement
 ;

startStatement:
		START _ Identifier __ EOL
{
	executeStartStatement($3);
}
 ;

includeStatement:
		INCLUDE _ String __ EOL
{
	executeIncludeStatement($3);
}
 ;

productionStatement:
		label productionBody EOL
{
	bindSymbol($1, $2);
}
 ;

nameStatement:
		Identifier _ '=' _ expr __ EOL
{
	bindSymbol($1, buildProduction(evaluateExpr($5), NAME_PROD));
}
 ;

label:
		Identifier _ ':' __
{
	$$ = $1;
}
 ;

productionBody:
		productionPreamble EOL spanList EOL
{
	$$ = buildProduction(plexParse($3, $1), SPAN_PROD);
}
 |		EOL spanList EOL
{
	$$ = buildProduction(plexParse($2, NULL), SPAN_PROD);
}
 |		setDeclaration
{
	$$ = buildProduction($1, SET_PROD);
}
 |		arrayDeclaration
{
	$$ = buildProduction($1, ARRAY_PROD);
}
 ;

spanList:
		spanLine
{
	$$ = buildSpanList(NULL, $1);
}
 |		spanList EOL spanLine
{
	$$ = buildSpanList($1, $3);
}
 ;

spanLine:
		'\t' spanLineBody
{
	$$ = $2;
}
 ;

spanLineBody:
		span
{
	$$ = buildSpanLine(NULL, $1);
}
 |		spanLineBody span
{
	$$ = buildSpanLine($1, $2);
}
 ;

span:
		node
{
	$$ = buildSpan($1, NODE_SPAN);
}
 |		whiteSpan
{
	$$ = buildSpan($1, WHITE_SPAN);
}
 |		hLine
{
	$$ = buildSpan($1, H_SPAN);
}
 |		vLine
{
	$$ = buildSpan($1, V_SPAN);
}
 |		xLine
{
	$$ = buildSpan($1, X_SPAN);
}
 |		filler
{
	$$ = buildSpan($1, FILLER_SPAN);
}
 |		endMark
{
	$$ = buildSpan($1, END_SPAN);
}
 ;

whiteSpan:
		' '
{
	$$ = 1;
}
 |		whiteSpan ' '
{
	$$ = $1 + 1;
}
 ;

hLine:
		'-'
{
	$$ = 1;
}
 |		hLine '-'
{
	$$ = $1 + 1;
}
 ;

vLine:
		'|'
{
	$$ = (int) CENTER_VERT;
}
 |		'/'
{
	$$ = (int) LEFT_VERT;
}
 |		'\\'
{
	$$ = (int) RIGHT_VERT;
}
 ;

xLine:
		'+'
{
	$$ = 1;
}
 ;

filler:
		'#'
{
	$$ = 1;
}
 |		filler '#'
{
	$$ = $1 + 1;
}
 ;

endMark:
		'^'
{
	$$ = 1;
}
 ;

node:
		primNode
{
	$$ = buildParseNode($1, NULL);
}
 |		primNode '(' exprList ')'
{
	$$ = buildParseNode($1, $3);
}
 ;

primNode:
		Identifier
{
	$$ = buildPrimNode($1, IDENTITY_OP);
}
 |		primNode operator
{
	$$ = buildPrimNode($1, $2);
}
 ;

operator:
		'!'		/* invert 180 deg. */
{
	$$ = (int) INVERT_OP;
}
 |		'<'		/* counter-clockwise 90 deg. */
{
	$$ = (int) CCW_OP;
}
 |		'>'		/* clockwise 90 deg. */
{
	$$ = (int) CW_OP;
}
 |		'?'		/* random selection from a set */
{
	$$ = (int) RANDOM_OP;
}
 |		'*'		/* periodic selection from a set */
{
	$$ = (int) PERIOD_OP;
}
 ;

setDeclaration:
		'(' _ identifierList _ ')'
{
	$$ = buildSet($3);
}
 ;

arrayDeclaration:
		'[' _ exprList _ ']'
{
	$$ = buildArray($3);
}
 ;

productionPreamble:
		'{' _ preambleStatementList _ '}'
{
	$$ = $3;
}
 ;

preambleStatementList:
		preambleStatement
{
	$$ = buildPreambleStatementList(NULL, $1);
}
 |		preambleStatementList _ preambleStatement
{
	$$ = buildPreambleStatementList($1, $3);
}
 ;

preambleStatement:
		SHUFFLE Identifier
{
	$$ = buildPreambleStatement(SHUFFLE_STATEMENT, $2);
}
 ;

identifierList:
		Identifier
{
	$$ = buildIdentifierList(NULL, $1);
}
 |		identifierList _ ',' _ Identifier
{
	$$ = buildIdentifierList($1, $5);
}
 ;

expr:
		String
{
	$$ = buildExpr(STRING_EXPR, $1, 0);
}
 |		Number
{
	$$ = buildExpr(NUMBER_EXPR, $1, 0);
}
 |		'.'
{
	$$ = buildExpr(DOT_EXPR, 0, 0);
}
 |		'$' Number
{
	$$ = buildExpr(PARAM_EXPR, $2, 0);
}
 |		Identifier '[' expr ']'
{
	$$ = buildExpr(ARRAY_EXPR, $1, $3);
}
 |		Identifier '?'
{
	$$ = buildExpr(RARRAY_EXPR, $1, 0);
}
 |		Identifier
{
	$$ = buildExpr(NAME_EXPR, $1, 0);
}
 |		'(' expr ')'
{
	$$ = buildExpr(NESTED_EXPR, $2, 0);
}
 |		expr '+' expr
{
	$$ = buildExpr(ADD_EXPR, $1, $3);
}
 |		expr '-' expr
{
	$$ = buildExpr(SUB_EXPR, $1, $3);
}
 |		expr '/' expr
{
	$$ = buildExpr(DIV_EXPR, $1, $3);
}
 |		expr '*' expr
{
	$$ = buildExpr(MUL_EXPR, $1, $3);
}
 ;

exprList:
		expr
{
	$$ = buildExprList(NULL, $1);
}
 |		exprList _ ',' _ expr
{
	$$ = buildExprList($1, $5);
}
 ;

%%

yyerror(s)
  char	*s;
{
	error("%s on line %d of \"%s\"\n", s, currentLineNumber,
		currentFileName);
}
