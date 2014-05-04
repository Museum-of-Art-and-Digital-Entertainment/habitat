Avatar customization bytes:
	The data returned by the customizer on the C64 consists of the
following:

	<head style> <head pattern> <orientation> <custom1> <custom2>

NOTE: in the interest of clarity, I've renamed these slightly from the names
given in the previous document describing the new user customizer.  The
content has not changed however.

	<head style> goes into the Style variable of the head.  It should be a
number in the range 1 to N, where N is the number of heads available
(currently N is 63 and growing daily).

	<head pattern> goes into the Orientation variable of the head, and
determines the color/pattern of the hair.  Its form is:

		xPPPPxxx

where PPPP is a four-bit number (i.e., 0 to 15) that indicates what pattern to
use.  Pattern 15 is allowed but discouraged as it chooses the color-ram color
which varies with screen position.  The 'x' bits are the other bits of the
orientation and shouldn't be messed with.  When creating a new avatar it is
sufficient to set these to 0.  In any case the byte passed back by the
customizer can be stuffed wholesale into the head's orientation.

These bytes are properties of a head object which should be created and
contained in the HEAD containership slot of the avatar (slot 2 counting from
0).

	<orientation> goes into the Orientation variable of the avatar, and
determines a number of things.  Its form is:

		SHHHHxxx

where the S bit determines sex (0==male, 1==female), and the four bit number
HHHH determines height (0 is tallest, 15 is shortest).  As with the head
orientation, the xxx bits should not be touched in operation but can be set to
zero on initialization, and the byte returned by the customizer on the C64 can
be used wholesale.

	<custom1> goes into the Customize(1) variable of the avatar, and
determines leg and torso patterns.  Its form is

		LLLLTTTT

where LLLL is the leg pattern (in the range 0-15) and TTTT is the torso
pattern (also in the range 0-15).  The selection of patterns is the same as
with hair.

	<custom2> goes into the Customize(2) variable of the avatar, and
determines arm pattern.  Its form is

		AAAA0000

where AAAA is the arm pattern (in the range 0-15).  The remaining four bits
are not used at this time.  The selection of patterns is also the same as
hair, legs, and torso.
