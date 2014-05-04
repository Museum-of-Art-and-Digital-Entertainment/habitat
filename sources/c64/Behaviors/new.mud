/*
	beta.mud

	Master muddle file for MicroCosm Beta release.

	Chip Morningstar
	Lucasfilm Ltd.
	4-May-1986

	Adapted from earlier versions by Aric Wilmunder & Randy Farmer
*/

class class_region 0 {
	sound	error_beep
	sound	region_boing
	sound	footsteps
	sound	teleport_region_change_0
	sound	teleport_region_change_0_pw
	sound	teleport_region_change_1
	sound	teleport_region_change_1_pw
	sound	teleport_region_change_2
	sound	teleport_arrival
	sound	teleport_arrival_pw
	sound	region_change_music_v0
	sound	region_change_music_v1
	sound	region_change_music_v2
	action	illegal			/* do */
	action	illegal			/* reversed do */
	action	GoToNewRegion		/* go */
	action	generic_cease		/* stop */
	action	illegal			/* get */
	action	illegal			/* put */
	action	generic_broadcast	/* talk */
	action	illegal			/* destroy */
	action	transit_region		/* 8 */
	action	ask_for_help		/* 9 */
	byte	 6			/* Object instance length */
	byte	 0			/* Initalization count */
	byte	 0			/* Capacity */
}

class class_avatar 1 {
	sound	avatar_injured
	sound	avatar_injured_pw
	sound	avatar_killed
	sound	avatar_killed_pw
	sound	avatar_into_stone
	sound	avatar_out_of_stone
	sound	successful_esp_activation
	sound	message_sent
	sound	message_received
	sound	failed_esp_activation
	sound	clothes_donned
	sound	clothes_doffed
	action	avatar_do		/* do */
	action	noEffect		/* reversed do */
	action	avatar_go		/* go */
	action	generic_cease		/* stop */
	action	avatar_get		/* get */
	action	avatar_put		/* put */
	action	avatar_talk		/* talk */
	action	generic_destroy		/* destroy */
	action  avatar_WALK		/* 8 -- WALK* */
	action	avatar_ATTACK		/* 9 -- ATTACK* */
	action	avatar_BASH		/* 10 -- BASH* */
	action	avatar_DIE		/* 11 -- DIE* */
	action	avatar_CLOSE		/* 12 -- CLOSE* */
	action	avatar_CLOSECONTAINER	/* 13 -- CLOSECONTAINER* */
	action	generic_SPEAK		/* 14 -- SPEAK* */
	action	avatar_GETM		/* 15 -- GET* */
	action	avatar_SITORGETUP	/* 16 -- SITORGETUP* */
	action	avatar_GRABFROM		/* 17 -- GRABFROM* */
	action	avatar_OPEN		/* 18 -- OPEN* */
	action	avatar_OPENCONTAINER	/* 19 -- OPENCONTAINER* */
	action	avatar_POSTURE		/* 20 -- POSTURE* */
	action	noEffect
	action	avatar_PUTM		/* 22 -- PUT* */
	action	avatar_REINCARNATE	/* 23 -- REINCARNATE* */
	action	avatar_THROW		/* 24 -- THROW* */
	action	noEffect
	action	noEffect
	action	noEffect
	action	avatar_WEAR		/* 28 -- WEAR* */
	action	avatar_REMOVE		/* 29 -- REMOVE* */
	action	avatar_PAID		/* 30 -- PAID* */
 	image	avatar_side_image
	byte	142			/* Object instance length */
	byte	140			/* 128+12 Initialization count */
	byte	  7			/* Capacity */
}

class class_head 127 {
	action	head_do			/* do */
	action	generic_throw		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	head_get		/* get */
	action	generic_goToAndDropAt	/* put */
	action	head_talk		/* talk */
	action	generic_destroy		/* destroy */
	action	generic_goToAndDropAt	/* 8 -- internal */
	image	head_placeholder_1
	image	head_placeholder_1
	image	head_placeholder_2
	image	head_placeholder_3
	image	head_placeholder_4
	image	head_placeholder_5
	image	head_placeholder_6
	image	head_placeholder_7
	image	head_placeholder_8
	image	head_placeholder_9
	image	head_placeholder_10
	image	head_placeholder_11
	image	head_placeholder_12
	image	head_placeholder_13
	image	head_placeholder_14
	image	head_placeholder_15
	head	head_image_reserved
	head	head_image_0
	head	head_image_1
	head	head_image_2
	head	head_image_3
	head	head_image_4
	head	head_image_5
	head	head_image_6
	head	head_image_7
	head	head_image_8
	head	head_image_9
	head	head_image_10
	head	head_image_11
	head	head_image_12
	head	head_image_13
	head	head_image_14
	head	head_image_15
	head	head_image_16
	head	head_image_17
	head	head_image_18
	head	head_image_19
	head	head_image_20
	head	head_image_21
	head	head_image_22
	head	head_image_23
	head	head_image_24
	head	head_image_25
	head	head_image_26
	head	head_image_27
	head	head_image_28
	head	head_image_29
	head	head_image_30
	head	head_image_31
	head	head_image_32
	head	head_image_33
	head	head_image_34
	head	head_image_35
	head	head_image_36
	head	head_image_37
	head	head_image_38
	head	head_image_39
	head	head_image_40
	head	head_image_41
	head	head_image_42
	head	head_image_43
	head	head_image_44
	head	head_image_45
	head	head_image_46
	head	head_image_47
	head	head_image_48
	head	head_image_49
	head	head_image_50
	head	head_image_51
	head	head_image_52
	head	head_image_53
	head	head_image_54
	head	head_image_55
	head	head_image_56
	head	head_image_57
	head	head_image_58
	head	head_image_59
	head	head_image_60
	head	head_image_61
	head	head_image_62
	head	head_image_63
	head	head_image_64
	head	head_image_65
	head	head_image_66
	head	head_image_67
	head	head_image_68
	head	head_image_69
	head	head_image_70
	head	head_image_71
	head	head_image_72
	head	head_image_73
	head	head_image_74
	head	head_image_75
	head	head_image_76
	head	head_image_77
	head	head_image_78
	head	head_image_79
	head	head_image_80
	head	head_image_81
	head	head_image_82
	head	head_image_83
	head	head_image_84
	head	head_image_85
	head	head_image_86
	head	head_image_87
	head	head_image_88
	head	head_image_89
	head	head_image_90
	head	head_image_91
	head	head_image_92
	head	head_image_93
	head	head_image_94
	head	head_image_95
	head	head_image_96
	head	head_image_97
	head	head_image_98
	head	head_image_99
	head	head_image_100
	head	head_image_101
	head	head_image_102
	head	head_image_103
	head	head_image_104
	head	head_image_105
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_amulet 2 {
	sound	magic
	sound	magic_pw
	action	generic_doMagic		/* do */
	action	generic_throw		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndGet	/* get */
	action	generic_goToAndDropAt		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	amulet_image
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_aquarium 129 {
	action	generic_depends		/* do */
	action	generic_throw		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndGet	/* get */
	action	generic_goToAndDropAt	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	action	generic_CHANGESTATE	/* 8 -- CHANGESTATE* */
	image	aquarium_image
	byte	15			/* Object instance length */
	byte	 7			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_atm 4 {
	sound	money_into_atm
	sound	money_into_atm_pw
	sound	money_out_of_atm
	sound	money_out_of_atm_pw
	sound	atm_thinking
	action	atm_do			/* do */
	action	illegal			/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	atm_get			/* get */
	action	atm_put			/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	atm_image
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_bag 6 {
	sound	bag_opening
	sound	bag_closing
	action	generic_adjacentOpenCloseContainer /* do */
	action	generic_depends		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndPickFromOrGet /* get */
	action	generic_goToAndDropIntoIfOpen /* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	bag_image
	image	luggage_side_image
	byte	22			/* Object instance length */
	byte	137			/* 128+9 Initialization count */
	byte	 5			/* Capacity */
}

class class_ball 7 {
	action	generic_depends		/* do */
	action	generic_throw		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndGet	/* get */
	action	generic_goToAndDropAt	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	ball_image
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_bed 130 {
	action	generic_depends		/* do */
	action	illegal			/* reversed do */
	action	generic_goToFurniture	/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndPickFrom	/* get */
	action	generic_goToAndDropInto	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	bed_side_image
	byte	15			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 1			/* Capacity */
}

class class_book 10 {
	action	book_do			/* do */
	action	generic_throw		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndGet	/* get */
	action	generic_goToAndDropAt	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	book_end_image
	image	book_front_image
	image	magazine_image
	image	newspaper_image
	image	paper_image
	image	knick_knack_image_1
	image	bottle_image
	byte	15			/* Object instance length */
	byte	 7			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_boomerang 11 {
	action	generic_depends		/* do */
	action	generic_throw		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndGet	/* get */
	action	generic_goToAndDropAt	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	boomerang_image
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_bottle 12 {
	action	generic_depends		/* do */
	action	bottle_rdo		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndGet	/* get */
	action	generic_goToAndDropAt	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	action	bottle_FILL		/* 8 */
	action	bottle_POUR		/* 9 */
	image	bottle_image
	byte	15			/* Object instance length */
	byte	 7			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_box 13 {
	sound	box_opening
	sound	box_closing
	action	generic_adjacentOpenCloseContainer /* do */
	action	generic_throw		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndPickFromOrGet /* get */
	action	generic_goToAndDropIntoIfOpen /* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	box_image
	image	treasure_chest_image
	byte	27			/* Object instance length */
	byte	137			/* 128+9 Initialization count */
	byte	10			/* Capacity */
}

class class_bridge 131 {
	action	generic_depends		/* do */
	action	illegal			/* reversed do */
	action	generic_goToCursor	/* go */
	action	generic_cease		/* stop */
	action	noEffect		/* get */
	action	generic_goToAndDropAt	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	bridge_side_image
	image	bridge_front_image
	byte	16			/* Object instance length */
	byte	 8			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_building 132 {
	action	generic_depends		/* do */
	action	illegal			/* reversed do */
	action	sky_go			/* go */
	action	generic_cease		/* stop */
	action	noEffect		/* get */
	action	noEffect		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	house_image
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_bush 133 {
	action	generic_depends		/* do */
	action	illegal			/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	noEffect		/* get */
	action	generic_goToAndDropAt	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	bush_image_0
	image	bush_image_1
	image	bush_image_2
	image	bush_image_3
	image	bush_image_4
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_chair 134 {
	action	generic_depends		/* do */
	action	illegal			/* reversed do */
	action	generic_goToFurniture	/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndPickFrom	/* get */
	action	generic_goToAndDropInto	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	chair_front_back_image	/* front */
	image	chair_side_image	/* side */
	image	bar_stool_image		/* front */
	image	bar_stool_image		/* side */
	image	chair_front_back_image	/* front */
	image	couch_side_image	/* side */
	byte	15			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 1			/* Capacity */
}

class class_changomatic 84 {
	sound	changomatic
	action	generic_depends		/* do */
	action	changomatic_rdo		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndGet	/* get */
	action	generic_goToAndDropAt	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	action	changomatic_CHANGE	/* 8 -- CHANGE* */
	image	changomatic_image
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_chest 135 {
	sound	chest_of_drawers_opening
	sound	chest_of_drawers_closing
	action	generic_adjacentOpenCloseContainer /* do */
	action	illegal			/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndPickFromIfOpen /* get */
	action	generic_goToAndDropIntoIfOpen /* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	chest_front_image
	image	chest_back_image
	image	chest_side_image
	byte	37			/* Object instance length */
	byte	137			/* 128+9 Initialization count */
	byte	20			/* Capacity */
}

class class_club 16 {
	action	generic_depends		/* do */
	action	generic_strike		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndGet	/* get */
	action	generic_goToAndDropAt	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	club_image
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_coke_machine 136 {
	sound	coin_accepted_by_coinop
	sound	coin_accepted_by_coinop_pw
	sound	coin_deposited_in_coinop
	sound	coin_deposited_in_coinop_pw
	sound	coin_rejected_by_coinop
	sound	coin_rejected_by_coinop_pw
	sound	stingy_coke_machine
	sound	stingy_coke_machine_pw
	action	generic_depends		/* do */
	action	illegal			/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	noEffect		/* get */
	action	coke_machine_put	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	action	generic_PAY		/* 8 -- PAY* */
	action	generic_coinOp		/* 9 -- internal COKE_COINOP */
	image	coke_machine_image_1
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_compass 17 {
	action	generic_depends		/* do */
	action	generic_throw		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndGet	/* get */
	action	generic_goToAndDropAt	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	compass_image
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_couch 137 {
	action	generic_depends		/* do */
	action	illegal			/* reversed do */
	action	generic_goToFurniture	/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndPickFrom	/* get */
	action	generic_goToAndDropInto	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	couch_front_back_image
	image	couch_front_back_image
	byte	16			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 2			/* Capacity */
}

class class_countertop 18 {
	action	generic_depends		/* do */
	action	illegal			/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndPickFrom	/* get */
	action	generic_goToAndDropInto	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	countertop_image
	byte	22 /*21*/		/* Object instance length */
	byte	 9			/* Initialization count */
	byte	 5 /* 4*/		/* Capacity */
}

class class_crystal_ball 20 {
	sound	crystal_ball
	sound	crystal_ball_pw
	action	generic_depends		/* do */
	action	generic_throw		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndGet	/* get */
	action	generic_goToAndDropAt	/* put */
	action	generic_askOracle	/* talk */
	action	generic_destroy		/* destroy */
	action	generic_SPEAK		/* 8 -- ORACLESPEAK+ */
	image	crystal_ball_image
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_display_case 22 {
	action	generic_depends		/* do */
	action	illegal			/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndPickFrom	/* get */
	action	generic_goToAndDropInto	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	display_case_image
	byte	22 /*21*/		/* Object instance length */
	byte	 9			/* Initialization count */
	byte	 5 /* 4*/		/* Capacity */
}

class class_door 23 {
	sound	door_opening
	sound	door_closing
	action	generic_adjacentOpenClose /* do */
	action	illegal			/* reversed do */
	action	generic_goToOrPassThrough /* go */
	action	generic_cease		/* stop */
	action	noEffect		/* get */
	action	generic_goToAndDropAt	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	door_image_0
	image	door_image_1
	byte	17			/* Object instance length */
	byte	 9			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_dropbox 24 {
	sound	mail_into_mailbox
	sound	mail_into_mailbox_pw
	action	generic_depends		/* do */
	action	illegal			/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	noEffect		/* get */
	action	generic_sendMail	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	dropbox_image
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_drugs 25 {
	action	drugs_do		/* do */
	action	generic_throw		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndGet	/* get */
	action	generic_goToAndDropAt	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	action	drugs_TAKE		/* 8 */
	image	drugs_image
	byte	15			/* Object instance length */
	byte	 7			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_escape_device 26 {
	sound	escape_device_activates
	sound	escape_device_used_up
	action	escape_device_do	/* do */
	action	generic_throw		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndGet	/* get */
	action	generic_goToAndDropAt	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	action	escape_device_BUGOUT	/* 8 */
	image	escape_device_image
	byte	15			/* Object instance length */
	byte	 7			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_fake_gun 27 {
	sound	gun_safety_on
	sound	gun_safety_off
	sound	joke_gunshot
	sound	joke_gunshot_pw
	action	fake_gun_do		/* do */
	action	fake_gun_rdo		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndGet	/* get */
	action	generic_goToAndDropAt	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	action	fake_gun_FAKESHOOT	/* 8 -- FAKESHOOT* */
	action	fake_gun_RESET		/* 9 -- RESET* */
	image	fake_gun_image
	byte	16			/* Object instance length */
	byte	 7			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_fence 138 {
	action	generic_depends		/* do */
	action	illegal			/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	noEffect		/* get */
	action	generic_goToAndDropAt	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	fence_image
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_flag 29 {
	action	generic_depends		/* do */
	action	generic_throw		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndGet	/* get */
	action	generic_goToAndDropAt	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	action	generic_CHANGESTATE	/* 8 -- CHANGESTATE+ */
	image	flag_image
	byte	15			/* Object instance length */
	byte	 7			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_flashlight 30 {
	sound	switch_click
	action	flashlight_do		/* do */
	action	generic_throw		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndGet	/* get */
	action	generic_goToAndDropAt	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	action	generic_OFFLIGHT	/* 8 -- OFFLIGHT* */
	action	generic_ONLIGHT		/* 9 -- ONLIGHT* */
	image	flashlight_image
	image	torch_image
	image	knick_knack_image_0
	byte	15			/* Object instance length */
	byte	 7			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_floor_lamp 139 {
	sound	switch_click
	action	floor_lamp_do		/* do */
	action	illegal			/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	noEffect		/* get */
	action	generic_goToAndDropAt	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	action	generic_OFFLIGHT	/* 8 -- OFFLIGHT* */
	action	generic_ONLIGHT		/* 9 -- ONLIGHT* */
	image	floor_lamp_image
	byte	15			/* Object instance length */
	byte	 7			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_fortune_machine 140 {
	sound	coin_accepted_by_coinop
	sound	coin_accepted_by_coinop_pw
	sound	coin_deposited_in_coinop
	sound	coin_deposited_in_coinop_pw
	sound	coin_rejected_by_coinop
	sound	coin_rejected_by_coinop_pw
	sound	fortune_dispensed
	sound	fortune_dispensed_pw
	sound	parking_meter_crank
	sound	parking_meter_crank_pw
	action	generic_depends		/* do */
	action	illegal			/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	noEffect		/* get */
	action	fortune_machine_put	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	action	generic_SPEAK		/* 8 -- SPEAKFORTUNE */
	action	generic_coinOp		/* 9 -- internal COINOP */
	action	generic_PAY		/* 10 */
	image	fortune_machine_image
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_fountain 141 {
	action	generic_depends		/* do */
	action	illegal			/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndFill	/* get */
	action	generic_goToAndDropAt	/* put */
	action	generic_askOracle	/* talk */
	action	generic_destroy		/* destroy */
	action	generic_SPEAK		/* 8 -- ORACLESPEAK+ */
	image	fountain_image
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_frisbee 31 {
	action	generic_depends		/* do */
	action	generic_throw		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndGet	/* get */
	action	generic_goToAndDropAt	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	frisbee_image
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_garbage_can 32 {
	sound	garbage_can_flushing
	action	garbage_can_do		/* do */
	action	illegal			/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndPickFrom	/* get */
	action	generic_goToAndDropInto	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	action	garbage_can_FLUSH	/* 8 -- FLUSH* */
	image	garbage_can_image
	image	kitchen_garbage_image
	byte	37 /*27*/		/* Object instance length */
	byte	 9			/* Initialization count */
	byte	20 /*10*/		/* Capacity */
}

class class_gemstone 33 {
	sound	magic_2
	sound	magic_2_pw
	action	generic_doMagicIfMagic	/* do */
	action	generic_throw		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndGet	/* get */
	action	generic_goToAndDropAt	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	gemstone_image
	byte	15			/* Object instance length */
	byte	 7			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_grenade 35 {
	sound	big_explosion
	sound	big_explosion_pw
	action	grenade_do		/* do */
	action	generic_throw		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndGet	/* get */
	action	generic_goToAndDropAt	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	action	grenade_EXPLODE		/* 8 -- EXPLODE+ */
	image	grenade_image
	byte	15			/* Object instance length */
	byte	 7			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_ground 36 {
	action	generic_depends		/* do */
	action	illegal			/* reversed do */
	action	generic_goToCursor	/* go */
	action	generic_cease		/* stop */
	action	noEffect		/* get */
	action	generic_goToAndDropAt	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	ground_image_0
	image	ground_image_1
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_gun 37 {
	sound	gun_safety_on
	sound	gun_safety_off
	sound	gunshot
	action	gun_do			/* do */
	action	generic_shoot		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndGet	/* get */
	action	generic_goToAndDropAt	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	gun_image_0
	image	gun_image_1
	image	gun_image_2
	image	mauser_image
	byte	15			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_hand_of_god 38 {
	sound	hand_o_god_flame
	sound	hand_o_god_lightning
	sound	hand_o_god_lightning_pw
	action	generic_depends		/* do */
	action	illegal			/* reversed do */
	action	illegal			/* go */
	action	illegal			/* stop */
	action	illegal			/* get */
	action	illegal			/* put */
	action	illegal			/* talk */
	action	generic_destroy		/* destroy */
	action	hand_of_god_BLAST	/* 8 -- BLAST* */
	image	hand_of_god_image
	image	cinder_image
	byte	15			/* Object instance length */
	byte	 7			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_hat 39 {
	action	generic_depends		/* do */
	action	generic_throw		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndGet	/* get */
	action	generic_goToAndDropAt		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	missing_image
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_hole 88 {
	sound	box_opening
	sound	box_closing
	action	hole_do			/* do */
	action	illegal			/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndPickFromIfOpen /* get */
	action	generic_goToAndDropIntoIfOpen /* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	action	generic_adjacentOpenCloseContainer /* 8 -- internal */
	image	hole_image
	byte	27			/* Object instance length */
	byte	137			/* 128+9 Initialization count */
	byte	10			/* Capacity */
}

class class_house_cat 143 {
	action	generic_depends		/* do */
	action	illegal			/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	noEffect		/* get */
	action	generic_goToAndDropAt	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	house_cat_image
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_hot_tub 144 {
	action	generic_depends		/* do */
	action	illegal			/* reversed do */
	action	generic_goToCursor	/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndFill	/* get */
	action	illegal			/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	hot_tub_image
	byte	20			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 6			/* Capacity */
}

class class_flat 93 {
	action	noEffect		/* do */
	action	illegal			/* reversed do */
	action	trap_go			/* go */
	action	generic_cease		/* stop */
	action	noEffect		/* get */
	action	noEffect		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	action	sky_go			/* 8 - internal */
	action	wall_go			/* 9 - internal */
	action	generic_goToCursor	/* 10 - internal */
	action	noEffect		/* 11 - internal */
	image	ground_image_0
	image	ground_image_1
	image	sky_image_2
	image	sky_image_3
	image	sky_image_4
	image	sky_image_5
	image	sky_image_6
	image	sky_image_7
	image	mountain_image_0
	image	cave_image_0
	image	ball_image
	image	tree_image_9
	byte	15			/* Object instance length */
	byte	 7			/* Initialization count */
	byte	 0			/* Capacity */
}


class class_instant_object_pill 40 {
	sound	instant_object_pill
	action	generic_depends		/* do */
	action	generic_throw		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndGet	/* get */
	action	generic_goToAndDropAt	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	action	instant_object_TRANSFORM /* 8 -- TRANSFORM* */
	image	instant_object_pill_image
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_jukebox 145 {
	action	jukebox_do		/* do */
	action	illegal			/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	noEffect		/* get */
	action	jukebox_put		/* put */
	action	jukebox_talk		/* talk */
	action	generic_destroy		/* destroy */
	action	generic_PAY		/* 8 */
	action	jukebox_PLAY		/* 9 -- PLAY+ */
	action	generic_coinOp		/* 10 -- internal JUKEBOX_COINOP */
	image	jukebox_image
	byte	15			/* Object instance length */
	byte	 7			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_key 42 {
	action	key_do			/* do */
	action	generic_throw		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndGet	/* get */
	action	generic_goToAndDropAt	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	key_image_0
	byte	16			/* Object instance length */
	byte	 8			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_knick_knack 43 {
	sound	magic_3
	sound	magic_3_pw
	action	generic_doMagicIfMagic	/* do */
	action	generic_throw		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndGet	/* get */
	action	generic_goToAndDropAt	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	knick_knack_image_0
	image	knick_knack_image_1
	image	knick_knack_image_2
	image	knick_knack_image_3
	image	knick_knack_image_4
	image	knick_knack_image_5
	image	teddy_bear_image
	image	rubber_ducky_image
	image	answering_machine_image
	image	telephone_image_0
	image	towel_image
	image	microphone_image
	image	road_pizza_image
	byte	15			/* Object instance length */
	byte	 7			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_knife 44 {
	action	generic_depends		/* do */
	action	generic_strike		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndGet	/* get */
	action	generic_goToAndDropAt	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	knife_image_0
	image	knife_image_1
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_magic_lamp 45 {
	sound	genie_appears
	sound	genie_out
	action	magic_lamp_do		/* do */
	action	generic_throw		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndGet	/* get */
	action	generic_goToAndDropAt	/* put */
	action	magic_lamp_talk		/* talk */
	action	generic_destroy		/* destroy */
	action	magic_lamp_GIVEUP	/* 8 -- GIVEUP+ */
	action	magic_lamp_RUB		/* 9 -- RUB* */
	action	magic_lamp_WISH		/* 10 -- WISH* */
	image	magic_lamp_image
	byte	16			/* Object instance length */
	byte	 8			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_magic_staff 46 {
	sound	magic_4
	sound	magic_4_pw
	action	generic_doMagic		/* do */
	action	generic_strike		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndGet	/* get */
	action	generic_goToAndDropAt	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	magic_staff_image
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_magic_wand 47 {
	sound	magic
	sound	magic_pw
	action	generic_doMagic		/* do */
	action	generic_strike		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndGet	/* get */
	action	generic_goToAndDropAt	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	magic_wand_image_0
	image	magic_wand_image_1
	image	teddy_bear_image
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_mailbox 48 {
	sound	mail_into_mailbox
	sound	mail_into_mailbox_pw
	sound	mail_out_of_mailbox
	sound	mail_out_of_mailbox_pw
	action	generic_depends		/* do */
	action	illegal			/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	mailbox_get		/* get */
	action	generic_sendMail	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	action	mailbox_MAILARRIVED	/* 8 -- MAILARRIVED+ */
	image	mailbox_image
	byte	15			/* Object instance length */
	byte	 7			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_matchbook 49 {
	action	generic_read		/* do */
	action	generic_throw		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndGet	/* get */
	action	generic_goToAndDropAt	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	matchbook_image
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_movie_camera 52 {
	sound	switch_click
	sound	switch_click
	action	generic_switch		/* do */
	action	generic_throw		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndGet	/* get */
	action	generic_goToAndDropAt	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	action	generic_OFF		/* 8 -- OFF* */
	action	generic_ON		/* 9 -- ON* */
	image	movie_camera_image
	byte	15			/* Object instance length */
	byte	 7			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_paper 54 {
	action	paper_do		/* do */
	action	generic_throw		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndGet	/* get */
	action	generic_goToAndDropAt	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	paper_image
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_short_sign 56 {
	action	generic_depends		/* do */
	action	illegal			/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	noEffect		/* get */
	action	generic_goToAndDropAt	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	sign_image_0
	image	sign_image_1
	image	sign_image_2
	image	sign_image_3
	image	sign_image_4
	image	sign_image_5
	image	sign_image_6
	byte	24			/* Object instance length */
	byte	16			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_sign 57 {
	action	generic_depends		/* do */
	action	illegal			/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	noEffect		/* get */
	action	generic_goToAndDropAt	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	sign_image_0
	image	sign_image_1
	image	sign_image_2
	image	sign_image_3
	image	sign_image_4
	image	sign_image_5
	image	sign_image_6
	byte	54			/* Object instance length */
	byte	46			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_plant 58 {
	action	generic_depends		/* do */
	action	generic_throw		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_getMass		/* get */
	action	generic_goToAndDropAt	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	plant_image_0
	image	plant_image_1
	image	plant_image_2
	byte	15			/* Object instance length */
	byte	 7			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_pond 147 {
	action	generic_depends		/* do */
	action	illegal			/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndFill	/* get */
	action	generic_goToAndDropAt	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	pond_image
	byte	14			/* Object instance length */
	byte	 6/*??*/		/* Initialization count */
	byte	 0			/* Capacity */
}

class class_ring 60 {
	sound	magic_2
	sound	magic_2_pw
	action	generic_doMagic		/* do */
	action	generic_throw		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndGet	/* get */
	action	generic_goToAndDropAt		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	ring_image
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_river 148 {
	action	generic_depends		/* do */
	action	illegal			/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndFill	/* get */
	action	generic_goToAndDropAt	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	missing_image
	byte	14			/* Object instance length */
	byte	 6/*??*/		/* Initialization count */
	byte	 0			/* Capacity */
}

class class_rock 61 {
	action	generic_depends		/* do */
	action	generic_throw		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_getMass		/* get */
	action	generic_goToAndDropAt	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	rock_image_0
	image	rock_image_1
	image	rock_image_2
	byte	15			/* Object instance length */
	byte	 7			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_roof 149 {
	action	generic_depends		/* do */
	action	illegal			/* reversed do */
	action	noEffect		/* go */
	action	generic_cease		/* stop */
	action	noEffect		/* get */
	action	noEffect		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	missing_image
	byte	16			/* Object instance length */
	byte	 8			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_safe 150 {
	sound	box_opening
	sound	box_closing
	action	generic_adjacentOpenCloseContainer /* do */
	action	illegal			/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndPickFromIfOpen /* get */
	action	generic_goToAndDropIntoIfOpen /* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	safe_image
	byte	27 /*22*/		/* Object instance length */
	byte	 137			/* 128+9 Initialization count */
	byte	10 /* 5*/		/* Capacity */
}

class class_security_device 63 {
	sound	security_device_on
	sound	security_device_off
	action	generic_switch		/* do */
	action	generic_throw		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndGet	/* get */
	action	generic_goToAndDropAt	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	action	generic_OFF		/* 8 -- OFF* */
	action	generic_ON		/* 9 -- ON* */
	image	security_device_image
	byte	15			/* Object instance length */
	byte	 7			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_sensor 64 {
	sound	sensor_scanning
	sound	sensor_didnt_find_it
	sound	sensor_found_it
	action	sensor_do		/* do */
	action	generic_throw		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndGet	/* get */
	action	generic_goToAndDropAt	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	action	sensor_SCAN		/* 8 -- SCAN* */
	image	sensor_image
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_sex_changer 90 {
	sound	sex_changer
	sound	sex_changer_pw
	action	sex_changer_do		/* do */
	action	illegal			/* reversed do */
	action	sex_changer_go		/* go */
	action	generic_cease		/* stop */
	action	noEffect		/* get */
	action	generic_goToAndDropAt	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	action	sex_changer_SEXCHANGE	/* 8 -- SEXCHANGE* */
	image	sex_changer_image
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_shovel 89 {
	sound	digging
	action	generic_depends		/* do */
	action	shovel_rdo		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndGet	/* get */
	action	generic_goToAndDropAt	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	action	shovel_DIG		/* 8 -- DIG* */
	image	shovel_image
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class spray_can 95 {
	sound	spray_can_hiss
	action	spray_can_do		/* do */
	action	noEffect		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndGet	/* get */
	action	generic_goToAndDropAt	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy  */
	action	spray_can_SPRAY		/* 8 -- SPRAY* */
	image	spray_can_image
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_picture 152 {
	action	generic_depends		/* do */
	action	illegal			/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	noEffect		/* get */
	action	generic_goToAndDropAt	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	picture_image_0
	image	picture_image_1
	image	picture_image_2
	image	picture_image_3
	byte	16			/* Object instance length */
	byte	 8			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_sky 69 {
	action	generic_depends		/* do */
	action	illegal			/* reversed do */
	action	sky_go			/* go */
	action	generic_cease		/* stop */
	action	noEffect		/* get */
	action	noEffect		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	ground_image_0
	image	ground_image_1
	image	sky_image_2
	image	sky_image_3
	image	sky_image_4
	image	sky_image_5
	image	sky_image_6
	image	sky_image_7
	image	mountain_image_0
	image	cave_image_0
	image	ball_image
	image	tree_image_9
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_stereo 70 {
	sound	switch_click
	sound	switch_click
	action	generic_switch		/* do */
	action	generic_throw		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	stereo_get		/* get */
	action	stereo_put		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	action	stereo_UNLOAD		/* 8 */
	action	stereo_PLAY		/* 9 -- PLAY+ */
	image	stereo_image
	byte	17			/* Object instance length */
	byte	 8			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_street 153 {
	action	generic_depends		/* do */
	action	illegal			/* reversed do */
	action	generic_goToCursor	/* go */
	action	generic_cease		/* stop */
	action	noEffect		/* get */
	action	generic_goToAndDropAt	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	street_image
	byte	16			/* Object instance length */
	byte	 8			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_streetlamp 154 {
	action	generic_depends		/* do */
	action	illegal			/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	noEffect		/* get */
	action	generic_goToAndDropAt	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	streetlamp_image_0
	image	streetlamp_image_1
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_stun_gun 91 {
	sound	gun_safety_on
	sound	gun_safety_off
	sound	stun_gun_fire
	sound	stun_gun_fire_pw
	sound	stun_gun_hit
	sound	stun_gun_hit_pw
	sound	stun_gun_miss
	action	gun_do			/* do */
	action	stun_gun_rdo		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndGet	/* get */
	action	generic_goToAndDropAt	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	gun_image_2
	byte	15			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_table 155 {
	action	generic_depends		/* do */
	action	illegal			/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndPickFrom	/* get */
	action	generic_goToAndDropInto	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	table_image
	byte	22 /*18*/		/* Object instance length */
	byte	 9			/* Initialization count */
	byte	 5 /* 4*/		/* Capacity */
}

class class_tape 71 {
	action	generic_read		/* do */
	action	generic_throw		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndGet	/* get */
	action	generic_goToAndDropAt	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	action	tape_LOAD		/* 8 */
	image	tape_image
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_teleport_booth 74 {
	sound	coin_accepted_by_coinop
	sound	coin_accepted_by_coinop_pw
	sound	coin_deposited_in_coinop
	sound	coin_deposited_in_coinop_pw
	sound	coin_rejected_by_coinop
	sound	coin_rejected_by_coinop_pw
	sound	teleport_activates
	sound	teleport_activates_pw
	sound	teleport_conf_wait
	sound	teleport_conf_wait_pw
	sound	teleport_departure
	sound	teleport_departure_pw
	sound	teleport_arrival
	sound	teleport_arrival_pw
	action	generic_depends		/* do */
	action	illegal			/* reversed do */
	action	generic_enterOrExit	/* go */
	action	generic_cease		/* stop */
	action	noEffect		/* get */
	action	teleport_put		/* put */
	action	teleport_talk		/* talk */
	action	generic_destroy		/* destroy */
	action	teleport_PAY		/* 8 -- PAY* */
	action	teleport_ZAPIN		/* 9 -- ZAPIN* */
	action	teleport_ZAPTO		/* 10 -- ZAPTO* */
	action	generic_coinOp		/* 11 -- internal TELEPORT_COINOP */
	image	teleport_image
	byte	15			/* Object instance length */
	byte	 7			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_test 94 {
	action	generic_test		/* do */
	action	generic_test		/* reversed do */
	action	generic_test		/* go */
	action	generic_cease		/* stop */
	action	generic_test		/* get */
	action	generic_test		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	missing_image
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_ticket 75 {
	action	generic_read		/* do */
	action	generic_throw		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndGet	/* get */
	action	generic_goToAndDropAt	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	ticket_image
	byte	15			/* Object instance length */
	byte	 7			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_tokens 76 {
	action	tokens_do		/* do */
	action	tokens_rdo		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndGet	/* get */
	action	generic_goToAndDropAt	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	tokens_image
	byte	16			/* Object instance length */
	byte	 8			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_trapezoid 87 {
	action	generic_depends		/* do */
	action	illegal			/* reversed do */
	action	trap_go			/* go */
	action	generic_cease		/* stop */
	action	noEffect		/* get */
	action	generic_goToAndDropAt	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	action	sky_go			/* 8 - internal */
	action	wall_go			/* 9 - internal */
	action	generic_goToCursor	/* 10 - internal */
	action	noEffect		/* 11 - internal */
	image	trapezoid_image
	image	trapezoid_rock_image
	byte	20			/* Object instance length */
	byte	12			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_super_trapezoid 92 {
	action	generic_depends		/* do */
	action	illegal			/* reversed do */
	action	trap_go			/* go */
	action	generic_cease		/* stop */
	action	noEffect		/* get */
	action	generic_goToAndDropAt	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	action	sky_go			/* 8 - internal */
	action	wall_go			/* 9 - internal */
	action	generic_goToCursor	/* 10 - internal */
	action	noEffect		/* 11 - internal */
	image	super_trapezoid_image
	byte	54			/* Object instance length */
	byte	46			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_tree 156 {
	action	generic_depends		/* do */
	action	illegal			/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	noEffect		/* get */
	action	generic_goToAndDropAt	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	tree_image_0
	image	tree_image_1
	image	tree_image_2
	image	tree_image_3
	image	tree_image_4
	image	tree_image_5
	image	tree_image_6
	image	tree_image_7
	image	tree_image_8
	image	tree_image_9
	image	tree_image_10
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_vendo_front 85 {
	sound	coin_accepted_by_coinop
	sound	coin_accepted_by_coinop_pw
	sound	coin_deposited_in_coinop
	sound	coin_deposited_in_coinop_pw
	sound	coin_rejected_by_coinop
	sound	coin_rejected_by_coinop_pw
	sound	vendo_changing
	sound	vendo_dispensing
	sound	vendo_dispensing_pw
	action	vendo_do		/* do */
	action	illegal			/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	noEffect		/* get */
	action	vendo_put		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	action	vendo_SELECT		/* 8 -- SELECT* */
	action	vendo_SELL		/* 9 -- SELL* */
	action	generic_coinOp		/* 10 -- internal */
	image	vendo_front_image
	image	newsvendo_front_image
	byte	29			/* Object instance length */
	byte	11			/* Initialization count */
	byte	10			/* Capacity */
}

class class_vendo_inside 86 {
	action	illegal			/* do */
	action	illegal			/* reversed do */
	action	illegal			/* go */
	action	illegal			/* stop */
	action	illegal			/* get */
	action	illegal			/* put */
	action	illegal			/* talk */
	action	generic_destroy		/* destroy */
	image	vendo_inside_image
	image	newsvendo_inside_image
	byte	19			/* Object instance length */
	byte	 9			/* Initialization count */
	byte	 2			/* Capacity */
}

class class_wall 80 {
	action	generic_depends		/* do */
	action	illegal			/* reversed do */
	action	wall_go			/* go */
	action	generic_cease		/* stop */
	action	noEffect		/* get */
	action	generic_goToAndDropAt	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	ground_image_0
	image	ground_image_1
	image	wall_image_2
	image	wall_image_3
	image	wall_image_4
	image	wall_image_5
	image	wall_image_6
	image	wall_image_7
	image	mountain_image_0
	image	cave_image_0
	image	ball_image
	image	tree_image_9
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_window 157 {
	action	generic_depends		/* do */
	action	illegal			/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	noEffect		/* get */
	action	generic_goToAndDropAt	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	window_image_0
	image	window_image_1
	byte	14			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_wind_up_toy 82 {
	sound	winding_up_toy
	sound	winding_up_toy_pw
	action	windup_toy_do		/* do */
	action	generic_throw		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndGet	/* get */
	action	generic_goToAndDropAt	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	action	windup_toy_WIND		/* 8 -- WIND* */
	image	windup_doll_image
	image	windup_penguin_image
	byte	15			/* Object instance length */
	byte	 7			/* Initialization count */
	byte	 0			/* Capacity */
}

head {

head_image_reserved:		"Images/nillhead.bin"	/ * 1st reserved */
head_image_0:			"Images/head0.bin"
head_image_1:			"Images/head1.bin"
head_image_2:			"Images/head2.bin"
head_image_3:			"Images/head3.bin"
head_image_4:			"Images/head4.bin"
head_image_5:			"Images/head5.bin"
head_image_6:			"Images/head6.bin"
head_image_7:			"Images/head7.bin"
head_image_8:			"Images/beard0.bin"
head_image_9:			"Images/block0.bin"
head_image_10:			"Images/buckw0.bin"
head_image_11:			"Images/dragon0.bin"
head_image_12:			"Images/fly0.bin"
head_image_13:			"Images/helmet0.bin"
head_image_14:			"Images/lioness.bin"
head_image_15:			"Images/lizard0.bin"
head_image_16:			"Images/ming0.bin"
head_image_17:			"Images/skull0.bin"
head_image_18:			"Images/stalk0.bin"
head_image_19:			"Images/tiger.bin"
head_image_20:			"Images/woman0.bin"
head_image_21:			"Images/robot0.bin"
head_image_22:			"Images/ostrich0.bin"
head_image_23:			"Images/turkey0.bin"
head_image_24:			"Images/sailor0.bin"
head_image_25:			"Images/bizzaro0.bin"
head_image_26:			"Images/bman0.bin"
head_image_27:			"Images/coolcat0.bin"
head_image_28:			"Images/duck0.bin"
head_image_29:			"Images/grandma0.bin"
head_image_30:			"Images/groucho.bin"
head_image_31:			"Images/shades0.bin"
head_image_32:			"Images/thug0.bin"
head_image_33:			"Images/viking0.bin"
head_image_34:			"Images/vampire0.bin"
head_image_35:			"Images/bozo0.bin"
head_image_36:			"Images/cyclops0.bin"
head_image_37:			"Images/fishead0.bin"
head_image_38:			"Images/tex0.bin"
head_image_39:			"Images/tophat0.bin"
head_image_40:			"Images/bean0.bin"
head_image_41:			"Images/cent0.bin"
head_image_42:			"Images/pirate1.bin"
head_image_43:			"Images/pirate2.bin"
head_image_44:			"Images/tknot1.bin"
head_image_45:			"Images/tknot2.bin"
head_image_46:			"Images/hillbilly0.bin"
head_image_47:			"Images/coldlady0.bin"
head_image_48:			"Images/turban0.bin"
head_image_49:			"Images/fstien0.bin"
head_image_50:			"Images/phair0.bin"
head_image_51:			"Images/darth0.bin"
head_image_52:			"Images/afro0.bin"
head_image_53:			"Images/milkman0.bin"
head_image_54:			"Images/wimpy0.bin"
head_image_55:			"Images/woman1.bin"
head_image_56:			"Images/sherlock0.bin"
head_image_57:			"Images/hunter0.bin"
head_image_58:			"Images/metro0.bin"
head_image_59:			"Images/hammer0.bin"
head_image_60:			"Images/rabbit0.bin"
head_image_61:			"Images/witch0.bin"
head_image_62:			"Images/army0.bin"
head_image_63:			"Images/bigmama0.bin"
head_image_64:			"Images/dandy0.bin"
head_image_65:			"Images/mr_mike0.bin"
head_image_66:			"Images/tonto0.bin"
head_image_67:			"Images/oldman0.bin"
head_image_68:			"Images/santa0.bin"
head_image_69:			"Images/jerk0.bin"
head_image_70:			"Images/fhippie0.bin"
head_image_71:			"Images/jaws0.bin"
head_image_72:			"Images/brain0.bin"
head_image_73:			"Images/oink0.bin"
head_image_74:			"Images/doctor0.bin"
head_image_75:			"Images/princess0.bin"
head_image_76:			"Images/mouse0.bin"
head_image_77:			"Images/wizard0.bin"
head_image_78:			"Images/madsci0.bin"
head_image_79:			"Images/pigtail0.bin"
head_image_80:			"Images/chef0.bin"
head_image_81:			"Images/bum0.bin"
head_image_82:			"Images/newsboy0.bin"
head_image_83:			"Images/gabor0.bin"
head_image_84:			"Images/ninja0.bin"
head_image_85:			"Images/statesman0.bin"
head_image_86:			"Images/irma0.bin"
head_image_87:			"Images/dodo0.bin"
head_image_88:			"Images/tasha0.bin"
head_image_89:			"Images/scruffy0.bin"
head_image_90:			"Images/grit0.bin"
head_image_91:			"Images/army1.bin"
head_image_92:			"Images/penguin0.bin"
head_image_93:			"Images/chaplin0.bin"
head_image_94:			"Images/nailhead0.bin"
head_image_95:			"Images/ascot0.bin"
head_image_96:			"Images/satan0.bin"
head_image_97:			"Images/angel0.bin"
head_image_98:			"Images/angel1.bin"
head_image_99:			"Images/spacesuit0.bin"
head_image_100:			"Images/princess1.bin"
head_image_101:			"Images/boone0.bin"
head_image_102:			"Images/moto0.bin"
head_image_103:			"Images/hardhat0.bin"
head_image_104:			"Images/hiawatha0.bin"
head_image_105:			"Images/gamorrean0.bin"
}

image {

avatar_side_image:		"Gr/Av/do40.bin"

head_placeholder_1:		"Images/undefined1.bin"
head_placeholder_2:		"Images/undefined2.bin"
head_placeholder_3:		"Images/undefined3.bin"
head_placeholder_4:		"Images/undefined4.bin"
head_placeholder_5:		"Images/undefined5.bin"
head_placeholder_6:		"Images/undefined6.bin"
head_placeholder_7:		"Images/undefined7.bin"
head_placeholder_8:		"Images/undefined8.bin"
head_placeholder_9:		"Images/undefined9.bin"
head_placeholder_10:		"Images/undefined10.bin"
head_placeholder_11:		"Images/undefined11.bin"
head_placeholder_12:		"Images/undefined12.bin"
head_placeholder_13:		"Images/undefined13.bin"
head_placeholder_14:		"Images/undefined14.bin"
head_placeholder_15:		"Images/undefined15.bin"

amulet_image:			"Images/amulet.bin"

answering_machine_image:	"Images/ans.bin"

aquarium_image:			"Images/ftank2.bin"	/* not complete */

atm_image:			"Images/atm.bin"

bag_image:			"Images/bag.bin"
luggage_side_image:		"Images/luggages.bin"

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

box_image:			"Images/box1.bin"
treasure_chest_image:		"Images/trchest.bin"

bridge_side_image:		"Images/bridges.bin"
bridge_front_image:		"Images/bridgef.bin"

bush_image_0:			"Images/bush1.bin"
bush_image_1:			"Images/bush2.bin"
bush_image_2:			"Images/bush3.bin"
bush_image_3:			"Images/bush4.bin"
bush_image_4:			"Images/grass0.bin"

chair_front_back_image:		"Images/chairfb.bin"
chair_side_image:		"Images/chairs.bin"
bar_stool_image:		"Images/stool0.bin"

changomatic_image:		"Images/chango.bin"

chest_front_image:		"Images/chestf.bin"
chest_back_image:		"Images/chestb.bin"
chest_side_image:		"Images/chests.bin"

club_image:			"Images/club2.bin"	/* handle use? */

coke_machine_image_1:		"Images/coke1.bin"

compass_image:			"Images/compass.bin"

couch_front_back_image:		"Images/couchfb.bin"
couch_side_image:		"Images/couchs.bin"

countertop_image:		"Images/counter0.bin"	

crystal_ball_image:		"Images/cball0.bin"

display_case_image:		"Images/dcase.bin"

door_image_0:			"Images/door1.bin"
door_image_1:			"Images/door2.bin"

dropbox_image:			"Images/mdrop.bin"

drugs_image:			"Images/pillbot.bin"

escape_device_image:		"Images/escaper.bin"

fake_gun_image:			"Images/fgun1.bin"

fence_image:			"Images/fence1.bin"

flag_image:			"Images/flag.bin" /* need still states */

flashlight_image:		"Images/flite.bin"
torch_image:			"Images/torch0.bin"

floor_lamp_image:		"Images/flamp.bin"

fortune_machine_image:		"Images/fortun.bin"

fountain_image:			"Images/fount2.bin"

frisbee_image:			"Images/fris.bin"

garbage_can_image:		"Images/gcan.bin"
kitchen_garbage_image:		"Images/kcan.bin"

gemstone_image:			"Images/gem.bin"

grenade_image:			"Images/gren.bin"

ground_image_0:			"Images/floor0.bin"
ground_image_1:			"Images/floor1.bin"

gun_image_0:			"Images/gun1.bin"
gun_image_1:			"Images/gun2.bin"
gun_image_2:			"Images/gun3.bin"
mauser_image:			"Images/maus.bin"

hand_of_god_image:		"Images/hand.bin"
cinder_image:			"Images/cinder.bin"

hole_image:			"Images/hole0.bin"

house_image:			"Images/house1.bin"

house_cat_image:		"Images/cat.bin"

hot_tub_image:			"Images/hottub.bin"

instant_object_pill_image:	"Images/mpill.bin"

jukebox_image:			"Images/juke.bin"

key_image_0:			"Images/key1.bin"

knick_knack_image_0:		"Images/kk1.bin"
knick_knack_image_1:		"Images/kk2.bin"
knick_knack_image_2:		"Images/kk3.bin"
knick_knack_image_3:		"Images/vase.bin"
knick_knack_image_4:		"Images/jug0.bin"
knick_knack_image_5:		"Images/saw.bin"

knife_image_0:			"Images/knife1.bin"
knife_image_1:			"Images/knife2.bin"

magic_lamp_image:		"Images/mlamp2.bin"	/* define states! */

magic_staff_image:		"Images/mstaff.bin"

magic_wand_image_0:		"Images/wand1.bin"
magic_wand_image_1:		"Images/wand2.bin"

mailbox_image:			"Images/mbox.bin"

matchbook_image:		"Images/mbook0.bin"

microphone_image:		"Images/mic0.bin"

movie_camera_image:		"Images/camera0.bin"

pants_image:			"Images/fpants.bin"

paper_image:			"Images/paper.bin"

pencil_image:			"Images/pencil.bin"

phone_booth_image:		"Images/phoneb5.bin"

plant_image_0:			"Images/plant1.bin"
plant_image_1:			"Images/plant2.bin"
plant_image_2:			"Images/plant3.bin"

pond_image:			"Images/pond0.bin"

ring_image:			"Images/mring.bin"	/* incomplete?*/

road_pizza_image:		"Images/flat.bin"

rock_image_0:			"Images/rock1.bin"
rock_image_1:			"Images/rock2.bin"
rock_image_2:			"Images/rock3.bin"

rubber_ducky_image:		"Images/rduk.bin"

safe_image:			"Images/safe1.bin"

security_device_image:		"Images/security.bin"

sensor_image:			"Images/sensor.bin"

sex_changer_image:		"Images/sexo.bin"

shirt_image:			"Images/fshirt.bin"

shovel_image:			"Images/shovel0.bin"
jacket_image:			"Images/fjacket.bin"

picture_image_0:		"Images/varpicture.bin"
picture_image_1:		"Images/picture1.bin"
picture_image_2:		"Images/picture2.bin"
picture_image_3:		"Images/picture3.bin"

sign_image_0:			"Images/sign0.bin"
sign_image_1:			"Images/sign1.bin"
sign_image_2:			"Images/sign2.bin"
sign_image_3:			"Images/sign3.bin"
sign_image_4:			"Images/sign4.bin"
sign_image_5:			"Images/sign5.bin"
sign_image_6:			"Images/sign6.bin"

skateboard_image:		"Images/sboard.bin"

sky_image_2:			"Images/bwall3.bin"
sky_image_3:			"Images/bwall4.bin"
sky_image_4:			"Images/bwall5.bin"
sky_image_5:			"Images/bwall6.bin"
sky_image_6:			"Images/bwall7.bin"
sky_image_7:			"Images/bwall8.bin"
mountain_image_0:		"Images/mount1.bin"
cave_image_0:			"Images/cave0.bin"

spray_can_image:		"Images/patgun0.bin"

stereo_image:			"Images/tapep.bin"

street_image:			"Images/road0.bin"

streetlamp_image_0:		"Images/slite1.bin"
streetlamp_image_1:		"Images/slite2.bin"

table_image:			"Images/table0.bin"

tape_image:			"Images/cassette.bin"

teddy_bear_image:		"Images/tbear.bin"

telephone_image_0:		"Images/phone1.bin"
telephone_image_1:		"Images/phone2.bin"

teleport_image:			"Images/port7.bin"

ticket_image:			"Images/ticket.bin"

tokens_image:			"Images/tok.bin"

towel_image:			"Images/towel.bin"

trapezoid_image:		"Images/trap0.bin"
trapezoid_rock_image:		"Images/trap1.bin"
super_trapezoid_image:		"Images/super_trap.bin"

tree_image_0:			"Images/tree1.bin"
tree_image_1:			"Images/tree2.bin"
tree_image_2:			"Images/palm2.bin"
tree_image_3:			"Images/tree4.bin"
tree_image_4:			"Images/tree5.bin"
tree_image_5:			"Images/tree6.bin"
tree_image_6:			"Images/tree7.bin"
tree_image_7:			"Images/tree8.bin"
tree_image_8:			"Images/tree9.bin"
tree_image_9:			"Images/treeA.bin"
tree_image_10:			"Images/treeB.bin"

vendo_front_image:		"Images/vendo1.bin"
vendo_inside_image:		"Images/vendo0.bin"
newsvendo_front_image:		"Images/newsstand1.bin"
newsvendo_inside_image:		"Images/newsstand0.bin"

wall_image_2:			"Images/bwall3.bin"
wall_image_3:			"Images/bwall4.bin"
wall_image_4:			"Images/bwall5.bin"
wall_image_5:			"Images/bwall6.bin"
wall_image_6:			"Images/bwall7.bin"
wall_image_7:			"Images/bwall8.bin"

window_image_0:			"Images/window1.bin"
window_image_1:			"Images/window3.bin"

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
avatar_WALK:		"avatar_WALK.bin"
avatar_ATTACK:		"avatar_ATTACK.bin"
avatar_BASH:		"avatar_BASH.bin"
avatar_CLOSE:		"avatar_CLOSE.bin"
avatar_CLOSECONTAINER:	"avatar_CLOSECONTAINER.bin"
avatar_GETM:		"avatar_GET.bin"
avatar_GRABFROM:	"avatar_GRABFROM.bin"
avatar_OPEN:		"avatar_OPEN.bin"
avatar_OPENCONTAINER:	"avatar_OPENCONTAINER.bin"
avatar_POSTURE:		"avatar_POSTURE.bin"
avatar_PUTM:		"avatar_PUT.bin"
avatar_THROW:		"avatar_THROW.bin"
avatar_WEAR:		"avatar_WEAR.bin"
avatar_REINCARNATE:	"avatar_REINCARNATE.bin"
avatar_REMOVE:		"avatar_REMOVE.bin"
avatar_PAID:		"avatar_PAID.bin"

atm_do:			"atm_do.bin"
atm_get:		"atm_get.bin"
atm_put:		"atm_put.bin"

book_do:		"book_do.bin"

bottle_rdo:		"bottle_rdo.bin"

changomatic_rdo:	"changomatic_rdo.bin"
changomatic_CHANGE:	"changomatic_CHANGE.bin"

coke_machine_put:	"coke_machine_put.bin"

drugs_do:		"drugs_do.bin"

escape_device_do:	"escape_device_do.bin"

fake_gun_do:		"fake_gun_do.bin"
fake_gun_rdo:		"fake_gun_rdo.bin"
fake_gun_FAKESHOOT:	"fake_gun_FAKESHOOT.bin"
fake_gun_RESET:		"fake_gun_RESET.bin"

flashlight_do:		"flashlight_do.bin"

floor_lamp_do:		"floor_lamp_do.bin"

fortune_machine_put:	"fortune_machine_put.bin"

garbage_can_do:		"garbage_can_do.bin"
garbage_can_FLUSH:	"garbage_can_FLUSH.bin"

grenade_do:		"grenade_do.bin"
grenade_EXPLODE:	"grenade_EXPLODE.bin"

gun_do:			"gun_do.bin"

hand_of_god_BLAST:	"hand_of_god_BLAST.bin"

head_do:		"head_do.bin"
head_get:		"head_get.bin"
head_put:		"head_put.bin"
head_talk:		"head_talk.bin"

hole_do:		"hole_do.bin"

instant_object_TRANSFORM: "instant_object_TRANSFORM.bin"

jukebox_do:		"jukebox_do.bin"
jukebox_put:		"jukebox_put.bin"
jukebox_talk:		"jukebox_talk.bin"
jukebox_PLAY:		"generic_PLAY.bin"

key_do:			"key_do.bin"

magic_lamp_do:		"magic_lamp_do.bin"
magic_lamp_talk:	"magic_lamp_talk.bin"
magic_lamp_GIVEUP:	"magic_lamp_GIVEUP.bin"
magic_lamp_RUB:		"magic_lamp_RUB.bin"
magic_lamp_WISH:	"magic_lamp_WISH.bin"

mailbox_get:		"mailbox_get.bin"
mailbox_MAILARRIVED:	"mailbox_MAILARRIVED.bin"

paper_do:		"paper_do.bin"

sensor_do:		"sensor_do.bin"
sensor_SCAN:		"sensor_SCAN.bin"

sex_changer_do:		"sex_changer_do.bin"
sex_changer_SEXCHANGE:	"sex_changer_SEXCHANGE.bin"

shovel_rdo:		"shovel_rdo.bin"
shovel_DIG:		"shovel_DIG.bin"

sky_go:			"sky_go.bin"

spray_can_do:		"spray_can_do.bin"
spray_can_SPRAY:	"spray_can_SPRAY.bin"

/* stereo_get:		"stereo_get.bin" */
/* stereo_put:		"stereo_put.bin" */
stereo_put:		"generic_goToAndDropAt.bin"
stereo_get:		"generic_goToAndGet.bin"
stereo_PLAY:		"generic_PLAY.bin"


stun_gun_rdo:		"stun_gun_rdo.bin"

telephone_do:		"telephone_do.bin"
telephone_get:		"telephone_get.bin"
telephone_put:		"telephone_put.bin"
telephone_talk:		"telephone_talk.bin"

teleport_put:		"teleport_put.bin"
teleport_talk:		"teleport_talk.bin"
teleport_PAY:		"teleport_PAY.bin"
teleport_ZAPIN:		"teleport_ZAPIN.bin"
teleport_ZAPTO:		"teleport_ZAPOUT.bin"

tokens_do:		"tokens_do.bin"
tokens_rdo:		"tokens_rdo.bin"

vendo_do:		"vendo_do.bin"
vendo_put:		"vendo_put.bin"
vendo_SELECT:		"vendo_SELECT.bin"
vendo_SELL:		"vendo_SELL.bin"

wall_go:		"generic_goToCursor.bin"

windup_toy_do:		"windup_toy_do.bin"
windup_toy_WIND:	"windup_toy_WIND.bin"

generic_adjacentOpenClose: "generic_adjacentOpenClose.bin" 
generic_adjacentOpenCloseContainer: "generic_adjacentOpenCloseContainer.bin"
generic_askOracle:	"generic_askOracle.bin"
generic_broadcast:	"generic_broadcast.bin"
generic_cease:		"generic_cease.bin"
generic_depends:	"generic_depends.bin"
generic_doMagic:	"generic_doMagic.bin"
generic_doMagicIfMagic:	"generic_doMagicIfMagic.bin"
generic_enterOrExit:	"generic_enterOrExit.bin"
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
generic_read:		"generic_read.bin"
generic_sendMail:	"generic_sendMail.bin"
generic_shoot:		"generic_shoot.bin"
generic_strike:		"generic_strike.bin"
generic_switch:		"generic_switch.bin"
generic_throw:		"generic_throw.bin"
generic_wearLegs:	"generic_wearLegs.bin"
generic_wearTorso:	"generic_wearTorso.bin"
generic_wearHead:	"generic_wearHead.bin"
generic_wearOrGet:	"generic_wearOrGet.bin"

generic_CHANGESTATE:	"generic_CHANGESTATE.bin"
generic_OFF:		"generic_OFF.bin"
generic_OFFLIGHT:	"generic_OFFLIGHT.bin"
generic_ON:		"generic_ON.bin"
generic_ONLIGHT:	"generic_ONLIGHT.bin"
generic_PAY:		"generic_PAY.bin"
generic_SPEAK:		"generic_SPEAK.bin"

generic_coinOp:		"generic_coinOp.bin"
generic_goToFurniture:	"generic_goToFurniture.bin"
/* generic_goToFurniture:	"generic_goTo.bin" */
bottle_FILL:		"bottle_FILL.bin"
bottle_POUR:		"bottle_POUR.bin"
drugs_TAKE:		"drugs_TAKE.bin"
escape_device_BUGOUT:	"escape_device_BUGOUT.bin"
sex_changer_go:		"sex_changer_go.bin"
generic_destroy:	"generic_destroy.bin"
generic_test:		"generic_test.bin"
stereo_UNLOAD:		"stereo_UNLOAD.bin"
tape_LOAD:		"tape_LOAD.bin"
avatar_DIE:		"avatar_DIE.bin"
avatar_SITORGETUP:	"avatar_SITORGETUP.bin"
/*avatar_SITORGETUP:	"illegal.bin"*/
GoToNewRegion:		"GoToNewRegion.bin"

transit_region:		"transit_region.bin"
ask_for_help:		"ask_for_help.bin"
trap_go:		"trap_go.bin"

illegal:		"illegal.bin"
noEffect:		"noEffect.bin"

}

sound {

atm_thinking:			"Sounds/atm_thinking.bin"
avatar_injured:			"Sounds/avatar_injured.bin"
avatar_injured_pw:		"Sounds/avatar_injured.pwbin"
avatar_killed:			"Sounds/avatar_killed.bin"
avatar_killed_pw:		"Sounds/avatar_killed.pwbin"

bag_closing:			"Sounds/bag_closing.bin"
bag_opening:			"Sounds/bag_opening.bin"
big_explosion:			"Sounds/big_explosion.bin"
big_explosion_pw:		"Sounds/big_explosion.pwbin"
box_closing:			"Sounds/box_closing.bin"
box_opening:			"Sounds/box_opening.bin"

changomatic:			"Sounds/changomatic.bin"
chest_of_drawers_closing:	"Sounds/chest_of_drawers_closing.bin"
chest_of_drawers_opening:	"Sounds/chest_of_drawers_opening.bin"
clothes_doffed:			"Sounds/clothes_doffed.bin"
clothes_donned:			"Sounds/clothes_donned.bin"
coin_accepted_by_coinop:	"Sounds/coin_accepted_by_coinop.bin"
coin_accepted_by_coinop_pw:	"Sounds/coin_accepted_by_coinop.pwbin"
coin_deposited_in_coinop:	"Sounds/coin_deposited_in_coinop.bin"
coin_deposited_in_coinop_pw:	"Sounds/coin_deposited_in_coinop.pwbin"
coin_rejected_by_coinop:	"Sounds/coin_rejected_by_coinop.bin"
coin_rejected_by_coinop_pw:	"Sounds/coin_rejected_by_coinop.pwbin"
crystal_ball:			"Sounds/crystal_ball.bin"
crystal_ball_pw:		"Sounds/crystal_ball.pwbin"

door_closing:			"Sounds/door_closing.bin"
door_opening:			"Sounds/door_opening.bin"
door_opening_pw:		"Sounds/door_opening.pwbin"

error_beep:			"Sounds/error_beep.bin"
escape_device_activates:	"Sounds/escape_device_activates.bin"
escape_device_used_up:		"Sounds/escape_device_used_up.bin"

garbage_can_flushing:		"Sounds/garbage_can_flush.bin"
genie_appears:			"Sounds/genie_appears.bin"
gun_safety_off:			"Sounds/gun_safety_off.bin"
gun_safety_on:			"Sounds/gun_safety_on.bin"
gunshot:			"Sounds/gunshot.bin"

hand_o_god_flame:		"Sounds/hand_o_god_flame.bin"
hand_o_god_lightning:		"Sounds/hand_o_god_lightning.bin"
hand_o_god_lightning_pw:	"Sounds/hand_o_god_lightning.pwbin"

instant_object_pill:		"Sounds/instant_object_pill.bin"

joke_gunshot:			"Sounds/joke_gunshot.bin"
joke_gunshot_pw:		"Sounds/joke_gunshot.pwbin"

knife_hits_avatar:		"Sounds/knife_hits_avatar.bin"
knife_hits_avatar_pw:		"Sounds/knife_hits_avatar.pwbin"
knife_hits_object:		"Sounds/knife_hits_object.bin"

magic:				"Sounds/magic.bin"
magic_pw:			"Sounds/magic.pwbin"
medium_explosion:		"Sounds/medium_explosion.bin"
money_into_atm:			"Sounds/money_into_atm.bin"
money_into_atm_pw:		"Sounds/money_into_atm.pwbin"
money_out_of_atm:		"Sounds/money_out_of_atm.bin"
money_out_of_atm_pw:		"Sounds/money_out_of_atm.pwbin"

parking_meter_crank:		"Sounds/parking_meter_crank.bin"
parking_meter_crank_pw:		"Sounds/parking_meter_crank.pwbin"
phone_busy:			"Sounds/phone_busy.bin"
phone_dial_tone:		"Sounds/phone_dial_tone.bin"
phone_local_ring:		"Sounds/phone_local_ring.bin"
phone_local_ring_pw:		"Sounds/phone_local_ring.pwbin"
phone_remote_hangup:		"Sounds/phone_remote_hangup.bin"
phone_remote_hangup_pw:		"Sounds/phone_remote_hangup.pwbin"
phone_remote_ring:		"Sounds/phone_remote_ring.bin"

region_boing:			"Sounds/region_boing.bin"

security_device_off:		"Sounds/security_device_off.bin"
security_device_on:		"Sounds/security_device_on.bin"
sensor_didnt_find_it:		"Sounds/sensor_didnt_find_it.bin"
sensor_found_it:		"Sounds/sensor_found_it.bin"
sensor_scanning:		"Sounds/sensor_scanning.bin"
small_explosion:		"Sounds/small_explosion.bin"
spray_can_hiss:			"Sounds/spraycan.bin"
switch_click:			"Sounds/switch_click.bin"

teleport_departure:		"Sounds/teleport_departure.bin"
teleport_departure_pw:		"Sounds/teleport_departure.pwbin"

vendo_changing:			"Sounds/vendo_changing.bin"
vendo_dispensing:		"Sounds/vendo_dispensing.bin"
vendo_dispensing_pw:		"Sounds/vendo_dispensing.pwbin"

water_pouring:			"Sounds/water_pouring.bin"
winding_up_toy:			"Sounds/winding_up_toy.bin"
winding_up_toy_pw:		"Sounds/winding_up_toy.pwbin"

teleport_arrival:		"Sounds/teleport_arrival.bin"
teleport_arrival_pw:		"Sounds/teleport_arrival.pwbin"
club_hits_avatar:		"Sounds/club_hits_avatar.bin"
club_hits_avatar_pw:		"Sounds/club_hits_avatar.pwbin"
club_hits_object:		"Sounds/club_hits_object.bin"
digging:			"Sounds/digging.bin"
footsteps:			"Sounds/footsteps.bin"
fortune_machine_thinking:	"Sounds/fortune_machine_thinking.bin"
fortune_dispensed:		"Sounds/fortune_dispensed.bin"
fortune_dispensed_pw:		"Sounds/fortune_dispensed.pwbin"
genie_out:			"Sounds/genie_out.bin"
grenade_pin_pull:		"Sounds/grenade_pin_pull.bin"
grenade_pin_pull_pw:		"Sounds/grenade_pin_pull.pwbin"
mail_into_mailbox:		"Sounds/mail_into_mailbox.bin"
mail_into_mailbox_pw:		"Sounds/mail_into_mailbox.pwbin"
mail_out_of_mailbox:		"Sounds/mail_out_of_mailbox.bin"
mail_out_of_mailbox_pw:		"Sounds/mail_out_of_mailbox.pwbin"
parking_meter_expires:		"Sounds/parking_meter_expires.bin"
parking_meter_expires_pw:	"Sounds/parking_meter_expires.pwbin"
teleport_activates:		"Sounds/teleport_activates.bin"
teleport_activates_pw:		"Sounds/teleport_activates.pwbin"
sex_changer:			"Sounds/sex_changer.bin"
sex_changer_pw:			"Sounds/sex_changer.pwbin"
message_received:		"Sounds/message_received.bin"
message_sent:			"Sounds/message_sent.bin"
coins_jingling:			"Sounds/coins_jingling.bin"
coins_jingling_pw:		"Sounds/coins_jingling.pwbin"
stingy_coke_machine:		"Sounds/stingy_coke_machine.bin"
stingy_coke_machine_pw:		"Sounds/stingy_coke_machine.pwbin"
stun_gun_fire:			"Sounds/stun_gun_fire.bin"
stun_gun_fire_pw:		"Sounds/stun_gun_fire.pwbin"
stun_gun_hit:			"Sounds/stun_gun_hit.bin"
stun_gun_hit_pw:		"Sounds/stun_gun_hit.pwbin"
stun_gun_miss:			"Sounds/stun_gun_miss.bin"
avatar_into_stone:		"Sounds/avatar_into_stone.bin"
avatar_into_stone_pw:		"Sounds/avatar_into_stone.pwbin"
avatar_out_of_stone:		"Sounds/avatar_out_of_stone.bin"
avatar_out_of_stone_pw:		"Sounds/avatar_out_of_stone.pwbin"
successful_esp_activation:	"Sounds/successful_esp_activation.bin"
failed_esp_activation:		"Sounds/failed_esp_activation.bin"
teleport_conf_wait:		"Sounds/teleport_conf_wait.bin"
teleport_conf_wait_pw:		"Sounds/teleport_conf_wait.pwbin"
magic_2:			"Sounds/magic_2.bin"
magic_2_pw:			"Sounds/magic_2.pwbin"
magic_3:			"Sounds/magic_3.bin"
magic_3_pw:			"Sounds/magic_3.pwbin"
magic_4:			"Sounds/magic_4.bin"
magic_4_pw:			"Sounds/magic_4.pwbin"
teleport_region_change_0:	"Sounds/teleport_region_change_0.bin"
teleport_region_change_0_pw:	"Sounds/teleport_region_change_0.pwbin"
teleport_region_change_1:	"Sounds/teleport_region_change_1.bin"
teleport_region_change_1_pw:	"Sounds/teleport_region_change_1.pwbin"
teleport_region_change_2:	"Sounds/teleport_region_change_2.bin"
region_change_music_v0:		"Sounds/region_change_music_v0.bin"
region_change_music_v1:		"Sounds/region_change_music_v1.bin"
region_change_music_v2:		"Sounds/region_change_music_v2.bin"
}
