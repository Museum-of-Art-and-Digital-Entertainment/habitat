#include <stdio.h>

typedef struct {
	int			 tag;
} alloc;

#define MAXTAG 40;
static int allocCount[MAXTAG] = {
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
};
static int  freeCount[MAXTAG] = {
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
};
static int highTag = 0;

  char *
mymalloc(size, tag)
  int	size;
  int	tag;
{
	alloc	*result;

	result = (alloc *) malloc(size + sizeof(alloc));
	if (tag > highTag)
		highTag = tag;
	allocCount[tag]++;
	result->tag = tag;
	++result;
	return((char *) result);
}

  void
myfree(ptr)
  alloc	*ptr;
{
	--ptr;
	freeCount[ptr->tag]--;
	free(ptr);
}

  void
dumpAllocOrphans()
{
	int	i;

	for (i=0; i<=highTag; ++i)
		printf("%d %d/%d\n", i, allocCount[i], freeCount[i]);
}
