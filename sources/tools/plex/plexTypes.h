/* 
   plexTypes.h: Type and constant definitions for Plex.

   Chip Morningstar, Lucasfilm Ltd., 26-January-1987
 */

#include <stdio.h>

typedef int		bool;
#define	TRUE	1
#define FALSE	0

typedef unsigned short	word;
typedef unsigned char	byte;
typedef int *		pointer;

#define Case		break; case
#define Default		break; default

#define typeAlloc(type)	((type *) myalloc(sizeof(type)))
#define typeAllocMulti(type, n) ((type *) myalloc((n)*sizeof(type)))
#define byteAlloc(size) ((byte *) myalloc(size))

/* directions */
#define WEST	0
#define NORTH	1
#define EAST	2
#define SOUTH	3
#define NONE	4

#define E	4	/* number of exits for a region--universal constant */

typedef enum {
	INVERT_OP, CCW_OP, CW_OP, RANDOM_OP, PERIOD_OP, IDENTITY_OP
} opKind;

typedef enum {
	SHUFFLE_STATEMENT
} pstatementKind;

typedef enum {
	INT_VALUE, STRING_VALUE
} valueKind;

typedef enum {
	CENTER_VERT, LEFT_VERT, RIGHT_VERT
} vertKind;

typedef enum {
	SPAN_PROD, SET_PROD, ARRAY_PROD, NAME_PROD
} prodKind;

typedef enum {
	NODE_SPAN, WHITE_SPAN, H_SPAN, V_SPAN, X_SPAN, FILLER_SPAN, END_SPAN
} spanKind;

typedef enum {
	USE_SEL, RANDOM_SEL, PERIOD_SEL, ENTRY_SEL
} selectionKind;

typedef enum {
	BI_DIR, FROMTO_DIR, TOFROM_DIR
} dirKind;

typedef enum {
	ADD_EXPR, SUB_EXPR, MUL_EXPR, DIV_EXPR, DOT_EXPR, ARRAY_EXPR,
	PARAM_EXPR, NUMBER_EXPR, STRING_EXPR, NESTED_EXPR, NAME_EXPR,
	RARRAY_EXPR
} exprKind;

typedef struct symbolStruct {
	char			*name;
	struct symbolStruct	*next;
	struct productionStruct	*binding;
	struct nodeStruct	*node;
	int			 dotValue;
} symbolType;

typedef struct {
	pstatementKind		 kind;
	int			 arg1;
} pstatementType;

typedef struct {
	int			 value;
	int			 count;
} numberType;

typedef struct {
	valueKind			 dataType;
	union {
		int			 intValue;
		char			*stringValue;
	} valueUnion;
} valueType;

typedef struct exprStruct {
	exprKind			 kind;
	struct exprStruct		*arg1;
	struct exprStruct		*arg2;
	int				 count;
} exprType;

typedef struct genericListStruct {
	struct genericListStruct	*next;
	int				*data;
} genericList;

typedef struct genericListHeadStruct {
	genericList			*first;
	genericList			*last;
} genericListHead;

typedef struct identifierListStruct {
	struct identifierListStruct	*next;
	symbolType			*identifier;
} identifierListType;

typedef struct pstatementListStruct {
	struct pstatementListStruct	*next;
	pstatementType			*pstatement;
} pstatementListType;

typedef struct valueListStruct {
	struct valueListStruct		*next;
	valueType			*value;
} valueListType;

typedef struct spanStruct {
	int				 count;
	spanKind			 kind;
	struct nodeStruct		*node;
	struct pathStruct		*pathD;
	struct pathStruct		*pathU;
	struct spanStruct		*backPointer;
} spanType;

typedef struct spanLineStruct {
	struct spanLineStruct		*next;
	spanType			*span;
} spanLineType;

typedef struct spanListStruct {
	struct spanListStruct		*next;
	spanLineType			*spanLine;
} spanListType;

typedef struct exprListStruct {
	struct exprListStruct		*next;
	exprType			*expr;
	int				 count;
} exprListType;

typedef struct primNodeStruct {
	union {
		struct primNodeStruct		*primNode;
		symbolType			*identifier;
	}				 primNodeUnion;
	opKind			 	 op;
	int				 count;
} primNodeType;

typedef struct {
	primNodeType	 *primNode;
	exprListType	 *argList;
	int		  count;
} parseNodeType;

typedef struct {
	symbolType	**symbols;
	int		  card;
	int		  counter;
} setType;

typedef struct {
	valueType	**values;
	int		  card;
} arrayType;

typedef struct {
	spanLineType	  **nodeList;
	struct nodeStruct **entryList;
	int		    height;
} plexProductionType;

typedef struct productionStruct {
	union {
		plexProductionType		*plexProd;
		setType				*set;
		arrayType			*array;
		valueType			*value;
	}				 productionUnion;
	prodKind			 prodKind;
} productionType;

typedef struct pathStruct {
	struct pathStruct	*next;
	struct nodeStruct	*fromNode;
	int			 fromDir;
	struct nodeStruct	*toNode;
	int			 toDir;
	int			 ord;
} pathType;

typedef struct nodeStruct {
	struct nodeStruct	*next;
	pathType		*out[E];	/* 0==W, 1==N, 2==E, 3==S */
	int			 inCount[E];
	symbolType		*symbol;
	int			 rotation;
	selectionKind		 selection;
	int			 ordinal;
	struct instanceStruct	*instance;
	exprListType		*argList;
} nodeType;

typedef struct instancePathStruct {
	struct instancePathStruct	*next;
	struct instanceStruct		*toNode;
	int				 ord;
	bool				 downFlag;
} instancePathType;

typedef struct instanceStruct {
	struct instanceStruct	*next;
	bool			 terminal;
	union {
		symbolType			*symbol;
		struct subInstanceStruct	*subTree;
	} 			 subUnion;
	instancePathType	*out[E];
	int			 inCount[E];
	int			 rotation;
	int			 ordinal;
	int			 entryNumber;
	struct instanceStruct	*parent;
	valueListType		*argList;
} instanceType;

typedef struct subInstanceStruct {
	instanceType		**subLines;
	instanceType		**entry;
	int			  height;
} subInstanceType;

typedef struct fileListStruct {
	FILE			*fyle;
	struct fileListStruct	*next;
	int			 saveLine;
	char			*saveName;
} fileList;
