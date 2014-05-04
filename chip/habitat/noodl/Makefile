.SUFFIXES: .o .c .h .run

OBJECTS = y.tab.o noodlErrors.o noodlLexer.o noodlRoutines.o

SOURCES = noodl.y noodlErrors.c noodlLexer.c noodlRoutines.c noodlTypes.h

.c.o:
	cc -c -g $*.c

.c.run:
	cc -o $* $*.c

noodl: $(OBJECTS)
	cc -g -o noodl $(OBJECTS)

noodlErrors.o: noodlErrors.c noodlTypes.h

noodlLexer.o: noodlLexer.c noodlTypes.h y.tab.h

noodlRoutines.o: noodlRoutines.c noodlTypes.h

y.tab.o: y.tab.c noodlTypes.h
	cc -c -g -DYYDEBUG y.tab.c

y.tab.c y.tab.h: noodl.y
	yacc -d noodl.y

y.output: noodl.y
	yacc -vd noodl.y

cleanup:
	/bin/rm -f *.o y.output y.tab.c y.tab.h noodl

love:
	@echo "Not war?"

