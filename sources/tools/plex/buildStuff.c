/* 
   buildStuff.c: Routines to build parse-tree data structures for Plex.

   Chip Morningstar, Lucasfilm Ltd., 26-January-1987
 */

#include "plexTypes.h"
#include "plexGlobals.h"

static valueListType	*workingArgList = NULL;

  byte *
myalloc(size)
  int	size;
{
	byte	*result;

	result = (byte *) malloc(size);
	if (result == NULL)
		fatalError("out of space alloc'ing %d bytes!\n", size);
	return(result);
}

  char *
buildString(string)
  char	*string;
{
	char	*result;

	result = (char *) myalloc(strlen(string) + 1);
	strcpy(result, string);
	return(result);
}

  genericListHead *
buildGenericList(ongoingList, newData)
  genericListHead	*ongoingList;
  int			*newData;
{
	genericListHead	*result;
	genericList	*newEntry;

	newEntry = typeAlloc(genericList);
	newEntry->data = newData;
	newEntry->next = NULL;
	if (ongoingList == NULL) {
		result = typeAlloc(genericListHead);
		result->first = newEntry;
		result->last = newEntry;
	} else {
		result = ongoingList;
		result->last->next = newEntry;
		result->last = newEntry;
	}
	return(result);
}

  genericListHead *
buildIdentifierList(ongoingList, identifier)
  genericListHead	*ongoingList;
  symbolType		*identifier;
{
	return(buildGenericList(ongoingList, identifier));
}

  genericListHead *
buildExprList(ongoingList, expr)
  genericListHead	*ongoingList;
  exprType		*expr;
{
	genericListHead	*result;

	result = buildGenericList(ongoingList, expr);
	if (ongoingList == NULL)
		((exprListType *)(result->first))->count = expr->count;
	else
		((exprListType *)(result->first))->count += expr->count + 1;
	return(result);
}

  setType *
buildSet(identifierList)
 genericListHead	*identifierList;
{
	int		  i;
	genericList	 *chaser;
	symbolType	**symbols;
	setType		 *result;

	i = 0;
	for (chaser=identifierList->first; chaser!=NULL; chaser=chaser->next)
		++i;
	if (i == 0)
		return(NULL);
	symbols = typeAllocMulti(symbolType *, i);
	i = 0;
	for (chaser=identifierList->first; chaser!=NULL; chaser=chaser->next)
		symbols[i++] = (symbolType *) chaser->data;
	result = typeAlloc(setType);
	result->symbols = symbols;
	result->card = i;
	result->counter = 0;
	return(result);
}

  void
freeExpr(expr)
  exprType	*expr;
{
	switch (expr->kind) {
		Case ADD_EXPR:
		case SUB_EXPR:
		case MUL_EXPR:
		case DIV_EXPR:
			freeExpr(expr->arg1);
			freeExpr(expr->arg2);
			free(expr);
		Case PARAM_EXPR:
		case NUMBER_EXPR:
		case STRING_EXPR:
		case DOT_EXPR:
		case NAME_EXPR:
		case RARRAY_EXPR:
			free(expr);
		Case ARRAY_EXPR:
			freeExpr(expr->arg2);
			free(expr);
		Default:
			error("botch: bad expr type");
	}
}

  arrayType *
buildArray(exprList)
 genericListHead	*exprList;
{
	int		  i;
	genericList	 *chaser;
	valueType	**values;
	arrayType	 *result;
	valueType	 *evaluateExpr();

	i = 0;
	for (chaser=exprList->first; chaser!=NULL; chaser=chaser->next)
		++i;
	if (i == 0)
		return(NULL);
	values = typeAllocMulti(valueType *, i);
	i = 0;
	for (chaser=exprList->first; chaser!=NULL; chaser=chaser->next) {
		values[i++] = evaluateExpr(chaser->data);
		freeExpr(chaser->data);
	}
	result = typeAlloc(arrayType);
	result->values = values;
	result->card = i;
	return(result);
}

  exprType *
buildExpr(kind, arg1, arg2)
  exprKind	 kind;
  exprType	*arg1;
  exprType	*arg2;
{
	exprType	*result;

	result = typeAlloc(exprType);
	result->kind = kind;
	result->arg1 = arg1;
	result->arg2 = arg2;
	switch (kind) {
		Case ADD_EXPR:
		case SUB_EXPR:
		case MUL_EXPR:
		case DIV_EXPR:
			result->count = ((exprType *)arg1)->count +
				((exprType *)arg2)->count + 1;
		Case DOT_EXPR:
			result->count = 1;
		Case NESTED_EXPR:
			result = (exprType *) arg1;
			result->count += 2;
		Case RARRAY_EXPR:
			result->count = strlen(((symbolType *)arg1)->name) +
				1;
		Case ARRAY_EXPR:
			result->count = strlen(((symbolType *)arg1)->name) +
				((exprType *)arg2)->count + 2;
		Case NAME_EXPR:
			result->count = strlen(((symbolType *)arg1)->name);
		Case PARAM_EXPR:
			result->count = ((numberType *)arg1)->count + 1;
		Case NUMBER_EXPR:
			result->count = ((numberType *)arg1)->count;
		Case STRING_EXPR:
			result->count = strlen(arg1) + 2;
	}
	return(result);
}

  valueType *
copyValue(value)
  valueType	*value;
{
	valueType	*result;

	result = typeAlloc(valueType);
	result->valueUnion.intValue = value->valueUnion.intValue;
	result->dataType = value->dataType;
	return(result);
}

  valueType *
paramLookup(paramNumber)
  int		 paramNumber;
{
	valueListType	*chaser;
	valueType	*result;

	chaser = workingArgList;
	while (chaser != NULL && paramNumber-- > 1)
		chaser = chaser->next;
	if (chaser == NULL) {
		error("insufficient number of arguments");
		result = typeAlloc(valueType);
		result->valueUnion.intValue = 0;
		result->dataType = INT_VALUE;
		return(result);
	} else
		return(copyValue(chaser->value));
}

  valueType *
arrayLookup(arrayName, index)
  symbolType	*arrayName;
  int		 index;
{
	arrayType	*array;
	valueType	*result;
	productionType	*production;

	if (arrayName == NULL || (production = arrayName->binding) == NULL ||
			production->prodKind != ARRAY_PROD)
		error("symbol '%s' is not an array\n", arrayName->name);
	else {
		array = production->productionUnion.array;
		if (0 <= index && index < array->card)
			return(copyValue(array->values[index]));
		else
			error("index %d is out of bounds for array '%s'\n",
				index, arrayName->name);
	}
	result = typeAlloc(valueType);
	result->valueUnion.intValue = 0;
	result->dataType = INT_VALUE;
	return(result);
}

  valueType *
randomArrayLookup(arrayName)
  symbolType	*arrayName;
{
	arrayType	*array;
	valueType	*result;
	productionType	*production;
	int		 index;

	if (arrayName == NULL || (production = arrayName->binding) == NULL ||
			production->prodKind != ARRAY_PROD) {
		error("symbol '%s' is not an array\n", arrayName->name);
		result = typeAlloc(valueType);
		result->valueUnion.intValue = 0;
		result->dataType = INT_VALUE;
		return(result);
	} else {
		array = production->productionUnion.array;
		return(copyValue(array->values[randomNumber(array->card)]));
	}
}

  valueType *
nameLookup(name)
  symbolType	*name;
{
	valueType	*result;
	productionType	*production;

	if (name == NULL || (production = name->binding) == NULL ||
			production->prodKind != NAME_PROD)
		error("symbol '%s' is not a value\n", name->name);
	else
		return(copyValue(production->productionUnion.value));
	result = typeAlloc(valueType);
	result->valueUnion.intValue = 0;
	result->dataType = INT_VALUE;
	return(result);
}

  valueType *
evaluateExpr(expr)
  exprType	*expr;
{
	valueType	*result;
	int		 arg1, arg2;

	result = typeAlloc(valueType);
	result->dataType = INT_VALUE;
	switch (expr->kind) {
		Case ADD_EXPR:
			arg1 = intExpr(expr->arg1);
			arg2 = intExpr(expr->arg2);
			result->valueUnion.intValue = arg1 + arg2;
		Case SUB_EXPR:
			arg1 = intExpr(expr->arg1);
			arg2 = intExpr(expr->arg2);
			result->valueUnion.intValue = arg1 - arg2;
		Case MUL_EXPR:
			arg1 = intExpr(expr->arg1);
			arg2 = intExpr(expr->arg2);
			result->valueUnion.intValue = arg1 * arg2;
		Case DIV_EXPR:
			arg1 = intExpr(expr->arg1);
			arg2 = intExpr(expr->arg2);
			result->valueUnion.intValue = arg1 / arg2;
		Case DOT_EXPR:
			result->valueUnion.intValue = currentDotValue;
		Case NAME_EXPR:
			free(result);
			result = nameLookup(expr->arg1);
		Case ARRAY_EXPR:
			free(result);
			result = arrayLookup(expr->arg1, intExpr(expr->arg2));
		Case RARRAY_EXPR:
			free(result);
			result = randomArrayLookup(expr->arg1);
		Case PARAM_EXPR:
			free(result);
			result = paramLookup(((numberType *)(expr->arg1))->
				value);
		Case NUMBER_EXPR:
			result->dataType = INT_VALUE;
			result->valueUnion.intValue = ((numberType *)
				(expr->arg1))->value;
		Case STRING_EXPR:
			result->dataType = STRING_VALUE;
			result->valueUnion.stringValue = (char *)expr->arg1;
		Default:
			error("botch: bad expr type");
	}
	return(result);
}

  int
intExpr(expr)
  exprType	*expr;
{
	valueType	*value;
	int		 result;

	value = evaluateExpr(expr);
	if (value->dataType != INT_VALUE) {
		error("non-integer value!");
		result = 0;
	} else
		result = value->valueUnion.intValue;
	free(value);
	return(result);
}

  spanType *
buildSpan(count, kind)
  int		count;
  spanKind	kind;
{
	spanType	*result;

	result = typeAlloc(spanType);
	result->count = count;
	result->kind = kind;
	result->node = NULL;
	result->pathU = result->pathD = NULL;
	return(result);
}

  genericListHead *
buildSpanLine(ongoingList, newSpan)
  genericListHead	*ongoingList;
  spanType		*newSpan;
{
	return(buildGenericList(ongoingList, newSpan));
}

  genericListHead *
buildSpanList(ongoingList, newSpanLine)
  genericListHead	*ongoingList;
  genericListHead	*newSpanLine;
{
	return(buildGenericList(ongoingList, newSpanLine));
}

  genericListHead *
buildPreambleStatementList(ongoingList, newStatement)
  genericListHead	*ongoingList;
  genericListHead	*newStatement;
{
	return(buildGenericList(ongoingList, newStatement));
}

  pstatementType *
buildPreambleStatement(kind, arg)
  pstatementKind	kind;
  int			arg;
{
	pstatementType	*result;

	result = typeAlloc(pstatementType);
	result->kind = kind;
	result->arg1 = arg;
	return(result);
}

  parseNodeType *
buildParseNode(primNode, argList)
  primNodeType		*primNode;
  genericListHead	*argList;
{
	parseNodeType	*result;

	result = typeAlloc(parseNodeType);
	result->primNode = primNode;
	result->count = primNode->count;
	if (argList != NULL) {
		result->argList = (exprListType *)argList->first;
		result->count += result->argList->count + 2;
	} else
		result->argList = NULL;
	return(result);
}

  primNodeType *
buildPrimNode(primNode, newOp)
  primNodeType	*primNode;
  opKind	 newOp;
{
	primNodeType	*result;

	result = typeAlloc(primNodeType);
	result->primNodeUnion.primNode = primNode;
	result->op = newOp;
	if (newOp == IDENTITY_OP)
		result->count = strlen(((symbolType *)primNode)->name);
	else
		result->count = primNode->count + 1;
	return(result);
}

  productionType *
buildProduction(newProduction, newProdKind)
  setType		*newProduction;
  prodKind		 newProdKind;
{
	productionType	*result;

	result = typeAlloc(productionType);
	result->productionUnion.set = newProduction;
	result->prodKind = newProdKind;
	return(result);
}

  symbolType *
evaluatePrimNode(primNode, rotationPtr, selectionPtr)
  primNodeType	*primNode;
  int		*rotationPtr;
  selectionKind	*selectionPtr;
{
	symbolType	*result;

	if (primNode == NULL) {
		*rotationPtr = 0;
		*selectionPtr = USE_SEL;
		return(NULL);
	}
	if (primNode->op != IDENTITY_OP)
		result = evaluatePrimNode(primNode->primNodeUnion.
			primNode, rotationPtr, selectionPtr);
	switch (primNode->op) {
		Case INVERT_OP:
			*rotationPtr = (*rotationPtr + 2) % E;
		Case CCW_OP:
			*rotationPtr = (*rotationPtr + 3) % E;
		Case CW_OP:
			*rotationPtr = (*rotationPtr + 1) % E;
		Case RANDOM_OP:
			if (*selectionPtr != USE_SEL)
				error("multiple selection operators\n");
			*selectionPtr = RANDOM_SEL;
		Case PERIOD_OP:
			if (*selectionPtr != USE_SEL)
				error("multiple selection operators\n");
			*selectionPtr = PERIOD_SEL;
		Case IDENTITY_OP:
			*rotationPtr = 0;
			*selectionPtr = USE_SEL;
			result = primNode->primNodeUnion.identifier;
		Default:
			error("BOTCH: bad opKind in evaluatePrimNode\n");
			result = NULL;
	}
	return(result);
}

  nodeType *
buildNode(parseNode, ordinal)
  parseNodeType	*parseNode;
  int		 ordinal;
{
	nodeType	*result;
	int		 i;
	primNodeType	*primNode;

	result = typeAlloc(nodeType);
	if (parseNode != NULL) {
		primNode = parseNode->primNode;
		result->argList = parseNode->argList;
	} else {
		primNode = NULL;
		result->argList = NULL;
	}
	result->ordinal = ordinal;
	result->next = NULL;
	for (i=0; i<E; ++i) {
		result->out[i] = NULL;
		result->inCount[i] = 0;
	}
	result->symbol = evaluatePrimNode(primNode, &(result->rotation),
		&(result->selection));
	if (result->symbol == NULL)
		result->selection = ENTRY_SEL;
	return(result);
}

  pathType *
buildPath(fromNode, fromDir, toNode, toDir)
  nodeType	*fromNode;
  int		 fromDir;
  nodeType	*toNode;
  int		 toDir;
{
	pathType	*result;

	result = typeAlloc(pathType);
	result->next = NULL;
	result->fromNode = fromNode;
	result->fromDir = fromDir;
	result->toNode = toNode;
	result->toDir = toDir;
	result->ord = 0;
	return(result);
}

  instanceType *
buildInstance()
{
	instanceType	*result;
	int		 i;

	result = typeAlloc(instanceType);
	result->next = NULL;
	for (i=0; i<E; ++i)
		result->out[i] = NULL;
	result->ordinal = 0;
	result->argList = NULL;
	return(result);
}

  valueListType *
evaluateArgList(exprList, previousArgList)
  exprListType	*exprList;
  valueListType *previousArgList;
{
	valueListType	*result;
	valueListType	*previousValueList;
	valueListType	*newValueList;

	result = NULL;
	workingArgList = previousArgList;
	while (exprList != NULL) {
		newValueList = typeAlloc(valueListType);
		newValueList->next = NULL;
		newValueList->value = evaluateExpr(exprList->expr);
		if (result == NULL)
			result = newValueList;
		else
			previousValueList->next = newValueList;
		previousValueList = newValueList;
		exprList = exprList->next;
	}
	return(result);
}

  void
freeArgList(argList)
  valueListType *argList;
{
	valueListType	*chaser;

	while (argList != NULL) {
		chaser = argList->next;
		free(argList->value);
		free(argList);
		argList = chaser;
	}
}
