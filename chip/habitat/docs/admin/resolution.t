This is my understanding of the resolution of various items per our
conversation with Quantum last Friday (7/25) and previous conversations with
Janet:

 1. Generate the world -- We are forging ahead with design.  Quantum is
still working on strategies for data file transfer.  Realms we are currently
working on include (but are not limited to):

	Populopolis -- The first Avatar village.  Basically generated, needs
	to be populated with necessary objects and things to do (and
	Avatars!).

	The Forest Road -- An enchanted pathway through the woods.  Consists
	of branching path that goes off into the scenery, getting weirder the
	farther away you travel.  Has a number of surprises embedded in it,
	notably the False Oracle.  Currently mapped, and the control files for
	Riddle are set up, but the regions themselves need to be generated.

	D'nalsi Island -- This is Randy's initial adventure.  Is designed and
	mapped out, but needs to have its data generated.

	The Back Forty -- A generic woods area of relatively little
	complication.  It's most notable feature is the Not-So-Wise Man's
	house, which is required for Randy's adventure.  Exists as a map
	presently.

	The Really Quite Confusing Desert -- This is basically a maze puzzle
	(it's our homage to Crowther and Woods).  Currently just a map.

	The Beach -- Simple social area.  Mapped.

	The Ruins -- The remains of an abandoned city.  Lots of secret
	passageways and mysterious twists and turns.  Intended as a setting
	for treasure hunts and games of Assassin.  Currently a map.

 2. Teleport network -- We have dispensed with personal teleporters as far as
general use is concerned.  We still entertain the possibility of transmit-only
personal teleporters, but they are not part of the present plan.  Teleport
booths will have fixed locations with (up to) 20 character teleport 'numbers'.
Teleport 'numbers' can be arbitrary alphanumeric strings, enabling them to be
mnemonic.  We will add a feature so that you can look at a teleport booth and
find out its 'number'.

 3. Mail system -- Currently we are using Q-Link user id's as names and mail
addresses.  We have decided to defer the question of allowing Habitat mail get
sent to outside (Q-Link) mailboxes via some special delivery mechanism, but
everyone agrees that this is a design issue and does not pose any particular
technical difficulties.  We are still dissatisfied with the decision to use
Q-Link names as Avatar names, but will go along with it for the time being.
We propose reconsideration of this question after beta-test is underway and we
can collect some real data about how the world actually operates.  The host
will add a tag to mail messages indicating the sender and the time of origin.

 4. Messenger -- We will implement something like the Q-Link on-line message
system, addressing single-packet messages to remote users.  Recipients to be
indicated by user name.  The host will add a tag identifying the sender before
passing the message along to its recipient.

 5. Cursor flash -- The cursor will indicate (by flashing) when the command
interface is locked out awaiting communications with the host.

 6. Identify avatar function -- We will install an identify-avatar function
that will enable players to determine the identity of other players in their
region.  For the sake of game play we are going to make identification be
reciprocal.  Currently this will just give user name, but in the future may
add other (user provided) information.  This also adds to our disgruntlement
over the use of Q-Link names as Habitat names.  As mentioned above, we should
reexamine this issue once beta testing has started.

 7. Q-3 upgrade -- Will do.

 8. Sex change device -- We will do.

 9. Version update -- We still need to clarify for Janet the mechanism by
which we intend this to work.

10. Sound effects -- Yes, there will be sound effects, likely in the Beta-1
release.

11. Twiddle upgrade -- Quantum will do.

12. Gr_state fix in host -- We will do.

13. Oracle -- Quantum will do.  We need to provide more definition of the
operator interface by Beta-1.

14. New user signup -- We will create a new-user signup and customization
dialog program on the C64 that will be run when a person logs in to the
Habitat for the first time.  This will let the new user pick his sex, head,
and other customization characteristics.  Currently the user will not be
choosing his own name but will inherit a name from his Q-Link account.
Quantum will implement the mechanism to assign the new user a turf, mailbox,
and other wordly possessions off of a list of unassigned real estate.

15. Chairs -- Will do.

16. More heads -- We will aim to have 100 or more different possible avatar
heads.  We are all agreed that more human-type heads are desirable.  Quantum
feels only human-type heads are needed, we politely disagree.  The plan is
that all avatars will arrive with default humanoid heads (and the players will
initially be given a selection of humanoid heads to choose from) but other
choices will be made available inside the world via shops, adventures and
magic.

17. Collision detect/adjacency check in host -- We will do.

18. Bandwidth reduction -- Will do.

19. Avatar death -- Avatars are to be reincarnated on their home turf, at a
loss of any possessions they were carrying at the time of their demise and a
'fee' charged by the Oracle for its trouble.

20. Hole and shovel objects -- We will do.

21. God -- The set of tools required for a god workstation on the host needs
to be defined.

22. Orientation in change region -- Will do.  Janet will install the 'hook' to
make this possible; we will take it from there.

23. Improved patterns -- We will do.

24. Region entry and exit daemons -- Will do.  Again, Janet will install the
'hook' and we will use it.

25. Capacity handling -- This is the most significant unresolved technical
issue.  We decided to defer it for the time being and get together sometime
soon to hammer out a solution.

26. Hall of records -- We will have a book of records.  The Hall Of Records
will be a place where a permanent copy of this book is kept and made publicly
available.

27. Region transition -- We are agreed that some sort of time-filling sequence
is necessary.  We are currently working on an audio transition sequence as a
first crack at the problem.

28. Independent object motion -- We will do.

29. Night and day -- We will do.

30. Stun gun object -- We will do.

31. Shouting -- Quantum will do.

32. Region specific object sets -- We still need to define the protocol for
using this feature, but there are no major stumbling blocks.

33. Music -- We will be installing a music driver in the C64 system software.
We will likely have title music during the initial program load time.  Other
possibilities, such as jukeboxes, tape players and region transition music,
need more discussion.

34. Grenade timer -- Will do.

35. Operations procedures -- This will developed as the result of what we
learn during beta testing.

36. Final manual -- We will provide an errata sheet for the present draft in
time for beta release and a complete revised draft in time for final release.
