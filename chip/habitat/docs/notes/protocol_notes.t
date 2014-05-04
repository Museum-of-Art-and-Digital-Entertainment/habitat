My protocol wishlist:

Current Protocol:
sync,crc,crc,crc,crc,seq#,seq#,type,IDbyte,SEQheader,NOID,REQUEST,data....,CR

Qlink header size:	10
Minimum message size:	13

Proposed Protocol:
cksum,cksum,seq#,seq#,type/SEQheader,NOID,REQUEST,data.....,CR

Qlink header size:	5
Minimum message size:	8 (+major gains in C64 compute time)


what		why
-------------	-------------------------------
No Sync Byte	All packets are delimited by CR and invalid packets are
		rejected ANYWAY. This byte is redundant.

Compressed CRC	Current method is unacceptably slow (cannot be over
		emphasized) & a simpler checksum can be passed in 1 or 2
		bytes.

No ID byte	If the host knows we are in Microcosm, this is redundant.
 ('U' now)

Combine:	There are only 7 types of Q-Link messages (0x20 to 0x26).
type ($20)	MicroCosm messages are not numbered in this range.
& SEQheader

I realize that ALL of these changes require intervention at the very lowest
level of your Protocol handler, but if telecommunications gaming succeeds,
bandwidth is going to become CRUCIAL.  Bandwidth & computation overhead must
be reduced to a bare minimum AND THEN some more.  My proposed changes would
reduce the required overhead for a message by 50% AND give BOTH the host and
home systems more CPU time to do the more important stuff (like handle other
users, or do graphics).

Keep in mind, if we succeed there will be competitors, who will write new
systems, probably as or more compact than the one I have proposed to you here
(thereby be able to do faster games, with more data flow).
