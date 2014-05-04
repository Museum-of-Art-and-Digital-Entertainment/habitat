#include "y.tab.h"
#include "griddleDefs.h"

  value *
integerize(val)
  value *val;
{
	char	*string;
	int	 i;
	value	*buildNumber();

	if (val == NULL) {
		val = buildNumber(0);
	} else if (val->dataType == VAL_UNDEFINED) {
		val->value = 0;
		val->dataType = VAL_INTEGER;
	} else if (val->dataType == VAL_STRING) {
		string = (char *)val->value;
		val->value = 0;
		for (i=0; i < 4 && string[i] != '\0'; ++i)
			val->value = val->value * 256 + string[i];
		val->dataType = VAL_INTEGER;
	} else if (val->dataType == VAL_BITSTRING) {
		/* do something */
		val->value = 0;
		val->dataType = VAL_INTEGER;
	}
	return(val);
}

  boolean
isInteger(val)
  value	*val;
{
	return(val != NULL && 
	       (val->dataType == VAL_INTEGER || val->dataType == VAL_AVATAR ||
	        val->dataType == VAL_OBJECT || val->dataType == VAL_REGION));
}

  boolean
isString(val)
  value *val;
{
	return(val->dataType == VAL_STRING);
}

  value *
evaluate(expr)
  expression	*expr;
{
	value	*result;
	value	*evaluateName();
	value	*evaluateUnop();
	value	*evaluateBin();
	value	*buildNumber();
	value	*buildString();
	value	*buildBitString();

	switch (expr->type) {
	Case ID_EXPR:
		result = evaluateName(expr->part1);
	Case NUM_EXPR:
		result = buildNumber((int) expr->part1);
	Case EXPR_EXPR:
		result = evaluate(expr->part1);
	Case UNOP_EXPR:
		result = evaluateUnop(expr->part1, evaluate(expr->part2));
	Case BIN_EXPR:
		result = evaluateBin(evaluate(expr->part1), expr->part2,
			evaluate(expr->part3));
	Case STRING_EXPR:
		result = buildString((char *) expr->part1);
	Case BITSTRING_EXPR:
		result = buildBitString((byte *) expr->part1);
	Default:
		printf("bad expr type leaked thru!\n");
		exit(1);
	}
	free(expr);
	return(result);
}

  void
freeExpr(expr)
  expression	*expr;
{
	switch (expr->type) {
		Case EXPR_EXPR:
			freeExpr(expr->part1);
		Case UNOP_EXPR:
			freeExpr(expr->part2);
		Case BIN_EXPR:
			freeExpr(expr->part1);
			freeExpr(expr->part3);
		Case STRING_EXPR:
			free(expr->part1);
		Case BITSTRING_EXPR:
			free(expr->part1);
	}
	free(expr);
}

  value *
evaluateUnop(oper, opnd)
  int	 oper;
  value	*opnd;
{
	opnd = integerize(opnd);
	switch(oper) {
		Case NOT:
			opnd->value = ~opnd->value;

		Case UMINUS:
			opnd->value = -opnd->value;

		Case A:
			if (opnd->dataType == VAL_OBJECT ||
					opnd->dataType == VAL_REGION)
				error("incompatible type coercion\n");
			opnd->dataType = VAL_AVATAR;

		Case O:
			if (opnd->dataType == VAL_AVATAR ||
					opnd->dataType == VAL_REGION)
				error("incompatible type coercion\n");
			opnd->dataType = VAL_OBJECT;

		Case R:
			if (opnd->dataType == VAL_OBJECT ||
					opnd->dataType == VAL_AVATAR)
				error("incompatible type coercion\n");
			opnd->dataType = VAL_REGION;

		Default:
			printf("bad unop leaked thru!\n");
			exit(1);
	}
	return(opnd);
}

  value *
evaluateBin(opnd1, oper, opnd2)
  value	*opnd1;
  int	 oper;
  value	*opnd2;
{
	opnd1 = integerize(opnd1);
	opnd2 = integerize(opnd2);
	switch(oper) {
		case ADD:
			opnd1->value += opnd2->value;
			break;
		case SUB:
			opnd1->value -= opnd2->value;
			break;
		case MUL:
			opnd1->value *= opnd2->value;
			break;
		case DIV:
			opnd1->value /= opnd2->value;
			break;
		case MOD:
			opnd1->value %= opnd2->value;
			break;
		case AND:
			opnd1->value &= opnd2->value;
			break;
		case OR:
			opnd1->value |= opnd2->value;
			break;
		case XOR:
			opnd1->value ^= opnd2->value;
			break;
		default:
			printf("bad binop leaked thru!\n");
			exit(1);
	}
	if (opnd1->dataType != opnd2->dataType) {
		if (opnd1->dataType == VAL_INTEGER)
			opnd1->dataType = opnd2->dataType;
		else if (opnd2->dataType != VAL_INTEGER)
			error("incompatible type combination");
	}
	free(opnd2);
	return(opnd1);
}

#ifdef FRED
  value *
valueFromName(name)
  char	*name;
{
	int	 len;
	int	 i;
	int	 result;
	value	*buildValue();

	if ((len = strlen(name)) < 3 || name[1] != '_')
		return(NULL);
	result = 0;
	for (i=2; i<len; ++i)
		if ('0' <= name[i] && name[i] <= '9')
			result = result * 10 + name[i] - '0';
		else
			return(NULL);
	if (name[0] == 'r')
		return(buildValue(VAL_REGION, result));
	else if (name[0] == 'o')
		return(buildValue(VAL_OBJECT, result));
	else if (name[0] == 'a')
		return(buildValue(VAL_AVATAR, result));
	else
		return(NULL);
}
#endif

  value *
evaluateName(name)
  symbol	*name;
{
	value	*buildNumber();
	value	*buildValue();
	value	*result;

	switch(name->type) {
		case VARIABLE_SYM:
			return(buildValue(name->def.value->dataType,
				name->def.value->value));
		case MACRO_SYM:
			return(evaluate(name->def.expr));
		case OBJECT_SYM:
			result = buildNumber(name->def.object->id);
			if (name->def.object->class == 0)
				result->dataType = VAL_REGION;
			else if (name->def.object->class == 1)
				result->dataType = VAL_AVATAR;
			else
				result->dataType = VAL_OBJECT;
			return(result);
		case NON_SYM:
#ifdef FRED
			if ((result = valueFromName(name->name)) != NULL)
				return(result);
#endif
			printf("symbol %s undefined\n", name->name);
			return(buildNumber(0));
			
		default:
			printf("bad symbol type leaked thru!\n");
			exit(1);
	}
}
