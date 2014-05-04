#include <stdio.h>

main()
{
	FILE	*statFyle;
	int	 i;

	if ((statFyle = fopen("/u0/habitat/fredStats", "w")) != NULL) {
		for (i=0; i<128; ++i)
			putw(0, statFyle);
		fclose(statFyle);
	} else
		fprintf(stderr, "couldn't open stat file!\n");
}
