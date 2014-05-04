.SUFFIXES: .o .c .h .run .y .l

GOBJ = griddle.o gmain.o glexer.o build.o cv.o gexpr.o gexec.o debug.o indir.o
FOBJ = griddle.o fmain.o flexer.o build.o cv.o fexpr.o fexec.o debug.o fred.o fred2.o fscreen.o sun.o map.o

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

griddle: $(GOBJ)
	cc -g $(GOBJ) -o griddle

fred: $(FOBJ)
	cc -g $(FOBJ) -o fred -lcurses -ltermlib

all: griddle fred

dumpfstats: dumpfstats.c
	cc -g dumpfstats.c -o dumpfstats

flushfstats: flushfstats.c
	cc -g flushfstats.c -o flushfstats

griddle.o: griddle.c griddleDefs.h
#griddle.c: griddle.y

alloc.o: alloc.c

build.o: build.c griddleDefs.h

gmain.o: main.c griddleDefs.h
	cc -c -g -DYYDEBUG main.c
	mv main.o gmain.o

fmain.o: main.c griddleDefs.h
	cc -c -g -DYYDEBUG -DFRED main.c
	mv main.o fmain.o

gexec.o: exec.c griddleDefs.h
	cc -c -g -DYYDEBUG exec.c
	mv exec.o gexec.o

fexec.o: exec.c griddleDefs.h
	cc -c -g -DYYDEBUG -DFRED exec.c
	mv exec.o fexec.o

debug.o: debug.c griddleDefs.h

cv.o: cv.c griddleDefs.h

glexer.o: lexer.c griddleDefs.h y.tab.h
	cc -c -g -DYYDEBUG lexer.c
	mv lexer.o glexer.o

flexer.o: lexer.c griddleDefs.h y.tab.h
	cc -c -g -DYYDEBUG -DFRED lexer.c
	mv lexer.o flexer.o

gexpr.o: expr.c griddleDefs.h y.tab.h
	cc -c -g -DYYDEBUG expr.c
	mv expr.o gexpr.o

fexpr.o: expr.c griddleDefs.h y.tab.h
	cc -c -g -DYYDEBUG -DFRED expr.c
	mv expr.o fexpr.o

indir.o: indir.c griddleDefs.h

fred.o: fred.c griddleDefs.h prot.h
	cc -c -g -DDATE=\""`date`\"" fred.c

fred2.o: fred2.c griddleDefs.h

fscreen.o: fscreen.c griddleDefs.h
