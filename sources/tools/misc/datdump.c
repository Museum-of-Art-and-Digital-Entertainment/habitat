/* 
   datdump.c: Muddle .dat file dumper

   Chip Morningstar, 23-February-1987
 */

#include <stdio.h>

typedef int		bool;
#define	TRUE	1
#define FALSE	0

typedef unsigned short	word;
typedef unsigned char	byte;

#define typeAlloc(type)	((type *) malloc(sizeof(type)))
#define byteAlloc(size) ((byte *) malloc(size))
#define makeWord(lo, hi) ((lo) | ((hi) << 8))

#define TABLE_SIZE	256

typedef struct {
	word	 offset[TABLE_SIZE];
	byte	*data;
} datTable;

datTable	oldData;

byte  inputByte();
int   inputDatFile();
word  inputWord();
FILE *openFile();
void  dumpDatFile();

main(argc, argv)
  int	 argc;
  char	*argv[];
{
	int	 i;

	if (argc != 2) {
		fprintf(stderr, "wrong number of parameters\n");
		exit(1);
	}
	inputDatFile(argv[1], &oldData);
	dumpDatFile(&oldData);
}

  void
dumpDatFile(table)
  datTable	*table;
{
	int	 i, j;
	int	 size;
	word	 aWord;

	for (i=0; i<TABLE_SIZE; ++i) {
		aWord = table->offset[i];
		printf("%3d 0x%04x: ", i, aWord);
		if (aWord != 0xFFFF) {
			size = makeWord(table->data[aWord], table->data[aWord+1]);
			printf("%3d ", size);
			for (j=0; j<8; ++j) {
				if (j >= size) break;
				printf("0x%02x ", table->data[aWord+2+j]);
			}
			if (j < size) printf("...");
		}
		printf("\n");
	}
}

  int
inputDatFile(fileName, table)
  char		*fileName;
  datTable	*table;
{
	FILE	*infyle;
	int	 i;
	int	 size;
	word	 aWord;

	infyle = fopen(fileName, "r");
	for (i=0; i<TABLE_SIZE; ++i) {
		aWord = inputWord(infyle);
		if (aWord != 0xFFFF)
			aWord -= TABLE_SIZE * sizeof(word);
		table->offset[i] = aWord;
	}
	size = fileSize(fileName) - (TABLE_SIZE * sizeof(word));
	table->data = byteAlloc(size);
	for (i=0; i<size; ++i)
		table->data[i] = inputByte(infyle);
	fclose(infyle);
	return(size);
}

  byte
inputByte(fyle)
  FILE	*fyle;
{
	return(getc(fyle));
}

  word
inputWord(fyle)
  FILE	*fyle;
{
	byte	lo, hi;

	lo = inputByte(fyle);
	hi = inputByte(fyle);
	return(makeWord(lo, hi));
}

#include <sys/types.h>
#include <sys/stat.h>

  int
fileSize(name)
  char	*name;
{
	struct stat	statbuf;

	if (stat(name, &statbuf) != 0) {
		fprintf(stderr, "can't read file '%s'\n", name);
		perror("Unix says");
		return(-1);
	} else
		return(statbuf.st_size);
}
