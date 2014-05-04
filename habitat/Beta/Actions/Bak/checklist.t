/*
	beta.mud

	Master muddle file for MicroCosm Beta release.

	Chip Morningstar
	Lucasfilm Ltd.
	4-May-1986

	Adapted from earlier versions by Aric Wilmunder & Randy Farmer
*/

class class_region 0 {
	sound	beep
	sound	boing
/**/	byte	 6			/* Object instance length */
/**/	byte	 0			/* Initalization count */
/**/	byte	 0			/* Capacity */
}

class class_avatar 1 {
	sound	beep
/**/	action	avatar_do		/* do */
/**/	action	noEffect		/* reversed do */
/**/	action	avatar_go		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	avatar_get		/* get */
/**/	action	avatar_put		/* put */
/**/	action	avatar_talk		/* talk */
	action	avatar_destroy		/* destroy */
/**/	action  avatar_WALK		/* 8 -- WALK* */
/**/	action	avatar_ATTACK		/* 9 -- ATTACK* */
/**/	action	avatar_BASH		/* 10 -- BASH* */
/**/	action	avatar_BUGOUT		/* 11 -- BUGOUT* */
/**/	action	avatar_CLOSE		/* 12 -- CLOSE* */
/**/	action	avatar_CLOSECONTAINER	/* 13 -- CLOSECONTAINER* */
/**/	action	generic_SPEAK		/* 14 -- SPEAK* */
/**/	action	avatar_GETM		/* 15 -- GET* */
/**/	action	avatar_GRAB		/* 16 -- GRAB* */
/**/	action	avatar_GRABFROM		/* 17 -- GRABFROM* */
/**/	action	avatar_OPEN		/* 18 -- OPEN* */
/**/	action	avatar_OPENCONTAINER	/* 19 -- OPENCONTAINER* */
/**/	action	avatar_POSTURE		/* 20 -- POSTURE* */
/**/	action	avatar_POUR		/* 21 -- POUR* */
/**/	action	avatar_PUTM		/* 22 -- PUT* */
/**/	action	avatar_TAKE		/* 23 -- TAKE* */
/**/	action	avatar_THROW		/* 24 -- THROW* */
/**/	action	avatar_LOAD		/* 25 -- LOAD* */
/**/	action	avatar_UNLOAD		/* 26 -- UNLOAD* */
/**/	action	avatar_FILL		/* 27 -- FILL* */
/**/	action	avatar_WEAR		/* 28 -- WEAR* */
/**/	action	avatar_REMOVE		/* 29 -- REMOVE* */
/**/	action	avatar_PAID		/* 30 -- PAID* */
/**/	action	generic_patternSwap	/* 31 -- internal pattern swap */
 	image	avatar_side_image
	byte	142			/* Object instance length */
	byte	 10			/* Initialization count */
	byte	  7			/* Capacity: hand, foot, legs, torso,
					   head, neck, back */
}

class class_amulet 2 {
	sound	beep
/**/	action	generic_doMagic		/* do */
/**/	action	generic_throw		/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
	action	generic_wear		/* get */
	action	generic_remove		/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smallExplosion	/* destroy */
	image	amulet_image
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_answering_machine 3 {
	sound	beep
/**/	action	answering_machine_do	/* do */
/**/	action	noEffect		/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	generic_goToAndGet	/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	answering_machine_talk	/* talk */
	action	generic_smash		/* destroy */
/**/	action	answering_machine_TAKEMESSAGE	/* 8 -- TAKEMESSAGE* */
	image	answering_machine_image
	byte	15			/* Object instance length */
	byte	 7			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_aquarium 129 {
	sound	beep
/**/	action	aquarium_do		/* do */
/**/	action	generic_throw		/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	generic_goToAndGet	/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smash		/* destroy */
/**/	action	generic_CHANGESTATE	/* 8 -- CHANGESTATE* */
	image	aquarium_image
	byte	15			/* Object instance length */
	byte	 7			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_atm 4 {
	sound	beep
/**/	action	atm_do			/* do */
/**/	action	illegal			/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	atm_get			/* get */
/**/	action	atm_put			/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smash		/* destroy */
	image	atm_image
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_backpack 5 {
	sound	beep
/**/	action	generic_depends		/* do */
/**/	action	generic_throw		/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
	action	generic_wearOrUnpocket	/* get */
	action	generic_remove		/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smashWithContents /* destroy */
	image	backpack_image
	byte	27			/* Object instance length */
	byte	 9			/* Initialization count */
	byte	10			/* Capacity */
}

class class_bag 6 {
	sound	beep
/**/	action	generic_adjacentOpenCloseContainer /* do */
/**/	action	generic_depends		/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	generic_goToAndPickFromOrGet /* get */
/**/	action	generic_goToAndDropIntoIfOpen /* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smashWithContents /* destroy */
	image	bag_image
	byte	22			/* Object instance length */
	byte	 9			/* Initialization count */
	byte	 5			/* Capacity */
}

class class_ball 7 {
	sound	beep
/**/	action	generic_depends		/* do */
/**/	action	generic_throw		/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	generic_goToAndGet	/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smash		/* destroy */
	image	ball_image
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_bed 130 {
	sound	beep
	action	bed_do			/* do */
/**/	action	illegal			/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	noEffect		/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smash		/* destroy */
/*	image	bed_side_image
	image	bed_front_image
	image	bed_back_image*/
	byte	15			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 1			/* Capacity */
}

class class_beeper 8 {
	sound	beep
/**/	action	beeper_do		/* do */
/**/	action	generic_throw		/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	generic_goToAndGet	/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smash		/* destroy */
/**/	action	beeper_BEEP		/* 8 -- BEEP* */
	image	beeper_image
	byte	15			/* Object instance length */
	byte	 7			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_book 10 {
	sound	beep
/**/	action	book_do			/* do */
/**/	action	generic_throw		/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	generic_goToAndGet	/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smash		/* destroy */
	image	book_end_image
	image	book_front_image
	image	magazine_image
	image	newspaper_image
	byte	15			/* Object instance length */
	byte	 7			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_boomerang 11 {
	sound	beep
/**/	action	generic_depends		/* do */
/**/	action	boomerang_rdo		/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	generic_goToAndGet	/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smash		/* destroy */
/**/	action	boomerang_THROWAWAY	/* 8 -- THROWAWAY* */
	image	boomerang_image
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_bottle 12 {
	sound	beep
/**/	action	generic_depends		/* do */
/**/	action	bottle_rdo		/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	generic_goToAndGet	/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smash		/* destroy */
	image	bottle_image
	byte	15			/* Object instance length */
	byte	 7			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_box 13 {
	sound	beep
/**/	action	generic_adjacentOpenCloseContainer /* do */
/**/	action	generic_throw		/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	generic_goToAndPickFromOrGet /* get */
/**/	action	generic_goToAndDropIntoIfOpen /* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smashWithContents /* destroy */
	image	box_image
	image	treasure_chest_image
	byte	27			/* Object instance length */
	byte	 9			/* Initialization count */
	byte	10			/* Capacity */
}

class class_bridge 131 {
	sound	beep
/**/	action	generic_depends		/* do */
/**/	action	illegal			/* reversed do */
/**/	action	generic_goToCursor	/* go */
/**/	action	generic_cease		/* stop */
/**/	action	noEffect		/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smash		/* destroy */
/*	image	bridge_side_image
	image	bridge_front_image*/
	byte	16			/* Object instance length */
	byte	 8			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_building 132 {
	sound	beep
/**/	action	illegal			/* do */
/**/	action	illegal			/* reversed do */
/**/	action	illegal			/* go */
/**/	action	illegal			/* stop */
/**/	action	illegal			/* get */
/**/	action	illegal			/* put */
/**/	action	illegal			/* talk */
/**/	action	illegal			/* destroy */
	image	missing_image	/* any imagery here at all anyway? */
	byte	14			/* Object instance length */
	byte	 8			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_bush 133 {
	sound	beep
/**/	action	generic_depends		/* do */
/**/	action	illegal			/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	noEffect		/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smash		/* destroy */
	image	bush_image_1
	image	bush_image_2
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_chair 134 {
	sound	beep
	action	generic_sitOrGetUp	/* do */
/**/	action	illegal			/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	noEffect		/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smash		/* destroy */
	image	chair_front_back_image
	image	chair_side_image
	byte	15			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 1			/* Capacity */
}

class class_chest 135 {
	sound	beep
/**/	action	generic_adjacentOpenCloseContainer /* do */
/**/	action	illegal			/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	generic_goToAndPickFromIfOpen /* get */
/**/	action	generic_goToAndDropIntoIfOpen /* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smashWithContents /* destroy */
	image	chest_front_image
	image	chest_back_image
	image	chest_side_image
	byte	37			/* Object instance length */
	byte	 9			/* Initialization count */
	byte	20			/* Capacity */
}

class class_club 16 {
	sound	beep
/**/	action	generic_depends		/* do */
/**/	action	generic_strike		/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	generic_goToAndGet	/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smash		/* destroy */
	image	club_image
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_coke_machine 136 {
	sound	beep
/**/	action	generic_depends		/* do */
/**/	action	illegal			/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	noEffect		/* get */
/**/	action	coke_machine_put	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smallExplosion	/* destroy */
/**/	action	coke_machine_PAY	/* 8 -- PAY* */
/*	image	coke_machine_image_1
	image	coke_machine_image_2*/
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_compass 17 {
	sound	beep
/**/	action	generic_depends		/* do */
/**/	action	generic_throw		/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	generic_goToAndGet	/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smash		/* destroy */
	image	compass_image
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_couch 137 {
	sound	beep
	action	generic_sitOrGetUp	/* do */
/**/	action	illegal			/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	noEffect		/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smash		/* destroy */
	image	couch_front_back_image
	image	couch_side_image
	byte	16			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 2			/* Capacity */
}

class class_countertop 18 {
	sound	beep
/**/	action	generic_depends		/* do */
/**/	action	illegal			/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	noEffect		/* get */
/**/	action	generic_goToAndDropInto	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smashWithContents /* destroy */
	image	countertop_image
	byte	22 /*21*/		/* Object instance length */
	byte	 9			/* Initialization count */
	byte	 5 /* 4*/		/* Capacity */
}

class class_credit_card 19 {
	sound	beep
/**/	action	generic_depends		/* do */
/**/	action	credit_card_rdo		/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	generic_goToAndGet	/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smash		/* destroy */
	image	credit_card_image
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_crystal_ball 20 {
	sound	beep
/**/	action	generic_depends		/* do */
/**/	action	generic_throw		/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	generic_goToAndGet	/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_askOracle	/* talk */
	action	generic_mediumExplosion	/* destroy */
/**/	action	generic_SPEAK		/* 8 -- ORACLESPEAK+ */
	image	missing_image	/* Hey, didn't Gary do one of these? */
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_die 21 {
	sound	beep
/**/	action	die_do			/* do */
/**/	action	generic_throw		/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	generic_goToAndGet	/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smash		/* destroy */
/**/	action	die_ROLL		/* 8 -- ROLL* */
	image	missing_image
	byte	15			/* Object instance length */
	byte	 7			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_display_case 22 {
	sound	beep
/**/	action	generic_depends		/* do */
/**/	action	illegal			/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	noEffect		/* get */
/**/	action	generic_goToAndDropInto	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smashWithContents /* destroy */
	image	display_case_image
	byte	22 /*21*/		/* Object instance length */
	byte	 9			/* Initialization count */
	byte	 5 /* 4*/		/* Capacity */
}

class class_door 23 {
	sound	beep
/**/	action	generic_adjacentOpenClose /* do */
/**/	action	illegal			/* reversed do */
/**/	action	generic_goToOrPassThrough /* go */
/**/	action	generic_cease		/* stop */
/**/	action	noEffect		/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smash		/* destroy */
	image	door_image_1
	image	door_image_2
	byte	17			/* Object instance length */
	byte	 9			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_dropbox 24 {
	sound	beep
/**/	action	generic_depends		/* do */
/**/	action	illegal			/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	noEffect		/* get */
/**/	action	generic_sendMail	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smash		/* destroy */
	image	dropbox_image
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_drugs 25 {
	sound	beep
/**/	action	drugs_do		/* do */
/**/	action	generic_throw		/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	generic_goToAndGet	/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smash		/* destroy */
	image	drugs_image
	byte	15			/* Object instance length */
	byte	 7			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_escape_device 26 {
	sound	beep
/**/	action	escape_device_do	/* do */
/**/	action	generic_throw		/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	generic_goToAndGet	/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smallExplosion	/* destroy */
	image	escape_device_image
	byte	15			/* Object instance length */
	byte	 7			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_fake_gun 27 {
	sound	beep
/**/	action	fake_gun_do		/* do */
/**/	action	fake_gun_rdo		/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	generic_goToAndGet	/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smash		/* destroy */
/**/	action	fake_gun_FAKESHOOT	/* 8 -- FAKESHOOT* */
/**/	action	fake_gun_RESET		/* 9 -- RESET* */
	image	fake_gun_image
	byte	16			/* Object instance length */
	byte	 7			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_fare_box 28 {
	sound	beep
/**/	action	fare_box_do		/* do */
/**/	action	illegal			/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	noEffect		/* get */
/**/	action	fare_box_put		/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smash		/* destroy */
/**/	action	fare_box_PAY		/* 8 -- PAY* */
/**/	action	fare_box_ARRIVAL	/* 9 -- ARRIVAL+ */
/**/	action	fare_box_DEPARTING	/* 10 -- DEPARTING+ */
/**/	action	fare_box_DEPARTURE	/* 11 -- DEPARTURE+ */
	image	fare_box_image
	byte	34			/* Object instance length */
	byte	26			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_fence 138 {
	sound	beep
/**/	action	generic_depends		/* do */
/**/	action	illegal			/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	noEffect		/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smash		/* destroy */
/*	image	fence_image*/
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_fish_food 83 {
	sound	beep
/**/	action	generic_depends		/* do */
/**/	action	generic_throw		/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	generic_goToAndGet	/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smash		/* destroy */
	image	missing_image
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_flag 29 {
	sound	beep
/**/	action	generic_depends		/* do */
/**/	action	generic_throw		/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	generic_goToAndGet	/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smash		/* destroy */
/**/	action	generic_CHANGESTATE	/* 8 -- CHANGESTATE+ */
	image	flag_image
	byte	15			/* Object instance length */
	byte	 7			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_flashlight 30 {
	sound	beep
/**/	action	flashlight_do		/* do */
/**/	action	generic_throw		/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	generic_goToAndGet	/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smash		/* destroy */
/**/	action	generic_OFFLIGHT	/* 8 -- OFFLIGHT* */
/**/	action	generic_ONLIGHT		/* 9 -- ONLIGHT* */
	image	flashlight_image
	byte	15			/* Object instance length */
	byte	 7			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_floor_lamp 139 {
	sound	beep
/**/	action	floor_lamp_do		/* do */
/**/	action	illegal			/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	noEffect		/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smash		/* destroy */
/**/	action	generic_OFFLIGHT	/* 8 -- OFFLIGHT* */
/**/	action	generic_ONLIGHT		/* 9 -- ONLIGHT* */
	image	floor_lamp_image
	byte	15			/* Object instance length */
	byte	 7			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_fortune_machine 140 {
	sound	beep
/**/	action	generic_depends		/* do */
/**/	action	illegal			/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	noEffect		/* get */
/**/	action	fortune_machine_put	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smash		/* destroy */
/**/	action	generic_SPEAK		/* 8 -- SPEAKFORTUNE* */
	image	fortune_machine_image
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_fountain 141 {
	sound	beep
/**/	action	generic_depends		/* do */
/**/	action	illegal			/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	generic_goToAndFill	/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_askOracle	/* talk */
/**/	action	noEffect		/* destroy */
/**/	action	generic_SPEAK		/* 8 -- ORACLESPEAK+ */
	image	fountain_image
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_frisbee 31 {
	sound	beep
/**/	action	generic_depends		/* do */
/**/	action	generic_throw		/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	generic_goToAndGet	/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smash		/* destroy */
	image	frisbee_image
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_garbage_can 32 {
	sound	beep
/**/	action	garbage_can_do		/* do */
/**/	action	illegal			/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	generic_goToAndPickFrom	/* get */
/**/	action	generic_goToAndDropInto	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smashWithContents /* destroy */
/**/	action	garbage_can_FLUSH	/* 8 -- FLUSH* */
	image	garbage_can_image
	image	kitchen_garbage_image
	byte	37 /*27*/		/* Object instance length */
	byte	 9			/* Initialization count */
	byte	20 /*10*/		/* Capacity */
}

class class_gate 142 {
	sound	beep
/**/	action	generic_adjacentOpenClose /* do */
/**/	action	illegal			/* reversed do */
/**/	action	generic_goToOrPassThrough /* go */
/**/	action	generic_cease		/* stop */
/**/	action	noEffect		/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smash		/* destroy */
	image	missing_image
	byte	17			/* Object instance length */
	byte	 9			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_gemstone 33 {
	sound	beep
/**/	action	generic_doMagicIfMagic	/* do */
/**/	action	generic_throw		/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	noEffect		/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smallExplosionIfMagic /* destroy */
	image	gemstone_image
	byte	15			/* Object instance length */
	byte	 7			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_grenade 35 {
	sound	beep
/**/	action	grenade_do		/* do */
/**/	action	generic_throw		/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	generic_goToAndGet	/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_mediumExplosion	/* destroy */
/**/	action	grenade_EXPLODE		/* 8 -- EXPLODE+ */
	image	grenade_image
	byte	15			/* Object instance length */
	byte	 7			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_ground 36 {
	sound	beep
/**/	action	generic_depends		/* do */
/**/	action	illegal			/* reversed do */
/**/	action	generic_goToCursor	/* go */
/**/	action	generic_cease		/* stop */
/**/	action	noEffect		/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
/**/	action	noEffect		/* destroy */
	image	ground_image
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_gun 37 {
	sound	beep
	sound	click
	sound	bang
/**/	action	gun_do			/* do */
/**/	action	generic_shoot		/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	generic_goToAndGet	/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_mediumExplosion	/* destroy */
	image	gun_image_1
	image	gun_image_2
	image	gun_image_3
	image	mauser_image
	byte	15			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_hand_of_god 38 {
	sound	beep
/**/	action	generic_depends		/* do */
/**/	action	illegal			/* reversed do */
/**/	action	illegal			/* go */
/**/	action	illegal			/* stop */
/**/	action	illegal			/* get */
/**/	action	illegal			/* put */
/**/	action	illegal			/* talk */
/**/	action	noEffect		/* destroy */
/**/	action	hand_of_god_BLAST	/* 8 -- BLAST* */
	image	hand_of_god_image
	image	cinder_image
	byte	15			/* Object instance length */
	byte	 7			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_hat 39 {
	sound	beep
/**/	action	generic_depends		/* do */
/**/	action	generic_throw		/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
	action	generic_wear		/* get */
	action	generic_remove		/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smash		/* destroy */
	image	missing_image
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_house_cat 143 {
	sound	beep
/**/	action	generic_depends		/* do */
/**/	action	illegal			/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	noEffect		/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smash		/* destroy */
	image	house_cat_image
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_hot_tub 144 {
	sound	beep
	action	generic_sitOrGetUp	/* do */
/**/	action	illegal			/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	generic_goToAndFill	/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smash		/* destroy */
	image	hot_tub_image
	byte	20			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 6			/* Capacity */
}

class class_instant_object_pill 40 {
	sound	beep
/**/	action	generic_depends		/* do */
/**/	action	generic_throw		/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	generic_goToAndGet	/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smash		/* destroy */
/**/	action	instant_object_TRANSFORM /* 8 -- TRANSFORM* */
	image	instant_object_pill_image
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_jacket 41 {
	sound	beep
/**/	action	generic_depends		/* do */
/**/	action	generic_throw		/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	generic_wearTorso	/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smashWithContents /* destroy */
/**/	action	generic_patternSwap	/* 8 -- internal pattern swap */
	image	missing_image
	byte	21 /*19*/		/* Object instance length */
	byte	 8			/* Initialization count */
	byte	 5 /* 3*/		/* Capacity */
}

class class_jukebox 145 {
	sound	beep
/**/	action	jukebox_do		/* do */
/**/	action	illegal			/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	noEffect		/* get */
/**/	action	jukebox_put		/* put */
/**/	action	jukebox_talk		/* talk */
	action	generic_smash		/* destroy */
/**/	action	illegal			/* 8 -- filler */
/**/	action	illegal			/* 9 -- filler */
	action	jukebox_PLAY		/* 10 -- PLAY+ */
	image	jukebox_image
	byte	15			/* Object instance length */
	byte	 7			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_key 42 {
	sound	beep
/**/	action	generic_depends		/* do */
/**/	action	generic_throw		/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	generic_goToAndGet	/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smash		/* destroy */
	image	key_image_1
	image	key_image_2
	byte	16			/* Object instance length */
	byte	 8			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_knick_knack 43 {
	sound	beep
/**/	action	generic_doMagicIfMagic	/* do */
/**/	action	generic_throw		/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	generic_goToAndGet	/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smallExplosionIfMagic /* destroy */
	image	knick_knack_image_1
	image	knick_knack_image_2
	image	knick_knack_image_3
	image	knick_knack_image_4
	byte	15			/* Object instance length */
	byte	 7			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_knife 44 {
	sound	beep
/**/	action	generic_depends		/* do */
/**/	action	generic_strike		/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	generic_goToAndGet	/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smash		/* destroy */
	image	knife_image_1
	image	knife_image_2
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_magic_lamp 45 {
	sound	beep
/**/	action	magic_lamp_do		/* do */
/**/	action	generic_throw		/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	generic_goToAndGet	/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	magic_lamp_talk		/* talk */
	action	generic_smash		/* destroy */
/**/	action	magic_lamp_GIVEUP	/* 8 -- GIVEUP+ */
/**/	action	magic_lamp_RUB		/* 9 -- RUB* */
/**/	action	magic_lamp_WISH		/* 10 -- WISH* */
	image	magic_lamp_image
	byte	16			/* Object instance length */
	byte	 8			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_magic_staff 46 {
	sound	beep
/**/	action	generic_doMagic		/* do */
/**/	action	generic_strike		/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	generic_goToAndGet	/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smallExplosion	/* destroy */
	image	magic_staff_image
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_magic_wand 47 {
	sound	beep
/**/	action	generic_doMagic		/* do */
/**/	action	generic_strike		/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	generic_goToAndGet	/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smallExplosion	/* destroy */
	image	magic_wand_image_1
	image	magic_wand_image_2
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_mailbox 48 {
	sound	beep
/**/	action	generic_depends		/* do */
/**/	action	illegal			/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	mailbox_get		/* get */
/**/	action	generic_sendMail	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smash		/* destroy */
/**/	action	mailbox_MAILARRIVED	/* 8 -- MAILARRIVED+ */
	image	mailbox_image
	byte	15			/* Object instance length */
	byte	 7			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_matchbook 49 {
	sound	beep
/**/	action	generic_read		/* do */
/**/	action	generic_throw		/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	generic_goToAndGet	/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smash		/* destroy */
	image	missing_image
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_microphone 50 {
	sound	beep
/**/	action	generic_depends		/* do */
/**/	action	generic_throw		/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	generic_goToAndGet	/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smash		/* destroy */
	image	missing_image	/* I know Gary did this one! */
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_movie_camera 52 {
	sound	beep
/**/	action	generic_switch		/* do */
/**/	action	generic_throw		/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	generic_goToAndGet	/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smash		/* destroy */
/**/	action	generic_OFF		/* 8 -- OFF* */
/**/	action	generic_ON		/* 9 -- ON* */
	image	missing_image	/* Has this been done? */
	byte	15			/* Object instance length */
	byte	 7			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_pants 53 {
	sound	beep
/**/	action	generic_depends		/* do */
/**/	action	generic_throw		/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	generic_wearLegs	/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smashWithContents /* destroy */
/**/	action	generic_patternSwap	/* 8 -- internal pattern swap */
	image	missing_image
	byte	20 /*18*/		/* Object instance length */
	byte	 7			/* Initialization count */
	byte	 5 /* 3*/		/* Capacity */
}

class class_paper 54 {
	sound	beep
/**/	action	paper_do		/* do */
/**/	action	generic_throw		/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	generic_goToAndGet	/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smash		/* destroy */
	image	paper_image
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_parking_meter 146 {
	sound	beep
/**/	action	generic_depends		/* do */
/**/	action	illegal			/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	noEffect		/* get */
/**/	action	parking_meter_put	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smash		/* destroy */
/**/	action  parking_meter_PAY	/* 8 -- PAY* */
/**/	action	parking_meter_EXPIRE	/* 9 -- EXPIRE+ */
	image	parking_meter_image
	byte	15			/* Object instance length */
	byte	 7			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_pencil 55 {
	sound	beep
/**/	action	generic_depends		/* do */
/**/	action	generic_throw		/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	generic_goToAndGet	/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smash		/* destroy */
	image	pencil_image
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_phone_booth 56 {
	sound	beep
/**/	action	phone_booth_do		/* do */
/**/	action	illegal			/* reversed do */
	action	generic_enterOrExit	/* go */
/**/	action	generic_cease		/* stop */
/**/	action	phone_booth_get		/* get */
/**/	action	phone_booth_put		/* put */
/**/	action	phone_booth_talk	/* talk */
	action	generic_smash		/* destroy */
/**/	action	generic_ANSWER		/* 8 -- ANSWER* */
/**/	action	generic_ANSWERED	/* 9 -- ANSWERED* */
/**/	action	generic_DIAL		/* 10 -- DIAL* */
/**/	action	generic_HANG		/* 11 -- HANG* */
/**/	action	generic_HUNGUP		/* 12 -- HUNGUP* */
/**/	action	generic_RING		/* 13 -- RING* */
/**/	action	generic_SPEAK		/* 14 -- SPEAK* */
/**/	action	generic_UNHOOK		/* 15 -- UNHOOK* */
	image	phone_booth_image
	byte	17			/* Object instance length */
	byte	 9			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_picture 57 {
	sound	beep
/**/	action	generic_depends		/* do */
/**/	action	generic_throw		/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	generic_getMass		/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smash		/* destroy */
	image	missing_image
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_plant 58 {
	sound	beep
/**/	action	generic_depends		/* do */
/**/	action	generic_throw		/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	generic_getMass		/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smash		/* destroy */
	image	plant_image_1
	image	plant_image_2
	image	plant_image_3
	byte	15			/* Object instance length */
	byte	 7			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_pond 147 {
	sound	beep
/**/	action	generic_depends		/* do */
/**/	action	illegal			/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	generic_goToAndFill	/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
/**/	action	noEffect		/* destroy */
	image	missing_image
	byte	14			/* Object instance length */
	byte	 6/*??*/		/* Initialization count */
	byte	 0			/* Capacity */
}

class class_ring 60 {
	sound	beep
/**/	action	generic_doMagic		/* do */
/**/	action	generic_throw		/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
	action	generic_wear		/* get */
	action	generic_remove		/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smallExplosion	/* destroy */
	image	ring_image
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_river 148 {
	sound	beep
/**/	action	generic_depends		/* do */
/**/	action	illegal			/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	generic_goToAndFill	/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
/**/	action	noEffect		/* destroy */
	image	missing_image
	byte	14			/* Object instance length */
	byte	 6/*??*/		/* Initialization count */
	byte	 0			/* Capacity */
}

class class_road_pizza 34 {
	sound	beep
/**/	action	generic_depends		/* do */
/**/	action	generic_throw		/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	generic_goToAndGet	/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smash		/* destroy */
	image	road_pizza_image
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_rock 61 {
	sound	beep
/**/	action	generic_depends		/* do */
/**/	action	generic_throw		/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	generic_getMass		/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smash		/* destroy */
	image	rock_image_1
	image	rock_image_2
	image	rock_image_3
	byte	15			/* Object instance length */
	byte	 7			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_roof 149 {
	sound	beep
/**/	action	generic_depends		/* do */
/**/	action	illegal			/* reversed do */
/**/	action	noEffect		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	noEffect		/* get */
/**/	action	noEffect		/* put */
/**/	action	generic_broadcast	/* talk */
/**/	action	noEffect		/* destroy */
	image	missing_image
	byte	17			/* Object instance length */
	byte	 9			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_rubber_ducky 62 {
	sound	beep
/**/	action	generic_depends		/* do */
/**/	action	generic_throw		/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	generic_goToAndGet	/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smash		/* destroy */
	image	rubber_ducky_image
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_safe 150 {
	sound	beep
/**/	action	generic_adjacentOpenCloseContainer /* do */
/**/	action	illegal			/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	generic_goToAndPickFromIfOpen /* get */
/**/	action	generic_goToAndDropIntoIfOpen /* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smashWithContents /* destroy */
	image	safe_image
	byte	27 /*22*/		/* Object instance length */
	byte	 9			/* Initialization count */
	byte	10 /* 5*/		/* Capacity */
}

class class_security_device 63 {
	sound	beep
/**/	action	generic_switch		/* do */
/**/	action	generic_throw		/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	generic_goToAndGet	/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_mediumExplosion	/* destroy */
/**/	action	generic_OFF		/* 8 -- OFF* */
/**/	action	generic_ON		/* 9 -- ON* */
	image	security_device_image
	byte	15			/* Object instance length */
	byte	 7			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_sensor 64 {
	sound	beep
/**/	action	sensor_do		/* do */
/**/	action	generic_throw		/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	generic_goToAndGet	/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smash		/* destroy */
/**/	action	sensor_SCAN		/* 8 -- SCAN* */
	image	sensor_image
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_shirt 65 {
	sound	beep
/**/	action	generic_depends		/* do */
/**/	action	generic_throw		/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	generic_wearTorso	/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smash		/* destroy */
/**/	action	generic_patternSwap	/* 8 -- internal pattern swap */
	image	missing_image
	byte	16			/* Object instance length */
	byte	 8			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_sidewalk 151 {
	sound	beep
/**/	action	generic_depends		/* do */
/**/	action	illegal			/* reversed do */
/**/	action	generic_goToCursor	/* go */
/**/	action	generic_cease		/* stop */
/**/	action	noEffect		/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
/**/	action	noEffect		/* destroy */
	image	missing_image
	byte	16			/* Object instance length */
	byte	 8			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_sign 152 {
	sound	beep
/**/	action	generic_depends		/* do */
/**/	action	illegal			/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	noEffect		/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smash		/* destroy */
	image	sign_image_1
	image	sign_image_2
	image	sign_image_3
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_skateboard 67 {
	sound	beep
/**/	action	generic_depends		/* do */
/**/	action	generic_throw		/* reversed do */
	action	generic_climbInOrOut	/* go */
/**/	action	generic_cease		/* stop */
/**/	action	generic_goToAndGet	/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smash		/* destroy */
	action	generic_DRIVE*		/* 8 -- DRIVE* */
	image	skateboard_image
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_sky 69 {
	sound	beep
/**/	action	generic_depends		/* do */
/**/	action	illegal			/* reversed do */
/**/	action	sky_go			/* go */
/**/	action	generic_cease		/* stop */
/**/	action	noEffect		/* get */
/**/	action	noEffect		/* put */
/**/	action	generic_broadcast	/* talk */
/**/	action	noEffect		/* destroy */
/*	image	sky_image*/
	image	wall_image
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_stereo 70 {
	sound	beep
/**/	action	generic_switch		/* do */
/**/	action	generic_throw		/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	stereo_get		/* get */
/**/	action	stereo_put		/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smash		/* destroy */
/**/	action	illegal			/* 8 -- filler */
/**/	action	illegal			/* 9 -- filler */
	action	stereo_PLAY		/* 10 -- PLAY+ */
	image	stereo_image
	byte	15			/* Object instance length */
	byte	 8			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_street 153 {
	sound	beep
/**/	action	generic_depends		/* do */
/**/	action	illegal			/* reversed do */
/**/	action	generic_goToCursor	/* go */
/**/	action	generic_cease		/* stop */
/**/	action	noEffect		/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
/**/	action	noEffect		/* destroy */
	image	missing_image
	byte	16			/* Object instance length */
	byte	 8			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_streetlamp 154 {
	sound	beep
/**/	action	generic_depends		/* do */
/**/	action	illegal			/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	noEffect		/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
	action	streetlamp_destroy	/* destroy */
	image	streetlamp_image_1
	image	streetlamp_image_2
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_table 155 {
	sound	beep
/**/	action	generic_depends		/* do */
/**/	action	illegal			/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	generic_goToAndPickFrom	/* get */
/**/	action	generic_goToAndDropInto	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smashWithContents /* destroy */
	image	missing_image	/* Don't we have one of these? */
	byte	19 /*18*/		/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 5 /* 4*/		/* Capacity */
}

class class_tape 71 {
	sound	beep
/**/	action	generic_read		/* do */
/**/	action	generic_throw		/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	generic_goToAndGet	/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smash		/* destroy */
	image	tape_image
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_teddy_bear 72 {
	sound	beep
/**/	action	generic_depends		/* do */
/**/	action	generic_throw		/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	generic_goToAndGet	/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_mediumExplosion	/* destroy */
	image	teddy_bear_image
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_telephone 73 {
	sound	beep
/**/	action	telephone_do		/* do */
/**/	action	illegal			/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	telephone_get		/* get */
/**/	action	telephone_put		/* put */
/**/	action	telephone_talk		/* talk */
	action	generic_smash		/* destroy */
/**/	action	generic_ANSWER		/* 8 -- ANSWER* */
/**/	action	generic_ANSWERED	/* 9 -- ANSWERED* */
/**/	action	generic_DIAL		/* 10 -- DIAL* */
/**/	action	generic_HANG		/* 11 -- HANG* */
/**/	action	generic_HUNGUP		/* 12 -- HUNGUP* */
/**/	action	generic_RING		/* 13 -- RING* */
/**/	action	generic_SPEAK		/* 14 -- SPEAK* */
/**/	action	generic_UNHOOK		/* 15 -- UNHOOK* */
	image	telephone_image_1
	image	telephone_image_2
	byte	17			/* Object instance length */
	byte	 9			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_teleport_booth 74 {
	sound	beep
/**/	action	generic_depends		/* do */
/**/	action	illegal			/* reversed do */
	action	generic_enterOrExit	/* go */
/**/	action	generic_cease		/* stop */
/**/	action	noEffect		/* get */
/**/	action	teleport_put		/* put */
/**/	action	teleport_talk		/* talk */
	action	generic_mediumExplosion	/* destroy */
	action	teleport_PAY		/* 8 -- PAY* */
	action	teleport_ZAPIN		/* 9 -- ZAPIN* */
	action	teleport_ZAPTO		/* 10 -- ZAPTO* */
	action	generic_coinOp		/* 11 -- internal TELEPORT_COINOP */
/*	image	teleport_image*/
	byte	15			/* Object instance length */
	byte	 7			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_ticket 75 {
	sound	beep
/**/	action	generic_depends		/* do */
/**/	action	generic_throw		/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	generic_goToAndGet	/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smash		/* destroy */
	image	ticket_image
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_tokens 76 {
	sound	beep
/**/	action	generic_depends		/* do */
/**/	action	tokens_rdo		/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	generic_goToAndGet	/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smash		/* destroy */
	image	tokens_image
	byte	16			/* Object instance length */
	byte	 8			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_towel 77 {
	sound	beep
/**/	action	generic_depends		/* do */
/**/	action	generic_throw		/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	generic_goToAndGet	/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smash		/* destroy */
	image	towel_image
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_tree 156 {
	sound	beep
/**/	action	generic_depends		/* do */
/**/	action	illegal			/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	noEffect		/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smash		/* destroy */
	image	tree_image_1
	image	tree_image_2
	image	tree_image_3
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_walkie_talkie 79 {
	sound	beep
/**/	action	walkie_talkie_do	/* do */
/**/	action	generic_throw		/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	walkie_talkie_get	/* get */
/**/	action	walkie_talkie_put	/* put */
/**/	action	walkie_talkie_talk	/* talk */
	action	generic_smash		/* destroy */
/**/	action	generic_ANSWER		/* 8 -- ANSWER* */
/**/	action	generic_ANSWERED	/* 9 -- ANSWERED* */
/**/	action	generic_DIAL		/* 10 -- DIAL* */
/**/	action	generic_HANG		/* 11 -- HANG* */
/**/	action	generic_HUNGUP		/* 12 -- HUNGUP* */
/**/	action	generic_RING		/* 13 -- RING* */
/**/	action	generic_SPEAK		/* 14 -- SPEAK* */
/**/	action	generic_UNHOOK		/* 15 -- UNHOOK* */
	image	walkie_talkie_image
	byte	17			/* Object instance length */
	byte	 9			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_wall 80 {
	sound	beep
/**/	action	generic_depends		/* do */
/**/	action	illegal			/* reversed do */
/**/	action	wall_go			/* go */
/**/	action	generic_cease		/* stop */
/**/	action	noEffect		/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
/**/	action	noEffect		/* destroy */
	image	wall_image
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_window 157 {
	sound	beep
/**/	action	generic_depends		/* do */
/**/	action	illegal			/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	noEffect		/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_smash		/* destroy */
	image	window_image_1
	image	window_image_2
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_wind_up_toy 82 {
	sound	beep
/**/	action	windup_toy_do		/* do */
/**/	action	generic_throw		/* reversed do */
/**/	action	generic_goTo		/* go */
/**/	action	generic_cease		/* stop */
/**/	action	generic_goToAndGet	/* get */
/**/	action	generic_goToAndDropAt	/* put */
/**/	action	generic_broadcast	/* talk */
	action	generic_mediumExplosion	/* destroy */
/**/	action	windup_toy_WIND		/* 8 -- WIND* */
	image	windup_doll_image
	image	windup_penguin_image
	byte	15			/* Object instance length */
	byte	 7			/* Initialization count */
	byte	 0			/* Capacity */
}


image {

avatar_side_image:		"Gr/Av/do29.bin"

amulet_image:			"Images/amulet.bin"

answering_machine_image:	"Images/ans.bin"

aquarium_image:			"Images/ftank2.bin"	/* not complete */

atm_image:			"Images/atm.bin"

backpack_image:			"Images/bpack.bin"	/* not complete */

bag_image:			"Images/bag.bin"

ball_image:			"Images/ball1.bin"

bed_side_image:			"Images/beds.bin"
bed_front_image:		"Images/bedf.bin"
bed_back_image:			"Images/bedb.bin"

beeper_image:			"Images/beep.bin"

book_end_image:			"Images/booke.bin"	/* do we need o/c? */
book_front_image:		"Images/bookf.bin"	/* do we need o/c? */
magazine_image:			"Images/mag.bin"	/* do we need o/c? */
newspaper_image:		"Images/news.bin"	/* do we need o/c? */

boomerang_image:		"Images/brang.bin"

bottle_image:			"Images/bottle.bin"

box_image:			"Images/box1.bin"	/* needs o/c states */
treasure_chest_image:		"Images/trchest.bin"

bridge_side_image:		"Images/bridges.bin"
bridge_front_image:		"Images/bridgef.bin"

bush_image_1:			"Images/bush1.bin"
bush_image_2:			"Images/bush2.bin"

chair_front_back_image:		"Images/chairfb.bin"
chair_side_image:		"Images/chairs.bin"

chest_front_image:		"Images/chestf.bin"
chest_back_image:		"Images/chestb.bin"	/* need o/c states */
chest_side_image:		"Images/chests.bin"

club_image:			"Images/club2.bin"	/* handle use? */

coke_machine_image_1:		"Images/coke1.bin"
coke_machine_image_2:		"Images/coke2.bin"

compass_image:			"Images/compass.bin"

couch_front_back_image:		"Images/couchfb.bin"
couch_side_image:		"Images/couchs.bin"

countertop_image:		"Images/counter.bin"	

credit_card_image:		"Images/ccard.bin"

display_case_image:		"Images/dcase.bin"

door_image_1:			"Images/door1.bin"
door_image_2:			"Images/door2.bin"

dropbox_image:			"Images/mdrop.bin"

drugs_image:			"Images/pillbot.bin"

escape_device_image:		"Images/escaper.bin"

fake_gun_image:			"Images/fgun1.bin"

fare_box_image:			"Images/fare.bin"

fence_image:			"Images/fence1.bin"

flag_image:			"Images/flag.bin" /* need still states */

flashlight_image:		"Images/flite.bin"

floor_lamp_image:		"Images/flamp.bin"

fortune_machine_image:		"Images/fortun.bin"

fountain_image:			"Images/fount2.bin"

frisbee_image:			"Images/fris.bin"

garbage_can_image:		"Images/gcan.bin"
kitchen_garbage_image:		"Images/kcan.bin"

gemstone_image:			"Images/gem.bin"

grenade_image:			"Images/gren.bin"

ground_image:			"Images/floor.bin"

gun_image_1:			"Images/gun1.bin"
gun_image_2:			"Images/gun2.bin"
gun_image_3:			"Images/gun3.bin"
mauser_image:			"Images/maus.bin"

hand_of_god_image:		"Images/hand.bin"
cinder_image:			"Images/cinder.bin"

house_cat_image:		"Images/cat.bin"

hot_tub_image:			"Images/hottub.bin"

instant_object_pill_image:	"Images/mpill.bin"

jukebox_image:			"Images/juke.bin"

key_image_1:			"Images/key1.bin"
key_image_2:			"Images/key2.bin"

knick_knack_image_1:		"Images/kk1.bin"
knick_knack_image_2:		"Images/kk2.bin"
knick_knack_image_3:		"Images/kk3.bin"
knick_knack_image_4:		"Images/vase.bin"

knife_image_1:			"Images/knife1.bin"
knife_image_2:			"Images/knife2.bin"

magic_lamp_image:		"Images/mlamp2.bin"	/* define states! */

magic_staff_image:		"Images/mstaff.bin"

magic_wand_image_1:		"Images/wand1.bin"
magic_wand_image_2:		"Images/wand2.bin"

mailbox_image:			"Images/mbox.bin"

paper_image:			"Images/paper.bin"

parking_meter_image:		"Images/meter.bin"	/* define states */

pencil_image:			"Images/pencil.bin"

phone_booth_image:		"Images/phoneb5.bin"

plant_image_1:			"Images/plant1.bin"
plant_image_2:			"Images/plant2.bin"
plant_image_3:			"Images/plant3.bin"

ring_image:			"Images/mring.bin"	/* incomplete?*/

road_pizza_image:		"Images/flat.bin"

rock_image_1:			"Images/rock1.bin"
rock_image_2:			"Images/rock2.bin"
rock_image_3:			"Images/rock3.bin"

rubber_ducky_image:		"Images/rduk.bin"

safe_image:			"Images/safe1.bin"

security_device_image:		"Images/security.bin"

sensor_image:			"Images/sensor.bin"

sign_image_1:			"Images/sign.bin"
sign_image_2:			"Images/exit.bin"
sign_image_3:			"Images/poster.bin"

skateboard_image:		"Images/sboard.bin"

sky_image:			"Images/sky.bin"

stereo_image:			"Images/tapep.bin"

streetlamp_image_1:		"Images/slite1.bin"
streetlamp_image_2:		"Images/slite2.bin"

tape_image:			"Images/cassette.bin"

teddy_bear_image:		"Images/tbear.bin"

telephone_image_1:		"Images/phone1.bin"
telephone_image_2:		"Images/phone2.bin"

teleport_image:			"Images/port7.bin"

ticket_image:			"Images/ticket.bin"

tokens_image:			"Images/tok.bin"

towel_image:			"Images/towel.bin"

tree_image_1:			"Images/tree1.bin"
tree_image_2:			"Images/tree2.bin"
tree_image_3:			"Images/palm2.bin"

walkie_talkie_image:		"Images/walky.bin"

wall_image:			"Images/bwall.bin"

window_image_1:			"Images/window1.bin"
window_image_2:			"Images/window3.bin"

windup_doll_image:		"Images/doll.bin"
windup_penguin_image:		"Images/peng.bin"

missing_image:			"Images/undefined.bin"
}

action {

avatar_do:		"avatar_do.bin"
avatar_go:		"avatar_go.bin"
avatar_get:		"avatar_get.bin"
avatar_put:		"avatar_put.bin"
avatar_talk:		"avatar_talk.bin"
avatar_destroy:		"unimplemented.bin"
avatar_WALK:		"avatar_WALK.bin"
avatar_ATTACK:		"avatar_ATTACK.bin"
avatar_BASH:		"avatar_BASH.bin"
avatar_BUGOUT:		"avatar_BUGOUT.bin"
avatar_CLOSE:		"avatar_CLOSE.bin"
avatar_CLOSECONTAINER:	"avatar_CLOSECONTAINER.bin"
avatar_GETM:		"avatar_GET.bin"
avatar_GRAB:		"avatar_GRAB.bin"
avatar_GRABFROM:	"avatar_GRABFROM.bin"
avatar_OPEN:		"avatar_OPEN.bin"
avatar_OPENCONTAINER:	"avatar_OPENCONTAINER.bin"
avatar_POSTURE:		"avatar_POSTURE.bin"
/*avatar_POUR:		"avatar_POUR.bin"*/
avatar_POUR:		"unimplemented.bin"
avatar_PUTM:		"avatar_PUT.bin"
avatar_TAKE:		"avatar_TAKE.bin"
avatar_THROW:		"avatar_THROW.bin"
/*avatar_LOAD:		"avatar_LOAD.bin"*/
avatar_LOAD:		"unimplemented.bin"
/*avatar_UNLOAD:	"avatar_UNLOAD.bin"*/
avatar_UNLOAD:		"unimplemented.bin"
/*avatar_FILL:		"avatar_FILL.bin"*/
avatar_FILL:		"unimplemented.bin"
avatar_WEAR:		"avatar_WEAR.bin"
avatar_REMOVE:		"avatar_REMOVE.bin"
avatar_PAID:		"avatar_PAID.bin"

region_HEREIS:		"unimplemented.bin"

answering_machine_do:	"answering_machine_do.bin"
answering_machine_talk:	"answering_machine_talk.bin"
answering_machine_TAKEMESSAGE:"answering_machine_TAKEMESSAGE.bin"

aquarium_do:		"aquarium_do.bin"

atm_do:			"atm_do.bin"
atm_get:		"atm_get.bin"
atm_put:		"atm_put.bin"

bed_do:			"unimplemented.bin"

beeper_do:		"beeper_do.bin"
beeper_BEEP:		"beeper_BEEP.bin"

book_do:		"book_do.bin"

boomerang_rdo:		"boomerang_rdo.bin"
boomerang_THROWAWAY:	"boomerang_THROWAWAY.bin"

bottle_rdo:		"bottle_rdo.bin"

coke_machine_put:	"coke_machine_put.bin"
coke_machine_PAY:	"coke_machine_PAY.bin"

credit_card_rdo:	"credit_card_rdo.bin"

die_do:			"die_do.bin"
die_ROLL:		"die_ROLL.bin"

drugs_do:		"drugs_do.bin"

escape_device_do:	"escape_device_do.bin"

fake_gun_do:		"fake_gun_do.bin"
fake_gun_rdo:		"fake_gun_rdo.bin"
fake_gun_FAKESHOOT:	"fake_gun_FAKESHOOT.bin"
fake_gun_RESET:		"fake_gun_RESET.bin"

fare_box_do:		"fare_box_do.bin"
fare_box_put:		"fare_box_put.bin"
fare_box_PAY:		"fare_box_PAY.bin"
fare_box_ARRIVAL:	"fare_box_ARRIVAL.bin"
fare_box_DEPARTING:	"fare_box_DEPARTING.bin"
fare_box_DEPARTURE:	"fare_box_DEPARTURE.bin"

flashlight_do:		"flashlight_do.bin"

floor_lamp_do:		"floor_lamp_do.bin"

fortune_machine_put:	"fortune_machine_put.bin"

garbage_can_do:		"garbage_can_do.bin"
garbage_can_FLUSH:	"garbage_can_FLUSH.bin"

grenade_do:		"grenade_do.bin"
grenade_EXPLODE:	"grenade_EXPLODE.bin"

gun_do:			"gun_do.bin"

hand_of_god_BLAST:	"hand_of_god_BLAST.bin"

instant_object_TRANSFORM: "instant_object_TRANSFORM.bin"

jukebox_do:		"jukebox_do.bin"
jukebox_put:		"jukebox_put.bin"
jukebox_talk:		"jukebox_talk.bin"
jukebox_PLAY:		"unimplemented.bin"

magic_lamp_do:		"magic_lamp_do.bin"
magic_lamp_talk:	"magic_lamp_talk.bin"
magic_lamp_GIVEUP:	"magic_lamp_GIVEUP.bin"
magic_lamp_RUB:		"magic_lamp_RUB.bin"
magic_lamp_WISH:	"magic_lamp_WISH.bin"

mailbox_get:		"mailbox_get.bin"
mailbox_MAILARRIVED:	"mailbox_MAILARRIVED.bin"

paper_do:		"paper_do.bin"

parking_meter_put:	"parking_meter_put.bin"
parking_meter_PAY:	"parking_meter_PAY.bin"
parking_meter_EXPIRE:	"parking_meter_EXPIRE.bin"

phone_booth_do:		"phone_booth_do.bin"
phone_booth_get:	"phone_booth_get.bin"
phone_booth_put:	"phone_booth_put.bin"
phone_booth_talk:	"phone_booth_talk.bin"

sensor_do:		"sensor_do.bin"
sensor_SCAN:		"sensor_SCAN.bin"

sky_go:			"sky_go.bin"

stereo_get:		"stereo_get.bin"
stereo_put:		"stereo_put.bin"
stereo_PLAY:		"unimplemented.bin"

streetlamp_destroy:	"unimplemented.bin"

telephone_do:		"telephone_do.bin"
telephone_get:		"telephone_get.bin"
telephone_put:		"telephone_put.bin"
telephone_talk:		"telephone_talk.bin"

teleport_put:		"teleport_put.bin"
teleport_talk:		"teleport_talk.bin"
teleport_PAY:		"unimplemented.bin"
teleport_ZAPIN:		"unimplemented.bin"
teleport_ZAPTO:		"unimplemented.bin"

tokens_rdo:		"tokens_rdo.bin"

walkie_talkie_do:	"walkie_talkie_do.bin"
walkie_talkie_get:	"walkie_talkie_get.bin"
walkie_talkie_put:	"walkie_talkie_put.bin"
walkie_talkie_talk:	"walkie_talkie_talk.bin"

wall_go:		"wall_go.bin"

windup_toy_do:		"windup_toy_do.bin"
windup_toy_WIND:	"windup_toy_WIND.bin"

generic_adjacentOpenClose: "generic_adjacentOpenClose.bin"
generic_adjacentOpenCloseContainer: "generic_adjacentOpenCloseContainer.bin"
generic_askOracle:	"generic_askOracle.bin"
generic_broadcast:	"generic_broadcast.bin"
generic_cease:		"generic_cease.bin"
generic_climbInOrOut:	"unimplemented.bin"
generic_depends:	"generic_depends.bin"
generic_doMagic:	"generic_doMagic.bin"
generic_doMagicIfMagic:	"generic_doMagicIfMagic.bin"
generic_enterOrExit:	"unimplemented.bin"
generic_getMass:	"generic_getMass.bin"
generic_goTo:		"generic_goTo.bin"
generic_goToAndDropAt:	"generic_goToAndDropAt.bin"
generic_goToAndDropInto:"generic_goToAndDropInto.bin"
generic_goToAndDropIntoIfOpen: "generic_goToAndDropIntoIfOpen.bin"
generic_goToAndFill:	"generic_goToAndFill.bin"
generic_goToAndGet:	"generic_goToAndGet.bin"
generic_goToAndPickFrom:"generic_goToAndPickFrom.bin"
generic_goToAndPickFromIfOpen: "generic_goToAndPickFromIfOpen.bin"
generic_goToAndPickFromOrGet: "generic_goToAndPickFromOrGet.bin"
generic_goToCursor:	"generic_goToCursor.bin"
generic_goToOrPassThrough: "generic_goToOrPassThrough.bin"
generic_mediumExplosion:"unimplemented.bin"
generic_read:		"generic_read.bin"
generic_remove:		"unimplemented.bin"
generic_sendMail:	"generic_sendMail.bin"
generic_shoot:		"generic_shoot.bin"
generic_sitOrGetUp:	"unimplemented.bin"
generic_smallExplosion:	"unimplemented.bin"
generic_smallExplosionIfMagic: "unimplemented.bin"
generic_smash:		"unimplemented.bin"
generic_smashWithContents: "unimplemented.bin"
generic_strike:		"generic_strike.bin"
generic_switch:		"generic_switch.bin"
generic_throw:		"generic_throw.bin"
generic_wear:		"unimplemented.bin"
generic_wearOrUnpocket:	"unimplemented.bin"
generic_wearLegs:	"generic_wearLegs.bin"
generic_wearTorso:	"generic_wearTorso.bin"

generic_ANSWER:		"generic_ANSWER.bin"
generic_ANSWERED:	"generic_ANSWERED.bin"
generic_CHANGESTATE:	"generic_CHANGESTATE.bin"
generic_DIAL:		"generic_DIAL.bin"
generic_DRIVE:		"unimplemented.bin"
generic_HANG:		"generic_HANG.bin"
generic_HUNGUP:		"generic_HUNGUP.bin"
generic_OFF:		"generic_OFF.bin"
generic_OFFLIGHT:	"generic_OFFLIGHT.bin"
generic_ON:		"generic_ON.bin"
generic_ONLIGHT:	"generic_ONLIGHT.bin"
generic_RING:		"generic_RING.bin"
generic_SPEAK:		"generic_SPEAK.bin"
generic_UNHOOK:		"generic_UNHOOK.bin"

generic_coinOp:		"generic_coinOp.bin"
generic_patternSwap:	"generic_patternSwap.bin"

illegal:		"illegal.bin"
noEffect:		"noEffect.bin"

}

sound {
beep:		"Sounds/beep.bin"
click:		"Sounds/click.bin"
boing:		"Sounds/boing.bin"
bang:		"Sounds/bang.bin"
}
