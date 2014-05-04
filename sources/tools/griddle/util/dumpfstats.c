#include <stdio.h>

int fredStats[128];

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

  void
readFredStats(argc, argv)
  int	 argc;
  char	*argv[];
{
	FILE	*statFyle;
	int	 i;
	char	 temp[256];

	if (argc > 1)
		sprintf(temp, "%s/u0/habitat/fredStats", argv[1]);
	else
		strcpy(temp, "/u0/habitat/fredStats");
	if ((statFyle = fopen(temp, "r")) != NULL) {
		for (i=0; i<128; ++i)
			fredStats[i] = getw(statFyle);
		fclose(statFyle);
	}
	if (statFyle == NULL || feof(statFyle)) {
		for (i=0; i<128; ++i)
			fredStats[i] = 0;
	}
}

main(argc, argv)
  int	 argc;
  char	*argv[];
{
	int	i;

	readFredStats(argc, argv);
	for (i=0; i<128; ++i)
		printf("%s -- %d\n", keyName(i), fredStats[i]);
}
