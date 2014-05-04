Muddle currently resides in /net/moth/u0/chip/muddle/muddle

To use it:
	muddle < inputfile

It writes a listing to the standard output and produces four data files named
"class.dat", "action.dat", "image.dat" and "sound.dat".  Each file consists of
a 256 word table followed by the data record.  Each data record begins with a
length word, followed by the actual data itself.  The data records in the
"class.dat" file are class descriptors.  They have this structure:

	word	class descriptor length (i.e., the length word)
	byte	number of images
	byte	number of sounds
	byte	number of actions
	byte	offset from start of class descriptor to first image
	byte	offset from start of class descriptor to first sound
	byte	offset from start of class descriptor to first action
	word	instance descriptor length
	bytes	random class-specific data
	bytes	image numbers
	bytes	sound numbers
	bytes	action numbers
