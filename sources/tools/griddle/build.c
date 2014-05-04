#include "griddleDefs.h"

value *evaluate();

  genericListHead *
buildGenericList(list, new)
  genericListHead	*list;
  int			*new;
{
	genericListHead	*result;
	genericList	*newList;

	if (list == NULL) {
		result = typeAlloc(genericListHead);
		result->thing = new;
		result->next = NULL;
		result->last = (genericList *)result;
	} else {
		newList = typeAlloc(genericList);
		newList->thing = new;
		newList->next = NULL;
		list->last->next = newList;
		list->last = newList;
		result = list;
	}
	return(result);
}

  fieldList *
buildFieldList(list, new)
  fieldList	*list;
  field		*new;
{
	return((fieldList *)buildGenericList(list, new));
}

  valueList *
buildValueList(list, new)
  valueList	*list;
  value		*new;
{
	return((valueList *)buildGenericList(list, new));
}

  objectList *
buildObjectList(list, new)
  objectList	*list;
  object	*new;
{
	return((objectList *)buildGenericList(list, new));
}

  exprList *
buildExprList(list, new)
  exprList	*list;
  expression	*new;
{
	return((exprList *)buildGenericList(list, new));
}

  propertyList *
buildPropertyList(list, new)
  propertyList		*list;
  property		*new;
{
	return((propertyList *)buildGenericList(list, new));
}

  stringList *
buildStringList(list, new)
  stringList	*list;
  char		*new;
{
	return((stringList *)buildGenericList(list, new));
}

  expression *
buildExpr(type, arg1, arg2, arg3)
  exprType	type;
  int		arg1;
  int		arg2;
  int		arg3;
{
	expression	*result;

	result = typeAlloc(expression);
	result->type = type;
	result->part1 = arg1;
	result->part2 = arg2;
	result->part3 = arg3;
	return(result);	
}

  property *
buildProperty(fieldName, data)
  symbol	*fieldName;
  exprList	*data;
{
	property	*result;

	result = typeAlloc(property);
	result->fieldName = fieldName;
	result->data = data;
	return(result);
}

  value *
buildValue(vtype, val)
  valueType	vtype;
  int		val;
{
	value	*result;

	result = typeAlloc(value);
	result->value = val;
	result->dataType = vtype;
	return(result);
}

  value *
buildNumber(val)
  int		val;
{
	return(buildValue(VAL_INTEGER, val));
}

  value *
buildString(val)
  char		*val;
{
	return(buildValue(VAL_STRING, (int)val));
}

  value *
buildBitString(val)
  byte		*val;
{
	return(buildValue(VAL_BITSTRING, (int)val));
}

  field *
buildField(name, dimension, type, initList)
  symbol	*name;
  expression	*dimension;
  fieldType	 type;
  exprList	*initList;
{
	field	*result;
	value	*val;

	result = typeAlloc(field);
	result->name = name;
	result->type = type;
	result->offset = 0;
	result->invisible = FALSE;
	val = evaluate(dimension);
	if (isInteger(val) && val->value > 0)
		result->dimension = val->value;
	else {
		error("illegal data type for field dimension\n");
		result->dimension = 1;
	}
	freeValue(val);
	result->initValues = initList;
	return(result);
}

  field *
invisifyField(aField)
  field	*aField;
{
	aField->invisible = TRUE;
	return(aField);
}

  objectTail *
buildObjectTail(idExpr, propList)
  expression	*idExpr;
  propertyList	*propList;
{
	objectTail	*result;

	result = typeAlloc(objectTail);
	result->idExpr = idExpr;
	result->properties = propList;
	return(result);
}

  objectStub *
buildObjectStub(obj)
  object *obj;
{
	objectStub *result;

	result = typeAlloc(objectStub);
	result->class = obj->class;
	result->id = getLong(obj->stateVector, 0);
	return(result);
}
