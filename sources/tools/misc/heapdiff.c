#include <stdio.h>

typedef unsigned char	byte;

typedef int		bool;
#define FALSE 0
#define TRUE 1

typedef struct {
	byte	objecthi[256],  objectlo[256];
	byte	classref[256],  classhi[256],  classlo[256];
	byte	imageref[256],  imagehi[256],  imagelo[256];
	byte	soundref[256],  soundhi[256],  soundlo[256];
	byte	actionref[256], actionhi[256], actionlo[256];
} resourceInfo;

#define	BOTTOM (0xb500)

#define peekw(loc,buf) (buf[loc] + buf[(loc)+1]*256)
#define peekb(loc,buf) (buf[loc])

int		sort_count;

typedef struct {
	int	sort;
	int	type;
	int	oset;
	int	size;
	int	reff;
} tableEntry;

tableEntry	table1[1280];
tableEntry	table2[1280];
byte		mem1[16384];
byte		mem2[16384];
resourceInfo	res1;
resourceInfo	res2;

main (argc, argv)
  int     argc;
  char   *argv[];
{
	int	count1, count2;

	if (argc != 3) {
		fprintf(stderr, "usage: heapdiff file1 file2\n");
		exit(1);
	}
	count1 = read_data(argv[1], mem1, table1, &res1);
	count2 = read_data(argv[2], mem2, table2, &res2);
	memDiff();
/*	printf("*** %s ***\n", argv[1]);
	print_it(table1, mem1, count1);
	printf("*** %s ***\n", argv[2]);
	print_it(table2, mem2, count2);*/
}

getm(buf, count, fyle)
  byte	*buf;
  int	 count;
  FILE	*fyle;
{
	while (count-- > 0)
		*buf++ = getc(fyle);
}

read_data(filename, membuf, table, res)
  char		*filename;
  byte		*membuf;
  tableEntry	*table;
  resourceInfo	*res;
{
	FILE	*fyle;
	int	 i;

	if ((fyle = fopen(filename, "r")) == NULL) {
		fprintf(stderr, "heapdiff: can't open '%s'\n", filename);
		exit(1);
	}
	getm(res->classhi, 256, fyle);
	getm(res->classlo, 256, fyle);
	getm(res->objecthi, 256, fyle);
	getm(res->objectlo, 256, fyle);
	getm(res->soundhi, 256, fyle);
	getm(res->soundlo, 256, fyle);
	getm(res->imagehi, 256, fyle);
	getm(res->imagelo, 256, fyle);
	getm(res->actionhi, 256, fyle);
	getm(res->actionlo, 256, fyle);
	getm(res->classref, 256, fyle);
	getm(res->soundref, 256, fyle);
	getm(res->imageref, 256, fyle);
	getm(res->actionref, 256, fyle);
	getm(membuf, 16384, fyle);

	sort_count = 0;
	for (i=255; i>=0; --i) {
	    if (res->classhi[i] != 0)
		if ((res->classref[i] & 0x3f) != 0)
		    add_it(table, membuf, res->classhi[i],
			res->classlo[i], 1, i, res->classref[i]);
		else
		    add_it(table, membuf, res->classhi[i],
			res->classlo[i], 6, i, res->classref[i]);
	    if (res->imagehi[i] != 0)
		if (res->imageref[i] != 0)
		    add_it(table, membuf, res->imagehi[i],
			res->imagelo[i], 2, i, res->imageref[i]);
	        else
		    add_it(table, membuf, res->imagehi[i],
			res->imagelo[i], 7, i, res->imageref[i]);
	    if (res->soundhi[i] != 0)
		if (res->soundref[i] != 0)
		    add_it(table, membuf, res->soundhi[i],
			res->soundlo[i], 3, i, res->soundref[i]);
		else
		    add_it(table, membuf, res->soundhi[i],
			res->soundlo[i], 8, i, res->soundref[i]);
	    if (res->actionhi[i] != 0)
		if (res->actionref[i] != 0)
		    add_it(table, membuf, res->actionhi[i],
			res->actionlo[i], 4, i, res->actionref[i]);
		else
		    add_it(table, membuf, res->actionhi[i],
			res->actionlo[i], 9, i, res->actionref[i]);
	    if (res->objecthi[i] != 0)
		add_it(table, membuf, res->objecthi[i],
			res->objectlo[i], 0, i, 1);
	}
	sort_it(table);
	return(sort_count);
}

add_it(table, membuf, hi, lo, type, oset, ref)
  tableEntry	*table;
  byte		*membuf;
  int		 hi;
  int		 lo;
  int		 type;
  int		 oset;
  int		 ref;
{
	int	temp;

	temp = hi*256 + lo - BOTTOM;
	table[sort_count].sort = temp;
	table[sort_count].type = type;
	table[sort_count].oset = oset;
	table[sort_count].size = peekw(temp, membuf);
	table[sort_count].reff = ref;
	sort_count++;
}

sort_it(table)
  tableEntry	*table;
{
	int		i, j;
	int		largest_at;
	int		largest_value;
	tableEntry	temp;

	for (i=sort_count-1; i>0; --i) {
		largest_at = i;
		largest_value = table[i].sort;
		for (j=i-1; j>=0; --j) {
			if (largest_value < table[j].sort) {
				largest_at = j;
				largest_value = table[j].sort;
			}
		}
		temp = table[i];
		table[i] = table[largest_at];
		table[largest_at] = temp;
	}
}

print_it(table, membuf, count)
  tableEntry	*table;
  byte		*membuf;
  int		 count;
{
	int		i;
	int		mem_loc;
	int		mem_use;
	static	char	*types[] = {
		"Object ",
		"Class  ",
		"Image  ",
		"Sound  ",
		"Action ",
		"*Object",
		"*Class ",
		"*Image ",
		"*Sound ",
		"*Action"
	};

	mem_loc = 0;
	mem_use = 0;
	for (i=0; i<count; ++i) {
		if (mem_loc != table[i].sort) {
			printf("hole at %04x  ", mem_loc + BOTTOM);
			printf("(%04x %04x)", peekw(mem_loc, membuf),
				peekw(mem_loc+2, membuf));
			if (mem_loc+peekw(mem_loc, membuf) != table[i].sort)
			    printf("ERROR! should be a data block here!");
			printf("\n");
		}
		printf("%04x  ", table[i].sort+BOTTOM);
		printf("%s  ", types[table[i].type]);
		printf("%3d  ", table[i].oset);
		printf("%5d  ", table[i].size);
		printf("%2x  ", table[i].reff);
		printf("\n");
		mem_loc = table[i].sort+table[i].size;
		if (table[i].type < 5) mem_use = mem_use +
				table[i].size;
	}
	printf	("%04x %d\n", mem_use, mem_use);
}

memDiff()
{
	int	i;

	for (i=0; i<256; ++i)
		if (res1.objecthi[i] == 0 && res2.objecthi[i] != 0)
			printf("add object %d\n", i);
		else if (res1.objecthi[i] != 0 && res2.objecthi[i] == 0)
			printf("delete object %d\n", i);
		else if (res1.objecthi[i] != 0 && res2.objecthi[i] != 0)
			resourceDiff("object", i,
				res1.objectlo[i], res1.objecthi[i],
				res2.objectlo[i], res2.objecthi[i]);

	for (i=0; i<256; ++i)
		if (res1.classhi[i] == 0 && res2.classhi[i] != 0)
			printf("add class %d\n", i);
		else if (res1.classhi[i] != 0 && res2.classhi[i] == 0)
			printf("delete class %d\n", i);
		else if (res1.classhi[i] != 0 && res2.classhi[i] != 0) {
			resourceDiff("class", i,
				res1.classlo[i], res1.classhi[i],
				res2.classlo[i], res2.classhi[i]);
			if (res1.classref[i] != res2.classref[i])
				printf("refct class %d: %d to %d\n",
				    i, res1.classref[i], res2.classref[i]);
		}

	for (i=0; i<256; ++i)
		if (res1.imagehi[i] == 0 && res2.imagehi[i] != 0)
			printf("add image %d\n", i);
		else if (res1.imagehi[i] != 0 && res2.imagehi[i] == 0)
			printf("delete image %d\n", i);
		else if (res1.imagehi[i] != 0 && res2.imagehi[i] != 0) {
			resourceDiff("image", i,
				res1.imagelo[i], res1.imagehi[i],
				res2.imagelo[i], res2.imagehi[i]);
			if (res1.imageref[i] != res2.imageref[i])
				printf("refct image %d: %d to %d\n",
				    i, res1.imageref[i], res2.imageref[i]);
		}

	for (i=0; i<256; ++i)
		if (res1.soundhi[i] == 0 && res2.soundhi[i] != 0)
			printf("add sound %d\n", i);
		else if (res1.soundhi[i] != 0 && res2.soundhi[i] == 0)
			printf("delete sound %d\n", i);
		else if (res1.soundhi[i] != 0 && res2.soundhi[i] != 0) {
			resourceDiff("sound", i,
				res1.soundlo[i], res1.soundhi[i],
				res2.soundlo[i], res2.soundhi[i]);
			if (res1.soundref[i] != res2.soundref[i])
				printf("refct sound %d: %d to %d\n",
				    i, res1.soundref[i], res2.soundref[i]);
		}

	for (i=0; i<256; ++i)
		if (res1.actionhi[i] == 0 && res2.actionhi[i] != 0)
			printf("add action %d\n", i);
		else if (res1.actionhi[i] != 0 && res2.actionhi[i] == 0)
			printf("delete action %d\n", i);
		else if (res1.actionhi[i] != 0 && res2.actionhi[i] != 0) {
			resourceDiff("action", i,
				res1.actionlo[i], res1.actionhi[i],
				res2.actionlo[i], res2.actionhi[i]);
			if (res1.actionref[i] != res2.actionref[i])
				printf("refct action %d: %d to %d\n",
				    i, res1.actionref[i], res2.actionref[i]);
		}
}

resourceDiff(type, number, r1lo, r1hi, r2lo, r2hi)
  char	*type;
  int	 number;
  int	 r1lo, r1hi, r2lo, r2hi;
{
	int	size1, size2;
	int	addr1, addr2;
	byte	byte1, byte2;
	int	i;
	bool	mismatch;

	addr1 = r1lo + r1hi*256;
	addr2 = r2lo + r2hi*256;
	size1 = peekw(addr1, mem1);
	size2 = peekw(addr2, mem2);
	if (size1 != size2)
		printf("size %s %d: %d to %d\n", type, number,
			size1, size2);
	else {
		mismatch = FALSE;
		for (i=0; i<size1; ++i) {
			byte1 = peekb(addr1 + i, mem1);
			byte2 = peekb(addr2 + i, mem2);
			if (byte1 != byte2) {
				if (!mismatch) {
				       mismatch = TRUE;
				       printf("change %s %d:\n", type, number);
				}
				printf(" 0x%02x (0x%04x 0x%04x): 0x%02x 0x%02x\n",
					i, addr1+i, addr2+i, byte1, byte2);
			}
		}
	}
}
