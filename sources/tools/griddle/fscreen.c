#include <curses.h>
#include "griddleDefs.h"
#include "y.tab.h"

static boolean unsavedFlag = FALSE;
static char unsavedChar;

extern int yylval;

  void
echoLine(fmt, arg1, arg2, arg3)
  char	*fmt;
  int	 arg1;
  int	 arg2;
  int	 arg3;
{
	move(0, 0);
	refresh();
	clrtoeol();
	printw(fmt, arg1, arg2, arg3);
	refresh();
}

  void
lineError(fmt, arg1, arg2, arg3)
  char	*fmt;
  int	 arg1;
  int	 arg2;
  int	 arg3;
{
	echoLine(fmt, arg1, arg2, arg3);
	putchar('\7');
}

  char
mygetch()
{
	if (unsavedFlag) {
		unsavedFlag = FALSE;
		return(unsavedChar);
	} else
		return(getch());
}

  void
ungetch(c)
  char c;
{
	unsavedChar = c;
	unsavedFlag = TRUE;
}

  boolean
mygetstr(buf)
  char *buf;
{
	char	 c;
	char	*originalBuf;
	int	 x, y;
	int	 originalX;

	originalBuf = buf;
	getyx(curscr, y, originalX);
	x = originalX;
	for (;;) {
		c = mygetch();
		if (c == CTRL_C || c == ESCAPE)
			return(FALSE);
		else if (c == '\n' || c == '\r' || c == EOF) {
			addch('\r');
			refresh();
			*buf = '\0';
			return(TRUE);
		} else if (c == '\b' || c == DEL) {
			if (buf > originalBuf) {
				mvclrtoeol(y, --x);
				--buf;
			}
		} else if (c == CTRL_U) {
			mvclrtoeol(y, x = originalX);
			buf = originalBuf;
		} else {
			addch(c);
			*buf++ = c;
			++x;
		}
		refresh();
	}
}

  boolean
getString(prompt, buf)
  char *prompt;
  char *buf;
{
	addstr(prompt);
	refresh();
	return(mygetstr(buf));
}

  int
promptInt(prompt, defval)
  char	*prompt;
  int	 defval;
{
	char	 answer[80];
	char	 newPrompt[80];
	symbol	*symb;
	symbol	*lookupSymbol();

	sprintf(newPrompt, " %s [%d] ? ", prompt, defval);
	if (!getString(newPrompt, answer))
		return(0);
	if (answer[0] == '\0')
		return(defval);
	else if (answer[0] == ESCAPE || answer[0] == CTRL_C)
		return(-1);
	else if ('0' <= answer[0] && answer[0] <= '9')
		return(atoi(answer));
	else {
		symb = lookupSymbol(answer);
		if (symb->type != CLASS_SYM) {
			lineError("not a class name!");
			return(-1);
		}
		return(symb->def.class);
	}
}

  boolean
promptStr(prompt, defval, resultBuf)
  char	*prompt;
  char	*defval;
  char	*resultBuf;
{
	char answer[80];
	char newPrompt[80];

	sprintf(newPrompt, " %s [\"%s\"] ? ", prompt, defval);
	if (!getString(newPrompt, answer))
		return(FALSE);
	if (answer[0] == '\0') {
		promptDefault = TRUE;
		if (defval != resultBuf)
			strcpy(resultBuf, defval);
	} else {
		promptDefault = FALSE;
		strcpy(resultBuf, answer);
	}
	return(TRUE);
}

  boolean
promptYN(prompt)
  char	*prompt;
{
	char	answer[80];

	mvclrtoeol(0, 0);
	for (;;) {
		if (getString(prompt, answer)) {
			if (answer[0] == 'Y' || answer[0] == 'y')
				return(TRUE);
			else if (answer[0] == 'N' || answer[0] == 'n')
				return(FALSE);
		}
		lineError("please answer yes or no!");
	}
}

  void
fieldPrompt(line, col, aField, buf, highlight)
  int	   line;
  int	   col;
  field	  *aField;
  byte	  *buf;
  boolean  highlight;
{
	mvaddstr(line, col, "  ");
	if (highlight)
		standout();
	printw("%s:", aField->name->name);
	if (highlight)
		standend();
	addstr(" ");
	clrtoeol();
	refresh();
}

  value *
parseValue(dataptr)
  char	**dataptr;
{
	char	*data;
	value	*val;
	value	*buildValue();
	valueType resultType, newType;
	boolean	 typeTest;
	int	 sign;

	if (dataptr == NULL || *dataptr == NULL)
		return(buildValue(VAL_INTEGER, 0));
	fredLexString = *dataptr;
	resultType = newType = VAL_INTEGER;
	val = NULL;
	sign = 1;
	for (;;) {
		typeTest = FALSE;
		switch (yylex()) {
			Case Number:
				val = buildValue(resultType, yylval*sign);
			Case String:
				val = buildValue(VAL_STRING, yylval);
				typeTest = TRUE;
			Case BitString:
				val = buildValue(VAL_BITSTRING, yylval);
				typeTest = TRUE;
			Case '-':
				sign = -sign;
			Case A:
				newType = VAL_AVATAR;
				typeTest = TRUE;
			Case O:
				newType = VAL_OBJECT;
				typeTest = TRUE;
			Case R:
				newType = VAL_REGION;
				typeTest = TRUE;
			Case ',':
				if (resultType != VAL_INTEGER)
					lineError("dangling type!");
				*dataptr = fredLexString;
				return(val);
			Case 0:
				if (resultType != VAL_INTEGER)
					lineError("dangling type!");
				*dataptr = NULL;
				return(val);
			Default:
				lineError("syntax error!");
				if (val == NULL)
					val = buildValue(VAL_INTEGER, 0);
		}
		if (typeTest && resultType != VAL_INTEGER)
			lineError("type mismatch!");
		else
			resultType = newType;
	}
}

  value *
parseInt(dataptr)
  char	**dataptr;
{
	value	*val;
	value	*buildNumber();

	val = parseValue(dataptr);
	if (val != NULL && !isInteger(val)) {
		lineError("invalid data type for integer value!");
		val = buildNumber(0);
	}
	return(val);
}

  value *
parseBit(dataptr)
  char	**dataptr;
{
	value	*val;
	value	*buildNumber();

	val = parseValue(dataptr);
	if (val != NULL && !isInteger(val) && val->dataType != VAL_BITSTRING){
		lineError("invalid data type for bitstring value!");
		val = buildNumber(0);
	}
	return(val);
}

  char *
parseString(dataptr)
  char	**dataptr;
{
	value		*val;

	if (dataptr == NULL || *dataptr == NULL)
		return(NULL);
	val = parseValue(dataptr);
	if (isString(val))
		return((char *)(val->value));
	else {
		lineError("invalid data type for string value!");
		return(NULL);
	}
}

  boolean
getRegionName()
{
	return(promptStr("name", regionName, regionName));
}

  void
hexDump(buf, len)
  byte	*buf;
  int	 len;
{
	int	i;
	int	line;

	clearDisplay();
	for (i=0, line=1; i<len; ++i) {
		if ((i & 7) == 0) mvprintw(line, 0, "0x%04x: ", i);
		printw("0x%02x ", buf[i]);
		if ((i & 7) == 7) ++line;
		if (line == LINES-1) {
			mvprintw(line, 0, "--more--");
			refresh();
			mygetch();
			clearDisplay();
			line = 1;
		}
	}
}

WINDOW *clearWindow;

  void
setupTerminal()
{
	WINDOW	*newwin();

	initscr();
	noecho();
	raw();
	nonl();
	erase();
	refresh();
	clearWindow = newwin(0, 0, 0, 0);
}

  void
reallyClearScreen()
{
	touchwin(clearWindow);
	wrefresh(clearWindow);
	touchwin(stdscr);
	refresh();
}
