.SUFFIXES: .o .c .h .run

SRC = slur.c classNames.h
OBJ = slur.o

.c.o: $(SRC)
	cc -Wall -c -g $*.c

slur: $(OBJ)
	cc -g $(OBJ) -o slur

clean:
	rm -f slur.o slur
