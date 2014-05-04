#include <stdio.h>

main(argc, argv)
  int	 argc;
  char	*argv[];
{
	int	limit;
	int	count;
	char	c;

	limit = atoi(argv[1]);
	count = 0;
	while ((c = getchar()) != EOF) {
		if (count++ < limit || c == '\n')
			putchar(c);
		if (c == '\n')
			count = 0;
	}
}
