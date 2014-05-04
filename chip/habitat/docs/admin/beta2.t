The avatar
	Missing some asynchronous behaviors.
	Need to integrate choreography with actions.
	Need to merge front/back view stuff with running system.

Inert and scenic objects (trees, the ground, etc.)
	Basically works.
	Wall vs. sky should handle change region appropriately.

Doors
	Not tested, but should work.
	Need to integrate with 'change-region'.

Carryable objects (get/put/throw)
	'Get' works.
	'Put' works.
	'Throw' awaits independent object motion.

Containers
	Keys and locks work.
	'Close' and 'pick-up' work.
	'Pick-from' and 'put-into' work.
	'Display-contents' works.
	'Open' is broken at host end.  C64 end is therefor untested.

Weapons
	C64 end works.
	Host end needs 'destroy-object'.
	Gun could use some sound effects right now.

Teleport devices
	Untested, awaiting 'change-region', money.
	Need interim 'teleport-number-lookup' in host.

Magical objects
	Seems to work.
	Need to define some magical functions in host.

Money
	'Select-denomination' works.
	Need 'create-object' in host.
	Need to redefine messages to pass noids of created tokens.

Clothing
	'Wear' coded but not tested.
	'Remove' needs to be a special case of 'avatar_do'.
	Need some clothing objects in test region (need images for them??).

Riddle
	Janet needs test data from us.
	Need to document new riddle, make minor changes.
	Need to have genesis working at host.
	Need to generate beta universe regions.

Misc
	'Change-region' is still a mess in host.
	Night/day graphics?
	Need at least one sensor function in host.
	Stereo 'load'/'unload'?
	Garbage can needs final checkout, should work though.
	Building graphics need to be defined.
	Need 'kill-avatar'/'reincarnate'.
	Need to add width to host database, adjacency checks in host and C64.
	Oracle?
	Aquarium, bottle, compass, fake gun, flag all need testing.
