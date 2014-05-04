.SUFFIXES: .o .c .h .run

SRC = slur.c classNames.h
OBJ = slur.o

.c.o:
	cc -c -g $*.c

.c.run:
	cc -o $* $*.c

slur.o: $(SRC)

slur: $(OBJ) classNames.h
	cc -g $(OBJ) -o slur
