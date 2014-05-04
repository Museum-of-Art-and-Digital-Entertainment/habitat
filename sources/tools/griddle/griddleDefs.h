#include <stdio.h>

#define Case		break; case
#define Default		break; default

typedef unsigned char	byte;
typedef unsigned short	word;
typedef int		boolean;
#ifndef FALSE
#define FALSE 0
#define TRUE 1
#endif

#define CLASS_REGION 0
#define CLASS_DOOR 23
#define CLASS_BUILDING 132
#define CLASS_FLAT 93
#define CLASS_TRAP 87
#define CLASS_SUPER_TRAP 92

/* These constants ought to be extracted from the defines, but they're not.
   Anytime the definition for the base object changes, these may have to be
   changed also. */
#define IDENT_OFFSET 0
#define IDENT_OFFSET_OBJ IDENT_OFFSET
#define CONTAINER_OFFSET_OBJ 8
#define CONTAINER_TYPE_OFFSET_OBJ 12
#define X_OFFSET_OBJ 14
#define Y_OFFSET_OBJ 16
#define STYLE_OFFSET_OBJ 18
#define GRSTATE_OFFSET_OBJ 20
#define ORIENT_OFFSET_OBJ 22

#define TYPE_OFFSET_FLAT 42
#define HEIGHT_OFFSET_TRAP 52
#define CONNECTION_OFFSET_DOOR 48

#define CONTAINER_OFFSET_AVA 8
#define X_OFFSET_AVA 12
#define Y_OFFSET_AVA 14
#define GRSTATE_OFFSET_AVA  20
#define ORIENT_OFFSET_AVA 28
#define STYLE_OFFSET_AVA 32
#define PROP_BASE_AVA 80
#define AVATAR_PROPERTY_COUNT 6

#define IDENT_OFFSET_REG IDENT_OFFSET
#define LIGHTLEVEL_OFFSET_REG 8
#define DEPTH_OFFSET_REG 10
#define EAST_OFFSET_REG 12
#define WEST_OFFSET_REG 16
#define NORTH_OFFSET_REG 20
#define SOUTH_OFFSET_REG 24
#define CLASSGROUP_OFFSET_REG 28
#define ORIENT_OFFSET_REG 30

typedef enum {
	VARIABLE_SYM, MACRO_SYM, OBJECT_SYM, NON_SYM, CLASS_SYM
} symbolType;

typedef enum {
	ID_EXPR, NUM_EXPR, EXPR_EXPR, UNOP_EXPR, BIN_EXPR, STRING_EXPR,
	BITSTRING_EXPR
} exprType;

typedef enum {
	FIELD_AVAID, FIELD_BIN15, FIELD_BIN31, FIELD_BIT, FIELD_BYTE,
	FIELD_CHARACTER, FIELD_ENTITY, FIELD_FATWORD, FIELD_OBJID,
	FIELD_REGID, FIELD_WORDS, FIELD_VARSTRING
} fieldType;

typedef enum {
	VAL_UNDEFINED, VAL_INTEGER, VAL_STRING, VAL_AVATAR, VAL_OBJECT,
	VAL_REGION, VAL_BITSTRING
} valueType;

typedef struct {
	exprType	type;
	int		part1;
	int		part2;
	int		part3;
} expression;

typedef struct exprListStruct {
	expression		*expr;
	struct exprListStruct	*nextExpr;
} exprList;

typedef struct stringListStruct {
	char			*string;
	struct stringListStruct	*nextString;
} stringList;

typedef struct {
	int			 value;
	valueType		 dataType;
} value;

typedef struct valueListStruct {
	value			*value;
	struct valueListStruct	*nextValue;
} valueList;

typedef struct genericListStruct {
	int				*thing;
	struct genericListStruct	*next;
} genericList;

typedef struct {
	int				*thing;
	genericList			*next;
	genericList			*last;
} genericListHead;

typedef struct {
	int		 class;
	byte		*stateVector;
} object;

typedef struct {
	int		 class;
	int		 id;
} objectStub;

typedef struct objectListStruct {
	object			*object;
	struct objectListStruct	*nextObject;
} objectList;

typedef struct symbolStruct {
	char			*name;
	int			 codeNumber;
	symbolType		 type;
	union {
		value			*value;
		expression		*expr;
		objectStub		*object;
		int			 class;
	}			 def;
	struct symbolStruct	*next;
} symbol;

typedef struct {
	symbol				*fieldName;
	exprList			*data;
} property;

typedef struct propertyListStruct {
	property			*property;
	struct propertyListStruct	*nextProp;
} propertyList;

typedef struct {
	expression	*idExpr;
	propertyList	*properties;
} objectTail;

typedef struct {
	symbol		*name;
	int		 dimension;
	fieldType	 type;
	int		 offset;
	boolean		 invisible;
	exprList	*initValues;
} field;

typedef struct fieldListStruct {
	field			*field;
	struct fieldListStruct	*nextField;
} fieldList;

typedef struct {
	fieldList		*fields;
	int			 size;
	symbol			*className;
	byte			*prototype;
} classDescriptor;

#define  HASH_MAX	512
symbol	*symbolTable[HASH_MAX];

char *malloc();

#define typeAlloc(t) ((t *)malloc(sizeof(t)))
#define typeAllocMulti(t,n) ((t *)malloc((n)*sizeof(t)))
#define byteAlloc(n) ((byte *)malloc(n))

typedef struct fileListStruct {
	FILE			*fyle;
	struct fileListStruct	*next;
	int			 saveLine;
	char			*saveName;
} fileList;

fileList	*inputStack;
fileList	*bottomOfInputStack;
FILE		*currentInput;
int		 currentLineNumber;
char		*currentFileName;
int		 globalIdCounter;
int		 globalIdAdjustment;
int		 objectBase;

FILE		*griFile;
FILE		*rawFile;
FILE		*cvFile;
FILE		*indirFile;
int		 indirectPass;
stringList	*cvInput;
char		*classFileName;
boolean		 debug;
boolean		 testMode;
boolean		 assignRelativeIds;
int		 useStartCount;
boolean		 insideDefinition;
boolean		 announceIncludes;

#define MAXCLASS 256
classDescriptor	*classDefs[MAXCLASS+1];

#define MAXNOID 256
int		 objectCount;
int		 rawCount;
object	        *noidArray[MAXNOID];
object		*altNoidArray[MAXNOID];
boolean		 noidAlive[MAXNOID];
boolean		 fredModeLexing;
char		*fredLexString;

boolean		 promptDefault;
char		 pathname[80];
char		 regionName[80];
byte		 cv[512];
int		 cvLength;
int		 displayNoid;
object		*undeleteBuffer;
int		 previousClass;


/* C64 locations */
#define KEYBOARD_OVERRIDE (word)0x0010
#define KEYBOARD_KEYPRESS (word)0x0011
#define TOUCH_SLOT	  (word)0x0012
#define TOUCHED_OBJECT	  (word)0x0013
#define TOUCHED_ADDRES	  (word)0x0014
#define CREATE_DATA_SLOT  (word)0x0801
#define CV_SIZE_SLOT      (word)0xea07
#define CV_DATA_SLOT      (word)0xea09

/* C64 override commands */
#define CMD_CREATE  1
#define CMD_SAVE_CV 2
#define CMD_LOAD_CV 3

#define TRAP_EDIT_KEY   141
#define UPPER_LEFT_KEY   18
#define UPPER_RIGHT_KEY  19
#define LOWER_LEFT_KEY   20
#define LOWER_RIGHT_KEY  21

#define DEL    '\177'
#define ESCAPE '\033'
#define ctrl(c) ('c'&0x1F)
#define CTRL_C ctrl(C)
#define CTRL_U ctrl(U)

#define mvclrtobot(y,x) { move((y),(x)); clrtobot(); }
#define mvclrtoeol(y,x) { move((y),(x)); clrtoeol(); }
#define clearDisplay() mvclrtobot(1,0)
#define nextlc(line,col,dy) {++(line);if((line)>LINES-1){\
	(line)=1;(col)+=(dy);}}

#define myCont() if (!testMode) Cont();

#define fredModeLexingOn() fredModeLexing = TRUE;
#define fredModeLexingOff() { strcpy(fredLexString, "\n"); \
	yylex(); fredModeLexing = FALSE; }

#define isAvatar(n) (noidArray[(n)]->class == 0)

typedef struct {
	int		 west;
	int		 north;
	int		 east;
	int		 south;
	int		 rot;
	int		*multi;
	int		 multiCount;
	int		 region;
} indirectEntry;

indirectEntry	*indirTable;
int		 indirCount;
char		 indirName[80];
int		 indirArgc;
char		*indirArgv[50];
int		 indirRegion;
boolean		 sortObjects;
