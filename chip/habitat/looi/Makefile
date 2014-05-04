.SUFFIXES: .o .c .h .run .n

OBJECTS = looi.o objectDatabase.o

SOURCES = looi.c objectDatabase.c looiDefs.h

.c.o:
	cc -c -g $*.c

.n.c:
	../noodl/noodl < $*.n > $*.c

.c.run:
	cc -o $* $*.c

looi: $(OBJECTS)
	cc -g -o looi $(OBJECTS)

looi.o: looi.c looiDefs.h

objectDatabase.o: objectDatabase.c looiDefs.h

objectDatabase.c: objectDatabase.n

cleanup:
	/bin/rm -f *.o looi

love:
	@echo "Not war?"

