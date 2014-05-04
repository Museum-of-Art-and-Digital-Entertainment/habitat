#include "griddleDefs.h"

#define CLASS_MAX	256
#define SIZE_OFFSET	12
int	 classSize[CLASS_MAX];

byte	cv[512];
int	cvLength;

static FILE	*cvFyle;
static object	*inNoid[MAXNOID];

  void
cvByte(n)
  byte	n;
{
	cv[cvLength++] = n;
}

  byte
readByte(fyle)
  FILE	*fyle;
{
	return((byte)getc(fyle));
}

  word
readWord(fyle)
  FILE	*fyle;
{
	byte	lo;
	byte	hi;

	lo = readByte(fyle);
	hi = readByte(fyle);
	return((hi << 8) + lo);
}

  void
readClassFile()
{
	int	 i;
	FILE	*classFyle;


	if ((classFyle = fopen(classFileName, "r")) == NULL)
		systemError("can't open class file '%s'\n", classFileName);
	for (i=0; i<CLASS_MAX; ++i)
		classSize[i] = readWord(classFyle);
	for (i=0; i<CLASS_MAX; ++i)
		if (classSize[i] == 0xFFFF)
			classSize[i] = 0;
		else {
			fseek(classFyle, classSize[i]+SIZE_OFFSET, 0);
			classSize[i] = (readByte(classFyle) & 0x7F) - 6;
		}
	fclose(classFyle);
}

  void
cvNoidClass()
{
	int	i;

	for (i=1; i<objectCount; ++i) {
		if (noidArray[i] != NULL) {
			cvByte(i);
			cvByte(noidArray[i]->class);
		}
	}
}

  void
cvProperties(class, buf)
  int	 class;
  byte	*buf;
{
	int	container;
	int	i;

	if (class == 0) {
		cvByte(0); /* style */
		cvByte(getWord(buf, LIGHTLEVEL_OFFSET_REG));
		cvByte(getWord(buf, DEPTH_OFFSET_REG));
		cvByte(getWord(buf, CLASSGROUP_OFFSET_REG));
		cvByte(0); /* who am I? */
		cvByte(0); /* bank balance */
		cvByte(0);
		cvByte(0);
		cvByte(0);
	} else if (class == 1) {
		container = getLong(buf, CONTAINER_OFFSET_AVA);
		if (container != 0 && (container < -1000-MAXNOID ||
				-1000 <= container)) {
			error("specified avatar container out of range\n");
			return;
		}
		cvByte(getByte(buf, STYLE_OFFSET_AVA));
		cvByte(getWord(buf, X_OFFSET_AVA));
		cvByte(getWord(buf, Y_OFFSET_AVA));
		cvByte(getWord(buf, ORIENT_OFFSET_AVA));
		cvByte(getWord(buf, GRSTATE_OFFSET_AVA));
		if (container == 0)
			cvByte(0);
		else
			cvByte(-container-1001);
		for (i=0; i<AVATAR_PROPERTY_COUNT; ++i)
			cvByte(getWord(buf, PROP_BASE_AVA + i*2));
	} else {
		container = getLong(buf, CONTAINER_OFFSET_OBJ);
		if (container != 0 && (container < -1000-MAXNOID ||
				-1000 <= container)) {
			error("specified object container out of range\n");
			return;
		}
		cvByte(getWord(buf, STYLE_OFFSET_OBJ));
		cvByte(getWord(buf, X_OFFSET_OBJ));
		cvByte(getWord(buf, Y_OFFSET_OBJ));
		cvByte(getWord(buf, ORIENT_OFFSET_OBJ));
		cvByte(getWord(buf, GRSTATE_OFFSET_OBJ));
		if (container == 0)
			cvByte(0);
		else
			cvByte(-container-1001);
		for (i=0; i<classSize[class]; ++i)
			cvByte(getWord(buf, objectBase + i*2));
	}
}

  void
cvProps()
{
	int	i;

	for (i=1; i<objectCount; ++i)
	    if (noidArray[i] != NULL)
		cvProperties(noidArray[i]->class, noidArray[i]->stateVector);
}

  boolean
generateContentsVector()
{
	int	i;

	cvLength = 0;
	if (noidArray[0] == NULL || noidArray[0]->class != 0) {
		error("first object is not a region\n");
		return(FALSE);
	} else for (i=1; i<objectCount; ++i) {
		if (noidArray[i] != NULL && noidArray[i]->class == 0) {
			error("more than one region given\n");
			return(FALSE);
		}
	}
/*	cvProperties(0, noidArray[0]->stateVector);*/
	cvNoidClass();
	cvByte(0);
	cvProps();
	cvByte(0);
	return(TRUE);
}

  void
outputContentsVector()
{
	if (generateContentsVector())
		fwrite(cv, 1, cvLength, cvFile);
}

  void
fillFromCvFile(obj)
  object	*obj;
{
	byte	*buf;
	int	 class;
	int	 container;
	int	 i;

	buf = obj->stateVector;
	class = obj->class;
	if (class == 0) {
		readByte(cvFyle); /* skip style */
		fillWord(buf, LIGHTLEVEL_OFFSET_REG, readByte(cvFyle));
		fillWord(buf, DEPTH_OFFSET_REG, readByte(cvFyle));
		fillWord(buf, CLASSGROUP_OFFSET_REG, readByte(cvFyle));
		readByte(cvFyle); /* skip who am i */
		for (i=0; i<4; ++i)
			readByte(cvFyle); /* skip bank balance */
	} else if (class == 1) {
		fillByte(buf, STYLE_OFFSET_AVA, readByte(cvFyle));
		fillWord(buf, X_OFFSET_AVA, readByte(cvFyle));
		fillWord(buf, Y_OFFSET_AVA, readByte(cvFyle));
		fillWord(buf, ORIENT_OFFSET_AVA, readByte(cvFyle));
		fillWord(buf, GRSTATE_OFFSET_AVA, readByte(cvFyle));
		container = getLong(inNoid[readByte(cvFyle)]->stateVector, 0);
		fillLong(buf, CONTAINER_OFFSET_AVA, container);
		for (i=0; i<AVATAR_PROPERTY_COUNT; ++i)
			fillWord(buf, PROP_BASE_AVA + i*2, readByte(cvFyle));
	} else {
		fillWord(buf, STYLE_OFFSET_OBJ, readByte(cvFyle));
		fillWord(buf, X_OFFSET_OBJ, readByte(cvFyle));
		fillWord(buf, Y_OFFSET_OBJ, readByte(cvFyle));
		fillWord(buf, ORIENT_OFFSET_OBJ, readByte(cvFyle));
		fillWord(buf, GRSTATE_OFFSET_OBJ, readByte(cvFyle));
		container = getLong(inNoid[readByte(cvFyle)]->stateVector, 0);
		fillLong(buf, CONTAINER_OFFSET_OBJ, container);
		for (i=0; i<classSize[class]; ++i)
			fillWord(buf, objectBase + i*2, readByte(cvFyle));
	}
}

  void
inputContentsVector(filename)
  char	*filename;
{
	int	 i;
	int	 noid;
	int	 class;
	int	 highNoid;
	int	 noidBase;
	byte	 noidMap[MAXNOID];
	object	*initObject();

	if ((cvFyle = fopen(filename, "r")) == NULL) {
		error("can't open contents vector input file '%s'\n",
			filename);
		return;
	}
	for (i=0; i<MAXNOID; ++i)
		inNoid[i] = NULL;
	noidMap[0] = 0;
	inNoid[0] = initObject(0, -globalIdCounter++);
	noidBase = 1;
	do {
		for (highNoid=noidBase; (noid = readByte(cvFyle)) != 0; ++highNoid) {
			class = readByte(cvFyle);
			noidMap[highNoid] = noid;
			inNoid[noid] = initObject(class, -globalIdCounter++);
		}
		for (i=noidBase; i<highNoid; ++i)
			fillFromCvFile(inNoid[noidMap[i]]);
		for (i=0; i<highNoid; ++i) {
			if (objectCount < MAXNOID)
				noidArray[objectCount++] = inNoid[noidMap[i]];
			if (griFile != NULL)
				dumpObject(inNoid[noidMap[i]]);
			if (rawFile != NULL)
				outputRawObject(inNoid[noidMap[i]]);
		}
		noidBase = 0;
	} while (readByte(cvFyle) != 0 && !feof(cvFyle));
	fclose(cvFyle);
}

  int
deCvNoidClass(offset)
  int	offset;
{
	int	i;

	for (; cv[offset] != 0; offset += 2)
		;
	return(offset + 1);
}

  int
deCvProperties(class, buf, offset)
  int	 class;
  byte	*buf;
  int	 offset;
{
	int	i;

	if (class == 0) {
		fillWord(buf, LIGHTLEVEL_OFFSET_REG, cv[offset + 1]);
		fillWord(buf, DEPTH_OFFSET_REG, cv[offset + 2]);
		fillWord(buf, CLASSGROUP_OFFSET_REG, cv[offset + 3]);
		return(9);
	} else if (class == 1) {
		fillByte(buf, STYLE_OFFSET_AVA, cv[offset + 0]);
		fillWord(buf, X_OFFSET_AVA, cv[offset + 1]);
		fillWord(buf, Y_OFFSET_AVA, cv[offset + 2]);
		fillWord(buf, ORIENT_OFFSET_AVA, cv[offset + 3]);
		fillWord(buf, GRSTATE_OFFSET_AVA, cv[offset + 4]);
		if (cv[offset + 5] == 0)
			fillLong(buf, CONTAINER_OFFSET_AVA, 0);
		else
			fillLong(buf, CONTAINER_OFFSET_AVA, -1001-cv[offset+5]);
		for (i=0; i<AVATAR_PROPERTY_COUNT; ++i)
			fillWord(buf, PROP_BASE_AVA + i*2, cv[offset + 6+i]);
		return(6 + AVATAR_PROPERTY_COUNT);
	} else {
		fillWord(buf, STYLE_OFFSET_OBJ, cv[offset + 0]);
		fillWord(buf, X_OFFSET_OBJ, cv[offset + 1]);
		fillWord(buf, Y_OFFSET_OBJ, cv[offset + 2]);
		fillWord(buf, ORIENT_OFFSET_OBJ, cv[offset + 3]);
		fillWord(buf, GRSTATE_OFFSET_OBJ, cv[offset + 4]);
		fillLong(buf, CONTAINER_OFFSET_OBJ, -1001-cv[offset + 5]);
		for (i=0; i<classSize[class]; ++i)
			fillWord(buf, objectBase + i*2, cv[offset + 6 + i]);
		return(6 + classSize[class]);
	}
}

  int
deCvProps(noidOffset, stateOffset)
  int	noidOffset;
  int	stateOffset;
{
	int	noid;

	while ((noid = cv[noidOffset]) != 0) {
		if (cv[noidOffset + 1] != noidArray[noid]->class) {
			error("class mismatch: cv says %d, we say %d\n",
				cv[noidOffset + 1], noidArray[noid]->class);
			return(0);
		}
		stateOffset += deCvProperties(noidArray[noid]->class,
			noidArray[noid]->stateVector, stateOffset);
		noidOffset += 2;
		noidAlive[noid] = TRUE;
	}
	if (cv[stateOffset] == 0)
		return(0);
	else
		return(stateOffset + 1);
}

  void
degenerateContentsVector()
{
	int	offset;
	int	noid;

	noidAlive[0] = TRUE;
	for (noid=1; noid<MAXNOID; ++noid)
		noidAlive[noid] = FALSE;
	offset = 0;
	while ((offset = deCvProps(offset, deCvNoidClass(offset))) != 0)
		;
	for (noid=1; noid<MAXNOID; ++noid)
		if (!noidAlive[noid] && noidArray[noid] != NULL) {
			freeObject(noidArray[noid]);
			noidArray[noid] = NULL;
		}
}
