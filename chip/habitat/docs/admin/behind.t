MicroCosm deviations from expectation 5/14/86

	We had planned to be able to release a beta-testable version of the
system tomorrow.  Obviously we aren't going to be able to do this.  We are
behind schedule in two major areas:

1) Testing/debugging the object behaviors -- The major impediment in this is
the unexpected cumbersomeness and slowness of the testing cycle, due to the
long distance between us and Quantum and the commmunications difficulties and
coordination problems that result.  Certain components at the Quantum end are
presently either unimplemented or only partially implemented, which makes
testing our end of those components virtually impossible.  However, we
presently have our hands full just testing the stuff that is already there.
I am at a loss to explain why the testing process is quite so cumbersome and
time consuming.  Part of it is due to having an unreliable system at the other
end, part is due to communications difficulties, and part is imponderables.

2) Setting up the beta-test world itself -- Four things must happen in order
to do this: we have to set up the tools to allow us to define the world,
Quantum has to set up the tools to take those definitions and turn them into
actual database entries in their system, we must conceptualize the world and
take our resulting design and generate the description files to create it, and
finally, Quantum must take these files, process them, and install the
resulting world elements in their system.  The first of these tasks (creation
of world definition tools for us to use) is essentially complete, save some
minor revisions in the output format that were requested by Janet Hunter
yesterday.  The status of the second task (definition processor at the Quantum
end) is unclear.  My conversations with Janet yield the impression that it has
just been started in the past few days.  The third task (conceptualization of
the world) is in the design and creative stage, but we have not yet had time
to create the formal definitions.  The fourth task awaits the execution of the
other tasks.

We are attempting to get the following elements operational for release to
Quantum on Monday (5/19):
	The avatar
	Inert and scenic objects (trees, the ground, etc.)
	Doors
	Carryable objects (get/put/throw)
	Containers
	Weapons
	Teleport devices (pending teleport-number lookup working in host)
	Magical objects (with few if any magical functions in the host though)
	Money
	Clothing
	various miscellaneous items
	Beta-version manual.
	Generate test universe regions using Riddle (pending operation of
		Quantum database generator).
Meeting this deadline will be touch-and-go given the present testing
bottlenecks.

The following components of the Quantum system are currently in a state that
is unknown due to the testing delays.  These components are required for the
beta-release:
	Interim teleport number lookup facility.
	Change-region operation.
	Container handling.

The Quantum system is currently lacking the following components required for
beta-release:
	Region database generator (to use output from Riddle).
	Avatar creation mechanism (i.e., new-user setup stuff).

The following components are scheduled for implementation or testing by us in
the interim between beta-release and CES:
	Additional regions.
	Seat objects (chairs, couches, etc.).
	Paper/Books.
	Oracular interactions.
	Additional misc. objects.
	Generic house/building graphics generator.
	Signs/text object graphics.
	Sounds.

To do this we will require the following components on the Quantum end that
are presently unimplemented:
	Paper/Book page database.
	Proper teleport-number lookup database.
	Oracle system (mechanism to connect system operators to oracles and
		collect player inputs to oracles).

The following are scheduled for implementation or testing by us after CES:
	Mail system.
	Telephone system.
	Musical objects.
	More misc. objects.
	Add lots more regions.
	Final sounds.
	Beta-test initiated revisions.
	Avatar customization and user setup utility.
	Turf customization utility.
	Creation of documents, adventures, treasures, quests, magic, and so
		on to be inserted into the world.

To allow these Quantum will have to complete the following at their end:
	Mail system.
	Telephone system.

