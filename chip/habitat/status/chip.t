From chip Mon Apr 20 17:31:43 1987
Subject: status report
Today:
	finished bug report form, with accompanying writeup for Quantum
	created updated master maps for Populopolis, printed them out
	coded fix for ghost-walk-through-door bug
	installed a better error message for teleport failure
	organized status report & task summary files for project tracking

Tomorrow:
	finish maps for rest of world
	fix mailbox help message
	figure out why auto-teleport isn't quite right yet
	finish master obj manual (assuming Aric gets me the image printouts)
	investigate head checkpointing stuff
..................................................
From chip Tue Apr 21 17:30:24 1987
Received: by moth; 21 APR 87 17:30:24 PST
From: chip (Chip Morningstar -- "Software Without Moving Parts")
To: aric, chip, farmer, nancy, sda
Subject: status report
Status: R

Today:
	revised bug report form on basis of last night's playtest
	attended project leader meeting
	finished world maps
	fixed (I hope) auto-teleportation (on test system now)
	continued object manual (almost there!)
	looked into head checkpointing
Didn't:
	fix mailbox help message (forgot to look up quote)
	finish object manual
Tomorrow:
	fix mailbox help message
	finish object manual
	code stuff for book-title HELP
	figure out why Aric couldn't put down his wand after teleport
	code door restrictions
..................................................
From chip Wed Apr 22 21:50:33 1987
Received: by moth; 22 APR 87 21:50:33 PST
From: chip (Chip Morningstar -- "Software Without Moving Parts")
To: aric, chip, farmer, nancy, sda
Subject: status report
Status: R

Today:
	finished object manual (hooray!)
	organized and prioritized task summary list
	went to staff meeting
Didn't:
	fix mailbox help message (forgot to look up quote AGAIN)
	code book title stuff, door restriction stuff
	fix wand-put-after-teleport bug
Tomorrow:
	book title HELP
	fix mailbox help message (please)
	make sure book title, key number, magic, etc., work with vendo HELP
	code door restrictions
	try to fix wand-put-after-teleport bug
..................................................
From chip Fri Apr 24 17:34:51 1987
Received: by moth; 24 APR 87 17:34:51 PST
From: chip (Chip Morningstar -- "Software Without Moving Parts")
To: aric, chip, farmer, nancy, sda
Subject: status report 4/23 & 4/24
Status: R

Today and yesterday:
	fixed mailbox help messages
	did book title help stuff (Janet's routines don't work right yet)
	updated vendo HELP stuff
	spent a lot of time meeting with the guys from TI
Didn't:
	code door restriction stuff
	work on teleport/wand problem
Monday:
	bug Janet about book title routines
	door restrictions
	wand/teleport bug
	multi-door entry positioning bug (#12 and #x41)
	work with Randy making generic_switch objects send response
	update maps some more (since Aric's rearranged things a bit)
..................................................
From chip Mon Apr 27 19:24:26 1987
Received: by moth; 27 APR 87 19:24:26 PDT
From: chip (Chip Morningstar -- "Software Without Moving Parts")
To: aric, chip, farmer, nancy, sda
Subject: status report
Status: R

Today:
	bugged Janet about fixing book title stuff (should be in tomorrow)
	coded door restrictions (ready to test)
	found auto-teleport bug (not fixed yet, but I know what's wrong)
	coded stuff for multi-door positioning (needs some work by Janet)
	updated maps; printed them out
	made compass DO give message with west direction (needs test)
	made escape device HELP show charge remaining (needs test)
	reduced fortune price from $10 to $2
	went to habiteam meeting
Didn't:
	finish fixing autoteleport
	work on generic_switch objects (Randy did it all!)
Tomorrow:
	test out stuff added today
	talk to Janet about adding ESP failure error message
	investigate PUT putting things in the wrong place
	finish fixing autoteleport
	bug Janet about book title, region transition change for doors
..................................................
From chip Tue Apr 28 16:56:59 1987
Received: by moth; 28 APR 87 16:56:59 PDT
From: chip (Chip Morningstar -- "Software Without Moving Parts")
To: aric, chip, farmer, nancy, sda
Subject: my status report, 4/28
Status: R

Today:
	tested book title stuff (something's still broken in Janet's code)
	fixed spray cans messing up head pattern
	coded fix for flashlight/ghost problem (Janet needs to incorporate)
	fixed auto-teleport (for sure this time)
	got compass working independent of orientation (sends text message)
	made escape device help give charge
	added asynch choreography to coke machine, fortune machine
	fixed problem in vendo help tables
	bugged Janet about her stuff
Didn't:
	investigate PUT bug (Randy fixed it before I got here!)
Tomorrow:
	bug Janet about book title problems, door entry stuff, ESP failure,
		ghosts & flashlights
	finish anything waiting on the above tasks, if she finishes her part
	look for more stuff to do (possibly: work on Ghu, code Xerox machine
		object, code binder object, bug Gary about additional artwork)

From chip Thu Apr 30 17:29:13 1987
Received: by moth; 30 APR 87 17:29:13 PDT
From: chip (Chip Morningstar -- "Software Without Moving Parts")
To: aric, chip, farmer, nancy, sda
Subject: my status report, 4/30
Status: R

Today & Yesterday:
	got book title HELP working
	got multi-door region entry working
	spent hours in meetings
	fixed vendo HELP so it works right with both front and back halves
	coded modification to Scumm compiler to output checksums (for Maniac)
Tomorrow:
	debugging Scumm modification, if needed
	shepherd Eric Drexler around
	anything that comes up in tonight's test that needs attending to

From chip Thu May  7 17:19:24 1987
Received: by moth; 07 MAY 87 17:19:24 PDT
From: chip (Chip Morningstar -- "Software Without Moving Parts")
To: aric, chip, farmer, nancy, sda
Subject: status report, 5/7
Status: R

Today, yesterday, etc:
	numerous arguments, meetings and teleconferences
	printed complete source listing for C64 Habitat
	fixed several minor host bugs
	mondo playtests
	brainstormed with the team about diagnosing mystery bugs
Tomorrow:
	work with Randy on mystery bugs
	probably more arguments, meetings and teleconferences

From chip Thu May 21 18:28:49 1987
Received: by moth; 21 MAY 87 18:28:49 PDT
From: chip (Chip Morningstar -- "Software Without Moving Parts")
To: aric, chip, farmer, nancy, sda
Subject: Status report
Status: R

Past few days:
	lots of progress on Ghu (now has macros, IF, FOR-loops; most of the
		object, avatar and region database stuff is working; dynamic
		class definition is working as of today)
	staying out of Randy's and Aric's way as they install diagnostics
	numerous meetings
	some progress on stochastic region generation stuff
Tomorrow:
	Ghu acquires the 'set' command (after which point folks can begin
		using it on an experimental basis)

From chip Fri May 22 17:24:11 1987
Received: by moth; 22 MAY 87 17:24:11 PDT
From: chip (Chip Morningstar -- "Software Without Moving Parts")
To: aric, chip, farmer, nancy, sda
Subject: Status report
Status: R

Today:
	fire fighting (shem crash, QL conf. call, false panic over bad disk)
	some work on ghu (didn't finish SET stuff as planned, due to above)
Tuesday:
	finish SET stuff for Ghu
	fix ESP/teleport bug


From chip Fri May 29 18:44:55 1987
Received: by moth; 29 MAY 87 18:44:55 PDT
From: chip (Chip Morningstar -- "Software Without Moving Parts")
To: aric, chip, farmer, nancy, sda
Subject: status report 5/29
Status: R

Today, yesterday etc.:
	got dynamic fields working in ghu
	got the SET command working in ghu
	fixed the ESP/teleport problem (I think)
	met with the gang to brainstorm global project planning
Tomorrow (Monday actually):
	get UPDATE working in ghu
	start adding parameterization to Plex
	start writing database-->riddle utility

From chip Thu Jun  4 17:54:17 1987
Received: by moth; 04 JUN 87 17:54:17 PDT
From: chip (Chip Morningstar -- "Software Without Moving Parts")
To: aric, chip, farmer, nancy, sda
Subject: Status report 6/4
Status: R

Today and preceding:
	added SET, UPDATE, misc other fancy features to Ghu
	met with the gang and plotted world creation strategy
	started adding parameterization feature to Plex
	started to define database->.rdl translator
	helped David Fox with Macross problems plaguing Atari XE conversion
Tomorrow:
	finish parameterizing Plex

From chip Mon Jun  8 17:58:50 1987
Received: by moth; 08 JUN 87 17:58:50 PDT
From: chip (Chip Morningstar -- "Software Without Moving Parts")
To: aric, chip, farmer, nancy, sda
Subject: Status report 6/8
Status: R

Today and Friday:
	taught Randy how to use Plex, brainstormed on new features required
	got parameterization working in Plex
	met w/ sda for annual review
Tomorrow:
	more bells and whistles for Plex

From chip Tue Jun  9 19:05:44 1987
Received: by moth; 09 JUN 87 19:05:44 PDT
From: chip (Chip Morningstar -- "Software Without Moving Parts")
To: aric, chip, farmer, nancy, sda
Subject: Status report 6/9
Status: R

Today:
	added INCLUDE, production-value set elements and symbolic name
		definition to Plex
	debugged storage leaks in Plex
	shmoozed with the Login magazine folks
Tomorrow:
	more work on Plex
	possibly some more work on Ghu

From chip Wed Jun 10 18:38:14 1987
Received: by moth; 10 JUN 87 18:38:14 PDT
From: chip (Chip Morningstar -- "Software Without Moving Parts")
To: aric, chip, farmer, nancy, sda
Subject: Status report 6/10
Status: R

Today:
	got data types working in ghu
	added error recovery features to plex
	added memory-performance enhancments to plex
	updated slur to handle new format (LRC) class.dat files
	coded default-value feature for class defintion in ghu
	misc. other features added to plex
	wrote riddle parameter filter program
Tomorrow:
	more of the same

From chip Wed Jun 17 17:13:48 1987
Received: by moth; 17 JUN 87 17:13:48 PDT
From: chip (Chip Morningstar -- "Software Without Moving Parts")
To: aric, chip, farmer, nancy, sda
Subject: Status report 6/17
Status: R

Today and recently:
	numerous improvements to Plex
	added database to Riddle format conversion command to Ghu
	added default initial value to Ghu class table
	fixed bugs from last night's playtest (1 crash bug, 2 cosmetic ones)
Tomorrow:
	test cosmetic improvements made today
	more work on Ghu
	anything that comes up in tonight's test that needs attention

From chip Mon Jul 20 20:38:40 1987
Received: by moth; 20 JUL 87 20:38:40 PDT
From: chip (Chip Morningstar -- "Software Without Moving Parts")
To: aric, chip, farmer, nancy, sda
Subject: My status report
Status: R

Today:
	Made magic work on heads
	Added capmon calls to style changing magic
	Added failure handling for region transition (handles light, etc.)
	Fixed autoteleport, I think
	Improved flashlight/lamp help to tell on/off state
	Brought curses.pl1 in line with current data-structure rules
	Got "indirect" feature working in Griddle and Plex (Plex output used
		as control input to Griddle w/ parameter passing)
Tomorrow:
	Help Randy set up exhaustive class test area
	Whatever miscellany crops up from tonight's playtest
	Make heads have value in pawn machines

