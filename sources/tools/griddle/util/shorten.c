#include <stdio.h>

main()
{
	char	c;
	int	i;

	i = 0;
	while ((c = getchar()) != EOF) {
		putchar(c);
		if (c == '\n')
			i = 0;
		else if (++i > 78) {
			putchar('\\');
			putchar('\n');
			i = 0;
		}
	}
}
