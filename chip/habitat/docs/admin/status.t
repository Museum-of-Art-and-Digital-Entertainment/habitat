			Remaining Habitat tasks
			-----------------------
	What follows is intended to be an exhaustive list of the remaing
implementation tasks in the Habitat project.  They are listed in very rough
order of priority, ranked in groups from most important to least important.

Generate the world --
    Immense ongoing task to make the Habitat an interesting place to visit.
	Priority: very high
	Who: everyone
	Time: open ended, needs planning for immediate next stages
	Status: first piece of world is almost ready, various other pieces in
		various other states of design/implementation

Teleport network --
    Basic long-distance random-access transportation system.
	Priority: high
	Who: Janet to implement teleport number lookup mechanism in host; Chip
		and Randy to test and debug related object behaviors
	Time: less than 1 week?
	Status: C64 components all work, though they haven't been tested in
		concert as there is no way to do this; host object behaviors
		are all written, but untested due to lack of number lookup
		mechanism; everything awaits the teleport number database and
		associated access routines

More heads --
    We would like to have 100 or more different possible avatar heads by
    release time.
	Priority: high
	Who: Aric to coordinate; Gary and others to generate artwork
	Time: variable and ongoing
	Status: 20 heads and counting

Sex change device --
    Aric has added sex to avatar torsos.  We need a device to let players
    choose their avatar's sex.
	Priority: high
	Who: Chip to implement object; Aric to handle graphics
	Time: 1/2 day
	Status: undone, but trivial

Version update --
    We now have the ability to update the players' object disks remotely.  We
    need a mechanism in the host to use this ability.
	Priority: high
	Who: Janet to implement; Chip to advise
	Time: a few days
	Status: not done

Avatar death --
    In theory, avatars can be killed in combat.  We still need to define a
    plausable combat resolution mechanism and to implement the actions that
    take place when an avatar actually dies.  This includes defining what
    reincarnation REALLY means.
	Priority: high
	Who: Chip to design, in consultation with everyone else; Chip and
		Janet to implement in host
	Time: several days
	Status: not done

Sound effects --
    All the objects need appropriate sound effects.
	Priority: high
	Who: Chris to create sounds; Chip and Randy to integrate with objects
	Time: a week or so for sounds to be finished, a day or two to
		integrate and test
	Status: roughly 60% of sounds are done, others are progressing nicely

Q-3 upgrade --
    Make it work with the latest rev of the Q-Link software.
	Priority: high
	Who: Randy to advise Quantum; various Quantum folk to implement
	Time: negligable
	Status: should just work, but hasn't been tried

Collision detect/adjacency check in host --
    Routines in host to make sure avatars don't walk through things, etc.
	Priority: medium to high
	Who: Chip to implement
	Time: 1 hour to implement, another to test
	Status: basically done, needs to be activated

Region entry and exit daemons --
    Mechanism in host to run region-specific routines on entry or exit to
    particular regions.
	Priority: medium to high
	Who: Janet to install hooks in host; Chip to implement daemons
	Time: unknown
	Status: not done

Capacity handling --
    We want the host to be able to keep track of how much memory the players'
    C64s have left, so that it can decide whether there is room for new
    objects to appear or not.  This requires that the host have a database of
    the class information on the C64 object disk (it can't just keep a size
    number for each object since objects can share overlapping resources).
	Priority: medium to high
	Who: Janet and Chip to implement; Chip to provide the data
	Time: 1 week
	Status: this is a hairy pain in the you-know-where; in particular, it
		is unclear how this information will be stored in the host
		(i.e., in memory or on disk); fortunately, it is not urgent,
		as other, simpler strategies can be used to satisfice in the
		meantime

Hole and shovel objects --
    These are a couple of objects useful for Randy's initial adventure
    scenario, among other things.
	Priority: medium to high
	Who: Randy to implement C64 behavior; Chip to implement host behavior
	Time: less than 1 day
	Status: C64 behaviors basically written, needs integration with host
		and definition of objects in host database.

LRU memory reclamation --
    A more clever algorithm to determine which old data to throw away when
    more memory is needed in the C64.
	Priority: medium to high
	Who: Randy to implement
	Time: 1/2 week
	Status: not started; a lot of work to debug

Oracle --
    The host end of the oracle needs to be implemented.  The oracle takes a
    number of forms, most notably the fountain and the genie in the magic
    lamp.
	Priority: medium to high
	Who: Janet needs to implement the host stuff for this
	Time: unknown
	Status: all the C64 stuff is there, and the host object behaviors are
		there; we are missing the host software to allow operators to
		communicate directly through the oracle and for things said to
		oracles to be logged for future attention

Hall of records --
    The hall of records will probably wind up being a book of records instead,
    but in any case the records to be kept need to be defined and the
    mechanisms to collect the information required to keep them up to date and
    the database required to store them must both be implemented.
	Priority: medium to high
	Who: Chip to decide on records to be kept, in consultation with the
		rest of the crew; Janet to implement record collecting and
		storage facilities on host; Chip to assist in host
		implementation to the degree this is possible
	Time: several days, though ongoing since we could think of new records
		to keep at any time
	Status: not done

New user signup --
    When a new user signs up to play, several things need to be done: he needs
    to pick a name (for mailing purposes, if nothing else) and a sex, he needs
    to be assigned a turf, his avatar needs to be generated and any other
    worldly goods generated and placed.  This all happens in the host, though
    some sort of dialog at the Q-Link level is probably best for getting the
    name and sex choices.
	Priority: medium to high
	Who: Janet and other (unknown) Quantum folk to implement
	Time: unknown
	Status: not done

God --
    Various tools are required to give the host-based operators control over
    the goings on in the world.  The C64 already has a means of arbitrarily
    creating and deleting objects on command from the host, though we still
    want to add a way to arbitrarily fiddle with an object's state from the
    host.  We also need to implement the hand-of-god object on the C64 to
    allow operators to zap things dramatically.  The host needs a set of
    routines to command these various capabilities, and some sort of
    interactive utility to allow the operators to monitor the activity in any
    region and to invoke the special command routines.
	Priority: high to low, depending on the piece in question
	Who: Randy to implement the state twiddler behavior; Aric and Randy to
		implement the hand-of-god in the C64; Janet and Chip to create
		the command routines; Janet to implement the region monitoring
		routines; unknown Quantum people to implement the
		interactive operator utility
	Time: a few hours for the state twiddler, a 1-2 days for the
		hand-of-god, 1-2 days for the command routines, an unknown
		amount of time for the other host-based facilities
	Status: most of the pieces are laying around, they need to be glued
		together though; the design of the operator's utility needs to
		be more carefully thought out.

Region transition --
    Implement some sort of sequence to occupy the time it takes to get from
    one region to the next.  Current plan is to blank the screen and play an
    appropriate sound effect (e.g., footsteps when walking, whizzy flying-
    through-the-ether sounds when teleporting).
	Priority: medium
	Who: Randy to implement; Aric may have to help with screen blanking
		(maybe not as is simple); Chris to do sound effects
	Time: less than 1 day
	Status: I believe the sound effects are already done

Chairs --
    Code to allow chairs and other seat-like objects to work as containers
    (i.e., so that you set things on them) and to allow avatars to sit down in
    them and get up again.  Required to make chairs something more than just
    decorations.
	Priority: medium, but possibly these ought to be removed from the
		design?
	Who: Aric to implement graphics; Randy and Chip to implement C64
		behavior code; Chip to implement host behavior code; Janet may
		have to change the host database engine slightly.
	Time: several days
	Status: awaiting, among other things, a design decision as to whether
		we even should bother

Bandwidth reduction --
    Cheap trick to cut communications bandwidth requirements 25%-50%.
	Priority: medium
	Who: Randy to implement on our end; Janet to implement in host
	Time: minutes to hours
	Status: already done, but currently de-installed in order to ease
		debugging of other things; should just work

Operations procedures --
    Create a guidelines document for system operators, geek gods, and similar
    folk that lays down the rules for managing the universe.
	Priority: medium
	Who: Chip to create; others (both here and at Quantum) to advise
	Time: several days
	Status: just thinking about it for the time being

Mail system --
    Basic mechanism for person-to-person and broadcast non-real-time
    communications.
	Priority: medium
	Who: Janet to implement mailer in host, including address lookup
		mechanism; Chip to implement object behaviors in host and C64;
		Randy to assist with C64 behaviors
	Time: 1 week?
	Status: building blocks on our end are the paper and mailbox objects;
		the former is done, the latter is done but untested, awaiting
		unimplemented host mailer mechanism

Final manual --
    We need to generate the final draft of the manual.
	Priority: medium
	Who: Chip to rewrite; Gary to do some artwork; other Quantum people
		and LFL people to coordinate design and production
	Time: a few days to rewrite, who knows how long for the rest?
	Status: we have the basic manual complete, it just needs some
		revisions and illustrations to bring it up to date to the
		current concept of the system

Key object "do" behavior --
    This will provide a means for distinguishing one key from another, for
    those people who have lots of locks.
	Priority: medium
	Who: Chip or Randy to implement in C64
	Time: less than 1/2 day
	Status: not done

Stun gun object --
    Will provide an alternate (less deadly) means of conflict between avatars.
    Useful for mock battles and the like, among other things.
	Priority: medium
	Who: Chip or Randy to implement in C64; Chip to implement in host.
	Time: 1 day
	Status: this *may* be doable with a special case of gun behavior with
		no change at all to the C64 software; otherwise unimplemented

Independent object motion --
    Graphics to allow objects to change location on the screen independent of
    avatar animation.  Needed for throwing to look right, and to make possible
    certain other minor objects (e.g., windup toys).
	Priority: medium to low
	Who: Aric to implement graphics; Chip and Randy to implement C64
		behavior code to use it
	Time: 2-3 days
	Status: not done

Telephones --
    Basic mechanism for person-to-person real-time remote communication.
	Priority: medium to low
	Who: Janet to implement interprocess communications structure and
		telephone number database lookup mechanism; Chip to implement
		object behaviors in host and C64; Randy to assist with C64
		behaviors; Aric to add choreography for phone handling.
	Time: 2-3 weeks?
	Status: interprocess communications paths figured out, underlying host
		code otherwise on hold and unimplemented; host and C64
		behavior code written but never tested

Failure recovery --
    We would like the C64 to be able to recover from certain catastrophic
    failures by (essentially) rebooting and getting all-new region description
    information from the host.
	Priority: medium to low
	Who: Randy to implement; Chip to kibitz
	Time: a few days
	Status: this is one of those things that looks better in the abstract
		than in the concrete; we probably won't do it, since 1) any
		error bad enough to require this is probably bad enough to
		mess the C64 up enough that it can't do this even if it wanted
		to, and 2) such errors shouldn't occur anyhow.

Night and day --
    We have figured out a simple graphics trick to make it look like night in
    any region.  This is useful for implementing a true day/night cycle as
    well as for darkening caves and the like.
	Priority: low to medium
	Who: Aric to implement graphics; Randy to integrate graphics with
		behaviors; Chip to implement appropriate host behaviors; Janet
		to implement time-based elements (i.e., day vs. night
		according to a clock) in host.
	Time: 2-4 days
	Status: on hold

Improved patterns --
    The present set of patterns we have is kind of yucky.  It would be nice to
    create better looking and more useful patterns.
	Priority: low
	Who: Aric to install; Aric and Gary (?) to design
	Time: less than 1 day
	Status: not done

Region specific object sets --
    Mechanism to enable object disks to be swapped, allowing different parts
    of the world to have radically different object sets.
	Priority: low for now, high later
	Who: Randy to implement; Chip and Janet to handle region terrain-type
		transition in host
	Time: several days
	Status: on hold

Music --
    Need music player mechanism and music for the jukebox and tape player
    objects.
	Priority: low
	Who: Randy to implement music driver; Chris to advise; Chris and ? to
		create music (music creation can be an ongoing activity once
		the mechanism is installed); Chip to implement behavior code
		to use it
	Time: less than 1 day for music driver, arbitrary time for
		composition, 1 or 2 days for behaviors
	Status: on the back burner for sure

Bus system --
    A form of collective transportation...
	Priority: low, probably will remove from design
	Who: Janet to implement basic mechanism in host; Chip to implement
		behaviors in host and C64
	Time: days and days
	Status: not done, probably not worth doing

Shouting --
    We figured out an extension to the player interface to allow players to
    talk to adjoining regions by "shouting".
	Priority: low
	Who: Janet needs to add some interprocess stuff in the host to make
		this happen
	Time: days?
	Status: not started; may not be done, as is a lot of hassle for
		relatively small return

Grenade timer --
    After some thinking, we finally devised a very clever mechanism to be the
    timer for the hand grenade object.  This needs to be installed in the
    host.
	Priority: low
	Who: Chip to implement in host; Randy or Aric to suplement in C64 in
		necessary (probably won't be)
	Time: less than 1 day
	Status: not done
