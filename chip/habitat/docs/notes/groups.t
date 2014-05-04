		Major Functional Object Groups
		    MicroCosm Document #21
			 April 28, 1986

	Most of the various objects can be categorized using a small number of
functional groups.  All of the classes in a particular group share a common
set of behavior protocols for accomplishing a particular sort of task.  Many
objects belong to more than one group because they support more than one set
of functions.  Not all of the functionality of the complete object set is
accounted for by this group structure.  There are many one-of-a-kind functions
that are not dealt with here.  In approximate order of implementation:

Avatar
	avatar

	The avatar group consists of one class, the avatar class itself.  This
could be thought of as a sort of one-of-a-kind thing, but it is so important I
decided not to.

Inert
	bush		sign		streetlamp	tree
	window

	The inert group consists of objects which simply sit there and do
nothing.  They are only there to be seen.

Scenic
	bridge		fence		gate		ground
	pond		river		roof		sidewalk
	sky		street		wall

	The scenic group consists of objects that are used to construct the
background.  They are mostly just seen, though they can interact with
movement.  Scenic objects are generally not rendered as cels but are specified
directly in terms of other graphics primitives.

Door
	door		gate

	The door group consists of scenic obstructions which may be opened to
allow passage or closed to block it.  Like containers, the all have the
'open', 'key' and 'unlocked' properties.

GPT
	amulet		answering machine		aquarium
	backpack	bag		ball		beeper	
	book/newspaper	boomerang	bottle		box
	club		compass		credit card	crystal ball
	die		drugs		escape device	fake gun
	flag		flashlight	frisbee		gemstone
	grenade		gun		instant object pill
	key		knick knack	knife		magic lamp
	magic staff	magic wand	matchbook	microphone
	movie camera	paper		pencil		picture
	plant		radio		ring		road pizza
	rock		rubber ducky	security device	sensor
	stereo		tape		teddy bear	ticket
	tokens		towel		walkie talkie	windup-doll

	GPT stands for Get/Put/Throw.  The GPT group contains all objects
which can be picked up and carried.  Doing this requires manipulation of the
'container' and 'x' and 'y' position properties of the objects.  It also must
be possible to show the avatar carrying these objects.

Container
	backpack	bag		boat		box
	car		chest		countertop	display case
	garbage can	jacket		pants		safe
	skirt		table		truck

	The container group consists of objects which may contain other
objects.  All containers may be opened and closed and have a lock that
requires a key to open.  They thus all have the 'open', 'key' and 'unlocked'
properties.  For some objects it is inappropriate to open and close, so their
'open' property is permanently TRUE and they don't respond to the open/close
container protocol.  For some objects it is inappropriate to have locks, so
their 'unlocked' property is permanently TRUE and their 'key' property is set
to NULL so that they can never be locked.  All containers have a 'contents'
property which is an array of object pointers that tells what other objects
are contained within them.  All containers have a capacity which is specified
by the 'capacity' class property.  The capacity determines how many objects
may be placed inside the container before the container is said to be full (it
also tells us how large a space to allocate for the 'contents' property in the
instance descriptor).  Some containers (for example the backpack or the
garbage can) are opaque and hide their contents within themselves.  Others
(for example the display case or the table) are either transparent or display
their contents outside themselves.  Containers have a boolean
'displayContents' class property that tells the graphics routines whether or
not to show what's in the container when rendering the container on the
screen.

Pseudo
	building	bus		region		water

	The pseudo group consists of objects which don't really exist, but are
defined anyway for reasons of convenience in system definition.

Weapon
	club		grenade		gun		knife
	magic staff

	The weapon group consists of all those objects which can be used to
inflict mayhem and destruction on other avatars and their property.  The host
must understand the nature and extent of the damage caused by each.

Port
	escape device	teleport booth	avatar

	The port group consists of objects which move an avatar from one
region to another.  Avatars are included in this group because they can move
themselves by walking.  The region-to-region transition triggers a lot of
important activity in the system, in both the host and in the C64.

Magic
	amulet		gemstone	knick knack	magic staff
	magic wand	ring

	The magic group consists of objects with magical powers.  An object's
magical power is simply invoked.  What happens then depends on what exactly
the magical power happends to be.  There is a pool of magical functions
available in the host for all magical objects to draw upon.  Magical objects
have a host property 'magicType' that tells which magical function to call.

Money
	atm		coke machine	credit card	fare box
	fortune machine	jukebox		parking meter	phone booth
	teleport booth	tokens

	The money group includes all objects that participate in the handling
of funds.  Money is represented in two forms: as tokens, which are objective
entities that can be passed from person to person or left in a place, and as
bank account credits, which can be transferred from one account to another.
The atm object converts between the two forms, while the token object and the
credit card object embody the interface to the actual money.  All the other
objects in this group are "coin operated" devices that require the infusion of
funds in order to work.  The coin-op objects all support a pay/refund
protocol.

Sit
	bed		boat		car		chair
	couch		hot tub		motorcycle	truck

	The sit group consists of objects that may be sat in or laid upon.
Some of them can hold multiple avatars.  Each sit group object has an
'occupants' property that is an array of object pointers specifying who is
sitting in it.  Each element in this array corresponds to a particular
position.  The number of avatars who can sit in an object is given by the
'maxOccupants' class property.  The graphics routines must worry about
displaying the right people in the right places, and the player interface must
worry about what seats are filled and what seat a player is pointing at.

Light
	flashlight	floor lamp

	The light group consists of objects which affect the illumination
level of the region.  Turning them on or off increments or decrements
(respectively) the light level of the region.  When the light level of a
region is 0, it is displayed in darkness.

Edit
	paper

	The edit group consists of objects which have a text property that the
player must be able to edit.  We pop into a simple editor mode to do this.
Currently there is only one class in this group, but that could change.

Clothing
	amulet		backpack	hat		jacket
	pants		shirt		shoes		skirt

	The clothing group consists of objects which may be worn on some part
of the body (they are not all clothing items strictly speaking, e.g., the
amulet).  We thus need to have a protocol for putting things on and taking
them off again.  Clothing items may be picked up and carried in the hands
between being worn and being put down.  Clothing group objects carry the
'location' class property which specifies where on the body they are to be
worn.

Mail
	dropbox		mailbox

	The mail group consists of objects which interface with the mail
system.  There are two functions associated with this system: sending mail and
receiving mail.

Phone
	answering machine		beeper		phone booth
	telephone	walkie talkie

	The phone group consists of objects which make up the telephone
system.  The answering machine and the beeper have to interact with the phone
system, while the rest of the objects in the group do all the work.  Each
phone object has an internal state machine that drives it.  Corresponding to
this is a 'phoneState' property that tells whether the phone is ringing,
talking, dialing, etc.  The full phone protocol is quite large and complex.

Interactive
	crystal ball	fountain	magic lamp

	The interactive group contains objects that have the potential of
putting players into direct dialog with system people.  For example, the
fountain functions as oracle and can ask and answer questions live from the
gods.

Vehicle
	boat		car		motorcycle	skateboard
	truck

	The vehicle group contains all the vehicles.  Vehicles carry avatars
and their possessions around under the control of one player (the driver).
Vehicle movement is a special case of walking: once a player is in the
driver's seat of a vehicle, he moves around exactly as he would if he were
walking.  The vehicle moves and carries all the other passengers along with
it.

Music
	jukebox		radio		stereo

	The music group consists of objects which can play music.  Music is
represented as a periodic stream of note strings which are sent from the host.
Hopefully, they take a lot less time to transmit than they do to play, so that
they don't eat all the communications bandwidth.

Idiosyncratic

	aquarium	book/newspaper	boomerang	bottle
	building	bus		compass		countertop
	crystal ball	die		display case	drugs
	escape device	fake gun	fare box	flag
	fortune machine	fountain	frisbee		garbage can
	hand of god	house cat	instant object pill
	jukebox		magic lamp	matchbook	movie camera
	paper		parking meter	region		security device
	sensor		tape		teleport booth	wind-up toy

	The idiosyncratic group consists of all those objects which possess
some behavior that is not accounted for in one of the above groups, i.e.,
everything else.
