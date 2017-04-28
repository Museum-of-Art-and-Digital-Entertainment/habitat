.SUFFIXES: .o .c .h .run .y .l

SRC = buildStuff.c lexer.l main.c muddle.y output.c joutput.c semantics.c symbols.c
OBJ = buildStuff.o main.o muddle.o lexer.o semantics.o symbols.o output.o joutput.o

CFLAGS=-m32 -O2 -ansi -DYYDEBUG
YACC=bison -y
LEX=flex

#CC=cc
CC=gcc

.c.o:
	$(CC) $(CFLAGS) -c -g $*.c

.y.c:
	$(YACC) -d $*.y
	mv -f y.tab.c $*.c

.l.c:
	$(LEX) $*.l
	mv -f lex.yy.c $*.c

.c.run:
	$(CC) $(CFLAGS) -o $* $*.c

jmuddle: $(OBJ)
	$(CC) $(CFLAGS) -g buildStuff.o main.o muddle.o lexer.o semantics.o symbols.o joutput.o -o jmuddle

muddle: $(OBJ)
	$(CC) $(CFLAGS) -g buildStuff.o main.o muddle.o lexer.o semantics.o symbols.o output.o -o muddle

puddle: puddle.c
	$(CC) $(CFLAGS) -g puddle.c -o puddle

clean:
	rm -f *.o lexer.c muddle.c y.tab.h jmuddle.exe muddle.exe puddle.exe

all:	jmuddle muddle puddle

muddle.o: muddle.c muddleTypes.h muddleGlobals.h
muddle.c: muddle.y

lexer.o: lexer.c
lexer.c: lexer.l

main.o: main.c muddleTypes.h muddleGlobals.h

buildStuff.o: buildStuff.c muddleTypes.h

output.o: output.c muddleTypes.h muddleGlobals.h
joutput.o: joutput.c muddleTypes.h muddleGlobals.h

semantics.o: semantics.c muddleTypes.h muddleGlobals.h

symbols.o: symbols.c muddleTypes.h muddleGlobals.h
