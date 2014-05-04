/*
   created by Noodl version 1.01 on Mon Jan  6 11:29:14 1986
 */
#include "looiDefs.h"


bool			 done;

typedef struct {
	int	class;
	int	location;
	int	owner;
	int	image;
	int	testProperty;
} systemJunkPropertyVectorType;
#undef self
#define self ((systemJunkPropertyVectorType *)objectTable[object>>CLASS_SHIFT])

  requestResultType
systemJunk_addCapability(object, capabilityNumber, a, b)
	int	object;
	int	capabilityNumber;
	int	a;
	int	b;
{
		return(a+b);
	}

  requestResultType
systemJunk_printCapability(object, capabilityNumber, n)
	int	object;
	int	capabilityNumber;
	int	n;
{
		printf("n = %d\n", n);
		return(1);
	}

  requestResultType
systemJunk_setCapability(object, capabilityNumber, n)
	int	object;
	int	capabilityNumber;
	int	n;
{
		self->testProperty = n;
		return(n);
	}

  requestResultType
systemJunk_getCapability(object, capabilityNumber)
	int	object;
	int	capabilityNumber;
{
		return(self->testProperty);
	}

requestResultType	getpid();

capabilityVectorType systemJunkCapabilityVector = {
	systemJunk_addCapability,
	systemJunk_printCapability,
	systemJunk_setCapability,
	systemJunk_getCapability,
	getpid,
};

classDescriptorType systemJunkClass = {
	systemJunkCapabilityVector,
	5,
	1
};

typedef struct {
	int	class;
	int	location;
	int	owner;
	int	image;
	int	tokenProperty1;
	int	tokenProperty2;
} secondClassPropertyVectorType;
#undef self
#define self ((secondClassPropertyVectorType *)objectTable[object>>CLASS_SHIFT])

  requestResultType
secondClass_speakCapability(object, capabilityNumber)
	int	object;
	int	capabilityNumber;
{
		printf("Hi, I'm a second class class!\n");
		return(0);
	}

  requestResultType
secondClass_finishCapability(object, capabilityNumber)
	int	object;
	int	capabilityNumber;
{
		done = 1;
		return(-1);
	}

requestResultType	getpid();

capabilityVectorType secondClassCapabilityVector = {
	secondClass_speakCapability,
	secondClass_finishCapability,
	getpid,
};

classDescriptorType secondClassClass = {
	secondClassCapabilityVector,
	3,
	2
};

  void
createObjects()
{
	objectTable[0] = (propertyVectorType *)malloc(sizeof(systemJunkPropertyVectorType));
	objectTable[0]->class = &systemJunkClass;
	objectTable[1] = (propertyVectorType *)malloc(sizeof(systemJunkPropertyVectorType));
	objectTable[1]->class = &systemJunkClass;
	objectTable[2] = (propertyVectorType *)malloc(sizeof(secondClassPropertyVectorType));
	objectTable[2]->class = &secondClassClass;
	objectTable[3] = (propertyVectorType *)malloc(sizeof(systemJunkPropertyVectorType));
	objectTable[3]->class = &systemJunkClass;
}

