Here is the task summary for Monday, August 24, 1987.

Format: Left-hand column is priority/release requirement ('A' = alpha, 'B' =
beta, 'R' = release, '+' = strictly wishlist item).  Next column to the right
is status: 'D' = done, 'T' = testing, 'W' = working on it, ' ' = pending, 'I'
= just an idea right now, 'N' = we decided not to do it at all, 'C' = comment,
'P' = pilot error, 'R' = repeat.  Next comes the initials of the people
responsible for the item, then the item tag number, and finally the item
itself.

Currently active official task list items:
3R W c #x3 implement Ghu (#54)

General items on internal list:
3B   ? #x9 Publish first Rant, and populate newstands
3R   r #x15 Check prices in all vendos
3B   r #x18 make clone recurse
3R   r #x19 spray cans run out (host destroys) after n uses
4+   ? #x22 camera object
4R T c #x23 customizer: 4-5 selections of heads -- host chooses vector to send
4+   j #x24 change host flag for ghost (Y hi-bit) so avatars' XY pos are kept
4+ T r #x25 Give objects the power to PROMPT user ('What is the secret word?')
4+   r a #x26 magic GO
4R   r c g #x27 book binder machine
4R   r c g #x28 xerox machine
4+   r #x29 make host send avatar's word balloon color in customizer byte
3R   j #x30 Batch process: Close all unlocked doors
3B   j #x31 Batch process: Remove curses, immunities

test items prior to 5/1:
4+   r #x52 Make clicking cursor also face front & back.
2B W j c #115 make ESP send fail message, echo talk in response

test items prior to 6/1:
3B   r a #177 Install remaining Capture-The-Flag fields (if the game works)
3R T a c #186 Wand of teleport does not work on heads
3R W a c #187 Wand of style change does not work on others.

test items as of 7/2:
2B   j #210 Avatar in two regions at the same time *M*
1B   r c j #211 Communications hang. Seems to be related to boxes/bags *M*
2B   c r #213 dv hung when PUT down a head when someone else had grabbed it. *M*
1B W c a #214 Auto-teleport (escape device) causes crash in asynch case.
1B T r #217 Bahia got an 'impossible' heap overrun. (new diagnositic: FE#9)
2B W r #219 Grab from left hand side sometimes doesn't work.
2B   r j #220 Return to people connection failed?
2B   r #221 lock cursor movement when button pressed

7/20 playtest:
1B   j #231 de-ghost on login
3B T c #234 heads have no resale value
3B   r #237 make help work while seated

8/14 misc items
1B T c #238 make ungrabbable classes include tokens (plus other classes?)
1B T c #239 you can pick up open boxes sometimes
2B   c j #240 disconnect while holding restricted object
3B   r c #241 bring up stock market
3B T r #242 bring up d'nalsi adventure
3B T r #243 bring up region rally
3B T r c #244 bring up tome of wealth and fame
3B   r c #245 do something about capture the flag
3B   c r #246 define librarian, other roles
3B   c #247 bring oracle/bureaucrats up

Alpha test items:

Dragonfish:
?    #0804-1 Corrupted memory (evidenced by multi-colored text chars) Could Be Bad C64.

Ribbit:
1A T j c #0804-2 In customizer, one of the heads still appears on the right
?    #0804-3 Could not enter (waited 5 min during load) (after 12:30pm)

Cathleen:
?    #0804-5 Flashing Go, Couldn't quit. (1:05 or 11:05?)

Milady:
1B   r #0804-6 In customizer: "...represented by  me" <- double space

K9 Trainer:
1A T c r #0804-11 An avatar saw me as invisible

Ms Unique:
1B   r c #0804-13 Had problem opening dresser (check lamp/chair placement)
1A T r #0804-14 Single Char word balloon (typed suring region trans)

Chip:
1B   c #0804-19 Padding short messages with spaces not quite right.

Renfield:
1B   n #0804-20 Approve Habitat boot screen
1A   a #0804-22 Does moonwalk work on non-standard avatars?
1A T c j #0804-24 Style Magic/Auto teleport crashes target avatar,1/2s tokens

PRASE:
1B   r #0807-2 Ghosted (before appearing), Dghosted...GET hung 9:45 (invest.)

RIBBIT:
1B   q #0807-6 On return to PC, dumped to basic (happens elsewhere in qlink)

MS UNIQUE:
-    j #0807-8 regionproc crash (janet working on)
1B T r c #0807-9 Costellos is still hooked to sewer, and "GAMES NEWS"
1A T c #0811-1 Sensor DO crashed system for sensor type 0
1A   c j #0811-2 Some items (because of crash) where in backgound (Janet notes: change containers should set y AND X)

JANET:
?? T r #0808-2 Long protocol delays (minutes!)

BELGAR:
??   #0811-10 Got a PALM TREE in plaza sw! (then region crash)

Beren:
1A T c #0812-1 Auto teleport 1/2s tokens
2B   c r #0812-2 If you hand an object to a sitting avatar, it stands.
1B W r #0812-3 On/off lights does not work right in paper interface.

Cathleen:
1B   r #0812-5 immobile magic DO should do implied GO.
1A   r #0812-6 still able to leave Backgammon #2 with game piece.
??   #0812-7 PE? says whe lost a token during teleport (?)
??   #0812-8 PE. A user 'winked' (left and came back fast)
??   #0812-9 PE? Cathy couldn't GO to the pond. (collision with tree?)
??   #0812-10 PE. Had problem putting token in pocket (cathy)
??   #0812-11 PE. Tried to walk to the 'ground' above horizon"No way to go"

Chris:
1A   j r #0812-14 FE #7 (there were 3 of these, 2 dumped, both caused by host)

Ariana1:
2B   r a #0813-1 Some turfs have flowers on top of dresser (move/remove them)
2B   r a #0813-2 The New You needs a "MORE ->" sign
1A   j #0813-3 Regionproc Crash.

Bahia:
1A T c #0813-4 It is possible to 'get' an open box! (fixed)

Janet:
1B   j r #0813-8/9 Had problems grabbing objects (had something in hand,I bet)
1A   j #0813-10 FE#7 (Host send talk message from non-exist noid!)
