#include "griddleDefs.h"

#define MAXLINE 500

  char *
scan_number(args, resultptr)
  char	*args;
  int	*resultptr;
{
	*resultptr = 0;
	while ('0' <= *args && *args <= '9')
		*resultptr = *resultptr * 10 + *args++ - '0';
	return(args);
}

  char *
scan_connections(args, multiOK, resultptr, multiptr, countptr)
  char		*args;
  boolean	 multiOK;
  int		*resultptr;
  int	       **multiptr;
  int		*countptr;
{
	int	multiArray[20];
	int	multiCount;
	int	dummy;
	int	i;

	if (*args == '(') {
		*args = ' ';
		multiCount = 0;
		while (*args == ' ')
			args = scan_number(args+1, &multiArray[multiCount++]);
		*resultptr = multiArray[multiCount - 1];
		if (multiOK) {
			*multiptr = typeAllocMulti(int, multiCount);
			for (i=0; i<multiCount; ++i)
				(*multiptr)[i] = multiArray[i];
			*countptr = multiCount;
		}
		return(args + 1);
	} else {
		args = scan_number(args, resultptr);
		if (multiOK) {
			*multiptr = typeAlloc(int);
			(*multiptr)[0] = *resultptr;
			*countptr = 1;
		}
		return(args);
	}
}

  void
scanIndirectFilePass1()
{
	char	 line[MAXLINE];
	char	*argptr;
	char	*iptr;
	char	*index();
	char	*skipArg();
	boolean  stringFlag;
	int	 rot;

	indirRegion = 0;
	indirectPass = 1;
	while (fgets(line, MAXLINE, indirFile) != NULL) {
		iptr = indirName;
		argptr = line;
		while (*argptr != ' ')
			*iptr++ = *argptr++;
		*iptr = '\0';

		argptr += 3;
		argptr = scan_number(argptr, &rot);
		indirTable[indirRegion].rot = rot;
		argptr = scan_connections(argptr + 3, rot == 0,
			&indirTable[indirRegion].west,
			&indirTable[indirRegion].multi,
			&indirTable[indirRegion].multiCount);
		argptr = scan_connections(argptr + 3, rot == 1,
			&indirTable[indirRegion].north,
			&indirTable[indirRegion].multi,
			&indirTable[indirRegion].multiCount);
		argptr = scan_connections(argptr + 3, rot == 2,
			&indirTable[indirRegion].east,
			&indirTable[indirRegion].multi,
			&indirTable[indirRegion].multiCount);
		argptr = scan_connections(argptr + 3, rot == 3,
			&indirTable[indirRegion].south,
			&indirTable[indirRegion].multi,
			&indirTable[indirRegion].multiCount);
		argptr = index(argptr, '/') + 1;
		indirArgc = 0;
		while (argptr != NULL && *argptr != '\0' && *argptr != '\n') {
			while (*argptr == ' ')
				++argptr;
			if (stringFlag = (*argptr == '"'))
				++argptr;
			indirArgv[indirArgc++] = argptr;
			argptr = skipArg(argptr, stringFlag);
			if (argptr != NULL)
				*argptr++ = '\0';
		}
		queueInputFile(strcat(indirName, ".gri"));
		if (!openFirstFile(FALSE)) {
			error("can't continue from here!");
			exit(1);
		}
		globalIdAdjustment = globalIdCounter - 1001;
		yyparse();
		++indirRegion;
	}
}

  void
scanIndirectFilePass2()
{
	char	 line[MAXLINE];
	char	*argptr;
	char	*iptr;
	char	*index();
	char	*skipArg();
	boolean  stringFlag;
	int	 dummy;

	indirRegion = 0;
	indirectPass = 2;
	globalIdCounter = 1001;
	while (fgets(line, MAXLINE, indirFile) != NULL) {
		iptr = indirName;
		argptr = line;
		while (*argptr != ' ')
			*iptr++ = *argptr++;
		*iptr = '\0';

		argptr += 3;
		argptr = scan_number(argptr, &dummy);
		argptr = scan_connections(argptr, FALSE, &dummy, NULL,&dummy);
		argptr = scan_connections(argptr, FALSE, &dummy, NULL,&dummy);
		argptr = scan_connections(argptr, FALSE, &dummy, NULL,&dummy);
		argptr = scan_connections(argptr, FALSE, &dummy, NULL,&dummy);
		argptr = index(argptr, '/') + 1;
		indirArgc = 0;
		while (argptr != NULL && *argptr != '\0' && *argptr != '\n') {
			while (*argptr == ' ')
				++argptr;
			if (stringFlag = (*argptr == '"'))
				++argptr;
			indirArgv[indirArgc++] = argptr;
			argptr = skipArg(argptr, stringFlag);
			if (argptr != NULL)
				*argptr++ = '\0';
				
		}
		queueInputFile(strcat(indirName, ".gri"));
		if (!openFirstFile(FALSE)) {
			error("can't continue from here!");
			exit(1);
		}
		globalIdAdjustment = globalIdCounter - 1001;
		yyparse();
		++indirRegion;
	}
}

  void
replaceIndirectArgs(obj, index)
  object	*obj;
  int		 index;
{
	int	 i;
	byte	*buf;
	int	 reg;

	reg = indirRegion - 1;
	buf = obj->stateVector;
	if (obj->class == CLASS_REGION) {
		fillLong(buf, WEST_OFFSET_REG,
			getIdent(indirTable[reg].west));
		fillLong(buf, NORTH_OFFSET_REG,
			getIdent(indirTable[reg].north));
		fillLong(buf, EAST_OFFSET_REG,
			 getIdent(indirTable[reg].east));
		fillLong(buf, SOUTH_OFFSET_REG,
			getIdent(indirTable[reg].south));
		fillWord(buf, ORIENT_OFFSET_REG, indirTable[reg].rot);
	} else if (obj->class == CLASS_DOOR || obj->class == CLASS_BUILDING) {
	    if (index <= indirTable[reg].multiCount) {
		fillLong(buf, CONNECTION_OFFSET_DOOR,
			getIdent(indirTable[reg].multi[index-1]));
		if (index == indirTable[reg].multiCount) {
			buf = altNoidArray[0]->stateVector;
			switch (indirTable[reg].rot) {
				Case 0: fillLong(buf, WEST_OFFSET_REG, -1);
				Case 1: fillLong(buf, NORTH_OFFSET_REG, -1);
				Case 2: fillLong(buf, EAST_OFFSET_REG, -1);
				Case 3: fillLong(buf, SOUTH_OFFSET_REG, -1);
			}
		}
	    } else
		fillLong(buf, CONNECTION_OFFSET_DOOR, -1);
	}
}

  int
getIdent(num)
  int	num;
{
	if (num == 0)
		return(-1);
	else
		return(indirTable[num - 1].region);
}

  char *
skipArg(line, stringFlag)
  char	  *line;
  boolean  stringFlag;
{
	char	*index();

	if (stringFlag) {
		while ((line = index(line+1, '"')) != NULL)
			if (*(line - 1) != '\\')
				return(line);
	} else for (; *line != ' ' && *line != '\n' && *line != '\0'; ++line)
		;
	return(line);
}

  void
replaceParams(line)
  char	*line;
{
	char	 scratchBuf[500];
	char	*outptr;
	char	*argptr;
	char	*inptr;
	int	 offset;
	enum { LEFT, CENTER, RIGHT, NONE } format;
	int	 width;
	int	 i;
	int	 len;

	outptr = scratchBuf;
	inptr = line;
	while (*inptr != '\0') {
		if (*inptr == '`') {
			offset = scanNumber(&inptr);
			if (*inptr == 'l' || *inptr == 'r' || *inptr == 'c') {
				format = (*inptr == 'l') ? LEFT :
					((*inptr == 'r') ? RIGHT : CENTER);
				width = scanNumber(&inptr) + 1;
			} else
				format = NONE;
			if (indirArgc < offset)
				error("parameter offset %d out of range\n",
					offset);
			else if (offset == -1)
				*outptr++ = '`';
			else {
				len = strlen(indirArgv[offset]);
				switch (format) {
				Case NONE:
					for (argptr=indirArgv[offset];
							*argptr != '\0'; )
						*outptr++ = *argptr++;
				Case LEFT:
					for (argptr=indirArgv[offset], i=0;
							*argptr != '\0' &&
							i < width; ++i)
						*outptr++ = *argptr++;
					for (; i < width; ++i)
						*outptr++ = ' ';

				Case RIGHT:
					argptr = indirArgv[offset];
					if (len < width)
						for (i=width-len; i > 0; --i)
							*outptr++ = ' ';
					else
						argptr += len - width;
					while (*argptr != '\0')
						*outptr++ = *argptr++;

				Case CENTER:
					argptr = indirArgv[offset];
					i = 0;
					if (len < width)
						for (; i < (width-len)/2; ++i)
							*outptr++ = ' ';
					else
						argptr += (len - width) / 2;
					for (; i<width && *argptr!='\0'; ++i)
						*outptr++ = *argptr++;
					for (; i<width; ++i)
						*outptr++ = ' ';
				}
			}
		} else {
			if (*inptr == '\\') {
				++inptr;
				if (*inptr != '`')
					*outptr++ = '\\';
			}
			*outptr++ = *inptr++;
		}
	}
	*outptr = '\0';
	strcpy(line, scratchBuf);
}

  int
scanNumber(lineptr)
  char	**lineptr;
{
	int	 result;
	char	*line;

	result = 0;
	line = *lineptr + 1;
	while ('0' <= *line && *line <= '9')
		result = result * 10 + *line++ - '0';
	*lineptr = line;
	return(result - 1);
}

  void
indirectGriddle()
{
	char	line[80];
	int	i;

	fgets(line, 80, indirFile);
	sscanf(line, "%d", &indirCount);
	indirTable = typeAllocMulti(indirectEntry, indirCount);
	scanIndirectFilePass1();

	rewind(indirFile);
	flushNoidArray();
	fgets(line, 80, indirFile);
	scanIndirectFilePass2();
	flushNoidArray();
}
