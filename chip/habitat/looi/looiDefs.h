/*
   looiDefs.h: type declarations for Looi and Noodl run time

   Chip Morningstar, Lucasfilm Ltd., 3-January-1986
*/
typedef int			  bool;
#define TRUE	1
#define FALSE	0

typedef int			  noidType;
#define CLASS_MASK	0x3FF
#define CLASS_LIMIT	CLASS_MASK+1
#define CLASS_SHIFT	10
#define OBJECT_LIMIT	200

#define lookupPropertyVector(noid) (objectTable[(noid) >> CLASS_SHIFT])

typedef int			  argType;

typedef int			  requestResultType;

typedef requestResultType	(*capabilityFunctionType)();

typedef requestResultType     (*(*capabilityVectorArrayPtr))();

typedef requestResultType	(*capabilityVectorType[])();

typedef struct {
	capabilityVectorArrayPtr capabilityVector;
	int			 capabilityCount;
	int			 propertyCount;
} classDescriptorType;

typedef struct {
	classDescriptorType	*class;
	int			 location;
	int			 owner;
	int			 image;
} propertyVectorType;

/* global tables */

propertyVectorType	*objectTable[OBJECT_LIMIT];
classDescriptorType	classTable[CLASS_LIMIT];
