/* 
   symbols.c: Symbol table handler for Plex.

   Chip Morningstar, Lucasfilm Ltd., 26-January-1987
 */

#include "plexTypes.h"
#include "plexGlobals.h"

  symbolType *
newSymbol(name, binding)
  char			*name;
  productionType	*binding;
{
	symbolType	*newEntry;
	void		 installSymbol();

	newEntry = typeAlloc(symbolType);
	newEntry->name = name;
	newEntry->binding = binding;
	newEntry->node = NULL;
	newEntry->dotValue = 0;
	installSymbol(newEntry);
	return(newEntry);
}

  void
installSymbol(symbol)
  symbolType	*symbol;
{
	int			 test;
	int			 hashValue;
	symbolType		*result;
	symbolType		*oldResult;

	hashValue = hashString(symbol->name);
	result = symbolTable[hashValue];
	if (result == NULL) {
		symbolTable[hashValue] = symbol;
		symbol->next = NULL;
		return;
	}
	oldResult = NULL;
	while (result != NULL) {
		if ((test = strcmplc(symbol->name, result->name)) == 0) {
			error("symbol %s multiply defined\n", symbol->name);
			return;
		} else if (test > 0) {
			symbol->next = result;
			if (oldResult == NULL)
				symbolTable[hashValue] = symbol;
			else
				oldResult->next = symbol;
			return;
		} else {
			oldResult = result;
			result = result->next;
		}
	}
	if (oldResult == NULL)
		symbolTable[hashValue] = symbol;
	else
		oldResult->next = symbol;
	symbol->next = NULL;
}

  void
bindSymbol(symbol, binding)
  symbolType	*symbol;
  productionType	*binding;
{
	if (symbol->binding != NULL)
		error("warning: rebinding symbol '%s'\n", symbol->name);
	symbol->binding = binding;
}

  symbolType *
lookupSymbol(s)
  char			*s;
{
	symbolType	*result;
	int		 test;
	int		 hashValue;

	hashValue = hashString(s);
	result = symbolTable[hashValue];
	while (result != NULL) {
		if ((test = strcmplc(s, result->name)) == 0)
			break;
		else if (test > 0) {
			result = NULL;
			break;
		} else {
			result = result->next;
		}
	}
	return(result);
}

  char
toLowerCase(c)
{
	return ('A' <= c && c<= 'Z') ? (c - 'A' + 'a') : c;
}

  int
hashString(s)
  char	*s;
{
	unsigned	result;

	result = 0;
	while (*s != '\0')
		result = (result << 1) + toLowerCase(*s++);
	return(result & HASH_TABLE_MASK);
}

  bool
strcmplc(s1, s2)	/* string compare in lower case */
  char *s1;		/*  heavily optimized version */
  char *s2;
{
	char	c1;
	int	result;

	do {
		c1 = toLowerCase(*s1++);

		/* if result != 0, they differ */
		if (result = c1 - toLowerCase(*s2++)) {
			return(result);	     /* c1<c2==neg, c1>c2==pos */
		} else if (!c1) { 	     /* if they're null, we're done */
			return(0);
		}
	} while (TRUE);
}
