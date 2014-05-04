
extern char readc();
#define SC 033
#define REPLY 0
#define STORE 1
#define LOW 2
#define HIGH 3
#define JUMP 4
#define LOAD 5
#define BADREPLY 6
#define CONT 7
#define HALTMAIN 8
#define HALTALL 9
#define HALTCONT 10
#define JUMPSUB 11
#define RESET 12

typedef int Boolean;
typedef struct
{
	byte portB;
	byte portA;
	byte control;
	byte portC;
} Port;

extern Port *portopen();
#define CLOWIN 1
#define CLOWOUT 0
#define BIN 02
#define BOUT 0
#define AIN 0x10
#define AOUT 0
#define CUPOUT 0
#define CUPIN 08
#define BMODE0 0
#define AMODE0 0
#define MODESET 0x80

#define NCARDS 3
#define PADDR { 0x70l, 0x60l }
