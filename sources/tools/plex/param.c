#include <stdio.h>

main(argc, argv)
  int	 argc;
  char	*argv[];
{
	char	c;

	while ((c = getchar()) != EOF) {
		if (c == '`') {
			processParam(argc, argv);
		} else {
			if (c == '\\') {
				c = getchar();
				if (c != '`')
					putchar('\\');
			}
			putchar(c);
		}
	}
}

processParam(argc, argv)
  int	 argc;
  char	*argv[];
{
	int	offset;

	offset = scanNumber();
	if (argc <= offset)
		fprintf(stderr, "param: offset %d out of range\n", offset);
	else if (offset == 0)
		printf("`");
	else
		printf("%s", argv[offset]);
}

  int
scanNumber()
{
	char	c;
	int	result;

	c = getchar();
	if (c == 'w' || c == 'W')
		return(1);
	else if (c == 'n' || c == 'N')
		return(2);
	else if (c == 'e' || c == 'E')
		return(3);
	else if (c == 's' || c == 'S')
		return(4);
	else if (c == 'r' || c == 'R')
		return(5);
	result = 0;
	while ('0' <= c && c <= '9') {
		result = result * 10 + c - '0';
		c = getchar();
	}
	ungetc(c, stdin);
	if (result == 0)
		return(0);
	else
		return(result + 5);
}
