.SUFFIXES: .o .c .h .run .y .l .ply .pl1

SRC = ghu.ply
OBJ = ghu.pl1

.c.o:
	cc -c -g -DYYDEBUG $*.c

.y.c:
	yacc -vd $*.y
	mv y.tab.c $*.c

.ply.pl1:
	yacc -vd $*.ply
	mv y.tab.c $*.plyout
	emacs $*.plyout
	mv $*.plyout $*.pl1
	mv y.tab.h y.tab.plhout
	emacs y.tab.plhout
	mv y.tab.plhout y.tab.incl.pl1

.l.c:
	lex $*.l
	mv lex.yy.c $*.c

.c.run:
	cc -o $* $*.c

ghu: $(OBJ)
