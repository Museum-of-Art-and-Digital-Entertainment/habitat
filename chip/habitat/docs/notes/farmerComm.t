The Microcosm OBJECT Message Packet:

How it is built:

       byte	Value	Purpose
	+0	'Z'	(sync)		\
	+1		Hammed CRC	 |
	+2		    ''		 |
	+3		    ''		  \	Standard Packet Header
	+4		    ''		  /	all msgs use this design
	+5		TX sequence #	 |
	+6		RX sequence #	 |
	+7	0x20 	data type	/
	+8	'M'	Microcosm ID byte
	+9		Sequence/Continuation byte
	+10 *		Object # (noid)
	+11 *		Request #
	+12 - 127 *	Parameters

* = All messages are encoded starting at byte 10, so these offsets refer
	to AFTER decoding (as both the OBJECT # and the REQUEST # could
	be forbidden values).

The encoding scheme used is: 
   When a forbidden character needs to be sent, send an ESCAPE, exclusive-or
the character with $55 and send it. The forbidden characters are:
$0d,$0e,ESCAPE,$8d,$8e,$ff. ESCAPE here means $5d.
   AGAIN, encoding/decoding starts at byte +10.


BYTE	+8:	Microcosm ID Byte

	This byte will ALWAYS remain constant for Microcosm OBJECT messages.
Of course, Qlink messages like 'LO' (log-off) will put the appropriate value
here. 'M' is the current working Microcosm ID byte, if this is already being
used by another application, plsease assign us a character.

BYTE	+9:	Sequence/Continuation Byte

	This byte supplies 2 pieces of information, what Microcosm message
number this is & 'is there more to follow?'. It looks like this:

01c0xxxx

Where:
	xxxx	is the Sequence Number 0-15 (wraps around)
	c	is the 'continued' flag bit. 1 = more coming

Resulting codes are printable Ascii:

	@ABCDEFGHIJKLMNO	for 'not continued'
	`abcdefghijklmno	for 'continued'

There is a SPECIAL Sequence/Continuation value: 'Z' (or 'z' for continued)

'Z' is used for the 'Phantom Request'. If the host needs to send an OBJECT
message to a user, and the user has not issued a request. The seq/cont byte
will be 'Z' (an avatar talking to the user is a good example).


BYTE	+10:	Object Number *

   This is the NOID (see document 'Looi'). Range 0-255. Encoded.

BYTE	+11:	Request Number *

   Range 0-255. 0-127 for general messages. 128-255 for object specific.
   Encoded.

BYTES	+12 up:	Parameters/Data	*

   Encoded. Object knows what to do with these.

