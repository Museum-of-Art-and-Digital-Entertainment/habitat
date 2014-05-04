/*
   Noodl: the Negligable Overhead Object Description Language for the
    encoding of host-based object behavior code in the MicroCosm system.

   Kindly refer to MicroCosm design document #3, "Noodl", and MicroCosm
    design document #2, "Looi", for more detailed descriptive prose as to what
    this is all about.  If you don't know already, you needn't bother to read
    further!

   This is the first crack at a Noodl to C translator using Yacc.

   Chip Morningstar, Lucasfilm Ltd., 2-January-1986
 */

%{

#include "noodlTypes.h"

%}

/* Tokens are recognized by the lexer */
%token CLASS		/* the keyword 'class' */
%token OBJECT		/* the keyword 'object' */
%token ENDFILE		/* the end of the input */
%token CCode		/* anything between '{' and '}' */
%token Identifier	/* the usual */
%token Number		/* a decimal integer */

%%

noodl:
		noodlDescription ENDFILE	/* no action */
|
		ENDFILE				/* no action */
 ;

noodlDescription:
		noodlThing			/* no action */
 |		noodlDescription noodlThing	/* no action */
 ;

noodlThing:
		CCode
{
	outputCCode($1);
}
 |		objectDefinition
{
	outputObjectListDefinition($1);
}
 |		classDefinition			/* no action */
 ;

objectDefinition:
		OBJECT identifierList '!'
{
	$$ = $2;
}
 ;

classDefinition:
		CLASS className propertyList
{
	outputPropertyVectorDefinition($2, $3);
}						 capabilities '!'
{
	outputCapabilityVectorDefinition($2, $5);
	outputClassDescriptorDefinition($2, $3, $5);
}
 |		CLASS className propertyList
{
	outputPropertyVectorDefinition($2, $3);
}						'!'
{
	outputCapabilityVectorDefinition($2, NULL);
	outputClassDescriptorDefinition($2, $3, NULL);
}
 ;

className:
		Identifier	/* default action */
 ;

propertyList:
		nameList	/* default action */
 ;

nameList:
		'(' identifierList ')'
{
	$$ = $2;
}
 |		'('		   ')'
{
	$$ = NULL;
}
 ;

identifierList:
		Identifier
{
	$$ = buildIdentifierList(NULL, $1, 0);
}
 |		identifierList ',' Identifier
{
	$$ = buildIdentifierList($1, $3, 0);
}
 ;

capabilities:
		explicitCapabilityDescription
{
	$$ = buildIdentifierList(NULL, $1, EXPLICIT_CAPABILITY);
}
 |		capabilities explicitCapabilityDescription
{
	$$ = buildIdentifierList($1, $2, EXPLICIT_CAPABILITY);
}
 |		implicitCapabilityDescription
{
	$$ = buildIdentifierList(NULL, $1, IMPLICIT_CAPABILITY);
}
 |		capabilities implicitCapabilityDescription
{
	$$ = buildIdentifierList($1, $2, IMPLICIT_CAPABILITY);
}
 ;

explicitCapabilityDescription:
		capabilityIdentifier argumentList body
{
	$$ = outputCapabilityDescriptionExplicit($1, $2, $3);
}
 ;

implicitCapabilityDescription:
		capabilityIdentifier argumentList functionName
{
	$$ = outputCapabilityDescriptionImplicit($1, $2, $3);
}
 ;

functionName:
		Identifier	/* default action */
 ;

capabilityIdentifier:
		capabilityName
{
	$$ = buildCapabilityIdentifier($1, -1);
}
 |		capabilityName ':' capabilityNumber
{
	$$ = buildCapabilityIdentifier($1, $3);
}
 ;

capabilityName:
		Identifier	/* default action */
 ;

capabilityNumber:
		Number		/* default action */
 ;

argumentList:
		nameList	/* default action */
 ;

body:
		CCode		/* default action */
 ;
