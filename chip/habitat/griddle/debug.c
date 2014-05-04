#include "griddleDefs.h"

  int
getByte(buf, offset)
  byte	*buf;
  int	 offset;
{
	return((char)buf[offset]);
}

  int
getWord(buf, offset)
  byte	*buf;
  int	 offset;
{
	return((short)( buf[offset    ] * 256 +
			buf[offset + 1]       ));
}

  int
getLong(buf, offset)
  byte	*buf;
  int	 offset;
{
	return( buf[offset    ] * 256 * 256 * 256 +
		buf[offset + 1] * 256 * 256       +
		buf[offset + 2] * 256		  +
		buf[offset + 3]                   );
}

  char
contCode(ctype)
  int	ctype;
{
	if (ctype == 0) return('r');
	else if (ctype == 1) return('a');
	else /* if (ctype == 2) */ return('o');
}

  void
dumpField(aField, buf)
  field	*aField;
  byte	*buf;
{
	char	str[512];

	if (fieldString(aField, buf, str))
		fprintf(griFile, "  %s\n", str);
}

  boolean
fieldString(aField, buf, str)
  field	*aField;
  byte	*buf;
  char	*str;
{
	int	 i;
	int	 offset, bitOffset;
	int	 val;
	char	*escape();
	char	 temp[80];

	if (aField->invisible) {
		*str = '\0';
		return(FALSE);
	}
	sprintf(str, "%s: ", aField->name->name);
	offset = aField->offset & 0x3FFF;
	bitOffset = aField->offset >> 14;
	for (i=0; i<aField->dimension; ++i) {
		switch (aField->type) {
		Case FIELD_ENTITY:
			sprintf(temp, "%c %d",
				contCode(getWord(buf, offset + 6*i + 4)),
				getLong(buf, offset + 6*i));

		Case FIELD_BIN31:
			val = getLong(buf, offset + 4*i);
			sprintf(temp, "%d", val);

		Case FIELD_AVAID:
			val = getLong(buf, offset + 4*i);
			sprintf(temp, "a %d", val);

		Case FIELD_OBJID:
			val = getLong(buf, offset + 4*i);
			sprintf(temp, "o %d", val);

		Case FIELD_REGID:
			val = getLong(buf, offset + 4*i);
			sprintf(temp, "r %d", val);

		Case FIELD_FATWORD:
			val = getWord(buf, offset + 4*i) +
			      getWord(buf, offset + 4*i + 2) * 256;
			sprintf(temp, "%d", val);

		Case FIELD_BIN15:
			val = getWord(buf, offset + 2*i);
			sprintf(temp, "%d", val);

		Case FIELD_WORDS:
			val = getWord(buf, offset + 2*i);
			sprintf(temp, "%s%s%s",
				(i == 0) ? "\"" : "",
				escape(val),
				(i == aField->dimension-1) ? "\"" : ""
			);

		Case FIELD_BYTE:
			val = getByte(buf, offset);
			sprintf(temp, "%d", val);

		Case FIELD_VARSTRING:
			val = getWord(buf, offset);
			strcpy(temp, "\"");
			strncat(temp, buf + offset + 2, val);
			strcat(temp, "\"");
			i = aField->dimension - 1;

		Case FIELD_CHARACTER:
			val = getByte(buf, offset + i);
			sprintf(temp, "%s%s%s",
				(i == 0) ? "\"" : "",
				escape(val),
				(i == aField->dimension-1) ? "\"" : ""
			);

		Case FIELD_BIT:
			val = getByte(buf, offset + ((i+bitOffset)>>3));
			val &= 1 << (7 - ((i+bitOffset)&7));
			sprintf(temp, "%s%c%s",
				(i == 0)                   ? "'"  : "" ,
				(val)                      ? '1'  : '0',
				(i == aField->dimension-1) ? "'b" : ""
			);
		}
		strcat(str, temp);
		if (aField->type != FIELD_WORDS && aField->type !=
			       FIELD_BIT && aField->type != FIELD_CHARACTER &&
			       i != aField->dimension-1)
			strcat(str, ", ");
	}
	return(TRUE);
}

  void
dumpObject(obj)
  object	*obj;
{
	fieldList	*fields;

	if (obj == NULL)
		return;
	fprintf(griFile, "use %s {\n", classDefs[obj->class+1]->className->
		name);
	if (obj->class > 1) {
		fields = classDefs[0]->fields;
		while (fields != NULL) {
			dumpField(fields->field, obj->stateVector);
			fields = fields->nextField;
		}
	}
	fields = classDefs[obj->class+1]->fields;
	while (fields != NULL) {
		dumpField(fields->field, obj->stateVector);
		fields = fields->nextField;
	}
	fprintf(griFile, "}\n");
}
