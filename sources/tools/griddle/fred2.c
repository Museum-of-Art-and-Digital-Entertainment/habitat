#include <curses.h>
#include "griddleDefs.h"
#include <sys/types.h>
#include <sys/stat.h>

  void
mydown(buf, len, addr)
  byte	*buf;
  word	 len;
  word	 addr;
{
	if (!testMode)
		down(buf, len, addr);
}

  void
displayRegion()
{
	mydown(cv, (word)(cvLength), CV_DATA_SLOT);
	c64_override_command(CMD_LOAD_CV);
}

  boolean
incColorPattern(dp, cmd)
  int	dp;
  byte	cmd;
{
	byte	*buf;

	if (displayNoid == 0)
		lineError("region has no color/pattern!");
	else {
		buf = noidArray[displayNoid]->stateVector;
		if (isAvatar(displayNoid))
			fillWord(buf, ORIENT_OFFSET_AVA,
			       (getWord(buf, ORIENT_OFFSET_AVA) + dp) & 0xFF);
		else
			fillWord(buf, ORIENT_OFFSET_OBJ,
			       (getWord(buf, ORIENT_OFFSET_OBJ) + dp) & 0xFF);
		c64_key_command(cmd);
		displayOneObject(displayNoid);
	}
	return(TRUE);
}

  boolean
incPattern()
{
	return(incColorPattern(8, 'p'));
}

  boolean
decPattern()
{
	return(incColorPattern(-8, 'P'));
}

  boolean
incX(dx, cmd)
  int	dx;
  byte	cmd;
{
	byte	*buf;

	if (displayNoid == 0)
		lineError("region has no X-coordinate!");
	else {
		buf = noidArray[displayNoid]->stateVector;
		if (isAvatar(displayNoid))
			fillWord(buf, X_OFFSET_AVA,
				(getWord(buf, X_OFFSET_AVA) + dx) & 0xFF);
		else
			fillWord(buf, X_OFFSET_OBJ,
				(getWord(buf, X_OFFSET_OBJ) + dx) & 0xFF);
		c64_key_command(cmd);
		displayOneObject(displayNoid);
	}
	return(TRUE);
}

  boolean
incY(dy, cmd)
  int	dy;
  byte	cmd;
{
	byte	*buf;

	if (displayNoid == 0)
		lineError("region has no Y-coordinate!");
	else {
		buf = noidArray[displayNoid]->stateVector;
		if (isAvatar(displayNoid))
			fillWord(buf, Y_OFFSET_AVA,
				(getWord(buf, Y_OFFSET_AVA) + dy) & 0xFF);
		else
			fillWord(buf, Y_OFFSET_OBJ,
				(getWord(buf, Y_OFFSET_OBJ) + dy) & 0xFF);
		c64_key_command(cmd);
		displayOneObject(displayNoid);
	}
	return(TRUE);
}

  boolean
incX_4()
{
	return(incX(4, '.'));
}

  boolean
decX_4()
{
	return(incX(-4, ','));
}

  boolean
incY_1()
{
	return(incY(1, '?'));
}

  boolean
incY_10()
{
	return(incY(10, '>'));
}

  boolean
decY_1()
{
	return(incY(-1, '/'));
}

  boolean
decY_10()
{
	return(incY(-10, '<'));
}

  boolean
zeroGrState()
{
	byte	*buf;

	if (displayNoid == 0)
		lineError("region does not have grState!");
	else {
		buf = noidArray[displayNoid]->stateVector;
		if (isAvatar(displayNoid))
			fillWord(buf, GRSTATE_OFFSET_AVA, 0);
		else
			fillWord(buf, GRSTATE_OFFSET_OBJ, 0);
		c64_key_command('s');
		displayOneObject(displayNoid);
	}
	return(TRUE);
}

  boolean
incGrState()
{
	byte	*buf;

	if (displayNoid == 0)
		lineError("region does not have grState!");
	else {
		buf = noidArray[displayNoid]->stateVector;
		if (isAvatar(displayNoid))
			fillWord(buf, GRSTATE_OFFSET_AVA,
				getWord(buf, GRSTATE_OFFSET_AVA) + 1);
		else
			fillWord(buf, GRSTATE_OFFSET_OBJ,
				getWord(buf, GRSTATE_OFFSET_OBJ) + 1);
		c64_key_command('S');
		displayOneObject(displayNoid);
	}
	return(TRUE);
}

  boolean
toggleOrient()
{
	byte	*buf;

	if (displayNoid == 0)
		lineError("region does not have displayed orientation!");
	else {
		buf = noidArray[displayNoid]->stateVector;
		if (isAvatar(displayNoid))
			fillWord(buf, ORIENT_OFFSET_AVA,
				getWord(buf, ORIENT_OFFSET_AVA) ^ 0x01);
		else
			fillWord(buf, ORIENT_OFFSET_OBJ,
				getWord(buf, ORIENT_OFFSET_OBJ) ^ 0x01);
		c64_key_command('o');
		displayOneObject(displayNoid);
	}
	return(TRUE);
}

  boolean
borderToggle()
{
	byte	*buf;

	if (noidArray[displayNoid]->class != CLASS_TRAP &&
			noidArray[displayNoid]->class != CLASS_SUPER_TRAP)
		lineError("current object is not a trapezoid!");
	else {
		buf = noidArray[displayNoid]->stateVector;
		fillWord(buf, HEIGHT_OFFSET_TRAP,
				getWord(buf, HEIGHT_OFFSET_TRAP) ^ 0x80);
		c64_key_command('B');
		displayOneObject(displayNoid);
	}
	return(TRUE);
}

  boolean
flatChange()
{
	byte	*buf;
	int	 class;

	class = noidArray[displayNoid]->class;
	if (class != CLASS_FLAT && class != CLASS_TRAP && class !=
			CLASS_SUPER_TRAP)
		lineError("inappropriate object for flat type change!");
	else {
		buf = noidArray[displayNoid]->stateVector;
		fillWord(buf, TYPE_OFFSET_FLAT,
			(getWord(buf, TYPE_OFFSET_FLAT) + 1) & 3);
		c64_key_command('m');
		displayOneObject(displayNoid);
	}
	return(TRUE);
}

  boolean
foreground()
{
	byte	*buf;

	if (displayNoid == 0)
		lineError("region does not have foreground/background!");
	else {
		buf = noidArray[displayNoid]->stateVector;
		if (isAvatar(displayNoid))
			fillWord(buf, Y_OFFSET_AVA,
				getWord(buf, Y_OFFSET_AVA) | 0x80);
		else
			fillWord(buf, Y_OFFSET_OBJ,
				getWord(buf, Y_OFFSET_OBJ) | 0x80);
		c64_key_command('f');
		displayOneObject(displayNoid);
	}
	return(TRUE);
}

  boolean
background()
{
	byte	*buf;

	if (displayNoid == 0)
		lineError("region does not have foreground/background!");
	else {
		buf = noidArray[displayNoid]->stateVector;
		if (isAvatar(displayNoid))
			fillWord(buf, Y_OFFSET_AVA,
				getWord(buf, Y_OFFSET_AVA) & 0x7F);
		else
			fillWord(buf, Y_OFFSET_OBJ,
				getWord(buf, Y_OFFSET_OBJ) & 0x7F);
		c64_key_command('b');
		displayOneObject(displayNoid);
	}
	return(TRUE);
}

  void
uploadRegion()
{
	generateContentsVector();
	displayRegion();
}

  void
homogenize(filename)
  char	*filename;
{
	char	 tempstr[80];
	char	*tildeptr;
	char	*index();

	if ((tildeptr = index(filename, '~')) != NULL) {
		strncpy(tempstr, filename, tildeptr - filename);
		sprintf(tempstr + (tildeptr - filename), "%s%s",
			getenv("HOME"), tildeptr + 1);
		strcpy(filename, tempstr);
	}
}

  boolean
readRegion()
{
	char  regionFileName[80];

	sprintf(regionFileName, "%s%s", pathname, regionName);
	homogenize(regionFileName);
	queueInputFile(saveString(regionFileName));
	if (openFirstFile(TRUE)) {
		resetRegionCounters();
		yyparse();
		echoLine("reading %d objects", objectCount);
		globalIdCounter += objectCount;
		displayNoid = 0;
		if (objectCount > 127)
			lineError("too many objects in region");
		return(TRUE);
	} else {
		lineError("can't open '%s'", regionFileName);
		return(FALSE);
	}
}

  boolean
writeRegionRaw()
{
	char  regionFileName[80];
	int   i;
	struct stat statBuf;

	sprintf(regionFileName, "%s%s", pathname, regionName);
	homogenize(regionFileName);
	if (!promptDefault)
		if (stat(regionFileName, &statBuf) == 0)
			if (!promptYN("file already exists; replace? ")) {
				echoLine("write aborted");
				return(FALSE);
			}
	if ((rawFile = fopen(regionFileName, "w")) != NULL) {
		for (i=0; i<objectCount; ++i)
			outputRawObject(noidArray[i]);
		fclose(rawFile);
		rawFile = NULL;
		return(TRUE);
	} else {
		lineError("can't open '%s'", regionFileName);
		return(FALSE);
	}
}

  boolean
writeRegionGriddle()
{
	char  regionFileName[80];
	int   i;
	struct stat statBuf;

	sprintf(regionFileName, "%s%s", pathname, regionName);
	homogenize(regionFileName);
	if (!promptDefault)
		if (stat(regionFileName, &statBuf) == 0)
			if (!promptYN("file already exists; replace? ")) {
				echoLine("write aborted");
				return(FALSE);
			}
	if ((griFile = fopen(regionFileName, "w")) != NULL) {
		for (i=0; i<objectCount; ++i)
			dumpObject(noidArray[i]);
		fclose(griFile);
		griFile = NULL;
		return(TRUE);
	} else {
		lineError("can't open '%s'", regionFileName);
		return(FALSE);
	}
}

  char *
keyName(key)
  char key;
{
	static char	result[10];
	int		i;
	static struct {
		char	 key;
		char	*name;
	} keyList[] = {
		' ',    "SPACE",	'\b',   "BACKSPACE",
		'\t',   "TAB",		'\n',   "LINE FEED",
		'\r',   "RETURN",	'\33',  "ESC",
		'\177', "DEL"
	};

	if ('!' <= key && key <= '~') {
		sprintf(result, "%c", key);
		return(result);
	}
	for (i=0; keyList[i].key != '\0'; ++i)
		if (keyList[i].key == key)
			return(keyList[i].name);
	if (key < ' ') {
		sprintf(result, "^%c", key + 0x40);
		return(result);
	}
	sprintf(result, "\\%o", key);
	return(result);
}

  int
nextFreeNoid()
{
	int	noid;

	for (noid=0; noid<objectCount; ++noid)
		if (noidArray[noid] == NULL)
			break;
	if (noid == objectCount)
		++objectCount;
	return(noid);
}

  void
announceObject(noid, class)
  int	noid;
  int	class;
{
	byte	 createPacket[7];
	byte	*buf;
	void	 mydown();

	if (class == 0)
		return;
	buf = noidArray[noid]->stateVector;
	createPacket[0] = class;
	createPacket[1] = 0;
	if (class == 1) {
		createPacket[2] = getByte(buf, STYLE_OFFSET_AVA);
		createPacket[3] = getWord(buf, X_OFFSET_AVA);
		createPacket[4] = getWord(buf, Y_OFFSET_AVA);
		createPacket[5] = getWord(buf, ORIENT_OFFSET_AVA);
		createPacket[6] = getWord(buf, GRSTATE_OFFSET_AVA);
	} else {
		createPacket[2] = getWord(buf, STYLE_OFFSET_OBJ);
		createPacket[3] = getWord(buf, X_OFFSET_OBJ);
		createPacket[4] = getWord(buf, Y_OFFSET_OBJ);
		createPacket[5] = getWord(buf, ORIENT_OFFSET_OBJ);
		createPacket[6] = getWord(buf, GRSTATE_OFFSET_OBJ);
	}
	mydown(createPacket, (word) 7, CREATE_DATA_SLOT);
	c64_override_command(CMD_CREATE);
}

  boolean
nightMode()
{
	c64_key_command('n');
	return(TRUE);
}

  boolean
eraseBackground()
{
	c64_key_command('e');
	return(TRUE);
}

  boolean
walkto()
{
	c64_key_command('w');
	return(TRUE);
}

  boolean
showFlatTypes()
{
	c64_key_command('g');
	return(TRUE);
}

  boolean
peekContainer()
{
	c64_key_command('l');
	return(TRUE);
}

  boolean
containerOffsetRight()
{
	c64_key_command('+');
	return(TRUE);
}

  boolean
containerOffsetLeft()
{
	c64_key_command('-');
	return(TRUE);
}

  boolean
containerOffsetUp()
{
	c64_key_command('@');
	return(TRUE);
}

  boolean
containerOffsetDown()
{
	c64_key_command('*');
	return(TRUE);
}

  boolean
changeHold()
{
	c64_key_command('=');
	return(TRUE);
}

  boolean
changeContainer()
{
	int	 newContainer;
	int	 contCode;
	byte	*cbuf;
	byte	*obuf;

	newContainer = touchObject();
	c64_touch_command(displayNoid);
	c64_key_command('C');
	c64_key_command('r');
	obuf = noidArray[displayNoid]->stateVector;
	cbuf = noidArray[newContainer]->stateVector;
	if (noidArray[newContainer]->class == 0)
		contCode = 0;
	else if (noidArray[newContainer]->class == 1)
		contCode = 1;
	else
		contCode = 2;
	if (isAvatar(displayNoid)) {
		if (contCode == 1)
			lineError("can't put avatar in another avatar!");
		else if (contCode == 0)
			fillLong(obuf, CONTAINER_OFFSET_AVA, 0);
		else
			fillLong(obuf, CONTAINER_OFFSET_AVA,
				getLong(cbuf, IDENT_OFFSET_OBJ));
	} else {
		fillLong(obuf, CONTAINER_OFFSET_OBJ,
			getLong(cbuf, IDENT_OFFSET_OBJ));
		fillWord(obuf, CONTAINER_TYPE_OFFSET_OBJ, contCode);
	}
}

  boolean
trapEdit()
{
	char	c;

	if (noidArray[displayNoid]->class != CLASS_TRAP &&
			noidArray[displayNoid]->class != CLASS_SUPER_TRAP) {
		lineError("current object is not a trapezoid!");
		return(TRUE);
	}
	clearDisplay();
	mvprintw(1, 0, "L -- upper left corner");
	mvprintw(2, 0, "l -- lower left corner");
	mvprintw(3, 0, "R -- upper right corner");
	mvprintw(4, 0, "r -- lower right corner");
	mvprintw(5, 0, "x -- exit trapezoid edit mode");
	refresh();
	c64_key_command(TRAP_EDIT_KEY);
	while ((c = mygetch()) != 'x') {
		if (c == 'L') {
			echoLine("upper left");
			c64_key_command(UPPER_LEFT_KEY);
		} else if (c == 'l') {
			echoLine("lower left");
			c64_key_command(LOWER_LEFT_KEY);
		} else if (c == 'R') {
			echoLine("upper right");
			c64_key_command(UPPER_RIGHT_KEY);
		} else if (c == 'r') {
			echoLine("lower right");
			c64_key_command(LOWER_RIGHT_KEY);
		} else {
			lineError("not a trapezoid edit command!");
		}
	}
	echoLine("done editing trapezoid");
	c64_key_command(TRAP_EDIT_KEY);
	snarfRegion();
	degenerateContentsVector();
	displayOneObject(displayNoid);
	return(TRUE);
}
