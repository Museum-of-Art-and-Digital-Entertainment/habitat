Communications Protocol: Problems and Desired Changes

In order of significance and difficulty and in inverse order of degree of
solving the problem:

1. Make the host respond to HEARTBEATs from the Commodore, even if it has
outstanding NAKs pending -- this is the way the protocol is supposed to work
anyhow (it is an acknowledged bug) and will allow certain kinds of common
protocol recoveries to be accomplished with 2 packets instead of 6, saving
time and CPU overhead.  The result will be improved performance througout the
system, not just in Habitat.

2. Have the host be more intelligent about sending packets, and only send as
many packets as it knows the C64 can buffer, until getting some sort of
acknowledgement from the C64 (i.e., never allow itself to get more than a
certain amount ahead of the Commodore, no matter what).

3. Allow the application level program on the Stratus to tell the terminal
port to shut-up.  With some changes in the handshaking of such things as
pick-from-container and region transition, we can eliminate the "NAK-hack".
Since it happens at the application level, this change should be transparent
to the existing C64 products.

4. Add a new message type that enables the host to provide the C64 with the
throttle setting.  This requires either a change to the protocol itself or the
addition of a query function so that the application can send this message.

5. Redesign the protocol from first principles and do it right this time.
This, of course, changes *everything*.
