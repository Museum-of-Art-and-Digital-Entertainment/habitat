		Remaining Habitat tasks (7/25/86)
		---------------------------------
	What follows is intended to be an exhaustive list of the remaining
implementation tasks in the Habitat project.  They are listed in very rough
order of priority, ranked in groups from most important to least important.

 1. Generate the world -- 0 (ongoing (all))
    Immense ongoing task to make the Habitat an interesting place to visit.
	Who: everyone
	Time: open ended, needs planning for immediate next stages
	Status: first piece of world is almost ready, various other pieces in
		various other states of design/implementation.
	Unresolved issues: File transfer to host for realm descriptions
		remains a problem.

 2. Teleport network -- 1 (c=1/2 a=0 r=1/2 j=1)
    Basic long-distance random-access transportation system.
	Who: Janet to implement teleport number lookup mechanism in host; Chip
		and Randy to test and debug related object behaviors
	Time: Janet estimates <1 day for lookup engine; 1 day for C64
		integration.
	Status: C64 components all work, though they haven't been tested in
		concert as there is no way to do this; host object behaviors
		are all written, but untested due to lack of number lookup
		mechanism; everything awaits the teleport number database and
		associated access routines
	Unresolved issues: none

 3. Mail system -- 1 (c=1 a=0 r=1 j=2)
    Basic mechanism for person-to-person and broadcast non-real-time
    communications.
	Who: Janet to implement mailer in host, including address lookup
		mechanism; Chip to implement object behaviors in host and C64;
		Randy to assist with C64 behaviors
	Time: 2 days
	Status: building blocks on our end are the paper and mailbox objects;
		the former is done, the latter is done but untested, awaiting
		unimplemented host mailer mechanism
	Unresolved issues: none

 4. Messenger -- 1 (c=1 a=0 r=1 j=3)
    Basic mechanism for person-to-person on-line remote communication.
	Who: Janet to implement interprocess message structure; Chip to
		implement object behaviors in host; Randy and Chip to
		implement object behaviors in C64
	Time: 3 days
	Status: not done
	Unresolved issues: none

 5. Cursor flash -- 1 (c=0 a=0 r=1/4 j=0)
    The C64 cursor should flash or somehow change to indicate when the command
    interface is locked out awaiting communications with the host.
	Who: Randy to implement on C64
	Time: <1 day
	Status: not done
	Unresolved issues: none

 6. Identify avatar function -- 1 (c=1/2 a=0 r=1/2 j=0)
    Add an 'identify avatar' function that will enable players to determine
    the identity of other players in their region.
	Who: Randy to implement on C64, Chip to implement on host
	Time: <1 day
	Status: not done
	Unresolved issues: none

 7. Q-3 upgrade -- 1 (nil (r))
    Make it work with the latest rev of the Q-Link software.
	Who: Randy or Quantum
	Time: negligible
	Status: trivial, can be done any time
	Unresolved issues: none

 8. Sex change device -- 2 (c=1/2 a=0 r=0 j=0)
    Aric has added sex to avatar torsos.  We need a device to let players
    choose their avatar's sex.
	Who: Chip to implement object; Aric to handle graphics
	Time: 1/2 day
	Status: undone, but trivial
	Unresolved issues: none

 9. Version update -- 2 (c=3 a=0 r=1/2 j=3)
    We now have the ability to update the players' object disks remotely.  We
    need a mechanism in the host to use this ability.
	Who: Janet to implement; Chip to advise (LFL to provide data)
	Time: unknown; Janet needs more information
	Status: not done
	Unresolved issues: it is somewhat unclear whether track/sector update
		is too blunt an instrument

10. Sound effects -- 2 (c=0 a=0 r=2 j=0)
    All the objects need appropriate sound effects.
	Who: Chris to create sounds; Chip and Randy to integrate with objects
	Time: 1 more week of sound creation; 3-4 days for sound integration
	Status: roughly 3/4 of sounds are done, others are progressing nicely
	Unresolved issues: none

11. Twiddle upgrade -- 1 (c=0 a=0 r=0 j=1)
    The Twiddle program, which allows us to manipulate the host databases,
    needs to be revised to enable the creation and removal of objects.
	Who: Janet to implement
	Time: 1 day
	Status: not done
	Unresolved issues: none

12. Gr_state fix in host -- 2 (c=1 a=0 r=0 j=0)
    The host's notion of the "gr_state" variable has to be made consistent
    with the C64's.
	Who: Chip to implement on host
	Time: 1 day
	Status: not done
	Unresolved issues: none

13. Oracle -- 2 (c=0 a=0 r=0 j=3*)
    The host end of the oracle needs to be implemented.  The oracle takes a
    number of forms, most notably the fountain and the genie in the magic
    lamp.
	Who: Janet needs to implement the host stuff for this; may be done by
		Janet's new assistant
	Time: a few days
	Status: all the C64 stuff is there, and the host object behaviors are
		there; we are missing the host software to allow operators to
		communicate directly through the oracle and for things said to
		oracles to be logged for future attention
	Unresolved issues: operator interface needs to be defined

14. New user signup -- 2 (c=0 a=5 r=1/2 j=1)
    When a new user signs up to play, several things need to be done: he needs
    to pick a name (for mailing purposes, if nothing else) and a sex, he needs
    to be assigned a turf, his avatar needs to be generated and any other
    worldly goods generated and placed.  
	Who: Janet to implement new user turf/avatar allocator; Chip to
		implement new user behaviors on host (if any); Randy and Aric
		to implement new user customization dialogue program.
	Time: 1 day for new user turf/avatar allocator; 3 days for new user
		customization program.
	Status: not done
	Unresolved issues: none

15. Chairs -- 2 (c=1 a=1 r=0 j=0)
    Code to allow chairs and other seat-like objects to work as containers
    (i.e., so that you set things on them) and to allow avatars to sit down in
    them and get up again.  Required to make chairs something more than just
    decorations.
	Who: Aric to implement graphics; Randy and Chip to implement C64
		behavior code; Chip to implement host behavior code
	Time: 1-2 days
	Status: on hold
	Unresolved issues: none

16. More heads -- 2 (ongoing (a))
    We would like to have 100 or more different possible avatar heads by
    release time.
	Who: Aric to coordinate; Gary and others to generate artwork
	Time: variable and ongoing
	Status: 35 heads and counting
	Unresolved issues: none

17. Collision detect/adjacency check in host -- 2 (nil (c))
    Routines in host to make sure avatars don't walk through things, etc.
	Who: Chip to implement
	Time: 1 hour to implement, another to test
	Status: basically done, can be activated any time
	Unresolved issues: none

18. Bandwidth reduction -- 2 (nil (rj))
    Cheap trick to cut communications bandwidth requirements 25%-50%.
	Who: Randy to implement on our end; Janet to implement in host
	Time: trivial
	Status: already done, can be activated at any time
	Unresolved issues: we just have to set a mutually convenient point to
		do this.

19. Avatar death -- 3 (c=1 a=0 r=0 j=0)
    In theory, avatars can be killed in combat.  We still need to implement
    the actions that take place when an avatar actually dies.
	Who: Chip to implement in host
	Time: 1 day
	Status: not done
	Unresolved issues: combat resolution mechanism could be better

20. Hole and shovel objects -- 3 (c=1/4 a=0 r=0 j=0)
    These are a couple of objects useful for Randy's initial adventure
    scenario, among other things.
	Who: Randy to implement C64 behavior; Chip to implement host behavior
	Time: <1 day
	Status: C64 behaviors basically written, needs integration with host
		and definition of objects in host database.
	Unresolved issues: none

21. God -- 3 (c=1 a=1 r=1 j=1)
    Various tools are required to give the host-based operators control over
    the goings on in the world.  The C64 already has a means of arbitrarily
    manipulating objects on command from the host.  We also need to implement
    the hand-of-god object on the C64 to allow operators to zap things
    dramatically.  The host needs a set of routines to command these various
    capabilities, and some sort of interactive utility to allow the operators
    to monitor the activity in any region and to invoke the special command
    routines.
	Who: Aric and Randy to implement the hand-of-god in the C64; Janet and
		Chip to create the command routines; Janet to implement the
		region monitoring routines; unknown Quantum people to
		implement the interactive operator utility
	Time: 1 day for the hand-of-god, 1 day for the command routines, an
		unknown amount of time for the other host-based facilities
	Status: most of the pieces are laying around, they need to be glued
		together though
	Unresolved issues: the operator interface needs to be more fully
		defined.

22. Orientation in change region -- 3 (c=1/2 a=0 r=0 j=1/2)
    We need to change the change_region routine in the host to get the
    Avatar's new position and orientation correct based on the old position
    and orientation.
	Who: Janet to install "hook", Chip to provide routine to calculate new
		position
	Time: <1 day
	Status: not done
	Unresolved issues: none

23. Improved patterns -- 3 (c=0 a=1/2 r=0 j=0)
    The present set of patterns we have is kind of yucky.  It would be nice to
    create better looking and more useful patterns.
	Who: Aric to install; Aric and Gary (?) to design
	Time: <1 day
	Status: not done
	Unresolved issues: design

24. Region entry and exit daemons -- 4 (c=1/2 a=0 r=0 j=1)
    Mechanism in host to run region-specific routines on entry or exit to
    particular regions.
	Who: Janet to install hooks in host; Chip to implement daemons
	Time: 1 day to set up mechanism.  Daemons as needed.
	Status: not done
	Unresolved issues: none

25. Capacity handling -- 4 (c=5 a=0 r=5 j=5)
    We want the host to be able to keep track of how much memory the players'
    C64s have left, so that it can decide whether there is room for new
    objects to appear or not.  This requires that the host have a database of
    the class information on the C64 object disk (it can't just keep a size
    number for each object since objects can share overlapping resources).
	Who: Janet and Chip to implement; Chip to provide the data
	Time: 1 week+
	Status: uncertain.  needs clearer definition.
	Unresolved issues: this item needs considerable further study

26. Hall of records -- 4 (c=1 a=0 r=0 j=1)
    The hall of records will probably wind up being a book of records instead,
    but in any case the records to be kept need to be defined and the
    mechanisms to collect the information required to keep them up to date and
    the database required to store them must both be implemented.
	Who: Chip to decide on records to be kept, in consultation with the
		rest of the crew; Chip and Janet to install statistic monitor
		routines; Janet to write daily update program
	Time: 1 day to implement daily update program, 1 day to install record
		statistical monitors.
	Status: not done
	Unresolved issues: set of records to be kept needs to be defined

27. Region transition -- 4 (c=0 a=1/2 r=1/2 j=0)
    Implement some sort of sequence to occupy the time it takes to get from
    one region to the next.  Current plan is to blank the screen and play an
    appropriate sound effect (e.g., footsteps when walking, whizzy flying-
    through-the-ether sounds when teleporting).
	Who: Randy to implement; Aric may have to help with screen blanking
		(maybe not, as is simple); Chris to do sound effects
	Time: less than 1 day
	Status: I believe the sound effects are already done
	Unresolved issues: none

28. Independent object motion -- 4 (c=1/2 a=2 r=0 j=0)
    Graphics to allow objects to change location on the screen independent of
    avatar animation.  Needed for throwing to look right, and to make possible
    certain other minor objects (e.g., windup toys).
	Who: Aric to implement graphics; Chip and Randy to implement C64
		behavior code to use it
	Time: 2-3 days
	Status: not done
	Unresolved issues: none

29. Night and day -- 4 (c=1/2 a=0 r=1/2 j=1/2)
    We have figured out a simple graphics trick to make it look like night in
    any region.  This is useful for implementing a true day/night cycle as
    well as for darkening caves and the like.
	Who: Randy to integrate graphics; Chip to implement appropriate host
		behaviors; Janet to implement time-based elements (i.e., day
		vs. night according to a clock) in host.
	Time: 1 day
	Status: Randy is working on it
	Unresolved issues: what is the day/night cycle for the host, if any?

30. Stun gun object -- 5 (c=1/2 a=0 r=1/2 j=0)
    Will provide an alternate (less deadly) means of conflict between avatars.
    Useful for mock battles and the like, among other things.
	Who: Chip or Randy to implement in C64; Chip to implement in host.
	Time: 1 day
	Status: this *may* be doable with a special case of gun behavior with
		no change at all to the C64 software; otherwise unimplemented
	Unresolved issues: what is the result of being stunned?

31. Shouting -- 5 (c=1/4 a=0 r=0 j=1/2)
    We figured out an extension to the player interface to allow players to
    talk to adjoining regions by "shouting".
	Who: Janet needs to add some interprocess stuff in the host to make
		this happen
	Time: <1 day
	Status: not started
	Unresolved issues: none

32. Region specific object sets -- 6 (c=0 a=0 r=2 j=1)
    Mechanism to enable object disks to be swapped, allowing different parts
    of the world to have radically different object sets.
	Who: Randy to implement; Chip and Janet to handle region terrain-type
		transition in host
	Time: 1-3 days
	Status: on hold
	Unresolved issues: disk layout

33. Music -- 6 (c=0 a=0 r=1 j=0)
    Need music player mechanism and music for the jukebox and tape player
    objects.
	Who: Randy to implement music driver; Chris to advise; Chris and ? to
		create music (music creation can be an ongoing activity once
		the mechanism is installed); Chip to implement behavior code
		to use it
	Time: <1 day for music driver, arbitrary time for composition, 1-2
		days for behaviors
	Status: on the back burner for sure
	Unresolved issues: not relevant

34. Grenade timer -- 6 (c=1/2 a=0 r=0 j=1/2)
    After some thinking, we finally devised a very clever mechanism to be the
    timer for the hand grenade object.  This needs to be installed in the
    host.
	Who: Chip to implement in host; Janet to advise on timer-driven
		events in the Stratus; Randy or Aric to supplement in C64 if
		necessary (probably won't be)
	Time: <1 day
	Status: not done
	Unresolved issues: this is currently an experimental element

35. Operations procedures -- background (ongoing (cj))
    Create a guidelines document for system operators, geek gods, and similar
    folk that lays down the rules for managing the universe.
	Who: Chip to create; others (both here and at Quantum) to advise
	Time: several days
	Status: just thinking about it for the time being
	Unresolved issues: content

36. Final manual -- background (ongoing (c))
    We need to generate the final draft of the manual.
	Who: Chip to rewrite; Gary to do some artwork; other Quantum people
		and LFL people to coordinate design and production; Chip to
		produce errata and addenda update for beta users
	Time: a few days to rewrite
	Status: we have the basic manual complete, it just needs some
		revisions and illustrations to bring it up to date to the
		current concept of the system
	Unresolved issues: none
