#include <stdio.h>

#define typeAlloc(type) (type *)malloc(sizeof(type))
#define until (cond)	while (!(cond))

#define BUFFER_SIZE		  300
#define HUGE_BUFFER_SIZE	10000

typedef char	 stringType;	/* pointer to string is pointer to char */

typedef int	 bool;
#define TRUE	1
#define FALSE	0

typedef struct {
		stringType	*identifier;
		int		 preferredIndex;
	       } capabilityIdentifierType;

typedef struct identifierListStruct {
		stringType			*identifier;
		int				 tag;
		struct identifierListStruct	*nextIdentifier;
	       } identifierListType;

typedef struct {
		stringType			*identifier;
		int				 tag;
		identifierListType		*nextIdentifier;
		identifierListType		*lastIdentifier;
	       } identifierListHeadType;

typedef enum {
	UNCLOSED_STRING_ERROR,
	UNCLOSED_COMMENT_ERROR,
	UNCLOSED_CCODE_ERROR,
	       } errorType;

#define EXPLICIT_CAPABILITY	0
#define IMPLICIT_CAPABILITY	1
