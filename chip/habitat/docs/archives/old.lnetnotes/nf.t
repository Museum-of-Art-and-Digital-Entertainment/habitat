
	Random, slightly sorted maunderings about Lucasnet   10/17/84

Target Systems:  68000 based home computers (Mac, Amiga, Mindset, Phillips)

Generic Description:	Multiplayer games based on local processing
with occasional connection (phone lines or cable) for data transmission.

Lucasfilm Games Alliance:  A master computer (non-evil variety) that
maintains a huge (1000+ players) database(s) for games.  The game
universe in the computer would be updated by players whenever they
logged in.  The computer would do the database manipulation, and
simply accept and transmit data to players without letting them
actually run programs on the main computer.

Lucasnet Games:  A series of games, strongly related in internal
structure, loosely related in external (visible) structure, unrelated
and unique in theme.  These games would be multiplayer games set up
for people to run on their home computers.  The games would be
played in phases:

	Phase one:	Order entry phase.  Player enters new orders
	for his units.  Units are ordered to move, fight, explore,
	build, destroy, change.  Extensive user-friendly graphics
	and forecasts of the effects of the moves are provided on
	the screen.

	Phase two:	Order transmission.  All players exchange
	orders, either by calling one player, or circulating them
	in a chain until everyone has everyone else's orders.

	Phase three:	Update.  Each computer updates the state of
	the game universe, based deterministically on orders of units
	and a shared random seed.  Update is depicted graphically, with
	the same displays as in order entry but with final results
	affecting the database.  Public key encryption and various
	copy protection tricks are used to avoid cheating.  Winner
	is announced if one or more players have achieved victory
	conditions.  If not, play proceeds to phase one.

Possible themes:

	Historical battles (actual and hypothetical)
	Exploration (of America, of the Solar System, of our Galactic Arm)
	Politics (elections, running countries, revolutions)
	Economic (running countries, running businesses, world trade, lemonade
		stands, interstellar trade)

	All of the above  (PSL's Empire is a good example)

Program Structure:

	The programs would have three parts to them:

	1. A standard 68000 "game" with data base and programs to
	   manipulate it, with "black box" interfaces to the other
	   parts of the program -

	2. An I/O-graphics package, computer specific, that displays the
	   game information colorfully (or, in Mac, shadefully) and
	   clearly, 

	3. A communications interface that standardizes the inter-machine
	   communications (so any of the target machines can play with
	   any other, and part 1 can be machine independent).

Game Structure

	Games would be played in the afformentioned phases, with three
	very general types of play (irregardless of theme):

	1.  "Automatic" games where the player sets up some high level
	    goals or "doctrines", E.G. a military doctrine of shoot first,
	    ask questions later, an exploration doctrine of send in a few
	    military, and if unopposed send in civilians, otherwise more
	    military.  Updates will take care of actual movement and
	    interactions.  ROBOTWAR is an example of this kind of game,
	    although with only one round.  Political multiplayer team
	    games with each player being a cabinet minister (or co-dictator)
	    and setting up a doctrine independently, then submitting them
	    together and playing several teams against each other are
	    another possibility.  You could win as a team, or as an
	    individual (based on what the computer-generated populace
	    thought of your policies).

	2.  "Semi-Automatic", which can range from automatic games with
	    a few special orders that can effect the database without
	    an update, through games with internal economics and politics
	    under your control, but with interactions between players
	    happening only at updates and according to preplanned doctrines,
	    to games like Flying Buffalo's STARWEB, with almost everything
	    being ordered explicitly, and only a few special situations
	    (ambush, retreats, conditional attacks) being mediated by
	    the computer during update.  An example of this sort of game
	    would be one of interstellar exploration.  Each player would
	    have real-time control over their home planet, building and
	    exploring their home system, sending out colony ships and
	    explorers and warships on missions.  If the stars in this
	    world are a minimum of four light years apart, the updates
	    would take place every four years.  At that time any new
	    missions would be transferred between players' computers,
	    with the computers keeping the information secret until the
	    time that ships arrive at the opponent's home planets, probably
	    during the off-line phase.  These missions would be controlled
	    by the computer, according to whatever doctrine the player
	    sending the ship out had determined at time of launch.  Speed
	    of light would limit communications as well as transport - if
	    an explorer went to a system 6 lightyears away, it would take
	    12 years (game years of course) to find out if there were any
	    planets there.  Once a colony has been established and reaches
	    a certain technology level, they can build an ansible, an
	    instantaneous communications device that works only between
	    planets.  Then the colony would be controlled by the player
	    when offline, and new doctrines could be established instantly.
	    Changing technology would make a great difference in this game,
	    and situations like Haldeman's "The Forever War" would easily
	    happen.

	3.  "Manual" games, where the game mechanics are simple and players
	    can proceed with full control over what happens, exchanging
	    information at updates but resolving attacks, building, etc.
	    independently.  An example of this sort of game is SLAG, by
	    Stewart Eastman for the TRS-80.  This game started 2-12 players
	    with identical forces consisting of industry, bombers, ICBM's,
	    ABM's, Subs, Sub missiles, Anti-sub planes, and a spy network.
	    Each turn the players decide what to build with their indust-
	    rial output (any of the forces mentioned except spys), and
	    whether to move their spy network to a different country.
	    Then they decide whether to launch an attack, and what forces
	    to use.  Sub missile attacks are not identified by country.
	    Bomber attacks take two turns to complete, and can be called
	    off on the second turn (keeping the bomber circling over
	    enemy countries).  ICBM attacks come through in one turn,
	    so bomber attacks must be launched the turn before to
	    co-ordinate.  After the build/attack phase, an update would
	    occur.  Before seeing industrial output for that turn, the
	    players would find out if they were under attack that turn,
	    and attempt to fight it off if they were.  This is done in
	    an arcade style game with missiles and bombers passing overhead
	    and ABM's being used to shoot them down.  Bombers hit only once
	    will drop their bombs and crash.  Hit twice, they are destroyed
	    before attacking.  Missiles must only be hit once.  ICBM and
	    Bomber attacks identify the attacking country, sub missile attacks
	    do not.  If the player survives the attack phase with any industry
	    the player's ASW planes can try to spot subs, and go into an
	    arcade game for that phase, sub against plane.  Then another
	    build phase, started off with a spy report from the country your
	    spy network is in.   This game was lots of fun as a single
	    computer game with many players taking turns, and would go faster
	    with multiple computers.  Similar game play with an original
	    game is of course possible.
