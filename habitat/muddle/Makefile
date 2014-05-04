.SUFFIXES: .o .c .h .run .y .l

SRC = buildStuff.c lexer.l main.c muddle.y output.c semantics.c symbols.c
OBJ = buildStuff.o main.o muddle.o lexer.o output.o semantics.o symbols.o

.c.o:
	cc -c -g $*.c

.y.c:
	yacc -d $*.y
	mv y.tab.c $*.c

.l.c:
	lex $*.l
	mv lex.yy.c $*.c

.c.run:
	cc -o $* $*.c

puddle: puddle.c
	cc -g puddle.c -o puddle

muddle: $(OBJ)
	cc -g $(OBJ) -o muddle

muddle.o: muddle.c muddleTypes.h muddleGlobals.h
#muddle.c: muddle.y

lexer.o: lexer.c
lexer.c: lexer.l

main.o: main.c muddleTypes.h muddleGlobals.h

buildStuff.o: buildStuff.c muddleTypes.h

output.o: output.c muddleTypes.h muddleGlobals.h

semantics.o: semantics.c muddleTypes.h muddleGlobals.h

symbols.o: symbols.c muddleTypes.h muddleGlobals.h
