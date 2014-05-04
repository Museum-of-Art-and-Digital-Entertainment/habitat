3-Jan-86 1pm. Talked to Marc on phone.  Acknowledged reciept of two fedex
listings of communications software.  Complemented his 6502 programmer on good
code.  Confirmed visit for next week is still on.  Discussed demo needs.
Looks like a 'tape recording' of some line interchange will do just fine.
They are going to install instrumentation on their end to capture such data.
Talked about upgrade distribution.  Looks like on-line stuff will work.  Marc
reiterated that their concern is who pays.

------------------------------------------------------------------------------

7-Jan-86 all day.  Had meeting with Marc and Janet.  Introduced them to Randy
and showed them balloon-o-matic, discussed communications problems.
Introduced them to Gary and showed them early avatar animation and the cel
editor.  Introduced them to Aric, showed them the animation driver and
discussed animation problems/solutions.  Introduced them to everybody else
(courtesy and cultural background info).

Spent morning discussing the big picture: what the components of their system
are and how they interact, what the components of our system will be, how it
all fits together.  One of their concerns is how we balance the load when the
number of users gets large.  What they have to be able to do is spread the
host's job over a bunch of separate computers running concurrently.
Fortunately, our design makes this quite easy.  In fact, it turns out that
they will probably be able to use their existing software that that supports
their room-oriented chat system as the basis for the host database handler.

Took them to lunch at the Ranch.  They were suitably impressed and ooh'ed and
ah'ed at all the right things.

Spent the afternoon discussing who had to do what to get the thing going.
They will do the host remote procedure call object behavior lookup system
(Looi).  We will provide the object behavior software routines themselves.
They will do the host-end object database software.  We will specify the
layout of the host database and actually provide the data to go into it.  They
will provide tools for entering this data into their system and for altering
it once it is already there.  We will provide advice on what these tools
should be as part of the database specification.  They will provide routines
so that the object behavior code can get at the contents of the database
easily.  In the process of figuring this all out we redesigned the
communications protocol and the object reference and naming scheme in order to
solve some problems which Marc identified.  The result is greatly superior to
what we had before in every respect.  Lots of ideas were generated and both
Marc and Janet got real excited.  They even started talking about the eventual
need to do "MicroCosm II" (for fancier machines with faster communications)
someday after MicroCosm is a big hit.

We talked intermittently about the game itself and the MicroCosm fantasy.  We
discussed the avatar and turf customization kits and what sort of interface to
the system they would require.  This lead Marc to raise the question of
whether the players would be able to choose where their turves connect into
the world.  I had thought that the locations were fixed, but letting people
fiddle with them in certain constrained ways enables a number of interesting
things to happen, including a real estate marketplace and the formation of
political alliances based on territoriality.

We discussed asynchronous events that can occur within the system.  From our
point of view, the two most significant are the arrival of mail in the
player's electronic mailbox and the arrival of an on-line message from another
player.  We (LFL) need to discuss the extent to which we want to integrate the
communications facilities of the MicroCosm fantasy world (mail, telephone)
with those of the Q-Link system.  In particular, if somebody (who is not
inside MicroCosm) sends you a mail message, can you read it from your
MicroCosm mailbox?

We came up with a list of short-term things for each of us to do.

I am to define the basic layout and contents of the databases that will be
required, to make a first crack at defining what kinds of low-level routines
will be needed to interact with the database, and to think about interactive
tools for constructing and modifying the world model that the databases
contain.  I'm also supposed to spend some time thinking about what sorts of
statistics collection and usage monitoring hooks we want to embed in the
thing.

They are going to start setting up the database structure itself based on my
input.  (They are going to use off-the-shelf database software for the bulk of
it).  They are also going to start hacking around a version of the "rooming
house" software (that which handles "rooms" in their chat utility) to become a
"region monitor" module.  Part of this involves figuring out what sorts of
asynchronous events within the system will be needed to make it work.  They
are also going to work on low-level routines for interrogating and updating
the database.  Also, Marc is going to send us information about the Q-Link
load-file format so that we can have our Commodore 64 software load and run
off of disk under Q-Link's control (i.e., when you select the "MicroCosm" menu
item inside Q-Link).  This will let me write a filter to make our object files
compatible with theirs.

We went out to dinner at the Royal Thai, which they both enjoyed immensely,
except that Marc accidently ate a Thai pepper and had to chug water and
hyperventilate for 15 minutes in order to survive.

Marc is going to CES and offered to take us out to dinner in Las Vegas while
we're there.  Also, there is going to be a giant west coast Commodore Users'
Group meeting in San Francisco on February 6-7 (that's a weekend) which they
are going to be attending.  Marc is going to be on a panel along with
representatives from all their competitors.  He recommended we come to this
meeting, if only to see what kind of people our hard-core customers are going
to be.

------------------------------------------------------------------------------

13-Jan-86 1pm On arrival found message that Marc had called.  Called him back.
Something about putting together dog & pony show for Clive Smith and Commodore
bigwigs.  Didn't go into details because haven't talked to sda yet about what
it's all about.

------------------------------------------------------------------------------

16-Jan-86 Sent off progress report describing activities in December.

------------------------------------------------------------------------------

17-Jan-86 Sent off package with January 15 deliverables (object set document
plus cover letter).

------------------------------------------------------------------------------

17-Jan-86 Spent day putting together dog and pony disk for Clive.  Sent it off
via Federal Express AND uploaded to Q-Link so that Marc can retrieve it for
insertion into demo Q-Link system.  Talked to Marc on the phone twice, to
discuss upload and delivery arrangements for demo.  He also confirmed reciept
of December progress report and said a reciprocal report would be on its way
soon.

------------------------------------------------------------------------------

20-Jan-86 11am Called Marc and confirmed reciept of dog & pony demo.  All
seems to be well.

------------------------------------------------------------------------------

20-Jan-86 noon Called Clive Smith's office to discuss demo disk.  He wasn't in
and will call back (or so his secretary said).

------------------------------------------------------------------------------

21-Jan-86 2:45pm Called Marc, confirmed that he got demo disk working OK.  He
says direct database correspondence to Janet as she will be becoming the
technical contact from now on as she comes up to speed on the project.

------------------------------------------------------------------------------

21-Jan-86 Sent off database contents document with cover letter to Janet
Hunter at Q-link.

------------------------------------------------------------------------------

21-Jan-86 2:50pm Called Clive Smith, told him demo was on its way (he was
pleased).  He says he will send demo disk back to us when he is done with his
D&P show, but that he would like a permanent copy for future presentations
when we get around to polishing it up with the appropriate legal incantations
and so on.  He mentioned that he, Steve Cayce and sda will have to get
together SOON to put out some kind of press announcement.  He says the press
is already snooping at the door and that Steve Cayce was approached at CES by
a well-connected reporter who wanted to know what was going on between Quantum
and LFL.

------------------------------------------------------------------------------

28-Jan-86  Fedexed new copy of the communications protocol document (#14) to
Janet Hunter.

------------------------------------------------------------------------------

29-Jan-86 11:14am  Phone conversation with Janet Hunter.  She acknowledged
reciept of protocol document.  She will be starting work on database layout
tomorrow, but will be gone on vacation all next week.  After she gets back
she'll be starting coding in earnest.  I advised her to coordinate with Randy
on the nit-picky communications details.

------------------------------------------------------------------------------

4-Feb-86  Returned demo disk from Clive arrived in mail today.

------------------------------------------------------------------------------

11-Feb-86 12:15pm Tried to call Janet Hunter.  She was not there.  Voice who
answered (what a space case he was!) said she was back from vacation but not
there today.  I left a message for her to call be back.

------------------------------------------------------------------------------

12-Feb-86 1:08pm Janet Hunter called.  Said she has been out a couple of days
with the stomache flu and apologized for being a little behind.  Says she has
laid out the preliminary database definitions and is now working on modifying
the People Connection room processor to become a MicroCosm region processor.
I outlined the sequence of events that I'd like to follow, namely: 1) get
barebones region processor up and talking to the comm. line sending out
messages that basically say "I'm alive". 2) get it talking the MicroCosm
protocol so that it can say "I'm alive" to our C64 system. 3) handle the whole
object oriented request dispatch operation with some dummy test objects.  4)
start worrying about fitting in actual MicroCosm objects.  She said that this
would be fine.  I told her to coordinate with Randy as far as getting the
comm. stuff working goes.  We agreed to keep in contact every few days for the
time being.  I will call her again on Friday.  I then transferred her to Randy
to talk communications.

------------------------------------------------------------------------------

14-Feb-86 11:00am Tried to call Janet Hunter.  She wasn't there.  Left
message to call back.

------------------------------------------------------------------------------

14-Feb-86 afternoon  Janet Hunter called back.  Says everything is going fine.
I told her we had tape ready to go and would be sending it out presently.  She
had some techie questions for Randy about communications, but he's not here
due to weather, so we'll cover those another time.

------------------------------------------------------------------------------

18-Feb-86 11:35am Called Janet Hunter.  Explained about tape being delayed due
to weather delaying our making a copy (as folks who would copy tape for us
went home early).  She said "OK, no problem".  Says she is working on
communciations protocol software.  I handed her off to Randy for techie-talk
about that.

------------------------------------------------------------------------------

20-Feb-86 1:45pm Called Janet Hunter.  Told her about foulup with date on
mid-February deliverables cover letter (it said January when it should have
said February).  She said no problem.  Communications is ready for testing,
though she says Randy should call her before he tries it so as to assure that
she isn't simultaneously trying to run something incompatible.  She said they
got the tape and liked it a lot.  Told her I'd be sending object manual
sometime next week, and that it should give them a more concrete vision of
what their system must do.  She said that would be great.

------------------------------------------------------------------------------

3-Mar-86 2:15pm Janet Hunter called.  Just checking in as we hadn't spoken in
a while.  Long conversation.  She has communications working and is now
building the database.  We discussed strategy for constructing the database.
I described the object definition document.  It seems like what we need is a
face-to-face meeting to resolve various pickyune technical issues relating to
the database, followed by a week or so of development work at their end, then
an extended visit by me to which I come armed with the complete object
definition document and spend several days madly hacking in PL/1 putting the
objects into their system.  I am trying to get the object definition document
finished so she can look at it, but if I can't finish it in the next two or
three days we decided I should send her a few annotated sample pages just to
give her an idea of the kind of thing I'm up to.  We will probably schedule
the f.t.f. meeting next week sometime.  I am to get with sda and figure out
how that should work (me going there or her coming here, timing, etc.).  We
breifly discussed deliverables, and I indicated that the mid-March stuff was
on track except possibly for the demonstration of interaction with objects and
the host, since that requires the host-database system which is not working
yet.  We discussed communications issues and I explained to her that Randy was
out today with the flu but that we had received her new communications test
disk that lets us boot up without needing two simultaneous Q-Link logins as
the present arrangement requires.

------------------------------------------------------------------------------

6-Mar-86 2:30pm Janet Hunter called.  Long technical discussion.  Told her sda
had advised she come out here for next visit since I'd be going there for long
visit.  I raised possibility that we might be able to deal with issues via an
extended conference call rather than a personal trip, and she thought that
this would be a good idea both as a money saver and as a more productive use
of our time.  Says she thinks she will have a partial database engine
(something we can talk to if not use outright) by Wednesday or Thursday of
next week.  We had an extended discussion of the sequence of events involved
in the behavior protocol of messages exchanged between the Commodore 64 and
the host.  I also described the set of communications idioms I was using in
specifying the object behaviors.  We talked about what sorts of resources
would be needed at their end and in particular she asked whether any objects
had time-driven functions.  The parking meter proved to be an example of such
an object, and the day/night cycle also is under similar constraints.  She
thought that these would be no problem.  I also discussed for the first time
the jukebox/radio/stereo idea and she said she'd have to give it some thought
to see how that would operate in practice.  I am to try and get the damn
object spec document done and sent off to her ASAP.  This is going to be dicey
given my time constraints over the next few days.  We agreed that I will call
her tomorrow morning before the Epyx winners' visit to update her on the
prognosis for that.

------------------------------------------------------------------------------

7-Mar-86 10:35am called Janet Hunter.  Confirmed that I didn't get the object
document done last night (we expected I wouldn't) and I told her I'd try real
hard to get it done to have it in tonight's fedex shipment.  She asked how
Randy was coming with the communications software and I told her that he had
it rewritten and was now getting ready to assemble and test it.

------------------------------------------------------------------------------

12-Mar-86 11:50am called Janet Hunter.  Asked her about reconsidering use of
CRC for error detection and substituting a less computation intensive error
detection scheme.  She said this sounded OK to her but had rather far-reaching
system ramifications, so she would bring it up with the other folks there.  I
told her how system integration was coming along (it's coming along fine).
She had a couple of questions.  One was about the integration of Q-Link's
native mail system and on-line message system with MicroCosm.  I told her I
thought integrating OLMs wouldn't work (she agreed) but that integrating mail
was probably both doable and desirable.  I also explained my mail addressing
scheme which she thought would be no problem.  She also asked about the
continuation/termination bit in the message protocol and requested a slight
revision so that her communications processor can distinguish single-packet
messages from multi-packet messages and the start of multi-packet messages
from the rest.  I told her that I'd discuss this with Randy and that one of us
would get back to her on it.  She also said that she was starting integration
of their terminal handler with the MicroCosm database processor there, and
that we should soon be able to talk to a real process!

------------------------------------------------------------------------------

17-Mar-86 1:50pm Janet Hunter called.  Says she is ready to test and wants to
know what sort of test objects to code up.  I said I would talk to the guys
here and get back to her ASAP.  She also said she had finished going over the
object specification document and had some questions about object containment,
which I answered.

------------------------------------------------------------------------------

21-Mar-86 11:10am Called Janet Hunter.  Purpose of call was to cover various
technical issues: 1) any progress on changing CRC to something less CPU
intensive?  Answer: she talked to the other folks there about it, there
reaction was unenthusiastic.  Basically, it can be done, but it won't be done
anytime soon.  More persuasive argument must be pursued.  2) How are the test
objects coming?  Answer: only a few hours from being testable.  I told her we
are ready to test anytime she gives us the relevent parameters.  For the
second level of testing (where the region descriptor tells what objects are
present) she needs to know the format of the region contents vector.  I am to
get this for her.  3) Travel plans: how about me coming out first week in
April?  Answer: first few days of that week (Monday, March 31 to Wednesday,
March 2) she is going to be on vacation.  I don't need a lot of her attention
while there, but what I will need I will need at the start of the coding
session.  It seems the best thing would be for me to fly out there Thursday,
April 3 and depart the Thursday, Friday or Saturday of the following week.
Some more coordination is still needed before we should start making airline
reservations however.  Also, their computers are now overloaded and they don't
have a dedicated development system (which means they can only do development
during off-hours).  This is SUPPOSED to be remedied by then, but you never
know (she is going to look into this too).  4) Tell me various specific
details about the execution environment of the PL/1 code that will implement
the object behavior.  Answer: blah, blah, blah (various technical details).
Additional topics: she would like a copy of our test disk to aid her in her
own testing of the Stratus host.  I said this should be OK and that I would
speak with Randy about it.  She is going to call back in a couple of hours
when she gets the test objects working.

------------------------------------------------------------------------------

25-Mar-86 11:00am Janet Hunter called.  Had some questions about contents
vector definition and the way the object containership relation operated.
There was also a question about whether noids should be represented implicitly
or explicitly in the region contents vector description.  We discussed the
technicalities at some length.  I said I would discuss these matters with
Randy and Aric and get back to her later today.  Also told her about tentative
travel plans (go out there Thursday, April 3, return Saturday, April 12).
Asked her to writeup what she had about PL/1 execution environment of object
behaviors so that I could do as much work as possible in advance, she said she
would do this.  Also asked her to look into setting up remote dial-in access
for us to do development work on their machine, which she agreed to do.

------------------------------------------------------------------------------

27-Mar-86 1:30pm Called Janet Hunter.  Answered previous day's questions about
object identification (we are going to put explicit noids in the contents
vector for the time being, possibly going to implicit noids later once
everything works; I asked her to put instruments on the output channel so we
could see how many bytes this was costing us, which she said she'd do), and
about containership (we'll treat containers as a sort of all-or-nothing thing:
if a container is open, everybody knows what's in it, so the host sends out a
contents vector with every container opening, and when it's closed it's a
black box: nobody knows what's in it).  Also discussed mailer issues (how mail
messages are to be formatted) and names.  Janet asked the question, "do
avatars have names?".  My feeling is that they should, but what good are they?
We can't use them for mailing because of collisions with Q-Link login names.
I thought perhaps they could be "True Names" that are used to obtain magical
power over others, but this idea needs further thought.  Also, Janet is going
to be faxing me a copy of a document, describing the PL/1 environment for
programming objects, tomorrow morning some time.

------------------------------------------------------------------------------

23-Apr-86 9:50am Called Janet Hunter.  Two problems: listing not here yet and
no Telenet access yet.  She said she shipped listing regular UPS not realizing
how long it would take and will reprint and reship via a faster route.  She
says the X25 mods to let us access their development system via Telenet are in
place but she wants to test them before getting us involved.  She will call me
back this afternoon with the info as soon as she's had a chance to check it
out.

------------------------------------------------------------------------------

24-Apr-86 11:15am Called Janet Hunter.  Several things: 1) Randy would like to
have a direct access to MicroCosm disk for testing purposes, so that he
wouldn't have to wait for the whole q-link login procedure every test run.
Janet says this is in the works but won't happen soon.  She also said that the
problem with getting hooked to a computer that didn't have Microcosm is now
fixed.  2) Randy would like to be able to send an INIT message instead of
waiting for a HEARTBEAT message.  Janet says they are working on this, but it
involves changing the semantics of the INIT message so that it doesn't reset
everything and log you off, so it'll be a few days.  3) I want Telenet access
for debugging.  She said they made the mods required to have this happen,
tested it, and it didn't work.  You could log in but you never got a command
interpreter.  This seems to be a Stratus problem and they are currently
conferring with Stratus on the matter.  4) Listing: did she send a new
listing?  Answer: not yet.  She printed a new copy last night and will send it
out this evening if she doesn't hear from us to the contrary before then
(i.e., because the first listing finally arrived).  5) RDL: she was in the
middle of fixing something else for Randy, so she didn't want to talk about it
now, but she'll call back later today.

------------------------------------------------------------------------------

18-Jul-86 11:20am Called Janet.  Discussed ongoing problem with bad data in
Riddle file (the result of an off-by-1 bug in Slur).  Concluded the easiest
fix was just to generate a whole new Riddle file and send it.  Janet is going
to try to get a reliable file transfer utility working today.  She is also
going to try to get us finished rough documentation for the Twiddle utility.
She asked if I could provide her with a list of unfinished components (i.e.,
ones that are in the system spec but which won't be in the beta test).  Since
I had to generate such a list for sda anyhow I said I'd fax her a copy of
that.  She also asked for a list of features which work in the C64 but not on
the host.  I am to try to generate that today also, but that is somewhat lower
priority than the other list.

------------------------------------------------------------------------------

22-Jul-86 1:10pm Call from Clive Smith.  He is concerned about avatar
customization and thinks that heads are not enough.  He harranged me for
several minutes on the subject, and then I explained why things were the way
they were and that we were working on it but technical limitations seemed
pretty strong at this point.  He also said he had some comments on the manual,
but had to take another call before he could tell me what they were.

------------------------------------------------------------------------------

28-Jul-86 2:05pm Called Janet.  Asked about Twiddle: has it been upgraded as
we requested?  Answer: she added create object function and fixed text
handling.  New twiddle.doc file describes new features.  BTW, create object
requests you to provide a new global object id, but if it's already used it
starts searching from there until it finds a free one.  She says the
populopolis data has id's up to about 4830.  We still need to be able to
handle arbitrary objects.  I suggested she could just point us to the table it
uses to understand what objects it has, so we could revise it as needed when
we create new classes.  She said this is doable, but the format of the tables
is kind of complicated, so she wants to write it down rather than trying to
explain it over the phone.  Also asked about teleports.  She says the stuff
should be working on her end, but she had a problem with the atm and tokens
blowing up her C64 (I don't know why) so she wasn't able to test.

------------------------------------------------------------------------------

31-Jul-86 Conversation with Janet.  Gave her "wish list" items for Twiddle: a
"display" command that doesn't actually display, multiple commands on a line,
and a way to find all instances of a particular class.  She will take these
under advisement.  Also asked for delete object command and she explained the
way to do this is to move the object to region 98 or 99 (98=destroyed,
99=limbo).  We need to add some new fields to the avatar and the region, which
is problematic because those databases are hard to change.  We need a "stun
counter" field in the avatar, but we decided to use the "bus fare paid" flag
since the bus system is dead.  We need a "light level" value in the region,
but we decided to use "width", since region width is currently a meaningless
concept.  I also pointed out that we will need to give her a teleport
directory and asked for a convenient format to put it in (as a text file).
She suggested each entry on a line: 20 char address, space, region number.
She mentioned some problems with message transmission on paper write, which I
said I would pass along to Randy.  She also asked if we could have the cursor
keys function in the text interface.  I said that this wasn't hard, but the
problem is the amount of memory that the code to do it would take.  I said I'd
take this up with Randy.

------------------------------------------------------------------------------

1-Aug-86 11:00am Called Janet.  She said she was busy with a local disaster
and she'd call back in about a half hour.

------------------------------------------------------------------------------

1-Aug-86 11:30am Janet called back.  I had several things to talk about:
there seems to be a bug that causes the avatar's bank balance to get sent
wrong.  She said she'd investigate.  I warned her to avoid the pawnshop
interior as a couple of the objects have been changed to knick-knack styles
that she doesn't have on her disk.  I asked if ship Tuesday/arrive Wednesday
for beta-1 delivery was OK, she said yes.  I told her our plans for the
new-user custimization interaction and that it would require a minor change to
the login protocol.  She thought this would be fine.  We agreed I would write
up the protocol spec and fax it to her asap.  I asked about the status of mail
and message systems.  Mail is about ready; the major thing that needed to be
done was paper "write" to the database.  She asked about the message system.
We argued about whether it should be possible to have multi-packet messages.
This presents a problem for their internals, but we could construct the user
interface to fake it and use separate messages internally.  She still didn't
like this because of the timing problems and the load caused by such easy
multiple invocations of the name-lookup process.  I said I'd talk it over with
the guys.  She also pointed out a potential problem with message packets
intermingling with contents vector packets.  We also talked about file
transfer techniques.  She has a few more tricks up her sleeve, but she was too
busy to get into them right now.  She said she'd call back later this
afternoon to try out file xfer.

------------------------------------------------------------------------------

1-Aug-86 3:50pm Janet called.  She called to give me the go ahead to test
file transfer again, but first I had some Twiddle problems: it won't let you
enter negative numbers (parser doesn't recognize the minus sign), she needs to
recompile the class name list as I can't recompile it since I don't have the
right path aliases on my account, and it does funny things if you enter a
blank line.  She said she'd take care of these.  We then tried transferring a
file.  I read her the last 10 lines of the file over the phone and she said
she'd unpack the data, check it out, and get back to me.

------------------------------------------------------------------------------

1-Aug-86 4:45pm Janet called.  File transfer didn't work.  We are going to try
hopping via the well, which she can access via Uninet and we can access via
uucp.  I gave her the info on accessing it and said I would find out what we
had to do to use it.

------------------------------------------------------------------------------

6-Aug-86 6:00pm Called Janet.  We had tried to test and discovered that not
only were all the Habitat processes down, but our Q-Link processes were not
running either.  Had to verify that it was OK to do a start_monitor.  She said
go for it.  Explained I had Ghu spec written and would fax to her tonite or
tomorrow morning and that I'd be in touch first thing tomorrow to talk about
coordination of remaining tasks.

------------------------------------------------------------------------------

7-Aug-86 12:10pm Called Janet.  Told her I was faxing her spec today for "Ghu"
(God's Handy Utility) (ref task #21), and that I would write up a spec for the
version update facility (task #9) and try to get it to her tomorrow morning.
Brought up subject of integration of new-user facility (task #14).  She says
she got my fax describing it, that it seems simple and straight-forward to her
and she forsees no problems.  She asked us to send her a disk with as much of
it working as we could provide without anything on their end for it to talk
to.  I said I'd try to get it to her today, if possible (it might not be).  I
told her to coordinate work on it with Randy, since he's the one who needs to
get it going on our end now.  We also spoke about the "orientation in change
region" problem (task #22) and agreed on a protocol for handling it.  It turns
out that this protocol also takes care of the general case of region entry
daemons, so it will also knock away half of task #24.  Here is what we will
do: change_region currently is called with the desired new x and y coordinates
for the avatar to receive in the new region.  These have been changed to be a
direction number and transition type number (i.e., an indication of whether
you are walking, teleporting, or what).  change_region will pass these
through, together with the orientation of the region departed from, and call a
procedure that I will provide called region_entry_demon with these as
parameters.  I will put this procedure in "helpers.pl1".  Brought up the file
transfer problem.  Explained that I have established a reliable method of
sending files to the Well.  Told her to get their account set up on the Well
pronto.  We now have a second account there for this purpose, which they may
be able to use, but it would be billed to us so I'm not sure sda will go for
that.  She had some questions about compilation errors she'd hit trying to
merge her version of the test system there with ours.  It turns out that these
related to obsolete objects that have been removed (e.g., telephone and fare
box) and the proper strategy (as she had correctly guessed) was to simply
remove any references to these things.  She also said we need to recompile
*everything*, so this would be an opportune time to change the references to
region.width to region.light_level.  She had a question about assigning
mailboxes to new turves: how do we know what mailbox goes with what turf?  We
figured out that Genesis can handle it as long as we guarantee that the Riddle
file always declares the mailbox object before declaring the turf region,
which we can do.  They were supposed to send us a Q-3 disk yesterday, but they
ran into some sort of problem and are sending it today instead.  Finally, we
discovered that we can't call into their system from Telenet because it says
"70339L NOT OPERATING".  She said she'd talk to Tom (their network guy) and get back to us.

------------------------------------------------------------------------------

7-Aug-86 12:30pm Janet called back.  Said to try Telenet link again.  I did.
It works now.

------------------------------------------------------------------------------

8-Aug-86 1:27pm Janet called.  Regionproc in rundir now reflects changes for
new features, requires Q-3 to work right.  regionproc.pl1 is this new version,
regionproc.8-86.pl1 is old version, in case we want to go back,
regionproc.orientation.pl1 is new version that calls entry daemon.  She also
says she can't open the door in her turf, we will look into it.

------------------------------------------------------------------------------

10-Aug-86 3:30pm Janet called.  She thought delivery would be Tuesday morning,
not Monday morning!  Called to tell of testing problems: Marc's avatar can't
walk, she can't get out of her region (#1002) because she can't open the door.
We had already known of these from note on the system.  Turns out her problem
was due to a bug in the C64 adjacency check (which we have fixed) and that
Marc's was due to a problem in their database initialization, causing his stun
count to be set to some large number.

------------------------------------------------------------------------------

14-Aug-86 10:54am Janet called.  Asked about changes in database that cause
things to change size.  Only cases are new 2-byte token and chair (couch, bed)
objects that are now containers.  I complained that system didn't seem to
recognize the chair as a container, she said this was odd and she would
investigate.  She discovered that region #1082 points to itself, which crashes
change_region.  This is a mistake in our data (I fixed with Twiddle while we
were talking), but I will change our goto_new_region routine to check for this
as a special case.  I asked Janet if she could use a map, she said yes, so I
will send her a copy.  They don't like the region transition sound effects,
but other than that they *love* the sounds.  Overall they seem pretty happy
with the present state of the system.

------------------------------------------------------------------------------

14-Aug-86 12:29pm Janet called.  Turns out problem with chairs was that the
new chair (bed, couch) structs hadn't been recompiled, so the database engine
was confused.  She discovered this because she tried to compile them into her
system and got a syntax error!  I fixed while we were talking.  We will try
again.  I explained that the chair stuff had been taken out of the C64
software since we had been unable to test it.

------------------------------------------------------------------------------

18-Aug-86 5pm Janet called.  We discussed the bug list they faxed to us today.
In summary: item 1 (apparent spurious change_region requests) has already been
fixed; item 2 (unfriendly results from disk errors) we will work on; item 3
(hitting lots of gesture keys quickly hanging the C64) we are aware of and we
have a fix in the works; item 4 (teleport needs prompt) will be addressed by
the "HELP" key function providing better instructions -- the *is* an audio
prompt, but you are note in a *mode* per se, so the teleport can't provide a
text prompt; item 5 (teleport PUT being funny) turned out to be a case of
mistaken command entry -- the user thought he did a PUT when he actually done
a DO -- blinking command icon (instead of blinking cursor) should handle this
confustion; item 6 (another teleport PUT glitch) turns out to be a
choreography problem, which we will fix; item 7 (teleport left in active
state) is a case of "that's not a bug, that's a feature", but again the HELP
key should straighten it out; item 8 (strange object crashing on DO teleport)
turns out to be another choreography glitch; items 9 and 10 (token problems)
seem to be database foulups, but we will investigate; item 11 (confusion about
the fact that avatars can grab things from each other and hand things to each
other) -- well, that's the way it works, manual should comment however; item
12 (you can't ID an avatar if you're holding something) will be fixed by the
HELP key, which will pick up the ID avatar function in the case where you are
pointing at an avatar; item 13 (typing long ESP message and getting kicked
back into People Connection) turns out to be a case of keyboard aliasing with
the stupid C64 keyboard matrix, unfortunately the string ":)", if the two
characters are pressed simultaneously (as can happen if you are typing fast),
can alias to SHIFT-RUN/STOP, the command to kick you back into People
Connection.  What we will do is disable the return-to-People-Connection
function when you are typing into the text buffer; item 14 (system hangs if
you swap disks *before* typeing SHIFT-RUN/STOP to return to People Connection)
is a design issue -- in general, we cannot guarantee what will happen if you
switch disks at arbitrary times when you are not supposed to.  In this case,
we may want to check to see that the object disk is in anyhow, just to be
safe; item 15 (problems removing heads) relates to a broader problem, that
people are completely confused by the GET/PUT operation of heads and clothing
-- we will redesign if we can to make it more intuitive; item 16 (problems
GOing through a doorway) only one user had this problem -- Janet thinks it was
his imagination, as do we; item 17 (users being able to GET things in the
Pawnshop) is due to the fact that we have yet to install the giant sheet of
invisible glass to protect the objects; item 18 (chainsaw doing "flying
mailbox" impression) is because she has an out of date copy of
generic_THROW.pl1; item 19 (odd behavior on DO jukebox) is because the jukebox
is unfinished -- she will remove them from the database.  In other matters, I
repeated for her the information about getting onto the Well, confirmed that
our expectations as to the procedure for setting up test accounts for our
people is correct, and found out how to use Twiddle on the production
database.  There turns out to be a flag that you can give Twiddle that
overrides its default database name (the test system is the default).  The
only rule is that you can't mess with the production database after 3:30pm
their time.

------------------------------------------------------------------------------

20-Aug-86 12:03pm called Janet.  Asked what's up?  She had two items to
discuss: she couldn't get onto the Well, as Uninet just got eaten by Telenet
and they've got the nodes all messed up.  It appears that things will continue
to be messed up into October, so that will be a problem.  However, they have
obtained a copy of Kermit for the C64, and they can transfer files from a C64
to their computer, so we'll try that.  We need to get them a dial-in account
on Kessel; I said I would arrange for this and get back to her asap with the
info on how to.  She also wanted a complete explanation of the specific
details of the new head/clothing/marsupial-avatar/spray-can user interface
design, which I gave her.

------------------------------------------------------------------------------

20-Aug-86 3:42pm called Janet.  Gave her info on dialing up Kessel directly.
Her login is 'quantum' and she has accounts on both Kessel and Moth.  We may
have to do some shuffling to figure out how to get kermit on this end into the
correct mode, I will investigate.

------------------------------------------------------------------------------

25-Aug-86 3:02pm called Janet.  Told her I'd be gone and when, asked her to
pass this along to Marc.  Her only concern was that she wanted to have long
conversation with me about Oracle/God utilities, which we agreed we'd do
tomorrow.  She also said that making region 504 daylight fixed the customizer
problem they'd reported to Randy earlier. 

------------------------------------------------------------------------------

26-August-86 11am.  Talked with Janet.  We discussed today's disk shipment
(which they got just fine, by the way).  Janet wanted to reconfirm a change we
had made to the TelePort that needed to be matched with a change in the
regionproc (she already knew about it, she just wanted to double check).  We
agreed to try to switch over the test system to Q-3 to match the production
system asap.  She will coordinate doing this with Randy.  We talked about some
more database errors that needed fixing (some turf regions were missing
doors!) and I gave her the info to fix it.  She says we need more turf regions
in Popolopolis to accomodate the size of the beta-test group PLUS Q-people
PLUS LFL people.  She estimates 300 turves are needed (there are currently
120).  I said we would take this up as a matter of high priority, and would
try to have the city all ready by Friday.  She also mentioned a few details
that need to be taken care of, such as making sure all the turves are seeded
with copies of the newspaper.  She had a question about the status of the HELP
facility.  I explained that the machinery was in, though the specific help
messages for the different classes would need to be generated.  I told her I'd
set it up tonight so that at least the identifity-avatar function worked via
the HELP key (I have now done this, by the way) and that I'd set things up so
that Randy or Aric could put in specific help messages for specific classes of
objects with a minimum of muss and fuss (also done).  She asked about the rate
at which we should feed funds into folks' bank accounts.  She says the scheme
of paying on the basis of login hours is a big no-go with their lawyers.  I'm
a little hazy on the details.  However, paying a certain amount each time you
login (but no more than once per day) seems to be OK.  We decided to try T100
per day to start, and to adjust it up or down as experience dictated.  She
wanted to know if they should put "Lucasfilm's Habitat" or just "Habitat" on
the games menu.  I ran over and asked you and then told her the former.  She
asked me to set up an alternate version of class_avatar on the host that would
echo talk messages through the host rather than expecting the C64 to echo them
locally (done).  She asked about policy for sweeping up avatars who are turned
to stone.  We decided we could set up "hotel" regions that don't get swept up
as often so that people could logout away from home without worry, and we
adopted a convention for indicating this in the database descriptions of the
regions.  She also brought up the thing I already discussed with you about
Charlie having gotten on and said some ill-considered remarks about Habitat
that got their users all in a tizzy.

------------------------------------------------------------------------------

26-August-86 12:55pm.  Marc Seriff called.  HE was very concerned about
getting the Beta test going, and wanted to know when we'd have the regions set
up.  I told him we were working on a number of realms for adventuring, but
that we'd just learned about the need to enlarge Populopolis today.  Told him
that we were shooting to have the enlarged Populopolis in by Friday.  He also
said they had some concerns about the manual and wanted to know who they
should contact about manual changes.  I said the relevant person was me: just
tell me what you want changed and I'll get you a revised edition asap.  This
seemed to throw them a little, as they weren't prepared to give the changes
right away.  They said they'd call back in an hour or two with specific
changes.

------------------------------------------------------------------------------

26-August-86 3:50pm.  Call back.  The person who called this time was Kathy,
whose last name I forget.  She's their communications and documentation
person.  She had a bunch of changes, but to my surprise they were all very
minor, mostly being typos and grammatical boo-boos.  They had a few things
they wanted explained slightly differently, especially in things talking about
their system, but nothing major.  They also thought the order of the chapters
should be slightly different and I concurred with their proposed
reorganization.  I said I would make the changes and get them a new copy asap.
They asked if I could make today's Fedex deadline.  I said it was possible,
that I'd try, but is was likely that I wouldn't be able to if other things
came up.  They left me to work on it in hopes I'd get it done in time.  I've
made the changes now, but various interruptions pushed me well past 5:30 by
the time I was done, so it'll have to go out tomorrow.  I'll leave it on
Mary's desk -- I've already sent her a message asking her to drop it into a
Fedex packet for me.  If you want a copy, you can get it from her, unless you
catch me first.

------------------------------------------------------------------------------

26-August-86 4:45pm.  Janet called again.  She said they'd duped the disks and
now were getting mem-faults all over the place.  She is now concerned about
memory size...  I explained that this is what the capacity-handling facility
is designed to deal with, but she's still concerned.  In any case, she
described the regions that were causing the problem, and they shouldn't be, so
Randy and I got on (on the production system) and went into the offending
regions ourselves (with even more stuff) and had no problems.  Our working
hypothesis is that the person who duped their disks (who was not Janet this
time) screwed it up and got something confused.  At any rate, they have bad
disks.  I don't know if their original is bad or not.  We will work on that
first thing in the morning.  By the time we verified that the regions were ok,
everyone had left in Virginia and I couldn't raise Janet at home.

------------------------------------------------------------------------------

3-September-86 1:05pm.  Called Janet.  They are concerned about memory
capacity handling.  They want to arrange a conference call shortly to discuss
the issue.  Told Janet names and files for revised Populopolis.  She asked me
to double check the "owner" property to make sure that Turf regions were being
flagged as such.  She also asked for a small sample Riddle output file that
described a region with containers with things in them, so she can try to
figure out what Genesis is doing wrong.  I also described to her my idea of
how memory capacity handling should work.  She said that she needs to have the
data tables to do the capacity monitor.  I said I would make it a high
priority.  Then she said she'd be gone next week (unavoidable personal stuff,
much like my WorldCon trip).  I said I would make it a HIGH priority and would
try to have tables ready tomorrow.

------------------------------------------------------------------------------

3-September-86 1:33pm.  Marc, Janet & Steve Case called.  This is the
conference call alluded to in my previous conversation with Janet.  They are
concerned about memory capacity handling.  I said that the key is to install
the capacity monitor and then design the universe so that there aren't obvious
bottlenecks where full regions can blow stuff up.  Marc is afraid this is
going to have a disasterous effect on game play.  I explained that I thought
that we could work around it -- that this would simply be another design
constraint in the setup of regions.  They were dubious.  I explained that we
too were concerned, but what can be done beyond what we are already doing.  I
said we would work on it, but the main thing was that they needed to push
ahead with the capacity monitor.  They asked when we would have the additional
regions set up.  I said that we had the new Populopolis stuff just about ready
and that it would be all set today.  They had a few other minor things.  Anne
Artmeier wanted to know if I had gotten the fax they had sent about minor
changes to the manual (I had) and if there were any problems with the changes
they had requested (there weren't).  I said I'd try to get the revised edition
out today, but that it would certainly go out tomorrow if not today.  Marc
also asked what needed to be done on their end that wasn't being done.  I said
that other than getting the capacity monitor working, the only thing that was
really hanging us up was the lack of a direct file transfer mechanism from us
to them.  I explained for him briefly the history of the problem and what we
had tried to do about it.  He said he would think about it.

------------------------------------------------------------------------------

4-September-86 11:30am.  Janet called.  She's having trouble with remote
login.  I said I would investigate.  I also gave the the specific information
on where to upload the revised data files for Populopolis from.

------------------------------------------------------------------------------

4-September-86 3:30pm.  Called Janet.  Asked how she was faring with remote
login.  She's still had no luck.  We can't figure out what is going on since
David Vezie, Randy and I have all been able to use it successfully from a
variety of phones and modems.  I gave her the info on where to obtain the data
tables for the capacity monitor which I promised I'd generate.  She said she
hoped she could get to it tonight as she is disappearing tomorrow at noon
(their time) and won't be back until the Saturday before the press conference.

------------------------------------------------------------------------------
