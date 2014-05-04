/*
   noodlRoutines.c -- routines that do the work in the Noodl preprocessor.

   Chip Morningstar, Lucasfilm Ltd., 2-January-1986
 */

#include "noodlTypes.h"

extern int	yydebug;
int		lineNumber;

main(argc, argv)
  int	 argc;
  char	*argv[];
{
	long	theTime;

	lineNumber = 1;
	theTime = time(0);
	printf("/*\n   created by Noodl version 1.01 on %s */\n",
		ctime(&theTime));
	printf("#include \"looiDefs.h\"\n\n");
	yyparse();
}

  capabilityIdentifierType *
buildCapabilityIdentifier(identifier, preferredIndex)
  stringType	*identifier;
  int		 preferredIndex;
{
	capabilityIdentifierType	*newCapabilityIdentifier;

	newCapabilityIdentifier = typeAlloc(capabilityIdentifierType);
	newCapabilityIdentifier->identifier = identifier;
	newCapabilityIdentifier->preferredIndex = preferredIndex;
	return(newCapabilityIdentifier);
}

  identifierListHeadType *
buildIdentifierList(currentList, identifier, tag)
  identifierListHeadType	*currentList;
  stringType			*identifier;
  int				 tag;
{
	identifierListType	*newEntry;

	if (currentList == NULL) {
		currentList = typeAlloc(identifierListHeadType);
		newEntry = (identifierListType *) currentList;
		currentList->lastIdentifier = newEntry;
	} else {
		newEntry = typeAlloc(identifierListType);
	}
	newEntry->identifier = identifier;
	newEntry->tag = tag;
	if (currentList->lastIdentifier != newEntry)
		currentList->lastIdentifier->nextIdentifier = newEntry;
	else
		currentList->lastIdentifier->nextIdentifier = NULL;
	currentList->lastIdentifier = newEntry;
	return(currentList);
}

  void
outputCCode(codeBuffer)
  char	*codeBuffer;
{
	printf("%s\n", codeBuffer);
	free(codeBuffer);
}

  int
countListElements(list)
  identifierListType	*list;
{
	int	result;

	result = 0;
	while (list != NULL) {
		result++;
		list = list->nextIdentifier;
	}
	return(result);
}

stringType	*currentClassName = "";

  void
outputPropertyVectorDefinition(className, propertyList)
  stringType		*className;
  identifierListType	*propertyList;
{
	currentClassName = className;
	printf("typedef struct {\n");
	printf("	int	class;\n");
	printf("	int	location;\n");
	printf("	int	owner;\n");
	printf("	int	image;\n");
	while (propertyList != NULL) {
		printf("	int	%s;\n", propertyList->identifier);
		propertyList = propertyList->nextIdentifier;
	}
	printf("} %sPropertyVectorType;\n", className);
	printf("#undef self\n");
	printf("#define self ((%sPropertyVectorType *)objectTable[object>>CLASS_SHIFT])\n\n",
		className);
}

  char *
outputCapabilityDescriptionExplicit(capabilityIdentifier, argumentList, body)
  capabilityIdentifierType	*capabilityIdentifier;
  identifierListType		*argumentList;
  char				*body;
{
	identifierListType	*saveArgumentList;

	printf("  requestResultType\n");
	printf("%s_%sCapability(object, capabilityNumber", currentClassName,
		capabilityIdentifier->identifier);
	saveArgumentList = argumentList;
	while (argumentList != NULL) {
		printf(", %s", argumentList->identifier);
		argumentList = argumentList->nextIdentifier;
	}
	argumentList = saveArgumentList;
	printf(")\n");
	printf("	int	object;\n");
	printf("	int	capabilityNumber;\n");
	while (argumentList != NULL) {
		printf("	int	%s;\n", argumentList->identifier);
		argumentList = argumentList->nextIdentifier;
	}
	printf("{%s}\n\n", body);
	return(capabilityIdentifier->identifier);
}

  char *
outputCapabilityDescriptionImplicit(capabilityIdentifier, argumentList, func)
  capabilityIdentifierType	*capabilityIdentifier;
  identifierListType		*argumentList;
  char				*func;
{
	printf("requestResultType	%s();\n\n", func);
	return(func);
}

  void
outputCapabilityVectorDefinition(className, capabilityList)
  stringType		*className;
  identifierListType	*capabilityList;
{
	printf("capabilityVectorType %sCapabilityVector = {\n",
		className);
	while (capabilityList != NULL) {
		if (capabilityList->tag == EXPLICIT_CAPABILITY)
			printf("	%s_%sCapability,\n", className,
				capabilityList->identifier);
		else
			printf("	%s,\n", capabilityList->identifier);
		capabilityList = capabilityList->nextIdentifier;
	}
	printf("};\n\n");
}


  void
outputClassDescriptorDefinition(className, propertyList, capabilityList)
  stringType		*className;
  identifierListType	*propertyList;
  identifierListType	*capabilityList;
{
	printf("classDescriptorType %sClass = {\n", className);
	printf("	%sCapabilityVector,\n", className);
	printf("	%d,\n", countListElements(capabilityList));
	printf("	%d\n", countListElements(propertyList));
	printf("};\n\n");
}

  void
outputObjectListDefinition(objects)
  identifierListType	*objects;
{
	int	index;

	index = 0;
	printf("  void\ncreateObjects()\n{\n");
	while (objects != NULL) {
		printf("	objectTable[%d] = (propertyVectorType *)malloc(sizeof(%sPropertyVectorType));\n", index, objects->identifier);
		printf("	objectTable[%d]->class = &%sClass;\n", index,
			objects->identifier);
		objects = objects->nextIdentifier;
		++index;
	}
	printf("}\n\n");
}
