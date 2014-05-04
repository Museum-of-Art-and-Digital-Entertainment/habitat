%{
#include "griddleDefs.h"
%}

%token Name Number String BitString Rawline
%token INCLUDE DEFINE ENDDEFINE USE
%token AVAID BIN15 BIN31 BIT BYTE CHARACTER ENTITY FATWORD OBJID REGID
%token VARSTRING WORDS

%left A O R
%left OR
%left XOR
%left AND
%left ADD SUB
%left MUL DIV MOD
%right UMINUS NOT

%%

statementList:
		statement				/* na */
 |		statementList statement			/* na */
 ;

statement:
		assignmentStatement			/* na */
 |		includeStatement			/* na */
 |		defineStatement				/* na */
 |		objectUseStatement			/* na */
 |		rawStatement				/* na */
 ;

rawStatement:
		Rawline
{
	executeRawline($1);
}
 ;

assignmentStatement:
		Name '=' expr
{
	executeAssignment($1, $3);
}
 ;

includeStatement:
		INCLUDE String
{
	executeInclude($2);
}
 ;

defineStatement:
		DEFINE expr String fieldList ENDDEFINE
{
	$$ = executeDefine($2, $3, $4);
}
 |		DEFINE expr String ENDDEFINE
{
	$$ = executeDefine($2, $3, NULL);
}
 ;

fieldList:
		field
{
	$$ = buildFieldList(NULL, $1);
}
 |		fieldList field
{
	$$ = buildFieldList($1, $2);
}
 ;

field:
		basicField
{
	$$ = $1;
}
 |		'#' basicField
{
	$$ = invisifyField($2);
}
 ;

basicField:
		Name ':' fieldType
{
	$$ = buildField($1, buildExpr(NUM_EXPR, 1), $3, NULL);
}
 |		Name '(' expr ')' ':' fieldType
{
	$$ = buildField($1, $3, $6, NULL);
}
 |		Name ':' fieldType '=' exprList
{
	$$ = buildField($1, buildExpr(NUM_EXPR, 1), $3, $5);
}
 |		Name '(' expr ')' ':' fieldType '=' exprList
{
	$$ = buildField($1, $3, $6, $8);
}
 ;

fieldType:
		CHARACTER	{ $$ = (int) FIELD_CHARACTER;	}
 |		BIN15		{ $$ = (int) FIELD_BIN15;	}
 |		BIN31		{ $$ = (int) FIELD_BIN31;	}
 |		BIT		{ $$ = (int) FIELD_BIT;		}
 |		WORDS		{ $$ = (int) FIELD_WORDS;	}
 |		REGID		{ $$ = (int) FIELD_REGID;	}
 |		OBJID		{ $$ = (int) FIELD_OBJID;	}
 |		AVAID		{ $$ = (int) FIELD_AVAID;	}
 |		FATWORD		{ $$ = (int) FIELD_FATWORD;	}
 |		ENTITY		{ $$ = (int) FIELD_ENTITY;	}
 |		BYTE		{ $$ = (int) FIELD_BYTE;	}
 |		VARSTRING	{ $$ = (int) FIELD_VARSTRING;	}
 ;

objectUseStatement:
		USE Name Name objectTail
{
	executeUse($2, $3, $4);
}
 |		USE Name      objectTail
{
	executeUse($2, NULL, $3);
}
 ;

objectTail:
		'=' expr '{' properties '}'
{
	$$ = buildObjectTail($2, $4);
}
 |			 '{' properties '}'
{
	$$ = buildObjectTail(NULL, $2);
}
 ;

properties:
		property
{
	$$ = buildPropertyList(NULL, $1);
}
 |		properties property
{
	$$ = buildPropertyList($1, $2);
}
 ;

property:
		Name ':' exprList
{
	$$ = buildProperty($1, $3);
}
 ;

exprList:
		expr
{
	$$ = buildExprList(NULL, $1);
}
 |		exprList ',' expr
{
	$$ = buildExprList($1, $3);
}
 ;

expr:
		Name
{
	$$ = buildExpr(ID_EXPR, $1);
}
 |		Number
{
	$$ = buildExpr(NUM_EXPR, $1);
}
 |		String
{
	$$ = buildExpr(STRING_EXPR, $1);
}
 |		BitString
{
	$$ = buildExpr(BITSTRING_EXPR, $1);
}
 |		'(' expr ')'
{
	$$ = buildExpr(EXPR_EXPR, $2);
}
 |		SUB expr	%prec UMINUS
{
	$$ = buildExpr(UNOP_EXPR, UMINUS, $2);
}
 |		NOT expr
{
	$$ = buildExpr(UNOP_EXPR, NOT, $2);
}
 |		A expr
{
	$$ = buildExpr(UNOP_EXPR, A, $2);
}
 |		O expr
{
	$$ = buildExpr(UNOP_EXPR, O, $2);
}
 |		R expr
{
	$$ = buildExpr(UNOP_EXPR, R, $2);
}
 |		expr ADD expr
{
	$$ = buildExpr(BIN_EXPR, $1, ADD, $3);
}
 |		expr SUB expr
{
	$$ = buildExpr(BIN_EXPR, $1, SUB, $3);
}
 |		expr MUL expr
{
	$$ = buildExpr(BIN_EXPR, $1, MUL, $3);
}
 |		expr DIV expr
{
	$$ = buildExpr(BIN_EXPR, $1, DIV, $3);
}
 |		expr MOD expr
{
	$$ = buildExpr(BIN_EXPR, $1, MOD, $3);
}
 |		expr AND expr
{
	$$ = buildExpr(BIN_EXPR, $1, AND, $3);
}
 |		expr OR expr
{
	$$ = buildExpr(BIN_EXPR, $1, OR, $3);
}
 |		expr XOR expr
{
	$$ = buildExpr(BIN_EXPR, $1, XOR, $3);
}
 ;
