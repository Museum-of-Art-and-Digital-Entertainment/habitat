#include "griddleDefs.h"

  void
executeInclude(filename)
  char	*filename;
{
	fileList	*newFile;

	if (announceIncludes) {
		fprintf(stderr, "->%s\n", filename);
		fflush(stderr);
	}
	newFile = typeAlloc(fileList);
	newFile->next = inputStack;
	newFile->saveName = currentFileName;
	newFile->saveLine = currentLineNumber;
	newFile->fyle = currentInput;
	inputStack = newFile;
	if ((currentInput = fopen(filename, "r")) == NULL) {
		error("unable to open include file '%s'\n", filename);
		exit(1);
	}
	currentFileName = filename;
	currentLineNumber = 1;
	free(filename);
}

  void
executeAssignment(name, expr)
  symbol	*name;
  expression	*expr;
{
	value	*evaluate();

	if (name->type != NON_SYM && name->type != VARIABLE_SYM) {
		error("illegal assignment to '%s'\n", name->name);
	} else {
		if (name->type == VARIABLE_SYM)
			freeValue(name->def.value);
		name->type = VARIABLE_SYM;
		name->def.value = evaluate(expr);
	}
}

  void
fillByte(buf, offset, value)
  byte	*buf;
  int	 offset;
  int	 value;
{
	buf[offset] = value & 0xFF;
}

  void
fillWord(buf, offset, value)
  byte	*buf;
  int	 offset;
  int	 value;
{
	buf[offset    ] = (value >>  8) & 0xFF;
	buf[offset + 1] =  value        & 0xFF;
}

  void
fillLong(buf, offset, value)
  byte	*buf;
  int	 offset;
  long	 value;
{
	buf[offset    ] = (value >> 24) & 0xFF;
	buf[offset + 1] = (value >> 16) & 0xFF;
	buf[offset + 2] = (value >>  8) & 0xFF;
	buf[offset + 3] =  value        & 0xFF;
}

  value *
nextValue(dataptr)
  exprList	**dataptr;
{
	exprList	*data;
	value		*val;
	value		*buildNumber();

	if (dataptr == NULL || *dataptr == NULL)
		return(buildNumber(0));
	data = *dataptr;
	val = evaluate(data->expr);
	*dataptr = data->nextExpr;
	return(val);
}

  value *
nextIntValue(dataptr)
  exprList	**dataptr;
{
	value		*val;

	val = nextValue(dataptr);
	if (!isInteger(val))
		val = buildNumber(0);
	return(val);
}

  char *
nextStringValue(dataptr)
  exprList	**dataptr;
{
	value	*val;
	char	*result;

	if (dataptr == NULL || *dataptr == NULL)
		return(NULL);
	val = nextValue(dataptr);
	if (isString(val))
		result = (char *)(val->value);
	else
		result = NULL;
	freeValue(val);
	return(result);
}

  int
contNum(vtype)
  valueType	vtype;
{
	if (vtype == VAL_AVATAR) return (1);
	else if (vtype == VAL_OBJECT) return (2);
	else return (0);
}

  void
adjustValue(val)
  value	*val;
{
	if (indirFile != NULL && val->value < -1000)
		val->value -= globalIdAdjustment;
}

  void
fillField(buf, data, aField, nextInt, nextString, nextBit)
  byte		*buf;
  exprList	*data;
  field		*aField;
  value		*(*nextInt)();
  char		*(*nextString)();
  value		*(*nextBit)();
{
	int	 i, j;
	int	 offset, bitOffset;
	int	 len;
	value	*val;
	char	*string;
	byte	*bitString;
	int	 bitLength;
	int	 bufIndex;
	byte	 theBit;

	offset = aField->offset & 0x3FFF;
	if (indirFile != NULL && offset == IDENT_OFFSET)
		return;
	bitOffset = aField->offset >> 14;

	for (i=0; i<aField->dimension; ++i) {
		switch (aField->type) {
		Case FIELD_ENTITY:
			val = (*nextInt)(&data);
			adjustValue(val);
			fillLong(buf, offset + 6*i, val->value);
			fillWord(buf, offset + 6*i + 4, contNum(val->dataType));
			freeValue(val);

		Case FIELD_AVAID:
			val = (*nextInt)(&data);
			if (val->dataType != VAL_AVATAR && val->dataType !=
					VAL_INTEGER)
				error("illegal avatar id value\n");
			adjustValue(val);
			fillLong(buf, offset + 4*i, val->value);
			freeValue(val);

		Case FIELD_OBJID:
			val = (*nextInt)(&data);
			if (val->dataType != VAL_OBJECT && val->dataType !=
					VAL_INTEGER)
				error("illegal object id value\n");
			adjustValue(val);
			fillLong(buf, offset + 4*i, val->value);
			freeValue(val);

		Case FIELD_REGID:
			val = (*nextInt)(&data);
			if (val->dataType != VAL_REGION && val->dataType !=
					VAL_INTEGER)
				error("illegal region id value\n");
			adjustValue(val);
			fillLong(buf, offset + 4*i, val->value);
			freeValue(val);

		Case FIELD_BIN31:
			val = (*nextInt)(&data);
			fillLong(buf, offset + 4*i, val->value);
			freeValue(val);

		Case FIELD_FATWORD:
			val = (*nextInt)(&data);
			fillWord(buf, offset + 4*i, val->value & 0xFF);
			fillWord(buf, offset + 4*i + 2, (val->value >> 8) &
				0xFF);
			freeValue(val);

		Case FIELD_BIN15:
			val = (*nextInt)(&data);
			fillWord(buf, offset + 2*i, val->value);
			freeValue(val);

		Case FIELD_WORDS:
			string = (*nextString)(&data);
			if (string != NULL)
				for (; i<aField->dimension && string != NULL
						&& string[i] != '\0'; ++i)
				       fillWord(buf, offset + i*2, string[i]);
			for (; i<aField->dimension; ++i)
				fillWord(buf, offset + i*2, ' ');
			free(string);

		Case FIELD_BYTE:
			val = (*nextInt)(&data);
			fillByte(buf, offset + i, val->value);
			freeValue(val);

		Case FIELD_CHARACTER:
			string = (*nextString)(&data);
			if (string != NULL)
				for (; i<aField->dimension && string != NULL
						&& string[i] != '\0'; ++i)
					fillByte(buf, offset + i, string[i]);
			for (; i<aField->dimension; ++i)
				fillByte(buf, offset + i, ' ');
			freeValue(string);

		Case FIELD_VARSTRING:
			string = (*nextString)(&data);
			if (string != NULL) {
				len = strlen(string);
				fillWord(buf, offset, len);
				for (; i<aField->dimension && string != NULL
						&& string[i] != '\0'; ++i)
					fillByte(buf, offset+2+i, string[i]);
				free(string);
			} else
				fillWord(buf, offset, 0);
			i = aField->dimension;

		Case FIELD_BIT:
			val = (*nextBit)(&data);
			if (isInteger(val)) {
				bufIndex = offset + ((i+bitOffset)>>3);
				theBit = 1 << (7 - ((i+bitOffset)&7));
				if (val->value & 1)
					buf[bufIndex] |= theBit;
				else
					buf[bufIndex] &= ~theBit;
			} else if (val->dataType == VAL_BITSTRING) {
				bitString = (byte *)val->value;
				bitLength = *bitString++;
				for (j=0; j < bitLength && i+j <
					aField->dimension; ++j) {
				    bufIndex = offset + ((i+j+bitOffset)>>3);
				    theBit = 1 << (7 - ((i+j+bitOffset)&7));
				    if ((bitString[j>>3] >> (7-(j&7))) & 1)
					buf[bufIndex] |= theBit;
				    else
					buf[bufIndex] &= ~theBit;
				}
				for (i+=bitLength; i<aField->dimension; ++i) {
				    bufIndex = offset + ((i+bitOffset)>>3);
				    theBit = 1 << (7 - ((i+bitOffset)&7));
				    buf[bufIndex] &= ~theBit;
				}
			} else
				error("invalid data type for bit field\n");
			freeValue(val);
		}
	}
	if (data != NULL)
		error("too many initialization values\n");
}

  void
fillPrototype(buf, fields, class)
  byte		*buf;
  fieldList	*fields;
  int		 class;
{
	while (fields != NULL) {
		fillField(buf, fields->field->initValues, fields->field,
			nextIntValue, nextStringValue, nextValue);
		fields = fields->nextField;
	}
}

  void
fillProperty(buf, prop, fields, class)
  byte		*buf;
  property	*prop;
  fieldList	*fields;
  int		 class;
{
	while (fields != NULL) {
		if (fields->field->name == prop->fieldName) {
			fillField(buf, prop->data, fields->field,
				nextIntValue, nextStringValue, nextValue);
			return;
		} else {
			fields = fields->nextField;
		}
	}
	if (class > 1)
		fillProperty(buf, prop, classDefs[0]->fields, -1);
	else
		error("no match for field '%s'\n", prop->fieldName->name);
}

  void
fillData(buf, fields, properties, class)
  byte		*buf;
  fieldList	*fields;
  propertyList	*properties;
  int		 class;
{
	while (properties != NULL) {
		fillProperty(buf, properties->property, fields, class);
		properties = properties->nextProp;
	}
}

  object *
initObject(class, globalId)
  int	class;
  int	globalId;
{
	object		*result;
	objectList	*buildObjectList();
	int		 i;

	if (indirectPass == 1) {
		if (class == CLASS_REGION)
			indirTable[indirRegion].region = globalId;
		result = NULL;
	} else {
		result = typeAlloc(object);
		result->class = class;
		result->stateVector = byteAlloc(classDefs[class+1]->size);
		for (i=0; i<classDefs[class+1]->size; ++i)
		    result->stateVector[i] = classDefs[class+1]->prototype[i];
		if (class > 1)
		    fillLong(result->stateVector, 4, class);
		fillLong(result->stateVector, 0, globalId);
	}
	return(result);
}

  object *
generateObject(class, tail)
  int		 class;
  objectTail	*tail;
{
	value	*val;
	int	 globalId;
	object	*result;

	if (tail->idExpr == NULL || indirFile != NULL) {
		globalId = -globalIdCounter++;
	} else {
		val = evaluate(tail->idExpr);
		if (!isInteger(val) || val->value <= 0) {
			error("illegal global id number\n");
			return(NULL);
		}
		globalId = val->value;
		freeValue(val);
	}
	result = initObject(class, globalId);
	if (indirectPass != 1)
		fillData(result->stateVector, classDefs[class+1]->fields,
			tail->properties, class);
	return(result);
}

  void
outputRawObject(obj)
  object	*obj;
{
	int	i;

	if (obj == NULL)
		return;
	fprintf(rawFile, "/%d ", obj->class);
	for (i=0; i<classDefs[obj->class+1]->size; ++i) {
		if ((i & 31) == 31)
			fprintf(rawFile, "\\\n");
		fprintf(rawFile, "%02x", obj->stateVector[i]);
	}
	fprintf(rawFile, "\n");
}

  int
fieldCode(ftype)
  fieldType	ftype;
{
	if (ftype == FIELD_REGID)
		return(0);
	else if (ftype == FIELD_AVAID)
		return(1);
	else if (ftype == FIELD_OBJID)
		return(2);
	else
		return(-1);
}

  int
relativeId(id, contnum)
  int	id;
  int	contnum;
{
	char		 scratchName[15];
	symbol		*scratchSymbol;
	symbol		*lookupSymbol();

	sprintf(scratchName, "%c_%d", contCode(contnum), id);
	scratchSymbol = lookupSymbol(scratchName);
	if (scratchSymbol->type != VARIABLE_SYM) {
		if (id < -1000 || 0 < id) {
			error("undefined %c %d\n", contCode(contnum), id);
			return(0);
		} else
			return(id);
	} else
		return(scratchSymbol->def.value->value);
}

  void
shiftField(aField, buf, adjust)
  field	*aField;
  byte	*buf;
  int	 adjust;
{
	int	 i;
	int	 offset;
	int	 val;

	offset = aField->offset & 0x3FFF;
	for (i=0; i<aField->dimension; ++i) {
		if (aField->type == FIELD_ENTITY) {
			val = getLong(buf, offset + 6*i);
			if (val < -1000)
				fillLong(buf, offset + 6*i, val - adjust);
			else if (assignRelativeIds)
				fillLong(buf, offset + 6*i,
					relativeId(val, getWord(buf, offset +
					6*i + 4)));
		} else if (aField->type == FIELD_AVAID || aField->type ==
				FIELD_OBJID || aField->type == FIELD_REGID) {
			val = getLong(buf, offset + 4*i);
			if (val < -1000)
				fillLong(buf, offset + 4*i, val - adjust);
			else if (assignRelativeIds)
				fillLong(buf, offset + 4*i, relativeId(val,
					fieldCode(aField->type)));
		}
	}
}

  void
shiftRelativeGlobalIds(obj, adjust)
  object	*obj;
  int		 adjust;
{
	fieldList	*fields;

	if (obj->class > 1) {
		fields = classDefs[0]->fields;
		while (fields != NULL) {
			shiftField(fields->field, obj->stateVector, adjust);
			fields = fields->nextField;
		}
	}
	fields = classDefs[obj->class+1]->fields;
	while (fields != NULL) {
		shiftField(fields->field, obj->stateVector, adjust);
		fields = fields->nextField;
	}
}

  void
generateScratchId(class, id, relativeId)
  int	class;
  int	id;
  int	relativeId;
{
	char		 scratchName[15];
	symbol		*scratchSymbol;
	valueType	 vtype;
	value		*buildValue();
	symbol		*lookupSymbol();

	sprintf(scratchName, "%c_%d", contCode(class), id);
	scratchSymbol = lookupSymbol(scratchName);
	scratchSymbol->type = VARIABLE_SYM;
	if (class == 0)
		vtype = VAL_REGION;
	else if (class == 1)
		vtype = VAL_AVATAR;
	else
		vtype = VAL_OBJECT;
	scratchSymbol->def.value = buildValue(vtype, relativeId);
}

  void
executeRawline(obj)
  object	*obj;
{
	if (assignRelativeIds)
		generateScratchId(obj->class, getLong(obj->stateVector, 0),
			-1001 - objectCount);
	shiftRelativeGlobalIds(obj, objectCount - rawCount++);
	if (objectCount < MAXNOID)
		noidArray[objectCount++] = obj;
}

  void
freeObjectTail(tail)
  objectTail	*tail;
{
	propertyList	*properties;
	propertyList	*oldProperties;
	exprList	*expr;
	exprList	*oldExpr;

	properties = tail->properties;
	while (properties != NULL) {
		expr = properties->property->data;
		while (expr != NULL) {
			if (indirectPass == 1)
				freeExpr(expr->expr);
			oldExpr = expr;
			expr = expr->nextExpr;
			free(oldExpr);
		}
		free(properties->property);
		oldProperties = properties;
		properties = properties->nextProp;
		free(oldProperties);
	}
	free(tail);
}

  void
executeUse(className, tagName, tail)
  symbol	*className;
  symbol	*tagName;
  objectTail	*tail;
{
	object		*ultimate;
	objectStub	*buildObjectStub();

	if (className->type != CLASS_SYM)
		error("non-class identifier %s used for class name\n",
			className->name);
	else {
		ultimate = generateObject(className->def.class, tail);
		freeObjectTail(tail);
		if (ultimate != NULL && tagName != NULL) {
			if (ultimate->class == 0)
				globalIdAdjustment = 0;
			if (tagName->type == OBJECT_SYM)
				free(tagName->def.object);
			else if(tagName->type == VARIABLE_SYM)
				freeValue(tagName->def.value);
			tagName->type = OBJECT_SYM;
			tagName->def.object = buildObjectStub(ultimate);
		}
/*#ifndef FRED*/
		if (ultimate != NULL) {
			if (ultimate->class == CLASS_DOOR ||
					ultimate->class == CLASS_BUILDING)
				sortObjects = TRUE;
			else if (ultimate->class == CLASS_REGION)
				flushNoidArray();
			if (objectCount < MAXNOID && indirectPass != 1)
				noidArray[objectCount++] = ultimate;
			else if (indirectPass != 0)
				error("more than 256 objects in region\n");
		}
/*#endif*/
	}
}

cmpObjects(ob1, ob2)
  object **ob1;
  object **ob2;
{
	int class1, class2;

	class1 = (*ob1)->class;
	class2 = (*ob2)->class;
	if (class1 == CLASS_REGION)
		return(-1);
	else if (class2 == CLASS_REGION)
		return(1);
	else if (class1 != CLASS_DOOR && class1 != CLASS_BUILDING &&
			class2 != CLASS_DOOR && class2 != CLASS_BUILDING)
		return(0);
	else if (class1 != CLASS_DOOR && class1 != CLASS_BUILDING)
		return(1);
	else if (class2 != CLASS_DOOR && class2 != CLASS_BUILDING)
		return(-1);
	return(getLong((*ob1)->stateVector, X_OFFSET_OBJ) -
	       getLong((*ob2)->stateVector, X_OFFSET_OBJ));
}

flushNoidArray()
{
	int	i;

#ifndef FRED
	if (indirectPass == 2) {
		for (i=0; i<objectCount; ++i)
			altNoidArray[i] = noidArray[i];
		if (sortObjects)
			qsort(altNoidArray, objectCount, sizeof(object *),
				cmpObjects);
		for (i=0; i<objectCount; ++i)
			replaceIndirectArgs(altNoidArray[i], i);
	}
	sortObjects = FALSE;
#endif
	for (i=0; i<objectCount; ++i) {
#ifndef FRED
		if (griFile != NULL && indirectPass != 1)
			dumpObject(noidArray[i]);
		if (rawFile != NULL && indirectPass != 1)
			outputRawObject(noidArray[i]);
#endif
		freeObject(noidArray[i]);
	}
	objectCount = 0;
}

freeObject(obj)
  object	*obj;
{
	free(obj->stateVector);
	free(obj);
}

freeValue(val)
  value	*val;
{
	if (val != NULL) {
		if (val->dataType == VAL_STRING ||
				val->dataType == VAL_BITSTRING)
			free(val->value);
		free(val);
	}
}

  void
executeDefine(classExpr, name, fields)
  expression	*classExpr;
  char		*name;
  fieldList	*fields;
{
	value	*val;
	int	 class;
	symbol	*symb;
	symbol	*lookupSymbol();
	int	 size;

	val = evaluate(classExpr);
	class = val->value;
	if (!isInteger(val))
		error("non-integer value used for class number\n");
	else if (class < -1 || MAXCLASS <= class)
		error("class value %d out of range\n", class);
	else if (classDefs[class+1] != NULL)
		error("class %d already defined\n", class);
	else {
		translate(name, ' ', '_');
		symb = lookupSymbol(name);
		symb->type = CLASS_SYM;
		symb->def.class = class;
		classDefs[class+1] = typeAlloc(classDescriptor);
		size = computeFieldOffsets(fields, class);
		classDefs[class+1]->size = size;
		classDefs[class+1]->fields = fields;
		classDefs[class+1]->className = symb;
		classDefs[class+1]->prototype = (byte *)malloc(size);
		fillPrototype(classDefs[class+1]->prototype, fields, class);
	}
	freeValue(val);
	free(name);
}

  int
computeFieldOffsets(fields, class)
  fieldList	*fields;
  int		 class;
{
	int	 offset;
	int	 bitOffset;
	field	*aField;

	if (class > 1)
		offset = objectBase;
	else
		offset = 0;
	if (fields == NULL)
		return(offset);

	bitOffset = 0;
	while (fields != NULL) {
		aField = fields->field;
		aField->offset = offset + (bitOffset << 14);

		if (class == -1)
			objectBase = offset;

		switch (aField->type) {
		Case FIELD_ENTITY:
			offset += 6 * aField->dimension;

		Case FIELD_AVAID:
		case FIELD_BIN31:
		case FIELD_OBJID:
		case FIELD_REGID:
		case FIELD_FATWORD:
			offset += 4 * aField->dimension;

		Case FIELD_BIN15:
		case FIELD_WORDS:
			offset += 2 * aField->dimension;

		Case FIELD_BYTE:
		case FIELD_CHARACTER:
			offset += aField->dimension;

		Case FIELD_VARSTRING:
			offset += aField->dimension + 2;

		Case FIELD_BIT:
			bitOffset += aField->dimension;
			if (bitOffset > 15) {
				offset += 2 * (bitOffset >> 4);
				bitOffset -= (bitOffset & ~0xF);
			}
		}

		if (aField->type != FIELD_BIT && bitOffset > 0) {
			bitOffset = 0;
			offset += 2;
		} else if (aField->type != FIELD_CHARACTER &&
			   aField->type != FIELD_BYTE && (offset & 1) == 1)
			++offset;

		fields = fields->nextField;
	}
	if (bitOffset > 0)
		offset += 2;
	return(offset);
}
