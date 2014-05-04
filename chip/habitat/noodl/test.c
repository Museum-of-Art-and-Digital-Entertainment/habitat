/*
   created by Looi version 1.01 on Fri Jan  3 16:52:57 1986
 */
#include "looiDefs.h"


	main() {
		printf("C-stuff-1\n");
	}

typedef struct {
	int	class;
	int	location;
	int	owner;
	int	image;
	int	zip;
	int	zap;
	int	zim;
	int	zam;
} fooPropertyVectorType;

  requestResultType
foo_snozCapability(object, capabilityNumber, arg1)
	int	object;
	int	capabilityNumber;
	int	arg1;
{
		printf("C-stuff-2\n");
	}

  requestResultType
foo_sneezCapability(object, capabilityNumber)
	int	object;
	int	capabilityNumber;
{
		printf("C-stuff-3\n");
	}

  requestResultType
foo_snuuuzCapability(object, capabilityNumber, arg1, arg2, arg3)
	int	object;
	int	capabilityNumber;
	int	arg1;
	int	arg2;
	int	arg3;
{
		printf("C-stuff-4\n");
	}

capabilityVectorType fooCapabilityVector = {
	foo_snozCapability,
	foo_sneezCapability,
	foo_snuuuzCapability,
};

classDescriptorType fooClass = {
	fooCapabilityVector,
	3,
	4
};

typedef struct {
	int	class;
	int	location;
	int	owner;
	int	image;
	int	oop;
} barPropertyVectorType;

  requestResultType
bar_wopCapability(object, capabilityNumber)
	int	object;
	int	capabilityNumber;
{
		printf("C-stuff-5\n");
	}

  requestResultType
bar_bopCapability(object, capabilityNumber, foo)
	int	object;
	int	capabilityNumber;
	int	foo;
{
		printf("C-stuff-6\n");
	}

capabilityVectorType barCapabilityVector = {
	bar_wopCapability,
	bar_bopCapability,
};

classDescriptorType barClass = {
	barCapabilityVector,
	2,
	1
};

