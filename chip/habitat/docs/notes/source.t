		A quick guide to the Habitat source code

There are five major chunks of code:

	Actions -- the action code for the various objects
	Main -- main loop, common storage declaration, common macros
	Io -- telecommunications, keyboard, sound, screen driver, etc.
	Heap -- disk database and object memory manager
	Gr -- graphics rendering and animation sequencing

The files within each of these groups have been printed alphabetically.  The
last four groups get linked into the main program.  The first (Actions) goes
onto the object database disk.  The object database disk also includes the
sound and image definitions.  Though there is source for these, I have not
included it since it consists simply of byte data declaration statements, and
the bulk of this code exceeds that of the rest of the source code by nearly a
factor of two.

Included with the Actions code is the file 'beta.mud', which is the control
file that generates the object disk database.  This is input to our utility
'muddle', which generates the object database files from the sound, image and
action binaries.  The format should be relatively self-explanatory.  Muddle
also generates the widely used include file 'class_equates.m'.

I've also thrown in the Makefile which shows how all the pieces fit together.

Our assembler is a little unusual, and since we make heavy use of its macro
capabilities, I've also included a copy of the assembler writeup.
