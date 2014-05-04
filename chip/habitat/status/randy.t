From farmer Mon Apr 20 14:54:08 1987
Subject: Testing
I will be available for testing per the following schedule:

Monday & Tuesday : till 7pm either night
Wednesday: till 7ish (here at lfl)
Thrusday & Friday : till 7pm either night
Saturday: Anytime
Sunday: N/A
Total : 4 out of 7 days
Monday/Tuesday and Thursday/Friday are as required.

From farmer Mon Apr 20 15:12:43 1987
Subject: 1st status report
Did today:
Tried to release 4.8..a poor descision
fixed problems with 4.8.
spent 1/2 hr trying to get the keyboard routine to echo on interrupt (failed)
Made disks to test 4.8
Merged some changes with aric.
Found out why gosts could not pass thru doors (Chip needs to fix)

On the slate tomarrow:
Start new bug traking system.
REALLY release 4.8.
one more hour tring to get the keys to echo right-away. (not mandatory)
Internal test
fix bugs found last night (tonight)
..................................................
From farmer Tue Apr 21 15:13:24 1987
Subject: Status Report

Done today:
Started new Bug tracking system
Made 4.8 available for upload (Janet was unable to complete beacuse
				she got hung-up several times)
Merged Charlies new kb routine, it works VERY nicely.
Coded multi-object fiddle on C64
Coded region_play_sfx on C64 so host can issue sfx on C64
Testing tonight (Not sure how many qlinkers will be on since 4.8 is not out)

did NOT happen:
keys echo right away (spent the time putting Charlies routines in instead)

Tomarrow:
Test Multi Object Fiddle & region_play_sfx with host.
What if an avatar dies while waiting for reply?
Book interface fix.
Review new video tape and generate bug reports.
..................................................
From farmer Thu Apr 23 00:52:13 1987
Received: by moth; 23 APR 87 00:52:13 PST
From: farmer (Define the Universe. Give three examples.)
To: aric, chip, farmer, nancy, sda
Subject: Habistatus
Status: R

Done Wed:
	new keyboard routine, settling in adjustments.
	Book interface fix (goes to T)
	Fortune machine now has 89 messages (goes to T)
	Staff meeting
	Helped Chip clean up buglist
	Tested for 2+ hours.
NOT done:
	Test Multi Object Fiddle & region_play_sfx with host.
	What if an avatar dies while waiting for reply?
	Review new video tape and generate bug reports. (tape came late)

For Thursday:
	Test Multi Object Fiddle & region_play_sfx with host.
	What if an avatar dies while waiting for reply?
	Review new video tape and generate bug reports. (tape came late)
	Try to get keys to echo right away.
..................................................
From farmer Mon Apr 27 08:28:30 1987
Received: by moth; 27 APR 87 08:28:30 PDT
From: farmer (Define the Universe. Give three examples.)
To: aric, chip, nancy, sda
Subject: status
Status: R

I am VERY sorry that I did not send status on Thursday And Friday.
I will try to make this a regular habit-at.

Done
	region_play_sfx working (#x42 done & installed)
	Book interface final adjustments
	Attended Habitat team meeting
	Generated first pass at Populopolis Downtown map.
	Discovered that generic_switch was TOTALLY screwed,trashing memory
	Reviewed new video tape and generated bug reports.
	Started the procedure for processing ARFs.

Next:
	Analyze 4.9 results (ARFs) and report disposition of version 4.9
1A   r j c #x37 People having problems with login
2A   r #107 Still able to steal paper from an avatar (HOST)
	Make switches wait for reply.
2B   r #x46 what if an avatar dies while waiting for a reply?
3B   r #x18 make clone recurse
?B   j r #x38 Check mailer with full sheet
2B   r #x46 what if an avatar dies while waiting for a reply?
2B   r #23 Bahia put head on 'BAR'/backgammon, did not go where specified.
2B   r #110 Shift-Restore not working reliably, implement alternate

Re Item #113:
Janet sent me a log where we THINK tha the C64 sould have recovered from
a bad packet xmission a bit FASTER than it actualy did. This is not a 
fatal error, but a desireable performance improvement.

Re Item #112:
I am only certain that the fix to #112 will mark #29 off of the list..
it MAY be that it takes care of #14 and/or #111. Still uncertain there.
..................................................
From farmer Tue Apr 28 06:20:06 1987
Received: by moth; 28 APR 87 06:20:06 PDT
From: farmer (Define the Universe. Give three examples.)
To: aric, chip, farmer, nancy, sda
Subject: stat
Status: R

Done:
	Analyze 4.9 results (ARFs) and report disposition of version 4.9
	Make switches wait for reply.
	found & fixed grandson of grandfather of all bugs.
2A   r #107 Still able to steal paper from an avatar (HOST) 
?B   j r #x38 Check mailer with full sheet (OK)
2B   r #110 Shift-Restore not working reliably, implement alternate
	alternate Shift-Runstop (BOTH are operational)

Did NOT happen:
2B   r #x46 what if an avatar dies while waiting for a reply?
3B   r #x18 make clone recurse
2B   r #23 Bahia put head on 'BAR'/backgammon, did not go where specified.
           (Can not duplicate will review tape again)

Next:
	I will spend all of today trying to:
	1) Figure out WHAT happend at last nights playtest
	2) Fix it, and have 5.0 ready for Tomarrow.

..................................................
From farmer Tue Apr 28 09:10:07 1987
Received: by moth; 28 APR 87 09:10:07 PDT
From: farmer (Define the Universe. Give three examples.)
To: aric, chip, farmer, nancy, sda
Subject: midday status
Status: R

Mid-Day status (well, MY midday!)

ARFS update:
--   #128 Nancy got confused after reading mail, *you have mail* didnt go away
3- I r #129 book interface:BACK beep on page 0, Limit cursor to bottom line?
1A T j #130 Cathy melted down when someone entered backgammon (me) [j fixed 1]
3B   r c #131 Using Choke and Fortune machines: async chore.
1A T r #133 Users able to put items in closed containers! [fixed]
2A T j #134 Janet will presently truncate excessive text messages [1]
2B   c #135 Vendo help not working right (check out machutas, left vendo)
2B   r c #136 Spray Cans on heads: Janet used stripes, and for translucent!
1A T r #137 Aric put a box down, and the x coord was way wrong [Fixed 2]
2A   c r #138 De-ghosting, ghosting is not handling flashlights correctly


[1]:	There were MANY meltdowns and mem-faults, all caused by a problem
	introduced by Janet, in her attempts to deal with message balloons
	that spanned more than one packet. For the short run, she says
	she will just truncate the messages, and return the system to it's
	originall state (working).

[2]:	Found this bug, it moves items #19, #23, #137 to Test status.
..................................................
From farmer Tue Apr 28 11:44:01 1987
Received: by moth; 28 APR 87 11:44:01 PDT
From: farmer (Define the Universe. Give three examples.)
To: aric, chip, farmer, nancy, sda
Subject: ARFS
Status: R

Quantums ARFS arrvived:
ARFS update QLINK arfs arrived:
dd d #140 Dup #130
dd d #141 Dup #136
dd d #144 Dup #135
dd d #145 Dup #133
dd d #146 Dup #127 (In test)
dd d #148 Dup #139
dd d #149 Dup #130 Cathy stuck in text interface during mem-fault
dd d #150 Dup #138
dd d #151 Dup #130

Nothing that was not already on the list, or on the list as of this
morning!
..................................................
From farmer Tue Apr 28 14:10:48 1987
Received: by moth; 28 APR 87 14:10:48 PDT
From: farmer (Define the Universe. Give three examples.)
To: aric, chip, farmer, nancy, sda
Subject: More Status
Status: R

More stuff I did:
	Fixed minor problems with book & plaque on host.
	Took another swing at init problems (#x37)
3B T r c #121 Escape devices: 1) should start with 10 chgs
	PLUS the other stuff I sent out as my midday status.

Tomarrow:
	Release version 5.0!
	Document 5.0
	Internal test 5.0
	Have 5.0 disposition meeting.
	Staff meeting.
	Process last bathch of 4.9 ARFS
..................................................
From farmer Wed Apr 29 11:10:08 1987
Received: by moth; 29 APR 87 11:10:08 PDT
From: farmer (Define the Universe. Give three examples.)
To: aric, chip, farmer, nancy, sda
Subject: Habitat status
Status: R

new ARFS (all reportsed with version 4.9):

dd d #152 Dup #138
?? ? #153 insufficient information, Janet will get back to me
3B   c #154 newstand sign help message wrong "How did you do that?"
2B   r #155 took cathy 30 secs to appear in a region with 3 avatars.
dd d #156 Dup #138
dd d #157 Cathy had a failed init, Dup #37
     #158 Cathy had lockup after 'f7' news sign. [awaiting tape]
     #159 Repeat delete not working (user error?) [awaiting tape]
     #160 Janet took a long time to appear Dup #155...Tune Throttle back up!
     #161 It took a long time to load region [bandwidth reduction will reduce]
2A D a #162 Closed a door, part of it was flashing FIXED 5.0
2B   r #163 Cathy and bahia had problems opening a box in Machutas[await tape]
     #164 Translucent hair flashes after mail read (NOT a bug,TRANSLUCENT hair
		is bug #136, and THAT is Fixed in 5.0)
1A   r j #165 Flashing go trying to enter Bobs Bank (aric & janet)
dd d #166 Dup #162
2A   r j #167 Janet had problems picking up martini glass after purchasing.
4R   r #168 ']' and '[' are mapped to '(' and ')'.
2B   r #169 Book interface not handling next page correctly [Fixed 5.0]
3B   r a #170 Flowerbox outside tivolli's flickers.

Based on this data, I have high
confidence that the remaining Alpha tasks (except INIT failure)
are HOST problems. More data on this as it becomes available.
..................................................
From farmer Mon May 18 16:17:53 1987
Received: by moth; 18 MAY 87 16:17:53 PDT
From: farmer (Define the Universe. Give three examples.)
To: aric, chip, farmer, nancy, sda
Subject: Stats
Status: R



Today:
	Attended efficient Habistatus Meeting ;)
	Installed Error/Warning handler (Warnings seem to work)
	replaced Disk/Rs232 gateway with better system. (works great)
	Merged Rons disk routines with ours (now can handle disk errors!)
	Removed RESTORE key processing.
	Moved code that was causeing interrupt tear (potential crash)

Tomarrow:
	LRCs for Images, Actions, Sounds, and Classes
	Merge Latest Graphic stuff (both are diagnostics stuff)
	Maybe: install Sector LRC checking.

From farmer Thu May 21 16:06:26 1987
Received: by moth; 21 MAY 87 16:06:26 PDT
From: farmer (Randall Farmer) (What do you mean ARTIFICIAL intelligence?)
To: farmer,chip,aric,nancy,sda
Subject: Version 5.2
Status: R

Version 5.2 will be released in the morning for small-scale testing.
The Un-Dump tool is operational, ready for disks to come
(This is my status report)

Tomarrow:
	fix lights
	fix generic on/off object
	investigate heads problem (when limit of 31 is reached)


From farmer Mon Jun  1 15:48:10 1987
Received: by moth; 01 JUN 87 15:48:10 PDT
From: farmer (Randall Farmer) (What do you mean ARTIFICIAL intelligence?)
To: farmer,chip,aric,nancy,sda
Subject: Status
Status: RO

Today:
	Finished and tested Habitat 5.3.
	This Version has ALL pre-Alpha tasks complete on it, subject
	to testing.
Tomarrow:
	Organize Phase 1 Playtest.
	Do 5.3 release notes
	Look at Beta Tasks and Prioritize.

From farmer Thu Jun  4 10:16:16 1987
Received: by moth; 04 JUN 87 10:16:16 PDT
From: farmer (Randall Farmer) (What do you mean ARTIFICIAL intelligence?)
To: farmer,chip,aric,nancy,sda
Subject: Habistat
Status: R


Thru Today:
	#104 in test
	#122 in test
	Fixed problems with new KB stuff & text interface (test tonight)
	#172 in test
	#46 designing solution.
	Distribute 5.3a for test tonight.
	Talk to Mikey/Commedore re:hardware problems (we are on it's trail!)
	see nifty 3d demo

Tomarrow:
	meet with Telenet re:X.25
	Fix #46. (Note: Last duplicateable pre-Beta Bug)
	review test Arfs (if any).
	Fix important broken stuff on ARFs.
	report of Hardware progress.


From farmer Fri Jun  5 14:17:51 1987
Received: by moth; 05 JUN 87 14:17:51 PDT
From: farmer (Randall Farmer) (What do you mean ARTIFICIAL intelligence?)
To: aric, chip, farmer, nancy, sda
Subject: Re:  Habistat
Status: RO

Today:
	met with telenet people
	fixed (first pass..in test) #46.
	posted test results & fixed only reported C64 bug.

Not Done:
	hardware report: I still havn't heard from the guy at Commedore.
		(2 calls in...)

Monday:
	fix whatever bugs found over the weekend.
	try Commedore again.
	Review tasklist and find whatever there is to do.

From farmer Mon Jun  8 08:34:28 1987
Received: by moth; 08 JUN 87 08:34:28 PDT
From: farmer (Randall Farmer) (What do you mean ARTIFICIAL intelligence?)
To: farmer,chip,aric,nancy,sda
Subject: Today.
Status: RO


Since the Stratus is down today, while it is being moved to a new building:
I have implemented (C64 side only) the Habitat Kernal Commands
CHANGE_CONTAINERS and PROMPT_USER. These should greatly expand the future power
of Habitat, and online utilities.
Detailed specs mailed seperately.

I will be leaving at 3:00 today.

From farmer Tue Jun  9 07:30:42 1987
Received: by moth; 09 JUN 87 07:30:42 PDT
From: farmer (Randall Farmer) (What do you mean ARTIFICIAL intelligence?)
Cc: farmer,chip,aric,nancy,sda
Subject: Status
Status: RO


Monday:
	learned plex & statred definition for QuantumGrad (6000turf city)
	worked on Telecom space game concept document.
	implemented 2 new habitat kernal commands
	was unable to test program because Stratus was down durin move.
	(Also, attempted to test at night, but Stratus was SICKLY slow.)

Tuesday:
	Test an release 5.4 (if possible)
	Test new features.
	Polish off concept document with Noah, and submit to some others.
	Work more on QuantumGrad
	Bug Commendore AGAIN re: hardware.
From farmer Thu Jun 11 09:27:23 1987
Received: by moth; 11 JUN 87 09:27:23 PDT
From: farmer (Randall Farmer) (What do you mean ARTIFICIAL intelligence?)
To: farmer,chip,aric,nancy,sda
Subject: status
Status: R


Yesterday:
	released 5.4
	Worked on quantumgrad
	designed and uploaded a New Capture The Flag entry region (DONE!)
	kbitzed about plex with chip

today:
	more quantumgrad
	more plex kbitzing
	prepare for tonights playtest
	look into #x29 with aric

From farmer Wed Jun 17 17:44:54 1987
Received: by moth; 17 JUN 87 17:44:54 PDT
From: farmer (Randall Farmer) (What do you mean ARTIFICIAL intelligence?)
To: farmer,chip,aric,nancy,sda
Subject: Status
Status: R


Thru Today:
	Worked on Habitat 5.6:
	Re balanced interrupts to attempt to cope with BAD VIC chips.
	Finish work (testing tonight) that gets us 1024byte more heap!
	Attended Robots Meeting

Tomarrow:
	Summarize test results (BOTH tests)
	Provide 'large-scale-test-confidence-factor' agrreed with Janet.
	Release 5.6
	Use Ghu's new region=> rdl facility to get fixed regions
		back on moth.
	Design apt building generic hallways


From farmer Tue Jul 21 07:26:44 1987
Received: by moth; 21 JUL 87 07:26:44 PDT
From: farmer (Randall Farmer) (What do you mean ARTIFICIAL intelligence?)
To: farmer,chip,aric,nancy,sda
Subject: Status
Status: RO


Thru Monday:
	Helped ron with Maniac (1/2 day)
	Geared up for a 14+ player playtest!
	Fixed two problems with 5.9: Sounds & Paper-pointer-offscreen
	Started Apartment Generation

Today:
	Make sure Maniac (Apple) works
	Lay our more Quantumgrad regions (Kebitz with Chip)
From farmer Thu Jul 23 15:26:58 1987
Received: by moth; 23 JUL 87 15:26:58 PDT
From: farmer (Randall Farmer) (What do you mean ARTIFICIAL intelligence?)
To: farmer,chip,aric,nancy,sda
Subject: Status
Status: R


Today:
	Did all Class test
Tomarrow:
	Fix all the C64 bugs.
	Release rev 6.0


From farmer Tue Aug 18 10:06:55 1987
Received: by moth; 18 AUG 87 10:06:55 PDT
From: farmer (Randall Farmer) (What do you mean ARTIFICIAL intelligence?)
To: farmer,chip,aric,nancy,sda
Subject: more arfs
Status: RO

AFS recived 08-17, for playtesting 8/12 and 8/13

Beren:
D T	0812-1 Auto teleport 1/2s tokens (fixed)
2B c r	0812-2 If you hand an object to a sitting avatar, it stands.
1B W r	0812-3 On/off lights does not work right in paper interface.

Cathleen:
C	0812-4 Had a long (over 1 min) initial region load.
1B r	0812-5 immobile magic DO should do implied GO.
1A r	0812-6 still able to leave Backgammon #2 with game piece.
?	0812-7 PE? says whe lost a token during teleport (?)
?	0812-8 PE. A user 'winked' (left and came back fast)
?	0812-9 PE? Cathy couldn't GO to the pond. (collision with tree?)
?	0812-10 PE. Had problem putting token in pocket (cathy)
?	0812-11 PE. Tried to walk to the 'ground' above horizon"No way to go"
C	0812-12 Text window flashes.
C	0812-13 All multy page texts should signify (in text) "The End"

Chris:
1A j r	0812-14 FE #7 (there were 3 of these,2 dumped,and both caused by host)

Ariana1:
2B r a 	0813-1 Some turfs have flowers on top of dresser (move/remove them)
2B r a	0813-2 The New You needs a "MORE ->" sign
1A j	0813-3 Regionproc Crash.

Bahia:
1A T c	0813-4 It is possible to 'get' an open box! (fixed)
	0813-5 dup 0813-3
C	0813-6 Colorblind people have problems with word balloons.
C	0813-7 Had problems putting token in pocket

Janet:
1B j r	0813-8/9 Had problems grabbing objects (had something in hand,I bet)
1A j	0813-10 FE#7 (Host send talk message from non-exist noid!)
	0813-11 dup 0813-3

From farmer Thu Aug 20 14:50:08 1987
Received: by moth; 20 AUG 87 14:50:08 PDT
From: farmer (Randall Farmer) (What do you mean ARTIFICIAL intelligence?)
To: farmer,chip,aric,nancy,sda
Subject: Announcing
Status: RO


The Amulet Of Wonderous Worth (Dnalsi Island)
The Tome of Wealth and Fame (the game begins TODAY!)
The 1st Habitat Region Rally
are all functional and ready to install (10 seconds installation each.)

Comming tomarrow:
The Plaque of Cooties!

Comming in the following weeks:
The Habitat Stock Exchange
Capture the Flag

From farmer Fri Aug 21 10:47:31 1987
Received: by moth; 21 AUG 87 10:47:31 PDT
From: farmer (Randall Farmer) (What do you mean ARTIFICIAL intelligence?)
To: farmer,chip,aric,nancy,sda
Subject: Now operational
Status: RO


The Cooties Plague is now available for testing in Habitat,
(I replaced the Capture the Flag region with "DON'T PRESS THIS BUTTON!")
heh heh

From farmer Fri Aug 28 13:06:55 1987
Received: by moth; 28 AUG 87 13:06:55 PDT
From: farmer (Randall Farmer) (What do you mean ARTIFICIAL intelligence?)
To: farmer,chip,aric,nancy,sda, wendy
Subject: Day Off
Status: RO

I will be taking Friday the 4th of September off.
I am going to LA for the Holiday Weekend.
