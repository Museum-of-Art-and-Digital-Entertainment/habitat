4/21
2 D r make paper pink
2 D r Merge tokens even if you have a full pocket (requires C64 work)
2 D r fix library (remove reading rooms)
3 D r spray cans work on heads
1 D r Touch typing not keeping up
1 D r garbage chars in typed text
1 D j *you have mail* going to everyone in region
2 D r Club does not work as a weapon
2 D r del should erase AND backspace in text mode.
1 D r word balloon in wrong place.
4/22
1A D a Hook up Beach, Back-40, and Really Quite Confusing Desert
2- D a change 'patterns' on the two wands in the magic shop. add ring/moonwalk
2B D a teleport for tavern at end of road (or magic teleporting bush)
2B D c Vendo help not yet working
2A D c generalize ground HELP to flat, trap, super trap
2B D r Lefty's needs key numbers, and for containers to be in correct states
4B D c put game pieces into background on put or throw
2A D a Club has width (collisions), floats in hand
2A D a Cratinabox is messed up
2A D a Yellow room bookcases not restricted.
2A D a You can Exit a region thru a closed door (wall was sky)
2A D a sign in front of arcade is a sky!
2B D c Countertop help should be more explicit
3B D r Ugly key in lefty's
3B D a Change counters into tables
1A X r Janet never got past Habitat logo
2A D c Ghosts can't pass through arcade doors
2B D r a Game pieces in arcade DO on ground leaves afterimage
3A D a dnalsi island teleport booth address field is wrong
1A D c Fix bug report form
3- D a Add 'exit->' signs to arcade door-rooms
2B D a plaques have wrong number of pages
4/24
1A D c #x4 flipped doors put you in wrong spot on region entry (off by 8)
3B D c #x21 check customizer text
2B D a #x54 bad address fields in some teleports
3A D a #x55 flashing newsstand legs in front of Ymporium
4/27
2B D c #x5 Mailbox and Dropbox help are not appropriate
2A D c #x10 Supply Pawn Machine Values
2B D c #x11 make book, key, etc. work with vendo HELP
2B D r #x12 Generate online map of populopolis and put at Ymporium
4R D r #x42 Game pieces make noise when set down
3B D r #x48 paper state did not change when erased (was originally blank)
3R D r #x51 Book interface: put cursor at bottom. Better cursor graphic
1B D r #29 Was able to pickup bag while open [fixed by item #112 fix]
4/28
2B D a #x13 weapons free zone in the city limits
3R D c #x20 add chores for vendo SELECT, magic
2B D c r #x44 couldn't put down wand after auto-teleport
3B D a c #x45 check widths on plants and trees
3- D a #x49 in turfs, user can walk over chest legs
2B D c #102 Need orientation independant compass image
2A D r #107 Still able to steal paper from an avatar (HOST)
3B D a #116 Improve Plaque text in Arcade
3B D r c #121 Escape devices: 1) should start with 10 chgs 2)help give chgs
3B D c a #123 reduce price of fortune (current price $10)
-- D #128 Nancy got confused after reading mail, *you have mail* didnt go away
1A D j #130 Cathy melted down when someone entered backgammon [j fixed #134]
3B D r c #131 Using Choke and Fortune machines: async chore.
1A D r #133 Users able to put items in closed containers!
2B D c #135 Vendo help not working right (check out machutas, left vendo)
1A D r #137 Aric put a box down, and the x coord was way wrong
4/30
2A D j #x6 checkpoint avatar/contents on turn to ghost (head & hand)
3B D j r #x38 Check mailer with full sheet
2B D a #1 Make sure all multi-page books/plaques are correct (Arcade/Hall-Rec)
1B D c r j #19 PUT put a game piece in wrong place (review tape: suspect host)
2B D r #23 Bahia put head on 'BAR'/backgammon, did not go where specified.
2B D r #110 Shift-Restore not working reliably, implement alternate
1B D r #112 Bad request sent to host, class sensor
1A D r #119 Switches and Lights do not wait for replies.
2A D j #134 Janet will presently truncate excessive text messages
2B D r c #136 Spray Cans on heads: Janet used stripes, and for translucent!
2A D a #162 Closed a door, part of it was flashing FIXED 5.0
2B D r #169 Book interface not handling next page correctly [Fixed 5.0]
5/5
2B D r #x8 multi-object FIDDLE
3- D r #x16 add more fortunes to fortune machine
3R D r c #x17 ghost/avatar only door restrictions
2B D a #28 Make reset use Multi-object fiddle.				
1B D j #100 Balloons limited to one packet, break up longer (HOST)
2B D a #114 Is RESET games sending unneeded messages? [this repeats item #28]
3B D a #117 Region:9171 Have arrow/sign point the way out
2A D r #120 Book interface not working right on Populop map
1A D j #125 Fix for overly long text packets
2B D a #126 When Janet entered backgammon, all the dice were 'spinning'
2B D r #127 host Recieved CRC errors during init, but recovered. [Dup #x37]
3B D c #154 newstand sign help message wrong "How did you do that?"
2B D r #155 took cathy 30 secs to appear in a region with 3 avatars.
   D   #158 Cathy had lockup after 'f7' news sign. [awaiting tape]
   D   #159 Repeat delete not working (user error?) [awaiting tape]
3B D r a #170 Flowerbox outside tivolli's flickers.
1A D r #171 opening large box kills others in region
   D #174 Duplicate #158, #159    ALL FIXED 5.1
   D #175 Shovel sticks out of vendo FIXED 5.1
-- D #179 User error (Cathy thought she went to the wrong place)
dd D #183 Duplicate #170, FIXED
5/22
2A D j c #x1 make book help give title (#77)
1A D r j c #x37 People having problems with login
4+ D c j #x41 Doors should know which region you came from
2B D c #12 Multi-door entry does not place you in front of correct door
2A D c j #138 De-ghosting, ghosting is not handling flashlights correctly
4R D r #168 ']' and '[' are mapped to '(' and ')'.
2A D r #178 Cathy got 'keyboard jammed'
3B D a #180 Aric, please disconnect the 'top-down' map regions
1B D c #189 People are still 'colliding' with heads.
5/29
1A D r j #165 Flashing go trying to enter Bobs Bank (aric & janet)
1A D j c r #191 FE#1 (mem full) avatars being allowed to dghost in full region
-- D   #192 Nancy have FE#3 (LRC). User error. Dumped to Object Disk.
-- D   #193 Super trap patterns corrupted. FIXED 5.2b.
6/1
2B D j max occupants for region
3B D r #106 bottom of screen interrupt tears after text mode.
2A D c #?? ESP fails when pointing at teleport booth
1A D j #196 Could not return to PC after FE#1. FIXED
6/5
4+ N r #x53 Map shift-0 into ')' for touch typists
4+ N r #101 better SFX timing (lowest prio, not likely to happen)
1R N j #108 Charlie almost 'timed-out' while in text mode
2A D a #184 There are only 3 boardgame regions of each type.
3B D c #x14 describe graphics chars in online document
2A D r #x39 Get pointed info before throttle wait
1B D r #104 If you swap disks early on return to PC, recover.
1B D r #105 Better error recovery for disk routines.
1A D r #113 C64 protocol dropping packets on rare occasion
2B D r #122 for 'DO's that include GO (door/vendo/hole) face_cursor on arrival
2B D r #172 paper REPLY: put cursor on 2nd line
2A D r #173 Janet got meltdown just after sending ESP [investigating]
1A D r #176 Keyboard output tied to frame rate
2A D r a #?? flashlights are acting weird
2A D r #195 Camera, Lights, Stereo, Sec Dev cause problems async.
2A D r #199 bahia was unable to return to PC. (disk routines improved)
1A D r #204 Janet had strange meltdown (awaiting tape)
6/8
2B D a #185 Need better walkto for Crat-n-a-box (Not obscuring Crat)
6/15
1B D r #x46 what if an avatar dies while waiting for a reply?
3B D r #x47 Capture The Flag Entry: Frame-Rate sucks & needs T intersect
2B D a #188 Can not get help on hand held object, if style=spider.
1B D j r #x46b Host should reject messages from 'dead' avatars.
6/19
?+ I ? #x32 Turn to fly on teleport
?+ I ? #x33 teleport to Auditorium, and you arrive as a ghost (for meetings)
?+ I ? #x34 traps that spring monsters
?+ I ? #x35 wands that identify everyone in the room
4+ N c #x40 You can enter a region thru a closed door
?+ I a c r #118 Immobile magic that would require key to operate
3+ I r #129 book interface:'back' beep on page 0, Limit cursor to bottom line?
2B ? r #163 Cathy and bahia had problems opening a box in Machutas[await tape]
2A ? r j #167 Janet had problems picking up martini glass after purchasing.
?-     #198 Long time to initialize (Habitat logo screen)
6/23
2B D j #x2 create program to generate book of records (#21a)
2B D c r #190 ESP does not work when pointing to oracle (same for bbox)
7/2
2B D c #207 Guns don't work on avatars if they ghost/leave region
1A D j #212 Vendos/Atms/Token merge/PaperPad all broken
1A D j #215 two people open a box at the same time
2A D j #216 book/plaque changed so that it gets last-page-number from text db.
7/20
4B D r #x43 Screen Flash
1A D r c j #205 diagnose flakey C64 problems
2B D c r #206 Guns don't work on avatars' heads
1A D r #224 FE#4: Missing avatar image.
8/7
1B D j #209 Regionproc crash (null pointer)
2B D c r #218 Head Grstate in containers not set right (check host head-get)
2R D c #222 light help should tell light switch state
1A D r c j #228 perform exhaustive class test
2B D c #229 fix curses.pl1 to reflect Janet's nitty_bits layout
2B D r #230 die roll could use sound
3B D a #233 pointer system too tight for juggling balls and amulet
2B D r #236 add erase-line key for text line typing
1B D r c #238 pawn machine is broken?

stuff from class test, as of 8/7
SC D	Boomerang DO Hangs the C64
SI D	Knick_knack (and others) need style based help.
SI D	When PUTing paper to dropbox, restriction bit gets set (!?)
S+ D	ATM needs ASYNC chore for Deposit/Withdrawal
S+ D	game_piece HELP need 'kingme' instructions
S+ D	bag/box help needs to give KEY number
S+ D	Door help CBB
S+ D	Elevator 'Bad address' msg not appropriate.
C64+ D	TALK to hand of god is illegal (!?)
64+ N	Bottle DO ground beeps.

alpha items as of 8/7
Beren:
D	0804-4 (error was mis-reported, Dump disk shows he was entering 9111)
Chip:
1A D	0804-18 Shift-clear clears ESP: prompt. (FIXED)
Renfield:
1A D	0804-23 Token is too hard to point to. (fixed)
1A D	0804-25 Floor lamps are too wide (FIXED)
1A D	0804-26 Async Vendo SFX (dispensing) is wrong. (FIXED)
8/13
2B D c j #208 If region transition fails, light level and 'on-hold' bit wrong
2B D c #223 style changing magic doesn't call capmon
2B D c #232 test message on region transition failure
3B D c #235 make oracle acknowledge messages sent to it
?? P r #225 Rasputin got a FE#3 (LRC)...no dump, no tape *M*
2B P r #226 Ras got hung with flashing get (awaiting dump) *M*
3B P r #227 Janet got another coloram glitch (awaiting dump) *M*
	0804-10 Dup 0804-2
	0804-12 Dup 0804-11
	0804-15 Pilot error?, confused about events
	0804-16 Pilot error?:"Undeliverable mail did not display 'have MAIL'"
1B D c j 0804-21 When a region is full, send message
1A D c j r 0805-27 Tokens (when merged) are getting their restricted bits set.
1A D c j e 0805-28 Same as -27, but pawn machine creating.
8/14
-	0807-1 Pilot error (system cathy sent a messge from outside habitat)
-	0807-3 Pilot error? (Token was probably stolen.)
-	0807-5 Pilot confusion...The back fourty has non-euclidian connections
-	0807-7 Accidental disk dump (shift-control?)
D 	0808-1 Dup 0804-18 (fixed)
	0808-3 Dup 0808-2
	0808-4 Dup 0808-2
D D	0810-2 Cathy walked out of backgammon with game piece (Fixed)
-	0811-7 Dup 0810-1
8/18
2B D c #0811-9 Flag Help: "Soldier" NOT "Solder"
   R #0813-5 dup #0813-3
   R #0813-11 dup #0813-3
