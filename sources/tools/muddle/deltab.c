/*
	deltab.c -- Find disk-block delta between two files

	Chip Morningstar
	Lucasfilm Ltd.
	23-February-1987

*/

#include <stdio.h>

typedef int	bool;
#define FALSE 0
#define TRUE 1

main(argc, argv)
  int	 argc;
  char	*argv[];
{
	FILE	*fyle1, *fyle2;
	char	c1, c2;
	int	ccount;
	int	blockSize;
	bool	mismatch;

	if (argc < 3 || argc > 4) {
		fprintf(stderr, "deltab: wrong number of parameters\n");
		exit(1);
	} else if (argc == 4) {
		blockSize = atoi(argv[3]);
	} else {
		blockSize = 256;
	}
	if ((fyle1 = fopen(argv[1], "rb")) == NULL) {
		fprintf(stderr, "deltab: can't open %s\n", argv[1]);
		exit(1);
	} else if ((fyle2 = fopen(argv[2], "rb")) == NULL) {
		fprintf(stderr, "deltab: can't open %s\n", argv[2]);
		exit(1);
	}
	ccount = 0;
	do {
		c1 = getc(fyle1);
		c2 = getc(fyle2);
		if (ccount % blockSize == 0)
			mismatch = FALSE;
		if (c1 != c2 && !mismatch) {
			mismatch = TRUE;
			printf("0x%02x\n", ccount / blockSize);
		}
		++ccount;
	} while (!feof(fyle1) && !feof(fyle2));
}
