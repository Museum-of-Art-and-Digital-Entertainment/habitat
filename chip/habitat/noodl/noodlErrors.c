/*
   noodlErrors.c -- Error handling for the Noodl preprocessor.

   Chip Morningstar, Lucasfilm Ltd., 2-January-1986
 */

#include "noodlTypes.h"

int		lineNumber;

  void
fatalError(whatError, arg1, arg2, arg3)
  errorType	whatError;
  int		arg1;
  int		arg2;
  int		arg3;
{
	void	printErrorMessage();

	printErrorMessage(whatError, arg1, arg2, arg3);
	exit(1);
}

  void
error(whatError, arg1, arg2, arg3)
  errorType	whatError;
  int		arg1;
  int		arg2;
  int		arg3;
{
	void	printErrorMessage();

	printErrorMessage(whatError, arg1, arg2, arg3);
}

  void
printErrorMessage(whatError, arg1, arg2, arg3)
  errorType	whatError;
  int		arg1;
  int		arg2;
  int		arg3;
{
	static char *errorMessages[] = {
		"unclosed string at end of file",
		"unclosed comment at end of file",
		"unclosed C block at end of file",
	};

	fprintf(stderr, "line %d: ", lineNumber);
	fprintf(stderr, errorMessages[(int)whatError], arg1, arg2, arg3);
	fprintf(stderr, "\n");
}


/* yyerror is what yacc expects to call when it hits an error.  Yacc passes
   the error message as a string (this is almost always 'syntax error'). */
  void
yyerror(errorMessage)
  stringType	*errorMessage;
{
	fprintf(stderr, "line %d: %s\n", lineNumber, errorMessage);
}
