MicroCosm features and components, 26-September-1985

A full, finished system will include the following elements (note the numbers
as we'll use those to refer back to the items).

1) Baseline home system (resident on C64, Amiga).  Includes graphics for
	rendering backgrounds, scenery, objects, avatar animation, and
	close-up screens; basic sound effects for avatars and objects;
	interactive avatar control interface; communications protocol handler
	for interaction with dial-up host using 300 baud Commodore modem;
	core/disk object memory cache manage; object behavior modules for
	objects essential to system operation (notably the avatars themselves,
	objects relating to the mail and inter-player communications systems,
	and the basic generic routines for important broad categories of
	objects, such as containers and vehicles).

2) Home system communications enhancement (resident on C64, Amiga).  Adds
	support for 1200 baud modem and high-speed link to central host.

3) Home system avatar graphics enhancement (resident on C64, Amiga).  Adds
	graphics support so that avatars may have additional forms besides the
	basic humanoid shape (e.g., weird aliens, dogs & cats, birds, fish
	heads, etc.).

4) Basic object set (resident on C64, Amiga, with matching support routines
	resident on the central host).  This is the set of object behavior
	modules and imagery for the basic collection of common objects that
	everyone knows about.  Includes such things as trees, houses,
	clothing, weapons, automobiles, money, furniture, food, rocks, etc.

5) Advanced object set (available for C64, Amiga, stored on the central host
	and downloadable on demand, with matching support routines resident on
	the central host).  This is the set of object behavior modules and
	imagery for the more extensive collection of objects any one of which
	will only be encountered by a small subset of the player population.
	Includes rare treasures, specialized tools, unusual buildings, and so
	on.  It is foreseen that this set of objects will grow continuously as
	the system matures with use.

6) Avatar personality kit (available for C64, Amiga).  Interactive package to
	allow a player to customize the appearance of his avatar.  Will allow
	him to change the body shape, body type, proportions, coloration, etc.

7) Turf builder kit (available for C64, Amiga).  Interactive package to allow
	a player to customize the appearance and arrangement of his turf.
	Will allow him to place buildings, walls, furniture, doors, windows,
	booby-traps, and other household artifacts, and alter their
	positions, color, proportions, and so on.

8) Baseline host system (resident on central host machine).  All the software
	to make the universe work with multiple players.  Includes Looi(TM),
	the Low Overhead Object Interpreter, which handles all access to the
	host object database and controls execution of the host resident
	portion of the object behavior modules; communications handlers to
	manage communications with a large number of simultaneous participants
	using the system; message switcher to routine communications from one
	player to another; transaction processor to mediate between the
	various players and Looi; and the other components necessary to the
	basic functioning of the system.

9) Host support routines for basic object set.  Software modules to handle the
	part of the basic object set which must reside in the host.

10) Host support routines for the advanced object set.  Ditto.

11) Third-party object creation kit.  Software package to allow third-party
	software developers to create objects that will reside in the
	MicroCosm system.  This package will enable others to extend the
	universe itself by adding new elements for players to encounter and
	manipulate.  Includes documentation and standards; tools for
	programming object behavior modules on the C64 and Amiga and
	installing imagery to go with the objects thus created; and matching
	tools for programming the corresponding host-resident object routines.

12) Third-party gateway creation kit.  Software package to allow third-party
	software developers to use the MicroCosm universe as a gateway into
	other, unrelated software running on the host system (e.g., EA's
	two-player network Archon game).  Includes documentation and
	standards; and software tools for plugging their programs into the
	MicroCosm infrastructure.


The Hypercrunch mode scenario delivers:

15-March-1986: #1, some of #4, #8 and some of #9

1-June-1986: #2, rest of #4, some of #5, rest of #9, some of #10, #11 and #12

#3, the rest of #5, #6, #7, and the rest of #10 come later as ramp-down tasks
	or as separate followup projects.


The Semicrunch mode scenario delivers:

1-June-1986: #1, #4, partial #6, partial #7, #8 and #9

1-August-1986: #2, maybe #3 (if it can be done), #5, #6, #7, #10, #11 and #12
