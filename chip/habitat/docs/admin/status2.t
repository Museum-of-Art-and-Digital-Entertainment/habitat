		Remaining Habitat tasks (7/23/86)
		---------------------------------
	What follows is intended to be an exhaustive list of the remaining
implementation tasks in the Habitat project.  They are listed in very rough
order of priority, ranked in groups from most important to least important.

Generate the world --
    Immense ongoing task to make the Habitat an interesting place to visit.
	Priority: very high
	Who: everyone
	Time: open ended, needs planning for immediate next stages
	Status: first piece of world is almost ready, various other pieces in
		various other states of design/implementation.
	Unresolved issues: File transfer to host for realm descriptions
		remains a problem.

Teleport network --
    Basic long-distance random-access transportation system.
	Priority: high
	Who: Janet to implement teleport number lookup mechanism in host; Chip
		and Randy to test and debug related object behaviors
	Time: Janet estimates <1 day for lookup engine; 1 day for C64
		integration.
	Status: C64 components all work, though they haven't been tested in
		concert as there is no way to do this; host object behaviors
		are all written, but untested due to lack of number lookup
		mechanism; everything awaits the teleport number database and
		associated access routines
	Unresolved issues: Quantum marketing has not recognized that portable
		teleporters are not feasible, nor are they desirable

More heads --
    We would like to have 100 or more different possible avatar heads by
    release time.
	Priority: high
	Who: Aric to coordinate; Gary and others to generate artwork
	Time: variable and ongoing
	Status: 35 heads and counting
	Unresolved issues: There is still some confusion over what constitutes
		acceptable dimensions of avatar variability

Sex change device --
    Aric has added sex to avatar torsos.  We need a device to let players
    choose their avatar's sex.
	Priority: high
	Who: Chip to implement object; Aric to handle graphics
	Time: 1/2 day
	Status: undone, but trivial
	Unresolved issues: none

Version update --
    We now have the ability to update the players' object disks remotely.  We
    need a mechanism in the host to use this ability.
	Priority: high to medium
	Who: Janet to implement; Chip to advise (LFL to provide data)
	Time: unknown; Janet needs more information
	Status: not done
	Unresolved issues: Janet still does not understand how this will work;
		it is unclear whether track/sector update is too blunt an
		instrument

Sound effects --
    All the objects need appropriate sound effects.
	Priority: high
	Who: Chris to create sounds; Chip and Randy to integrate with objects
	Time: 1 more week of sound creation; 3-4 days for sound integration
	Status: roughly 3/4 of sounds are done, others are progressing nicely
	Unresolved issues: none

Q-3 upgrade --
    Make it work with the latest rev of the Q-Link software.
	Priority: high
	Who: Randy or Quantum
	Time: negligible
	Status: trivial, can be done any time
	Unresolved issues: none

Mail system --
    Basic mechanism for person-to-person and broadcast non-real-time
    communications.
	Priority: high
	Who: Janet to implement mailer in host, including address lookup
		mechanism; Chip to implement object behaviors in host and C64;
		Randy to assist with C64 behaviors
	Time: 2-3 days
	Status: building blocks on our end are the paper and mailbox objects;
		the former is done, the latter is done but untested, awaiting
		unimplemented host mailer mechanism
	Unresolved issues: name space seems to still be a problem for Quantum
		marketing; the question of whether it should be possible to
		send mail to Q-Link mailboxes is still hotly debated.

Messenger --
    Basic mechanism for person-to-person on-line remote communication.
	Priority: high
	Who: Janet to implement interprocess message structure; Chip to
		implement object behaviors in host; Randy and Chip to
		implement object behaviors in C64
	Time: 3-4 days
	Status: not done
	Unresolved issues: does everyone understand that this replaces the
		phone system, which was concluded to be impractical?

Twiddle upgrade --
    The Twiddle program, which allows us to manipulate the host databases,
    needs to be revised to enable the creation and removal of objects.
	Priority: high
	Who: Janet to implement
	Time: 1 day
	Status: not done
	Unresolved issues: none

Cursor flash --
    The C64 cursor should flash or somehow change to indicate when the command
    interface is locked out awaiting communications with the host.
	Priority: high
	Who: Randy to implement on C64
	Time: <1 day
	Status: not done
	Unresolved issues: none

Gr_state fix in host --
    The host's notion of the "gr_state" variable has to be made consistent
    with the C64's.
	Priority: high
	Who: Chip to implement on host
	Time: 1 day
	Status: not done
	Unresolved issues: none

Avatar death --
    In theory, avatars can be killed in combat.  We still need to implement
    the actions that take place when an avatar actually dies.
	Priority: high to medium
	Who: Chip to implement in host
	Time: 1 day
	Status: not done
	Unresolved issues: combat resolution mechanism could be better

Collision detect/adjacency check in host --
    Routines in host to make sure avatars don't walk through things, etc.
	Priority: medium to high
	Who: Chip to implement
	Time: 1 hour to implement, another to test
	Status: basically done, can be activated any time
	Unresolved issues: none

Region entry and exit daemons --
    Mechanism in host to run region-specific routines on entry or exit to
    particular regions.
	Priority: medium to high
	Who: Janet to install hooks in host; Chip to implement daemons
	Time: 1 day to set up mechanism.  Daemons as needed.
	Status: not done
	Unresolved issues: none

Capacity handling --
    We want the host to be able to keep track of how much memory the players'
    C64s have left, so that it can decide whether there is room for new
    objects to appear or not.  This requires that the host have a database of
    the class information on the C64 object disk (it can't just keep a size
    number for each object since objects can share overlapping resources).
	Priority: medium to high
	Who: Janet and Chip to implement; Chip to provide the data
	Time: 1 week+
	Status: uncertain.  needs clearer definition.
	Unresolved issues: this item needs considerable further study

Hole and shovel objects --
    These are a couple of objects useful for Randy's initial adventure
    scenario, among other things.
	Priority: medium to high
	Who: Randy to implement C64 behavior; Chip to implement host behavior
	Time: <1 day
	Status: C64 behaviors basically written, needs integration with host
		and definition of objects in host database.
	Unresolved issues: none

Oracle --
    The host end of the oracle needs to be implemented.  The oracle takes a
    number of forms, most notably the fountain and the genie in the magic
    lamp.
	Priority: medium to high
	Who: Janet needs to implement the host stuff for this; may be done by
		Janet's new assistant
	Time: a few days
	Status: all the C64 stuff is there, and the host object behaviors are
		there; we are missing the host software to allow operators to
		communicate directly through the oracle and for things said to
		oracles to be logged for future attention
	Unresolved issues: operator interface needs to be defined

Hall of records --
    The hall of records will probably wind up being a book of records instead,
    but in any case the records to be kept need to be defined and the
    mechanisms to collect the information required to keep them up to date and
    the database required to store them must both be implemented.
	Priority: medium to high
	Who: Chip to decide on records to be kept, in consultation with the
		rest of the crew; Chip and Janet to install statistic monitor
		routines; Janet to write daily update program
	Time: 1 day to implement daily update program, 1 day to install record
		statistical monitors.
	Status: not done
	Unresolved issues: set of records to be kept needs to be defined

New user signup --
    When a new user signs up to play, several things need to be done: he needs
    to pick a name (for mailing purposes, if nothing else) and a sex, he needs
    to be assigned a turf, his avatar needs to be generated and any other
    worldly goods generated and placed.  
	Priority: medium to high
	Who: Janet to implement new user turf/avatar allocator; Chip to
		implement new user behaviors on host (if any); Randy and Aric
		to implement new user customization dialogue program.
	Time: 1 day for new user turf/avatar allocator; 3 days for new user
		customization program.
	Status: not done
	Unresolved issues: we need to choose a location in the Q-Link menu
		tree to install the entry point for Habitat

God --
    Various tools are required to give the host-based operators control over
    the goings on in the world.  The C64 already has a means of arbitrarily
    manipulating objects on command from the host.  We also need to implement
    the hand-of-god object on the C64 to allow operators to zap things
    dramatically.  The host needs a set of routines to command these various
    capabilities, and some sort of interactive utility to allow the operators
    to monitor the activity in any region and to invoke the special command
    routines.
	Priority: high to low, depending on the piece in question
	Who: Aric and Randy to implement the hand-of-god in the C64; Janet and
		Chip to create the command routines; Janet to implement the
		region monitoring routines; unknown Quantum people to
		implement the interactive operator utility
	Time: 1 day for the hand-of-god, 1 day for the command routines, an
		unknown amount of time for the other host-based facilities
	Status: most of the pieces are laying around, they need to be glued
		together though
	Unresolved issues: the design of the operator interface needs to
		be more fully defined.

Region transition --
    Implement some sort of sequence to occupy the time it takes to get from
    one region to the next.  Current plan is to blank the screen and play an
    appropriate sound effect (e.g., footsteps when walking, whizzy flying-
    through-the-ether sounds when teleporting).
	Priority: medium
	Who: Randy to implement; Aric may have to help with screen blanking
		(maybe not, as is simple); Chris to do sound effects
	Time: less than 1 day
	Status: I believe the sound effects are already done
	Unresolved issues: none

Chairs --
    Code to allow chairs and other seat-like objects to work as containers
    (i.e., so that you set things on them) and to allow avatars to sit down in
    them and get up again.  Required to make chairs something more than just
    decorations.
	Priority: medium
	Who: Aric to implement graphics; Randy and Chip to implement C64
		behavior code; Chip to implement host behavior code
	Time: 1-2 days
	Status: on hold
	Unresolved issues: none

Bandwidth reduction --
    Cheap trick to cut communications bandwidth requirements 25%-50%.
	Priority: medium
	Who: Randy to implement on our end; Janet to implement in host
	Time: trivial
	Status: already done, can be activated at any time
	Unresolved issues: we just have to set a mutually convenient point to
		do this.

Operations procedures --
    Create a guidelines document for system operators, geek gods, and similar
    folk that lays down the rules for managing the universe.
	Priority: medium
	Who: Chip to create; others (both here and at Quantum) to advise
	Time: several days
	Status: just thinking about it for the time being
	Unresolved issues: content

Orientation in change region --
    We need to change the change_region routine in the host to get the
    Avatar's new position and orientation correct based on the old position
    and orientation.
	Priority: medium
	Who: Janet to install "hook", Chip to provide routine to calculate new
		position
	Time: <1 day
	Status: not done
	Unresolved issues: none

Identify avatar function --
    Add an 'identify avatar' function that will enable players to determine
    the identity of other players in their region.
	Priority: medium
	Who: Randy to implement on C64, Chip to implement on host
	Time: <1 day
	Status: not done
	Unresolved issues: how much information can you find out?  Is
		identification automatically reciprocal (we say yes)?  Name
		space issue is still a problem for Quantum marketing

Final manual --
    We need to generate the final draft of the manual.
	Priority: medium
	Who: Chip to rewrite; Gary to do some artwork; other Quantum people
		and LFL people to coordinate design and production; Chip to
		produce errata and addenda update for beta users
	Time: a few days to rewrite
	Status: we have the basic manual complete, it just needs some
		revisions and illustrations to bring it up to date to the
		current concept of the system
	Unresolved issues: nothing important

Stun gun object --
    Will provide an alternate (less deadly) means of conflict between avatars.
    Useful for mock battles and the like, among other things.
	Priority: medium to low
	Who: Chip or Randy to implement in C64; Chip to implement in host.
	Time: 1 day
	Status: this *may* be doable with a special case of gun behavior with
		no change at all to the C64 software; otherwise unimplemented
	Unresolved issues: what is the result of being stunned?

Independent object motion --
    Graphics to allow objects to change location on the screen independent of
    avatar animation.  Needed for throwing to look right, and to make possible
    certain other minor objects (e.g., windup toys).
	Priority: medium to low
	Who: Aric to implement graphics; Chip and Randy to implement C64
		behavior code to use it
	Time: 2-3 days
	Status: not done
	Unresolved issues: none

Night and day --
    We have figured out a simple graphics trick to make it look like night in
    any region.  This is useful for implementing a true day/night cycle as
    well as for darkening caves and the like.
	Priority: low to medium
	Who: Randy to integrate graphics; Chip to implement appropriate host
		behaviors; Janet to implement time-based elements (i.e., day
		vs. night according to a clock) in host.
	Time: 1 day
	Status: Randy is working on it
	Unresolved issues: what is the day/night cycle for the host, if any?

Improved patterns --
    The present set of patterns we have is kind of yucky.  It would be nice to
    create better looking and more useful patterns.
	Priority: low
	Who: Aric to install; Aric and Gary (?) to design
	Time: <1 day
	Status: not done
	Unresolved issues: design

Region specific object sets --
    Mechanism to enable object disks to be swapped, allowing different parts
    of the world to have radically different object sets.
	Priority: low for now, high later
	Who: Randy to implement; Chip and Janet to handle region terrain-type
		transition in host
	Time: 1-3 days
	Status: on hold
	Unresolved issues: disk layout

Music --
    Need music player mechanism and music for the jukebox and tape player
    objects.
	Priority: low
	Who: Randy to implement music driver; Chris to advise; Chris and ? to
		create music (music creation can be an ongoing activity once
		the mechanism is installed); Chip to implement behavior code
		to use it
	Time: <1 day for music driver, arbitrary time for composition, 1-2
		days for behaviors
	Status: on the back burner for sure
	Unresolved issues: not relevant

Shouting --
    We figured out an extension to the player interface to allow players to
    talk to adjoining regions by "shouting".
	Priority: low
	Who: Janet needs to add some interprocess stuff in the host to make
		this happen
	Time: <1 day
	Status: not started
	Unresolved issues: none

Grenade timer --
    After some thinking, we finally devised a very clever mechanism to be the
    timer for the hand grenade object.  This needs to be installed in the
    host.
	Priority: low
	Who: Chip to implement in host; Janet to advise on timer-driven
		events in the Stratus; Randy or Aric to supplement in C64 in
		necessary (probably won't be)
	Time: <1 day
	Status: not done
	Unresolved issues: this is currently an experimental element
