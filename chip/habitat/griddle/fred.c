#include <curses.h>
#include <signal.h>
#include "griddleDefs.h"
#include "prot.h"
#include "y.tab.h"

static int selectedField = 0;
static int selectedPath = 0;
static int editX = 0;
static int editY = 0;
static char *editPath;
static field *editField = NULL;
static boolean changedFlag = FALSE;

static char paths[10][80];
static char pathFileName[80];

int fredStats[128];

typedef struct {
	char			 commandKey;
	char			*echoName;
	boolean			(*commandFunction)();
	char			*helpInfo;
} command;

void echoLine();
void lineError();
boolean getString();
boolean processCommand();
void displayOneObject();

boolean saveGriddle(), initC64editor(), loadRegion(), quit(), saveRaw(), sh();
boolean refreshScreen(), showNoids(), displayObject(), incDisplayObject();
boolean decDisplayObject(), createObject(), help(), touch(), undeleteObject();
boolean deleteObject(), foreground(), background(), incX_4(), decX_4();
boolean incY_1(), decY_1(), incY_10(), decY_10(), zeroGrState(), incGrState();
boolean toggleOrient(), editObject(), nightMode(), walkto(), showFlatTypes();
boolean eraseBackground(), incPattern(), decPattern(), flatChange();
boolean twinObject(), peekContainer(), changeContainer(), trapEdit();
boolean borderToggle(), containerOffsetRight(), containerOffsetLeft();
boolean containerOffsetUp(), containerOffsetDown(), changeHold(), pauseFred();
boolean editPathlist(), displayPathlist();

command commandTable[] = {
	'b', "background object", background, "move object to background",
	'B', "background display suppression", eraseBackground,
		"display without background",
	ctrl(B), "border/unborder trapezoid trap", borderToggle,
		"border/unborder trapezoid",
	'c', "create new object", createObject, "create a new object",
	'C', "container peek", peekContainer, "look inside container",
	'd', "display object", displayObject, "display an object",
	'D', "drop into container", changeContainer,
		"drop object into container",
	ctrl(D), "display pathlist", displayPathlist,
		"display current pathlist",
	'e', "edit object", editObject, "edit an object's state info",
	'E', "edit trapezoid", trapEdit, "edit a trapezoid's corner info",
	'f', "foreground object", foreground, "move object to foreground",
	'F', "flat type change", flatChange, "change type of flat",
	'g', "griddle format save", saveGriddle, "save in griddle format",
	'G', "show flat types", showFlatTypes, "show flat types",
	'h', "help", help, "display help info",
	'H', "offset left", containerOffsetLeft, NULL,
	'i', "initialize region editor", initC64editor, "init Reno",
	'I', "change how held", changeHold, NULL,
	'J', "offset up", containerOffsetUp, NULL,
	'K', "offset down", containerOffsetDown, NULL,
	'L', "offset right", containerOffsetRight, NULL,
	'n', "night mode", nightMode, "switch display to night mode",
	'o', "object noid list", showNoids, "show noids and classes",
	'O', "orientation flip", toggleOrient, "toggle object's orientation",
	'p', "inc color/pattern", incPattern, "inc object's color/pattern",
	'P', "dec color/pattern", decPattern, "dec object's color/pattern",
	ctrl(P), "path list edit", editPathlist, "edit path list",
	'q', "quit", quit, "exit Fred",
	'r', "read region from file", loadRegion, "read region from a file",
	's', "set grState to 0", zeroGrState, "set object's grState to 0",
	'S', "inc grState", incGrState, "inc object's grState",
	't', "touch object under cursor", touch, "touch object under cursor",
	'T', "twin object", twinObject, "twin object",
	'u', "undelete deleted object", undeleteObject,
		"undo object deletion",
	'w', "walk to indicated object", walkto, "walk avatar to object",
	'x', "delete object", deleteObject, "delete an object",
	'z', "raw format save", saveRaw, "save in raw format",
	'+', "display object", incDisplayObject, "inc display noid",
	'-', "display object", decDisplayObject, "dec display noid",
	'!', "unix command", sh, "execute a Unix command",
	'.', "inc X", incX_4, "inc object's X coordinate",
	',', "dec X", decX_4, "dec object's X coordinate",
	'?', "inc Y", incY_1, "inc object's Y coordinate",
	'/', "dec Y", decY_1, "dec object's Y coordinate",
	'>', "inc Y by 10", incY_10, "inc object's Y coordinate by 10",
	'<', "dec Y by 10", decY_10, "dec object's Y coordinate by 10",
	'\r', "refresh Fred screen", refreshScreen, "refresh screen",
	ctrl(Z), "pause Fred", pauseFred, "pause Fred",
	'\0', NULL, NULL, NULL
};

extern char *getenv();

/* flags */
#define NCARDS 3
int card = 0;
int port = 0;

  void
c64_override_command(cmd)
  byte cmd;
{
	if (!testMode) {
		down(&cmd, (word) 1, KEYBOARD_OVERRIDE);
		Cont();
		sleep(1);
	}
}

  void
c64_key_command(cmd)
  byte cmd;
{
	byte buf;

	buf = cmd;
	if (!testMode) {
		down(&buf, (word) 1, KEYBOARD_KEYPRESS);
		Cont();
		sleep(1);
	}
}

  void
c64_touch_command(arg)
  byte arg;
{
	byte buf;

	buf = arg;
	if (!testMode) {
		down(&buf, (word) 1, TOUCH_SLOT);
		Cont();
	}
}

  void
readFredStats()
{
	FILE	*statFyle;
	int	 i;

	if ((statFyle = fopen("/u0/habitat/fredStats", "r")) != NULL) {
		for (i=0; i<128; ++i)
			fredStats[i] = getw(statFyle);
		fclose(statFyle);
	}
	if (statFyle == NULL || feof(statFyle)) {
		for (i=0; i<128; ++i)
			fredStats[i] = 0;
	}
}

  void
writeFredStats()
{
	FILE	*statFyle;
	int	 i;

	if ((statFyle = fopen("/u0/habitat/fredStats", "w")) != NULL) {
		for (i=0; i<128; ++i)
			putw(fredStats[i], statFyle);
		fclose(statFyle);
	}
}

  int
touchObject()
{
	char buf;

	if (!testMode) {
		c64_key_command('t');
		up(&buf, (word) 1, TOUCHED_OBJECT);
		Cont();
		return(buf);
	} else
		return(displayNoid);
}

  boolean
touch()
{
	displayNoid = touchObject();
	displayOneObject(displayNoid);
	return(TRUE);
}

  boolean
help()
{
	int	i;
	int	y, x;
	int	line, col;

	line = 1;
	col = 0;
	getyx(curscr, y, x);
	clearDisplay();
	for (i=0; commandTable[i].commandKey!='\0'; ++i) {
		if (commandTable[i].helpInfo != NULL) {
			mvprintw(line, col, "%s -- %s",
				keyName(commandTable[i].commandKey),
				commandTable[i].helpInfo);
			nextlc(line, col, 40);
		}
	}
	move(y, x);
	return(TRUE);
}

  boolean
displayField(line, col, aField, buf, highlight)
  int	   line;
  int	   col;
  field	  *aField;
  byte	  *buf;
  boolean  highlight;
{
	char	str[512];

	if (fieldString(aField, buf, str)) {
		if (highlight) {
			editX = col;
			editY = line;
			editField = aField;
		}
		mvaddstr(line, col, "  ");
		if (highlight)
			standout();
		addstr(str);
		if (highlight)
			standend();
		return(TRUE);
	} else
		return(FALSE);
}

  int
displayFieldList(fields, buf, lineptr, colptr, fieldNum)
  fieldList	*fields;
  byte		*buf;
  int		*lineptr;
  int		*colptr;
  int		 fieldNum;
{
	while (fields != NULL) {
		if (displayField(*lineptr, *colptr, fields->field, buf,
				fieldNum == selectedField)) {
			nextlc(*lineptr, *colptr, 40);
			++fieldNum;
		}
		fields = fields->nextField;
	}
	return(fieldNum);
}

  void
revalueField(firstc, buf)
  char	firstc;
  byte *buf;
{
	ungetch(firstc);
	fredModeLexingOn();
	fillFieldPrompt(editY, editX, editField, buf, TRUE);
	fredModeLexingOff();
}

  bool
showObject(noid)
  int	noid;
{
	object		*obj;
	int		 line, col;
	int		 y, x;
	int		 fieldNum;

	line = 1;
	col = 0;
	fieldNum = 1;
	obj = noidArray[noid];
	getyx(curscr, y, x);
	clearDisplay();
	if (obj->class > 1)
		fieldNum = displayFieldList(classDefs[0]->fields,
			obj->stateVector, &line, &col, fieldNum);
	fieldNum = displayFieldList(classDefs[obj->class+1]->fields,
		obj->stateVector, &line, &col, fieldNum);
	move(y, x);
	refresh();
	return(fieldNum - 1 == selectedField);
}

  void
editOneObject(noid)
  int	noid;
{
	char	c;
	boolean	lastField;

	showObject(noid);
	selectedField = 1;
	changedFlag = FALSE;
	do {
		lastField = showObject(noid);
		c = mygetch();
		if (c == DEL)
			break;
		else if (c == '\b') {
			selectedField = selectedField < 2 ?
				0 : selectedField - 2;
			lastField = FALSE;
		} else if (c != '\r' && c != '\n' && c != ' ')
			revalueField(c, noidArray[noid]->stateVector);
		++selectedField;
	} while (!lastField);
	selectedField = 0;
	showObject(noid);
}

  boolean
editObject()
{
	int	y, x;

	echoLine("editing object %d (%s)", displayNoid,
		classDefs[noidArray[displayNoid]->class+1]->className->name);
	getyx(curscr, y, x);
	editOneObject(displayNoid);
	if (changedFlag)
		uploadRegion();
	move(y, x);
	return(TRUE);
}

  void
displayOneObject(noid)
  int	noid;
{
	echoLine("object %d (%s)", noid,
		classDefs[noidArray[noid]->class+1]->className->name);
	showObject(noid);
}

  boolean
displayObject()
{
	int  noid;

	noid = promptInt("noid #", displayNoid);
	if (noid == -1)
		echoLine("aborted");
	else if (noid < 0 || MAXNOID <= noid)
		lineError("noid out of range");
	else if (noidArray[noid] == NULL)
		lineError("there is no object #%d", noid);
	else {
		displayNoid = noid;
		if (noid != 0)
			c64_touch_command(noid);
		displayOneObject(noid);
	}
	return(TRUE);
}

   boolean
incDisplayObject()
{
	int	count;

	count = 0;
	if (displayNoid == MAXNOID - 1) displayNoid = -1;
	while (noidArray[++displayNoid] == NULL && ++count < MAXNOID)
		if (displayNoid == MAXNOID - 1) displayNoid = -1;
	if (noidArray[displayNoid] != NULL) {
		if (displayNoid != 0)
			c64_touch_command(displayNoid);
		displayOneObject(displayNoid);
	} else
		lineError("no objects to display!");
	return(TRUE);
}

   boolean
decDisplayObject()
{
	int	count;

	count = 0;
	if (displayNoid == 0) displayNoid = MAXNOID;
	while (noidArray[--displayNoid] == NULL && ++count < MAXNOID)
		if (displayNoid == 0) displayNoid = MAXNOID;
	if (noidArray[displayNoid] != NULL) {
		if (displayNoid != 0)
			c64_touch_command(displayNoid);
		displayOneObject(displayNoid);
	} else
		lineError("no objects to display!");
	return(TRUE);
}

  boolean
deleteObject()
{
	if (displayNoid == 0)
		lineError("can't delete the region!");
	else {
		if (undeleteBuffer != NULL)
			freeObject(undeleteBuffer);
		undeleteBuffer = noidArray[displayNoid];
		noidArray[displayNoid] = NULL;
		if (displayNoid == objectCount)
			--objectCount;
		echoLine("object %d is gone", displayNoid);
		incDisplayObject();
		uploadRegion();
	}
	return(TRUE);
}

  boolean
undeleteObject()
{
	int	noid;

	if (undeleteBuffer == NULL)
		lineError("no deleted object to restore");
	else {
		noid = nextFreeNoid();
		noidArray[noid] = undeleteBuffer;
		undeleteBuffer = NULL;
		echoLine("object restored to noid %d", noid);
		uploadRegion();
	}
	return(TRUE);
}

  boolean
fillFieldPrompt(line, col, aField, buf, editMode)
  int	   line;
  int	   col;
  field	  *aField;
  byte	  *buf;
  boolean  editMode;
{
	char	 temp[80];
	value	*parseBit();
	value	*parseInt();
	char	*parseString();

	if (aField->invisible)
		return(FALSE);

	fieldPrompt(line, col, aField, buf, editMode);
	if (mygetstr(temp) && temp[0] != '\0') {
		fillField(buf, temp, aField, parseInt, parseString, parseBit);
		changedFlag = TRUE;
	}
	return(TRUE);
}

  void
fillDataPrompt(lineptr, colptr, buf, fields, class)
  int		*lineptr;
  int		*colptr;
  byte		*buf;
  fieldList	*fields;
  int		 class;
{
	fredModeLexingOn();
	while (fields != NULL) {
		if (fillFieldPrompt(*lineptr, *colptr, fields->field, buf,
				FALSE))
			nextlc(*lineptr, *colptr, 40);
		fields = fields->nextField;
	}
	fredModeLexingOff();
}

  void
generateFredObject(class, twinFlag)
  int	  class;
  boolean twinFlag;
{
	object	*obj;
	object	*initObject();
	int	 noid;
	int	 i;

	obj = initObject(class, -globalIdCounter++);
	if (twinFlag)
		for (i=4; i<classDefs[class+1]->size; ++i)
			obj->stateVector[i] =
				noidArray[displayNoid]->stateVector[i];
	noid = nextFreeNoid();
	displayNoid = noid;
	noidArray[noid] = obj;
	clearDisplay();
	if (twinFlag)
		displayOneObject(noid);
	else
		editOneObject(noid);
}

  boolean
createObject()
{
	int	class;
	void	displayRegion();

	class = promptInt("-- class", previousClass);
	if (class == -1)
		echoLine("aborted");
	else if (class < 1 || MAXCLASS <= class)
		lineError("class value %d is out of range", class);
	else {
		echoLine("creating class %d (%s)", class,
			classDefs[class+1]->className->name);
		previousClass = class;
		generateFredObject(class, FALSE);
		uploadRegion();
		echoLine("created object %d, class %d (%s)", displayNoid,
			class, classDefs[class+1]->className->name);
		c64_touch_command(displayNoid);
	}
	return(TRUE);
}

  boolean
twinObject()
{
	int	class;

	if (displayNoid == 0)
		lineError("can't twin region");
	else {
		class = noidArray[displayNoid]->class;
		previousClass = class;
		generateFredObject(class, TRUE);
/*		announceObject(displayNoid, class);*/
		uploadRegion();
		echoLine("created object %d, class %d (%s)", displayNoid,
			class, classDefs[class+1]->className->name);
		c64_touch_command(displayNoid);
	}
	return(TRUE);
}

  boolean
showNoids()
{
	int	line, col;
	int	y, x;
	int	i;

	line = 1;
	col = 0;
	getyx(curscr, y, x);
	clearDisplay();
	for (i=0; i<objectCount; ++i)
		if (noidArray[i] != NULL) {
			mvprintw(line, col, "%3d %s", i,
			   classDefs[noidArray[i]->class+1]->className->name);
			nextlc(line, col, 20);
		}
	move(y, x);
	refresh();
	return(TRUE);
}

  void
readPathlist()
{
	char *pathstr;
	FILE *fyle;
	int   i;

	sprintf(pathFileName, "%s/.fredpaths", getenv("HOME"));
	if ((fyle = fopen(pathFileName,"r")) != NULL) {
		for (i=1; i<10; i++)
			fscanf(fyle, "%s\n", paths[i]);
		fclose(fyle);
	} else {
		for (i=1; i<10; i++)
			strcpy(paths[i], "./");
	}		
	if ((pathstr = getenv("FREDPATH")) != NULL)
		strcpy(paths[0], pathstr);
	else
		strcpy(paths[0], "./");
}

  void
writePathlist()
{
	FILE	*fyle;
	int	 i;

	if ((fyle = fopen(pathFileName, "w")) != NULL) {
		for (i=1; i<10; i++)
			fprintf(fyle, "%s\n", paths[i]);
		fclose(fyle);
	} else
		lineError("can't write to pathlist file %s", pathFileName);
}

  void
showPathlist()
{
	int	i;
	int	y, x;

	getyx(curscr, y, x);
	clearDisplay();
	for (i=0; i<10; ++i) {
		mvaddstr(i + 1, 0, "  ");
		if (i == selectedPath) {
			editX = 0;
			editY = i + 1;
			editPath = paths[i];
			standout();
		}
		addstr(paths[i]);
		if (i == selectedPath) standend();
		clrtoeol();
	}
	move(y, x);
	refresh();
}

  boolean
displayPathlist()
{
	showPathlist();
	return(TRUE);
}

  void
revaluePath(firstc)
  char	firstc;
{
	char	temp[80];

	ungetch(firstc);
	mvaddstr(selectedPath + 1, 0, "  ");
	clrtoeol();
	refresh();
	if (mygetstr(temp) && temp[0] != '\0') {
		strcpy(editPath, temp);
		changedFlag = TRUE;
	}
}

  boolean
editPathlist()
{
	int	y, x;
	char	c;

	echoLine("editing pathlist");
	getyx(curscr, y, x);
	showPathlist();
	changedFlag = FALSE;
	for (;;) {
		c = mygetch();
		if (c == DEL)
			break;
		else if (c == '\b') {
			if (selectedPath > 0)
				--selectedPath;
		} else if (c == '\r' || c == '\n' || c == ' ') {
			if (selectedPath < 9)
				++selectedPath;
		} else
			revaluePath(c);
		showPathlist();
	}
	if (changedFlag)
		writePathlist();
	move(y, x);
	strcpy(pathname, paths[selectedPath]);
	return(TRUE);
}

  void
snarfRegion()
{
	int   i;
	byte *p;
	byte  buf[10000];
	int   regionSize;
	FILE *fyle;

	c64_override_command(CMD_SAVE_CV);
	up(buf, (word) 2, CV_SIZE_SLOT);
	regionSize = buf[0] + buf[1]*256;
	up(buf, (word)(regionSize), CV_DATA_SLOT);
	Cont();
	p = buf;
	for (i=0; i<regionSize; ++i)
		cv[i] = *p++;
}

  boolean
quit()
{
	echoLine("quit");
	clearDisplay();
	refresh();
	writeFredStats();
	return(FALSE);
}

  void
setupFastlinkPort()
{
	char *portstr;

	portstr = getenv("FASTPORT");
	if (portstr != NULL) {
		if (strlen(portstr) < 3) {
			error("FASTPORT env variable must be of form: c;p\n");
			exit(1);
		} else {
			card = portstr[0] - '0';
			port = portstr[2] - '0';
		}
	}
	if (card < 0 || NCARDS <= card) {
		error("card number out of range\n");
		exit(1);
	}
	if (port < 0 || 2 < port) {
		error("port number out of range\n");
		exit(1);
	}
	if (!testMode && !Init(card, port)) {
		error("unable to access device\n");
		Finish();
		exit(1);
	}
}

  void
doFredStuff()
{
	char *pathstr;
	FILE *fyle;

	pathname[0] = '\0';
	if ((pathstr = getenv("FREDPATH")) != NULL)
		strcpy(pathname, pathstr);
	readFredStats();
	readPathlist();
	if (!testMode)
		setupFastlinkPort();
	setupTerminal();

	displayNoid = 0;
	undeleteBuffer = NULL;
	previousClass = 2;

	strcpy(regionName, "/u0/habitat/empty.raw");
	echoLine("Fred version 1.0 (%s) -- type 'h' for help", DATE);
	while (processCommand())
		;
	refresh();
	endwin();
}

  boolean
initC64editor()
{
/*	system("down -S < /u0/aric/mic/Gr/all.out");*/
	system("down -S < /u0/habitat/reno.out");
/*	system("down -S < /u0/chip/reno.out");*/
	return(TRUE);
}

  boolean
sh()
{
	char	commandBuf[80];
	int	y, x;

	if (!getString(":", commandBuf)) {
		echoLine("aborted");
		return(TRUE);
	}
	getyx(curscr, y, x);
	clearDisplay();
	move(1, 0);
	refresh();
	echo(); noraw(); nl();
	system(commandBuf);
	noecho(); raw(); nonl();
	move(1, 47);
	refresh();
	echoLine("unix command:%s", commandBuf);
	refresh();
	return(TRUE);
}

  boolean
loadRegion()
{
	if (!getRegionName())
		echoLine("aborted");
	else if (readRegion() && generateContentsVector()) {
		displayRegion();
		echoLine("loaded %s", regionName);
	}
	return(TRUE);
}

  boolean
saveRaw()
{
	if (!getRegionName())
		echoLine("aborted");
	else {
		if (!testMode) {
			snarfRegion();
			degenerateContentsVector();
		}
		if (writeRegionRaw())
			echoLine("saved raw file %s", regionName);
	}
	return(TRUE);
}

  boolean
saveGriddle()
{
	if (!getRegionName())
		echoLine("aborted");
	else {
		if (!testMode) {
			snarfRegion();
			degenerateContentsVector();
		}
		if (writeRegionGriddle())
			echoLine("saved griddle file %s", regionName);
	}
	return(TRUE);
}

  boolean
processCommand()
{
	char		c;
	int		i;
	static char	previousC = '\0';

	if (previousC != '\r' && previousC != '\32')
		addstr(" -- Next?");
	refresh();
	c = mygetch();
	for (i=0; commandTable[i].commandKey != '\0'; ++i)
		if (commandTable[i].commandKey == c) {
			if (c != '\r' && c != '\32')
				echoLine(commandTable[i].echoName);
			fredStats[c]++;
			previousC = c;
			return (*(commandTable[i].commandFunction))();
		}
	lineError("'%s' is not a Fred command", keyName(c));
	previousC = c;
	return(TRUE);
}

  boolean
pauseFred()
{
	echo(); noraw(); nl();
	kill(0, SIGTSTP);
	noecho(); raw(); nonl();
	move(1, 47);
	refresh();
	reallyClearScreen();
	return(TRUE);
}

  boolean
refreshScreen()
{
	reallyClearScreen();
	c64_key_command('r');
	return(TRUE);
}
