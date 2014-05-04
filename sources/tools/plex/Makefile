.SUFFIXES: .o .c .h .run .y .l

SRC = main.c plex.y lexer.l buildStuff.c dump.c execute.c join.c print.c\
symbols.c 2danalyze.c 2dparse.c

OBJ = main.o plex.o lexer.o buildStuff.o dump.o execute.o join.o print.o\
symbols.o 2danalyze.o 2dparse.o

.c.o:
	cc -c -g -DYYDEBUG $*.c

.y.c:
	yacc -vd $*.y
	mv y.tab.c $*.c

.l.c:
	lex $*.l
	mv lex.yy.c $*.c

.c.run:
	cc -o $* $*.c

plex: $(OBJ)
	cc -g $(OBJ) -o plex

param: param.c
	cc -O -o param param.c

plex.o: plex.c plexTypes.h plexGlobals.h
#plex.c: plex.y

lexer.o: lexer.c
lexer.c: lexer.l

main.o: main.c plexTypes.h plexGlobals.h

buildStuff.o: buildStuff.c plexTypes.h

dump.o: dump.c plexTypes.h

execute.o: execute.c plexTypes.h plexGlobals.h

join.o: join.c plexTypes.h plexGlobals.h

print.o: print.c plexTypes.h plexGlobals.h

symbols.o: symbols.c plexTypes.h plexGlobals.h

2danalyze.o: 2danalyze.c plexTypes.h plexGlobals.h

2dparse.o: 2dparse.c plexTypes.h plexGlobals.h
