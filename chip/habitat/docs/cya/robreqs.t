To: Steve Arnold
From: Chip Morningstar
Date: December 11, 1987
Re: Rob & Janet's item/question memo of 12/7

As you requested, here is an item-by-item status report in response to Rob &
Janet's memo of 12/7/87: (I've quoted the memo literally on the lines
beginning with ">".)

>Here is a list of all outstanding items we have on record, not including
>three of the four "meta-problems" (heartbeat/protocol disconnect, PC
>loader, memory hits) or manifestations of them as near as we can judge.
>The fourth meta-problem, "messages to non-existing noids," we believe to
>be a problem with auto-teleport, which we'll continue to test

The "messages to non-existing noids" problem was indeed in the auto-teleport
routine and is fixed as of 10/30 (version 6.4).  Of the other three, the
"memory hits" problem turned out to be a bug in the bottle object and was also
fixed as of 10/30 in version 6.4.

>SYSTEM

>Needs testing
>-------------
>Auto-teleport -- dying, some Choke machines, wands
	As mentioned above, this is fixed in version 6.4 as of 10/30 (ver 6.4
	release notes, 11/10)
>GO/F3 collision (next rev)
	Fixed in version Beta 1.0 as of 12/9
>Error recovery for disk routines (next rev)
	Installed in version Beta 1.0 as of 12/9
>FE3 (JoeyT1)
	Since we do not have a dump disk for this problem, we cannot give a
	100% assured diagnosis.  However, reasoning from the circumstances
	surrounding it, our hypothesis is that it is the same problem as the
	GO/F3 collision bug mentioned above and the FE#13 that RJScott had.
>FE13 (RJScott)
	This turned out to be a result of the very same problem as the GO/F3
	collision bug, and so is fixed.

>Requires disk change (status uncertain)
>---------------------------------------
	Almost all of these are host problems or changes, not disk based.

>PUTing to a sitting Avatar makes it stand (9/10; #62)
	This is a host only bug, fixed as of 11/11
>New entries to regions don't show the state of an avatar
	There was a problem with this once upon a time (prior to our keeping
	the current bug database).  We believe it is fixed (was host bug).
	There have been	no reports of this happening for as far back as our
	database goes.
>Lamps are awfully wide (9/10; #94 sorta)
	We aren't sure what this means.  If Quantum wants us to change the
	collision detection parameters for the streetlamp we can do so easily.
	If so, it would be a host only change.
>Ticket DO hangs 64 (9/10; #85)
	Our records show this as being fixed as of 9/2
>Grenade doesn't work (9/10; #81)
	Working as of 11/11 (host only change).
>Ring looks like a pill (9/10; #86)
	We decided that the ring is sufficiently different that we don't need
	to mess with changing the image.
>Cursor turned into PUT icon in text interface (11/4; #500)
	We wrote this one off as a mystery on 10/12.  Lord Bolan (to whom this
	happened) had a number of odd things happen to only him, leading us to
	suspect his machine.  We have kept our eyes open for recurrences;
	there haven't been any.
>Command lockout turing GO while able to receive ESP, etc. (11/4; #374)
	Another weird Lord Bolan thing.
>Blank paper with written graphic state (9/10; #128)
	Fixed (on host) as of 10/12
>Random sign appearances (12/2; #696)
	Operator boo-boo while using Ghu; accidently moved wrong item.
>Shrunk to smallest size on 'porting home (12/2; #691)
	Currently on our working bug list.
>Grab from left-hand side doesn't always work (9/10; #26)
	Confusion resulting from collision detection; not a bug.

>Disk questions
>--------------
>On DOs that include GO, should avatars face cursor on arrival? (9/10; #64)
	GO is set up so that avatar is always facing in proper direction on
	arrival.  Sometimes this is facing cursor, sometimes not.
>Should all DOs include GOs? (9/10; #95)
	No.  In many cases the semantics of the DO operation makes this
	impossible.  Where it is possible, we do so.
>Do chairs work easily (i.e., GO from chair with one push?)
	Yes.
>Does Help work while seated? (9/10; #31)
	No.  The only thing you can do while seated is talk or GO.  It would
	be nice if you could do HELP while seated, but this would require some
	fairly hairy changes to the command interface routines, so we decided
	not to, in the interest of moving things forward.
>Follow command? (12/2; #190)
	This has been an on-again/off-again feature.  We need to make a final
	decision as to whether or not to implement this.  Our feeling here is
	that it is probably not needed, and we have the impression that the
	consensus at Quantum is similar; however, we need to decide.  If we do
	decide to implement this, the changes will be entirely host based.
>Does adding the ability to make objects prompt users require disk changes?
>(9/10; #9)
	Yes, but the changes have already been made.  They were installed in
	version 6.4 and have been tested.

>Host problems
>-------------
>Lights (both floor and flash/torch) do not consistently work (12/2,
>		comments -- 9/2, #96, #109 -- 11/4, #305)
	They should work now.  There were a couple of weird interacting host
	software problems, the last of which was fixed 11/19, as well as a
	systematic error in the database which was corrected on 12/4
>Cloning & prices on vendos -- are we sure they're right?
	We did a thorough check on all vendo prices and they are all correct.
>Title page/index for books (12/2; #104)
	It was the Book of Records in particular that required the index
	(which needed to be generated by the program that generates that
	particular document).  Janet implemented this as of 12/8.
>Finish 'port, town and region help names for regions (10/12; #9)
	(Actually item #194).  Port and town help arrows are in as of 11/19;
	we currently have the testers hunting for the inevitable mistakes.
	Names are installed in the residential areas and are being added to
	the other areas incrementally.
>Fix 'port directory
	We have an all-new teleport directory as of 11/14
>Drugs need to have help effect, pill count (9/10; #79)
	Done as of 11/11
>Heads have no resale value (9/10; #30)
	Fixed
>Some turfs have flowers on dressers which can be GETed but not PUT (9/10;
>		#72)
	Our records show this being fixed as of 9/3.
>Should Costello's be hooked to sewers? (9/10; #56)
	No it shouldn't.  Our records show it was disconnected as of 9/2.
>Move sewer so de-ghosts don't stand on it (9/10; #101)
	Our records show this being fixed as of 9/3.
>Should we de-ghost on login? (12/2; #29)
	We think we should, but a decision needs to be made.  If we do it,
	Janet is the one who will have to implement it.
>Add a type field to 'crats to allow customized responses (9/10; #202)
	Upon reflection we concluded that this was unnecessary.
>Put apartment tape online and test (10/12; #11)
	Final rev. of apartement installed on 12/9.  Requires Beta 1.0
	software to work properly (there was a bug in the elevator).
>Change all countertops to...something else (10/12; #82)
	As of 11/11 all countertops work just like tables.
>Two mail in pocket messages for one piece of mail (10/12; #222)
	Fixed as of 10/30 (host change by Janet).

>Manual changes
>--------------
>Revise to be current with Beta Release
	Version of manual sent 12/7 accurately describes Beta 1.0 system.
>Include graphic symbols/CTRL keys
>Index
	These can be added.  We'll need to redesign the page layout however,
	since these will add a few pages.
>Is there a current map of downtown?
	Yes, but not in a distributable form.
>Should we explain how tables, bookcases and dressers are containers?
	I don't know.  Should we?
>Should Jan gather as much as we know about configuration requirements?
	This would probably be wise.
>A little clearer about 'port booths, mebbe
	We will take a look at it.  What in particular needs clarification?

>Ghu
>---
>QL Rep (Rob) proficient enought to implement basic programming (10/12)
	Rob is the judge of this.
>Are there any docs on the macro language?
	Yes.  The document we sent to Quantum describes the macro features
	fully.
>Make Oracle fully functional & accessible
>Can GHU handle Oracle requests?
	Oracle handling is now implemented in Ghu.  We will send a revised
	edition of the manual that describes the relevent commands.
>Can GHU hand Rant publishing?
	Yes.  Text handling features are now implemented.  These will also be
	described in the new edition of the manual.
>Is it, in short, fully functional?
	Yes.  However, we would like to consult with Quantum about what
	protection features are required, if any, to prevent unauthorized
	mangling of the database or invasions of privacy accomplished via Ghu.
>Can (does?) GHU show memory usage in a region?
	No.
>Loops
	The version of Ghu originally released to Quantum had a looping
	feature.  We have since made this feature somewhat more general and
	this improvement is described in the latest edition of the manual.
>Can I search for items of a specific class?
	Yes, but it is very inefficient, since it requires iterating through
	the entire database.  If we were to make the class field a database
	key then we could do this more efficiently.  Janet?

>Things to do (Definition of Public Release Habitat System Document)
>-------------
>D'nalsi Island
	Ready to go on 30 seconds notice.
>Capture the Flag
	We are awaiting a chance to test this on a limited scale before
	pursuing a larger development effort.  Testing it, however, requires
	more users than we have typically had on.
>Cooties
	Working.
>Machiavelli
	Could use further design work.  Does not require any software
	developement, however.
>Stock Market
	We have a design, but need to set priorities since it will require
	some host software work.
>Talk Shows
>Game Shows
>Bijou Theatre
>Costello's Comedy Corner
	These are ready to go.  We have designed some magic items that will
	make the operation of theatrical activities a little easier, but they
	are luxuries.

>Items
>-----
>copy machine (12/2; #11 -- 4/29; #27)
>book binder (12/2; #11 -- 4/29; #28)
	These require host software that does not yet exist.  The C64 end is
	in as of version Beta 1.0
>Customizer: 4-5 selections of heads -- host chooses vector (4/29; #23)
	Done in hatchery long, long ago.
>Determine powers and privileges of Adventure Masters (3/2; #28)
>Write Guidebook to the Oracle (3/2; #48)
>Design batch transactions (3/2; #71)
	We need to work out operations plans in order to determine the
	relevence of these items.
>Make region entry smarter (doors, etc.) (3/2; #110)
>Add textual error messages (3/2; #117)
>Write help messages for magic items (3/2; #118)
	Ancient history; done.
>Implement Apartment Generator (3/2; #55)
	Done.
>Implement Adventure Master support software (3/2; #63)
	See above comment on Adventure Masters.
>Position on compatibility with 1581 (10/12; #2)
	We need a 1581 and detailed documentation on it.
