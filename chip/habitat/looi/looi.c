/* 
   Looi: the Low Overhead Object Interpreter

   Looi is just a loop that processes requests.  A request consists of three
   parts: an OBJECT to which the request is directed (indicated by a NOID,
   Numeric Object IDentifier), a CAPABILITY of said object which is the
   action to be taken (indicated by a CAPABILITY NUMBER) and (optionally) one
   or more ARGUMENTS (which can be anything at all).

   The canonical Looi performs the following operations in order:

	1) Computes the location of the object's PROPERTY VECTOR in memory
   from the NOID.

	2) Extracts the address of object's CLASS DESCRIPTOR from the
   property vector.

	3) Extracts the address of the class's CAPABILITY VECTOR from the
   class descriptor.

	4) Uses the CAPABILITY NUMBER as an index into the capability vector
   to locate a CAPABILITY FUNCTION.

	5) Calls the capability function using the NOID, CAPABILITY NUMBER
   and ARGUMENTS as parameters.

	6) The value passed back by the capability function is returned as
   the RESULT of the request.

   Now in practice, of course, we won't want to waste a lot of overhead on
   extra hash functions, table mappings, array lookups, and so on.  For the
   sake of speed we may eventually want to modify the above procedure to hash
   directly from the noid to the capability vector.  That, however, is
   optimization.

   In summary then, the mapping is:
	noid ->
		property vector ->
			class descriptor ->
				capability vector ->
					capability procedure ->
						result
 */

#include <stdio.h>
#include "looiDefs.h"

bool			done = FALSE;
void			unfortunateError();

  requestResultType
looi(noid, capabilityNumber, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
  noidType	noid;
  int		capabilityNumber;
  argType	arg1;
  argType	arg2;
  argType	arg3;
  argType	arg4;
  argType	arg5;
  argType	arg6;
  argType	arg7;
  argType	arg8;
{
	classDescriptorType	*classDescriptor;

	classDescriptor = lookupPropertyVector(noid)->class;
	if (capabilityNumber > classDescriptor->capabilityCount ||
			capabilityNumber < 0) {
		unfortunateError("capability number out of range");
		return(0);
	}
	return((*(classDescriptor->capabilityVector[capabilityNumber]))
		(noid, capabilityNumber, arg1, arg2, arg3, arg4, arg5, arg6,
		arg7, arg8));
}

main(argc, argv)
  int	 argc;
  char	*argv[];
{
	noidType	noid;
	int		capabilityNumber;
	argType		arg1;
	argType		arg2;
	argType		arg3;
	argType		arg4;
	argType		arg5;
	argType		arg6;
	argType		arg7;
	argType		arg8;

	void		getRequest();
	void		putResult();

	done = FALSE;
	createObjects();
	while (!done) {
		getRequest(&noid, &capabilityNumber, &arg1, &arg2, &arg3,
			&arg4, &arg5, &arg6, &arg7, &arg8);
		putResult(looi(noid, capabilityNumber, arg1, arg2, arg3, arg4,
			arg5, arg6, arg7, arg8));
	}
}

  void
getRequest(noidPtr, capabilityNumberPtr, arg1Ptr, arg2Ptr, arg3Ptr, arg4Ptr,
		arg5Ptr, arg6Ptr, arg7Ptr, arg8Ptr)
  noidType	*noidPtr;
  int		*capabilityNumberPtr;
  argType	*arg1Ptr;
  argType	*arg2Ptr;
  argType	*arg3Ptr;
  argType	*arg4Ptr;
  argType	*arg5Ptr;
  argType	*arg6Ptr;
  argType	*arg7Ptr;
  argType	*arg8Ptr;
{
	char	*lineBuffer[100];

	printf("\nrequest? (noid capability# arg1 ... arg8)\n");
	printf(" ? "); fflush(stdout);
	gets(lineBuffer);
	sscanf(lineBuffer, "%d %d %d %d %d %d %d %d %d %d", noidPtr,
		capabilityNumberPtr, arg1Ptr, arg2Ptr, arg3Ptr, arg4Ptr,
		arg5Ptr, arg6Ptr, arg7Ptr, arg8Ptr);
	*noidPtr <<= CLASS_SHIFT;
}

  void
putResult(result)
  requestResultType	result;
{
	printf("==> 0x%x\n", result);
}

  void
unfortunateError(error)
  char	*error;
{
	printf("*** %s ***\n", error);
}
