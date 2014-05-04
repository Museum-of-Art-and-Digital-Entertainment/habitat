This is the protocol for the newuser signup/customization feature:

Whenever a player is logging into Habitat, the C64 sends the request

	<REGION> <I'm alive> <program disk version>

Where <REGION> is always noid 0 and the <I'm alive> request byte is 3.
<program disk version> is two bytes identifying the software version number of
the player's program disk (NOT his object data disk).

If the version number is out of date (or the player is for some other reason
deemed by the host to be unacceptable) the host responds with

	<REGION> <I'm alive> <FAILURE> <error message>

Where the <FAILURE> byte is 0 and <error message> is a string that is
displayed that tells the player why his computer is hanging up on him.  The
C64 then returns to People Connection.

If the player is an established user the host responds with

	<REGION> <I'm alive> <SUCCESS> <object disk type> <object disk prompt>

Where the <SUCCESS> byte is 1, <object disk type> is a byte indicating what
sort of object disk is to be used, and <object disk prompt> is a string used
to prompt the player to put in his object disk (initially, "Insert Habitat
data disk, press any key").  After receiving the <SUCCESS> response, the C64
initiates normal interaction in the manner currently supported, i.e., by
sending a <Describe> request for the present region.

If the player is a new user, the host responds with

	<REGION> <I'm alive> <NEWUSER> <contents vector>

Where the <NEWUSER> byte is 2 and the <contents vector> is a regular region
initialization contents vector containing a ground, a sky, an avatar and a
bunch of heads.  This contents vector will be some constant string stored
somewhere in the host.  It may be one of several constants strings chosen at
random to vary the selection of heads provided.  (We will provide a suitable
string to begin with.)

After going through the customization dialog, the C64 sends the request

	<REGION> <Customize> <data>

Where the <Customize> request byte is 4 and the <data> consists of

	<head style> <head pattern> <custom1> <custom2> <custom3>

Where <head style> and <head pattern> are 'style' and 'orientation' bytes of
the new player's avatar's head (respectively) and <custom1> <custom2> and
<custom3> are the so named state bytes of the new player's avatar.

The host responds with either

	<REGION> <Customize> <SUCCESS>
or
	<REGION> <Customize> <FAILURE>

If a <FAILURE> response is given, the C64 should go through the customization
dialog again and try once more.  If a <SUCCESS> response is given the C64
should initiate normal operation like an established user (i.e., send the
<Describe> request for the current region).
