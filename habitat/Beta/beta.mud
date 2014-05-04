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
	action	toggle_ghost_mode	/* 9  f1*/
	action  toggle_walking_music	/* 10 f2*/
	action  fn_key_pressed		/* 11 f3*/
	action  fn_key_pressed		/* 12 f4*/
	action  fn_key_pressed		/* 13 f5*/
	action	change_player_color	/* 14 f6*/
	action	ask_for_help		/* 15 f7*/
	action  fn_key_pressed		/* 16 f8*/
	action  boing			/* 17 */
	action	do_a_gesture		/* 18 */
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
	sound	message_sent
	sound	message_sent
	sound	message_received
	sound	message_sent
	sound	clothes_donned
	sound	clothes_doffed
	action	avatar_do		/* do */
	action	noEffect		/* reversed do */
	action	avatar_go		/* go */
	action	generic_cease		/* stop */
	action	avatar_get		/* get */
	action	avatar_put		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	action  avatar_WALK		/* 8 -- WALK* */
	action	avatar_ATTACK		/* 9 -- ATTACK* */
	action	avatar_BASH		/* 10 -- BASH* */
	action	noEffect		/* 11 -- was DIE */
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
	action	noEffect		/* 23 -- was REINCARNATE */
	action	avatar_THROW		/* 24 -- THROW* */
	action	noEffect
	action	noEffect
	action	noEffect
	action	avatar_WEAR		/* 28 -- WEAR* */
	action	avatar_REMOVE		/* 29 -- REMOVE* */
	action	avatar_PAID		/* 30 -- PAID* */
 	image	avatar_side_image
 	image	avatar_peng_image
 	image	avatar_spid_image
 	image	avatar_drag_image
	image	avatar_gunship_image
	image	avatar_tank_image
	image	avatar_tentacle_image

	byte	 48			/* Object instance length */
	byte	140			/* 128+12 Initialization count */
	byte	  7			/* Capacity */
}

class class_head 127 {
	action	head_do			/* do */
	action	generic_throw		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	head_get		/* get */
	action	noEffect		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	action	generic_goToAndDropAt	/* 8 -- internal */

	image	head_placeholder_0 0
	image	head_placeholder_1 1
	image	head_placeholder_2 2
	image	head_placeholder_3 3
	image	head_placeholder_4 4
	image	head_placeholder_5 5
	image	head_placeholder_6 6
	image	head_placeholder_7 7
	image	head_placeholder_8 8
	image	head_placeholder_9 9
	image	head_placeholder_10 10
	image	head_placeholder_11 11
	image	head_placeholder_12 12
	image	head_placeholder_13 13
	image	head_placeholder_14 14
	image	head_placeholder_15 15
	image	head_placeholder_16 16
	image	head_placeholder_17 17
	image	head_placeholder_18 18
	image	head_placeholder_19 19
	image	head_placeholder_20 20
	image	head_placeholder_21 21
	image	head_placeholder_22 22
	image	head_placeholder_23 23
	image	head_placeholder_24 24
	image	head_placeholder_25 25
	image	head_placeholder_26 26
	image	head_placeholder_27 27
	image	head_placeholder_28 28
	image	head_placeholder_29 29
	image	head_placeholder_30 30
	image	head_placeholder_31 31

	head	head_image_reserved
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
	head	head_image_106
	head	head_image_107
	head	head_image_108
	head	head_image_109
	head	head_image_110
	head	head_image_111
	head	head_image_112
	head	head_image_113
	head	head_image_114
	head	head_image_115
	head	head_image_116
	head	head_image_117
	head	head_image_118
	head	head_image_119
	head	head_image_120
	head	head_image_121
	head	head_image_122
	head	head_image_123
	head	head_image_124
	head	head_image_125
	head	head_image_126
	head	head_image_127
	head	head_image_128
	head	head_image_129
	head	head_image_130
	head	head_image_131
	head	head_image_132
	head	head_image_133
	head	head_image_134
	head	head_image_135
	head	head_image_136
	head	head_image_137
	head	head_image_138
	head	head_image_139
	head	head_image_140
	head	head_image_141
	head	head_image_142
	head	head_image_143
	head	head_image_144
	head	head_image_145
	head	head_image_146
	head	head_image_147
	head	head_image_148
	head	head_image_149
	head	head_image_150
	head	head_image_151
	head	head_image_152
	head	head_image_153
	head	head_image_154
	head	head_image_155
	head	head_image_156
	head	head_image_157
	head	head_image_158
	head	head_image_159
	head	head_image_160
	head	head_image_161
	head	head_image_162
	head	head_image_163
	head	head_image_164
	head	head_image_165
	head	head_image_166
	head	head_image_167
	head	head_image_168
	head	head_image_169
	head	head_image_170
	head	head_image_171
	head	head_image_172
	head	head_image_173
	head	head_image_174
	head	head_image_175
	head	head_image_176
	head	head_image_177
	head	head_image_178
	head	head_image_179
	head	head_image_180
	head	head_image_181
	head	head_image_182
	head	head_image_183
	head	head_image_184
	head	head_image_185
	head	head_image_186
	head	head_image_187
	head	head_image_188
	head	head_image_189
	head	head_image_190
	head	head_image_191
	head	head_image_192
	head	head_image_193
	head	head_image_194
	head	head_image_195
	head	head_image_196
	head	head_image_197
	head	head_image_198
	head	head_image_199
	head	head_image_200
	head	head_image_201
	head	head_image_202
	head	head_image_203
	head	head_image_204
	head	head_image_205
	head	head_image_206
	head	head_image_207
	head	head_image_208
	head	head_image_209
	head	head_image_210
	head	head_image_211
	head	head_image_212
	head	head_image_213
	head	head_image_214
	head	head_image_215
	head	head_image_216
	head	head_image_217
	head	head_image_218
	head	head_image_219
	head	head_image_220
	byte	16			/* 16 IS correct instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_ghost 3 {
	action	noEffect		/* do */
	action	illegal			/* reversed do */
	action	noEffect		/* go */
	action	generic_cease		/* stop */
	action	noEffect		/* get */
	action	noEffect		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	action	illegal			/* 8 */
	action	illegal			/* 9 */
	action	illegal			/* 10 */
	action	illegal			/* 11 */
	action	illegal			/* 12 */
	action	illegal			/* 13 */
	action	generic_SPEAK		/* 14 */
	image	ghost_image
	byte	15			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_amulet 2 {
	sound	magic
	sound	magic_pw
	action	generic_doMagic		/* do */
	action	generic_rdoMagic	/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndGet	/* get */
	action	noEffect		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	amulet_image
	byte	15			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_aquarium 129 {
	action	generic_depends		/* do */
	action	generic_throw		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndGet	/* get */
	action	noEffect		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	action	generic_CHANGESTATE	/* 8 -- CHANGESTATE* */
	image	aquarium_image
	byte	16			/* Object instance length */
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
	byte	15			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_bag 6 {
	sound	bag_opening
	sound	bag_closing
	action	generic_adjacentOpenCloseContainer /* do */
	action	generic_throw		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndPickFromOrGet /* get */
	action	generic_goToAndDropIntoIfOpen /* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	bag_image
	image	luggage_side_image
	byte	23			/* Object instance length */
	byte	137			/* 128+9 Initialization count */
	byte	 5			/* Capacity */
}

class class_ball 7 {
	action	generic_depends		/* do */
	action	generic_throw		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndGet	/* get */
	action	noEffect		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	ball_image
	image	boomerang_image
	byte	15			/* Object instance length */
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
	byte	16			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 1			/* Capacity */
}

class class_book 10 {
	action	book_do			/* do */
	action	generic_throw		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndGet	/* get */
	action	noEffect		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	book_end_image
	image	book_front_image
	image	magazine_image
	image	newspaper_image
	image	paper_image
	image	knick_knack_image_1
	image	bottle_image
	image	tablets_image		/* SPECIAL */
	image	paper_image		/* placholder stock was here */
	byte	16			/* Object instance length */
	byte	 7			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_bottle 12 {
	action	generic_depends		/* do */
	action	bottle_rdo		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndGet	/* get */
	action	noEffect		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	action	bottle_FILL		/* 8 */
	action	bottle_POUR		/* 9 */
	image	bottle_image
	byte	16			/* Object instance length */
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
	byte	28			/* Object instance length */
	byte	137			/* 128+9 Initialization count */
	byte	10			/* Capacity */
}

class class_bridge 131 {
	action	generic_depends		/* do */
	action	illegal			/* reversed do */
	action	generic_goToCursor	/* go */
	action	generic_cease		/* stop */
	action	noEffect		/* get */
	action	noEffect		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	bridge_side_image
	image	bridge_front_image
	byte	17			/* Object instance length */
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
	byte	15			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_bush 133 {
	action	generic_depends		/* do */
	action	illegal			/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	noEffect		/* get */
	action	noEffect		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	bush_image_0
	image	bush_image_1
	image	bush_image_2
	image	bush_image_3
	image	bush_image_4
	byte	15			/* Object instance length */
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
	image	cafe_chair_image	/* front */
	image	cafe_chair_image	/* side */
	byte	16			/* Object instance length */
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
	action	noEffect		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	action	changomatic_CHANGE	/* 8 -- CHANGE* */
	image	changomatic_image
	byte	15			/* Object instance length */
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
	image	door_image_0		/* a closet */
	image	chest_side_image
	image	filecabinet_image
	byte	38			/* Object instance length */
	byte	137			/* 128+9 Initialization count */
	byte	20			/* Capacity */
}

class class_club 16 {
	action	generic_depends		/* do */
	action	generic_strike		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndGet	/* get */
	action	noEffect		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	club_image
	byte	15			/* Object instance length */
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
	byte	15			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_compass 17 {
	action	generic_read		/* do */
	action	generic_throw		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndGet	/* get */
	action	noEffect		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	compass_image
	byte	15			/* Object instance length */
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
	byte	17			/* Object instance length */
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
	byte	23 /*21*/		/* Object instance length */
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
	action	noEffect		/* put */
	action	generic_askOracle	/* talk */
	action	generic_destroy		/* destroy */
	image	crystal_ball_image
	byte	15			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_die 21 {
	sound	magic_3
	sound	magic_3_pw
	action	die_do			/* do */
	action	generic_throw		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndGet	/* get */
	action	noEffect		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	action	generic_CHANGESTATE	/* 8 -- ROLL* */
	image	die_image
	image	double_die_image
	byte	16			/* Object instance length */
	byte	 7			/* Initialization count */
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
	byte	23 /*21*/		/* Object instance length */
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
	action	noEffect		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	door_image_0
	image	door_image_1
	image	door_image_2
	image	door_image_3
	image	door_glass
	image	door_dungeon
	image	door_junk		/* ? */
	byte	18			/* Object instance length */
	byte	 9			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_dropbox 24 {
	action	generic_depends		/* do */
	action	illegal			/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	noEffect		/* get */
	action	noEffect		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	dropbox_image
	byte	15			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_drugs 25 {
	action	drugs_do		/* do */
	action	generic_throw		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndGet	/* get */
	action	noEffect		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	action	drugs_TAKE		/* 8 */
	image	drugs_image
	byte	16			/* Object instance length */
	byte	 7			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_elevator 28 {
	sound	teleport_conf_wait
	sound	teleport_conf_wait_pw
	sound	teleport_departure
	sound	teleport_departure_pw
	sound	teleport_arrival
	sound	teleport_arrival_pw
	action	generic_depends		/* do */
	action	illegal			/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	noEffect		/* get */
	action	noEffect		/* put */
	action	elevator_talk		/* talk */
	action	generic_destroy		/* destroy */
	action	illegal			/* 8 -- not used */
	action	elevator_ZAPIN		/* 9 -- ZAPIN* */
	action	elevator_ZAPTO		/* 10 -- ZAPTO* */
	action	generic_broadcast	/* 11 -- internal ELEVATOR_BROADCAST*/
	image	elevator_image
	byte	16			/* Object instance length */
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
	action	noEffect		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	action	escape_device_BUGOUT	/* 8 */
	image	escape_device_image
	byte	16			/* Object instance length */
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
	action	noEffect		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	action	fake_gun_FAKESHOOT	/* 8 -- FAKESHOOT* */
	action	fake_gun_RESET		/* 9 -- RESET* */
	image	fake_gun_image
	byte	17			/* Object instance length */
	byte	 7			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_fence 138 {
	action	generic_depends		/* do */
	action	illegal			/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	noEffect		/* get */
	action	noEffect		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	fence_image
	byte	15			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_flag 29 {
	action	generic_depends		/* do */
	action	generic_throw		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_getMass		/* get */
	action	noEffect		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	action	generic_CHANGESTATE	/* 8 -- CHANGESTATE+ */
	image	flag_image
	byte	16			/* Object instance length */
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
	action	noEffect		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	action	generic_OFFLIGHT	/* 8 -- OFFLIGHT* */
	action	generic_ONLIGHT		/* 9 -- ONLIGHT* */
	image	flashlight_image
	image	torch_image
	image	knick_knack_image_0
	byte	16			/* Object instance length */
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
	action	noEffect		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	action	generic_OFFLIGHT	/* 8 -- OFFLIGHT* */
	action	generic_ONLIGHT		/* 9 -- ONLIGHT* */
	image	floor_lamp_image
	byte	16			/* Object instance length */
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
	action	generic_PAY		/* 8 */
	action	generic_coinOp		/* 9 -- internal COINOP */
	image	fortune_machine_image
	byte	15			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_fountain 141 {
	action	generic_depends		/* do */
	action	illegal			/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndFill	/* get */
	action	noEffect		/* put */
	action	generic_askOracle	/* talk */
	action	generic_destroy		/* destroy */
	image	fountain_image
	byte	15			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_bureaucrat 158 {
	action	generic_depends		/* do */
	action	illegal			/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	noEffect		/* get */
	action	noEffect		/* put */
	action	generic_askOracle	/* talk */
	action	generic_destroy		/* destroy */
	image	jack_in_a_box_image
	byte	16			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 1			/* Capacity */
}

class class_frisbee 31 {
	action	generic_depends		/* do */
	action	generic_throw		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndGet	/* get */
	action	noEffect		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	frisbee_image
	byte	15			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}
class class_game_piece 5 {
	sound	magic_2
	sound	magic_2_pw
	action	generic_chgState	/* do */
	action	generic_throw		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	telekenesis_get		/* get */
	action	noEffect		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	action	generic_CHANGESTATE	/* 8 -- CHANGESTATE* */
	image	game_piece_image
	byte	15			/* Object instance length */
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
	byte	38 /*27*/		/* Object instance length */
	byte	137			/* 128+9 Initialization count */
	byte	20 /*10*/		/* Capacity */
}

class class_gemstone 33 {
	sound	magic_2
	sound	magic_2_pw
	action	generic_doMagicIfMagic	/* do */
	action	generic_rdoMagicIfMagic	/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndGet	/* get */
	action	noEffect		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	gemstone_image
	byte	16			/* Object instance length */
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
	action	noEffect		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	action	grenade_EXPLODE		/* 8 -- EXPLODE+ */
	image	grenade_image
	byte	16			/* Object instance length */
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
	byte	15			/* Object instance length */
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
	action	noEffect		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	gun_image_0
	image	gun_image_1
	image	gun_image_2
	image	mauser_image
	byte	16			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_hand_of_god 38 {
	sound	hand_o_god_flame
	sound	hand_o_god_lightning
	sound	hand_o_god_lightning_pw
	action	generic_depends		/* do */
	action	noEffect		/* reversed do */
	action	noEffect		/* go */
	action	noEffect		/* stop */
	action	noEffect		/* get */
	action	noEffect		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	action	hand_of_god_BLAST	/* 8 -- BLAST* */
	image	hand_of_god_image
	image	cinder_image
	byte	16			/* Object instance length */
	byte	 7			/* Initialization count */
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
	byte	28			/* Object instance length */
	byte	137			/* 128+9 Initialization count */
	byte	10			/* Capacity */
}

class class_house_cat 143 {
	action	generic_depends		/* do */
	action	illegal			/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	noEffect		/* get */
	action	noEffect		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	house_cat_image
	byte	15			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_hot_tub 144 {
	action	generic_depends		/* do */
	action	illegal			/* reversed do */
	action	generic_goToCursor	/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndFill	/* get */
	action	noEffect		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	hot_tub_image
	byte	21			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 6			/* Capacity */
}

class class_flat 93 {
	action	generic_depends		/* do */
	action	illegal			/* reversed do */
	action	trap_go			/* go */
	action	generic_cease		/* stop */
	action	noEffect		/* get */
	action	trap_put		/* put */
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
	image	pipes_image
	byte	16			/* Object instance length */
	byte	 7			/* Initialization count */
	byte	 0			/* Capacity */
}


class class_key 42 {
	action	key_do			/* do */
	action	generic_throw		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndGet	/* get */
	action	noEffect		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	key_image_0
	image	key_image_1
	byte	17			/* Object instance length */
	byte	 8			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_knick_knack 43 {
	sound	magic_3
	sound	magic_3_pw
	action	generic_doMagicIfMagic	/* do */
	action	generic_rdoMagicIfMagic	/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndGet	/* get */
	action	noEffect		/* put */
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
	image	cups_image
	byte	16			/* Object instance length */
	byte	 7			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_knife 44 {
	action	generic_depends		/* do */
	action	generic_strike		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndGet	/* get */
	action	noEffect		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	knife_image_0
	image	knife_image_1
	byte	15			/* Object instance length */
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
	action	noEffect		/* put */
	action	magic_lamp_talk		/* talk */
	action	generic_destroy		/* destroy */
	action	magic_lamp_WISH		/* 8 -- WISH* */
	action	magic_lamp_RUB		/* 9 -- RUB* */
	action  generic_broadcast	/* 10--internal MAGIC_LAMP_BROADCAST*/
	image	magic_lamp_image
	byte	17			/* Object instance length */
	byte	 8			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_magic_staff 46 {
	sound	magic_4
	sound	magic_4_pw
	action	generic_doMagic		/* do */
	action	generic_rdoMagic	/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndGet	/* get */
	action	noEffect		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	magic_staff_image
	image	pitchfork_image
	byte	15			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}


class class_magic_immobile 97 {
	sound	magic_4
	sound	magic_4_pw
	action	generic_adjacentDoMagic	/* do */
	action	illegal			/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	noEffect		/* get */
	action	noEffect		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	action	button_CHANGESTATE	/* 8 */
	image	ball_image
	image	switches_image
	image	dials_image
	image	bush_image_1
	image	bush_image_2
	image	bush_image_3
	image	streetlamp_image_0
	image	rock_image_1
	image	rock_image_2
	image	pond_image
	image	flag_image
	image	coke_machine_image_1
	image	plant_image_2
	image	tree_image_0
	image	tree_image_1
	image	tree_image_2
	image	tree_image_3
	image	tree_image_4
	image	tree_image_5
	image	tree_image_6
	image	pipes_image
	byte	15			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_magic_container 99 {
	sound	magic_4
	sound	magic_4_pw
	action	generic_adjacentDoMagic	/* do */
	action	illegal			/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndPickFrom	/* get */
	action	generic_goToAndDropInto	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	magic_wall_image
	image	copier_image
	byte	47			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	32			/* Capacity */
}

class	class_glue 98 {
	action	illegal			/* do */
	action	illegal			/* reversed do */
	action	illegal			/* go */
	action	illegal			/* stop */
	action	illegal			/* get */
	action	illegal			/* put */
	action	illegal			/* talk */
	action	illegal			/* destroy */
	image	glue_image
	byte	36			/* Object instance length */
	byte	21			/* Initialization count */
	byte	 6			/* Capacity */
}

class class_magic_wand 47 {
	sound	magic
	sound	magic_pw
	action	generic_doMagic		/* do */
	action	generic_rdoMagic	/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndGet	/* get */
	action	noEffect		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	magic_wand_image_0
	image	magic_wand_image_1
	image	magic_wand_image_2
	image	magic_wand_image_3
	image	teddy_bear_image
	byte	15			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_mailbox 48 {
	action	generic_depends		/* do */
	action	illegal			/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	noEffect		/* get */
	action	noEffect		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	mailbox_image
	byte	16			/* Object instance length */
	byte	 7			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_matchbook 49 {
	action	generic_read		/* do */
	action	generic_throw		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndGet	/* get */
	action	noEffect		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	matchbook_image
	byte	15			/* Object instance length */
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
	action	noEffect		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	action	generic_OFF		/* 8 -- OFF* */
	action	generic_ON		/* 9 -- ON* */
	image	movie_camera_image
	image	umbrella_image
	image	knick_knack_image_3
	image	knick_knack_image_4
	image	knick_knack_image_5
	image	frisbee_image
	byte	16			/* Object instance length */
	byte	 7			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_paper 54 {
	sound	successful_esp_activation
	action	paper_do		/* do */
	action	generic_throw		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndGet	/* get */
	action	noEffect		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	paper_image
	byte	15			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_pawn_machine 96 {
	sound	pawn_machine_munching
	sound	pawn_machine_munching_pw
	action	pawn_machine_do		/* do */
	action	illegal			/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndPickFrom	/* get */
	action	generic_goToAndDropInto	/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	action	pawn_machine_MUNCH	/* 8 -- MUNCH */
	image	pawn_machine_image
	image	pawnstock_image
	byte	19			/* Object instance length */
	byte	 9			/* Initialization count */
	byte	 1			/* Capacity */
}

class class_plaque 55 {
	action	plaque_do		/* do */
	action	generic_throw		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	illegal			/* get */
	action	illegal			/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	tv_image_0
	image	window_image_0
	image	plaque_image
	byte	16			/* Object instance length */
	byte	 7			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_short_sign 56 {
	action	generic_depends		/* do */
	action	illegal			/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	noEffect		/* get */
	action	noEffect		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	sign_image_0
	image	sign_image_1
	image	sign_image_2
	image	sign_image_3
	image	sign_image_4
	image	sign_image_5
	image	sign_image_6
	byte	25			/* Object instance length */
	byte	16			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_sign 57 {
	action	generic_depends		/* do */
	action	illegal			/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	noEffect		/* get */
	action	noEffect		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	sign_image_0
	image	sign_image_1
	image	sign_image_2
	image	sign_image_3
	image	sign_image_4
	image	sign_image_5
	image	sign_image_6
	byte	55			/* Object instance length */
	byte	46			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_plant 58 {
	action	generic_depends		/* do */
	action	generic_throw		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_getMass		/* get */
	action	noEffect		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	plant_image_0
	image	plant_image_1
	image	plant_image_2
	byte	16			/* Object instance length */
	byte	 7			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_pond 147 {
	action	generic_depends		/* do */
	action	illegal			/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndFill	/* get */
	action	noEffect		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	pond_image
	byte	15			/* Object instance length */
	byte	 6/*??*/		/* Initialization count */
	byte	 0			/* Capacity */
}

class class_ring 60 {
	sound	magic_2
	sound	magic_2_pw
	action	generic_doMagic		/* do */
	action	generic_rdoMagic	/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndGet	/* get */
	action	noEffect		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	ring_image
	byte	15			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_rock 61 {
	action	generic_depends		/* do */
	action	generic_throw		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_getMass		/* get */
	action	noEffect		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	rock_image_0
	image	rock_image_1
	image	rock_image_2
	byte	16			/* Object instance length */
	byte	 7			/* Initialization count */
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
	byte	28 /*22*/		/* Object instance length */
	byte	 137			/* 128+9 Initialization count */
	byte	10 /* 5*/		/* Capacity */
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
	action	noEffect		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	action	sensor_SCAN		/* 8 -- SCAN* */
	image	sensor_image
	byte	15			/* Object instance length */
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
	action	noEffect		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	action	sex_changer_SEXCHANGE	/* 8 -- SEXCHANGE* */
	image	sex_changer_image
	byte	15			/* Object instance length */
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
	action	noEffect		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	action	shovel_DIG		/* 8 -- DIG* */
	image	shovel_image
	byte	15			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_spray_can 95 {
	sound	spray_can_hiss
	action	spray_can_do		/* do */
	action	noEffect		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndGet	/* get */
	action	noEffect		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy  */
	action	spray_can_SPRAY		/* 8 -- SPRAY* */
	image	spray_can_image
	byte	15			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_picture 152 {
	action	generic_depends		/* do */
	action	illegal			/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	noEffect		/* get */
	action	noEffect		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	picture_image_0
	image	picture_image_1
	image	picture_image_2
	image	picture_image_3
	byte	17			/* Object instance length */
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
	image	pipes_image
	byte	15			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_stocks 70 {
	action	tokens_do		/* do */
	action	tokens_rdo		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndGet	/* get */
	action	noEffect		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	stocks_image
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
	byte	17			/* Object instance length */
	byte	 8			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_streetlamp 154 {
	action	generic_depends		/* do */
	action	illegal			/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	noEffect		/* get */
	action	noEffect		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	streetlamp_image_0
	image	streetlamp_image_1
	byte	15			/* Object instance length */
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
	action	noEffect		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	gun_image_2
	byte	16			/* Object instance length */
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
	image	countertop_image
	image	display_case_image
	image	bulletin_board_image
	byte	23 /*18*/		/* Object instance length */
	byte	 9			/* Initialization count */
	byte	 5 /* 4*/		/* Capacity */
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
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	noEffect		/* get */
	action	teleport_put		/* put */
	action	teleport_talk		/* talk */
	action	generic_destroy		/* destroy */
	action	teleport_PAY		/* 8 -- PAY* */
	action	teleport_ZAPIN		/* 9 -- ZAPIN* */
	action	teleport_ZAPTO		/* 10 -- ZAPTO* */
	action	generic_coinOp		/* 11 -- internal TELEPORT_COINOP */
	action  generic_broadcast	/* 12 -- internal TELEPORT_BROADCAST*/
	image	teleport_image
	byte	16			/* Object instance length */
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
	byte	15			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_ticket 75 {
	action	generic_read		/* do */
	action	generic_throw		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndGet	/* get */
	action	noEffect		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	ticket_image
	byte	16			/* Object instance length */
	byte	 7			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_tokens 76 {
	action	tokens_do		/* do */
	action	tokens_rdo		/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	generic_goToAndGet	/* get */
	action	noEffect		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	tokens_image
	byte	17			/* Object instance length */
	byte	 8			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_trapezoid 87 {
	action	generic_depends		/* do */
	action	illegal			/* reversed do */
	action	trap_go			/* go */
	action	generic_cease		/* stop */
	action	noEffect		/* get */
	action	trap_put		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	action	sky_go			/* 8 - internal */
	action	wall_go			/* 9 - internal */
	action	generic_goToCursor	/* 10 - internal */
	action	noEffect		/* 11 - internal */
	image	trapezoid_image
	image	trapezoid_rock_image
	byte	21			/* Object instance length */
	byte	12			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_super_trapezoid 92 {
	action	generic_depends		/* do */
	action	illegal			/* reversed do */
	action	trap_go			/* go */
	action	generic_cease		/* stop */
	action	noEffect		/* get */
	action	trap_put		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	action	sky_go			/* 8 - internal */
	action	wall_go			/* 9 - internal */
	action	generic_goToCursor	/* 10 - internal */
	action	noEffect		/* 11 - internal */
	image	super_trapezoid_image
	byte	55			/* Object instance length */
	byte	46			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_tree 156 {
	action	generic_depends		/* do */
	action	illegal			/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	noEffect		/* get */
	action	noEffect		/* put */
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
	image	bush_image_4		/* randy's fault */
	image	banner_image
	byte	15			/* Object instance length */
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
	byte	30			/* Object instance length */
	byte	139			/* 128+11 Initialization count */
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
	byte	20			/* Object instance length */
	byte	 9			/* Initialization count */
	byte	 2			/* Capacity */
}

class class_wall 80 {
	action	generic_depends		/* do */
	action	illegal			/* reversed do */
	action	wall_go			/* go */
	action	generic_cease		/* stop */
	action	noEffect		/* get */
	action	noEffect		/* put */
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
	image	pipes_image
	byte	15			/* Object instance length */
	byte	 6			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_window 157 {
	action	generic_depends		/* do */
	action	illegal			/* reversed do */
	action	generic_goTo		/* go */
	action	generic_cease		/* stop */
	action	noEffect		/* get */
	action	noEffect		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	image	window_image_0
	image	window_image_1
	image	window_image_2
	image	window_image_3
	byte	15			/* Object instance length */
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
	action	noEffect		/* put */
	action	generic_broadcast	/* talk */
	action	generic_destroy		/* destroy */
	action	windup_toy_WIND		/* 8 -- WIND* */
	image	windup_doll_image
	image	windup_penguin_image
	byte	16			/* Object instance length */
	byte	 7			/* Initialization count */
	byte	 0			/* Capacity */
}

class class_zone 255 {
	image	zone_image
	byte	41
	byte	32
	byte	0
}

head {

head_image_reserved:		"Images/nillhead.bin"	/* 1st reserved */
head_image_1:			"Images/head0.bin"
head_image_2:			"Images/head1.bin"
head_image_3:			"Images/head2.bin"
head_image_4:			"Images/head3.bin"
head_image_5:			"Images/head4.bin"
head_image_6:			"Images/head5.bin"
head_image_7:			"Images/head6.bin"
head_image_8:			"Images/head7.bin"
head_image_9:			"Images/beard0.bin"
head_image_10:			"Images/block0.bin"
head_image_11:			"Images/buckw0.bin"
head_image_12:			"Images/dragon0.bin"
head_image_13:			"Images/fly0.bin"
head_image_14:			"Images/helmet0.bin"
head_image_15:			"Images/lioness.bin"
head_image_16:			"Images/lizard0.bin"
head_image_17:			"Images/ming0.bin"
head_image_18:			"Images/skull0.bin"
head_image_19:			"Images/stalk0.bin"
head_image_20:			"Images/tiger.bin"
head_image_21:			"Images/woman0.bin"
head_image_22:			"Images/robot0.bin"
head_image_23:			"Images/ostrich0.bin"
head_image_24:			"Images/turkey0.bin"
head_image_25:			"Images/sailor0.bin"
head_image_26:			"Images/bizzaro0.bin"
head_image_27:			"Images/dobbs0.bin"
head_image_28:			"Images/coolcat0.bin"
head_image_29:			"Images/duck0.bin"
head_image_30:			"Images/grandma0.bin"
head_image_31:			"Images/groucho.bin"
head_image_32:			"Images/shades0.bin"
head_image_33:			"Images/thug0.bin"
head_image_34:			"Images/viking0.bin"
head_image_35:			"Images/vampire0.bin"
head_image_36:			"Images/bozo0.bin"
head_image_37:			"Images/cyclops0.bin"
head_image_38:			"Images/fishead0.bin"
head_image_39:			"Images/tex0.bin"
head_image_40:			"Images/tophat0.bin"
head_image_41:			"Images/bean0.bin"
head_image_42:			"Images/cent0.bin"
head_image_43:			"Images/pirate1.bin"
head_image_44:			"Images/pirate2.bin"
head_image_45:			"Images/tknot1.bin"
head_image_46:			"Images/tknot2.bin"
head_image_47:			"Images/hillbilly0.bin"
head_image_48:			"Images/coldlady0.bin"
head_image_49:			"Images/turban0.bin"
head_image_50:			"Images/fstien0.bin"
head_image_51:			"Images/phair0.bin"
head_image_52:			"Images/darth0.bin"
head_image_53:			"Images/afro0.bin"
head_image_54:			"Images/milkman0.bin"
head_image_55:			"Images/wimpy0.bin"
head_image_56:			"Images/woman1.bin"
head_image_57:			"Images/sherlock0.bin"
head_image_58:			"Images/hunter0.bin"
head_image_59:			"Images/metro0.bin"
head_image_60:			"Images/hammer0.bin"
head_image_61:			"Images/rabbit0.bin"
head_image_62:			"Images/witch0.bin"
head_image_63:			"Images/army0.bin"
head_image_64:			"Images/bigmama0.bin"
head_image_65:			"Images/dandy0.bin"
head_image_66:			"Images/mr_mike0.bin"
head_image_67:			"Images/tonto0.bin"
head_image_68:			"Images/oldman0.bin"
head_image_69:			"Images/santa0.bin"
head_image_70:			"Images/jerk0.bin"
head_image_71:			"Images/fhippie0.bin"
head_image_72:			"Images/jaws0.bin"
head_image_73:			"Images/brain0.bin"
head_image_74:			"Images/oink0.bin"
head_image_75:			"Images/doctor0.bin"
head_image_76:			"Images/princess0.bin"
head_image_77:			"Images/mouse0.bin"
head_image_78:			"Images/wizard0.bin"
head_image_79:			"Images/madsci0.bin"
head_image_80:			"Images/pigtail0.bin"
head_image_81:			"Images/chef0.bin"
head_image_82:			"Images/bum0.bin"
head_image_83:			"Images/newsboy0.bin"
head_image_84:			"Images/gabor0.bin"
head_image_85:			"Images/ninja0.bin"
head_image_86:			"Images/statesman0.bin"
head_image_87:			"Images/irma0.bin"
head_image_88:			"Images/dodo0.bin"
head_image_89:			"Images/tasha0.bin"
head_image_90:			"Images/scruffy0.bin"
head_image_91:			"Images/grit0.bin"
head_image_92:			"Images/army1.bin"
head_image_93:			"Images/penguin0.bin"
head_image_94:			"Images/chaplin0.bin"
head_image_95:			"Images/nailhead0.bin"
head_image_96:			"Images/ascot0.bin"
head_image_97:			"Images/satan0.bin"
head_image_98:			"Images/angel0.bin"
head_image_99:			"Images/angel1.bin"
head_image_100:			"Images/spacesuit0.bin"
head_image_101:			"Images/princess1.bin"
head_image_102:			"Images/boone0.bin"
head_image_103:			"Images/moto0.bin"
head_image_104:			"Images/hardhat0.bin"
head_image_105:			"Images/hiawatha0.bin"
head_image_106:			"Images/gamorrean0.bin"
head_image_107:			"Images/juvie0.bin"
head_image_108:			"Images/beaver0.bin"
head_image_109:			"Images/phydeaux0.bin"
head_image_110:			"Images/smiley0.bin"
head_image_111:			"Images/unicorn0.bin"
head_image_112:			"Images/mbeany0.bin"
head_image_113:			"Images/fbeany0.bin"
head_image_114:			"Images/executioner0.bin"
head_image_115:			"Images/keystone0.bin"
head_image_116:			"Images/airforce0.bin"
head_image_117:			"Images/cootie0.bin"
head_image_118:			"Images/tonto1.bin"
head_image_119:			"Images/mask.bin"
head_image_120:			"Images/rhood.bin"
head_image_121:			"Images/knight1.bin"
head_image_122:			"Images/knight2.bin"
head_image_123:			"Images/king.bin"
head_image_124:			"Images/angelwing.bin"
head_image_125:			"Images/deviltail.bin"
head_image_126:			"Images/plughead.bin"
head_image_127:			"Images/brain.bin"
head_image_128:			"Images/bem1.bin"
head_image_129:			"Images/bem2.bin"
head_image_130:			"Images/brow.bin"
head_image_131:			"Images/bimbi.bin"
head_image_132:			"Images/pothead.bin"
head_image_133:			"Images/bluehorn.bin"
head_image_134:			"Images/cleo.bin"
head_image_135:			"Images/demon1.bin"
head_image_136:			"Images/invsman.bin"
head_image_137:			"Images/rotohead.bin"
head_image_138:			"Images/wwolf.bin"
head_image_139:			"Images/bem3.bin"
head_image_140:			"Images/baron.bin"
head_image_141:			"Images/elephead.bin"
head_image_142:			"Images/melvin.bin"
head_image_143:			"Images/demon2.bin"
head_image_144:			"Images/rivithead.bin"
head_image_145:			"Images/riotcop.bin"
head_image_146:			"Images/peakhead.bin"
head_image_147:			"Images/jaggi.bin"
head_image_148:			"Images/resident.bin"
head_image_149:			"Images/kitty3.bin"
head_image_150:			"Images/pony4.bin"
head_image_151:			"Images/steve.bin"
head_image_152:			"Images/george.bin"
head_image_153:			"Images/deer.bin"
head_image_154:			"Images/bluegill.bin"
head_image_155:			"Images/bolthead.bin"
head_image_156:			"Images/necknod.bin"
head_image_157:			"Images/bride.bin"
head_image_158:			"Images/groom.bin"
head_image_159:			"Images/minister.bin"
head_image_160:			"Images/sheriff.bin"
head_image_161:			"Images/monk.bin"
head_image_162:			"Images/newhab1.bin"
head_image_163:			"Images/newhab3.bin"
head_image_164:			"Images/newhab5.bin"
head_image_165:			"Images/newhab6.bin"
head_image_166:			"Images/newhab7.bin"
head_image_167:			"Images/newhab8.bin"
head_image_168:			"Images/newhab9.bin"
head_image_169:			"Images/newhab10.bin"
head_image_170:			"Images/newhab11.bin"
head_image_171:			"Images/newhab13.bin"
head_image_172:			"Images/newhab14.bin"
head_image_173:			"Images/newhab15.bin"
head_image_174:			"Images/newhab16.bin"
head_image_175:			"Images/newhab17.bin"
head_image_176:			"Images/newhab18.bin"
head_image_177:			"Images/newhab19.bin"
head_image_178:			"Images/newhab20.bin"
head_image_179:			"Images/newhab21.bin"
head_image_180:			"Images/newhab22.bin"
head_image_181:			"Images/newhab23.bin"
head_image_182:			"Images/newhab24.bin"
head_image_183:			"Images/kenhead201.bin"
head_image_184:			"Images/kenhead202.bin"
head_image_185:			"Images/kenhead203.bin"
head_image_186:			"Images/kenhead205.bin"
head_image_187:			"Images/kenhead206.bin"
head_image_188:			"Images/kenhead207.bin"
head_image_189:			"Images/kenhead208.bin"
head_image_190:			"Images/kenhead209.bin"
head_image_191:			"Images/kenhead210.bin"
head_image_192:			"Images/kenhead211.bin"
head_image_193:			"Images/kenhead212.bin"
head_image_194:			"Images/kenhead213.bin"
head_image_195:			"Images/kenhead214.bin"
head_image_196:			"Images/kenhead215.bin"
head_image_197:			"Images/kenhead216.bin"
head_image_198:			"Images/kenhead217.bin"
head_image_199:			"Images/kenhead218.bin"
head_image_200:			"Images/kenhead219.bin"
head_image_201:			"Images/kenhead220.bin"
head_image_202:			"Images/kenhead221.bin"
head_image_203:			"Images/kenhead222.bin"
head_image_204:			"Images/kenhead223.bin"
head_image_205:			"Images/kenhead224.bin"
head_image_206:			"Images/kenhead225.bin"
head_image_207:			"Images/kenhead226.bin"
head_image_208:			"Images/kenhead227.bin"
head_image_209:			"Images/kenhead228.bin"
head_image_210:			"Images/kenhead229.bin"
head_image_211:			"Images/kenhead230.bin"
head_image_212:			"Images/kenhead231.bin"
head_image_213:			"Images/kenhead232.bin"
head_image_214:			"Images/kenhead233.bin"
head_image_215:			"Images/kenhead234.bin"
head_image_216:			"Images/kenhead235.bin"
head_image_217:			"Images/kenhead236.bin"
head_image_218:			"Images/kenhead237.bin"
head_image_219:			"Images/kenhead238.bin"
head_image_220:			"Images/kenhead239.bin"
}

image {

	/* DO NOT REARRANGE THIS LIST, YOU MAY ADD TO THE BOTTOM. */

head_placeholder_0:		"Images/undefined0.bin"		0	-12
head_placeholder_1:		"Images/undefined1.bin"		0	-12
head_placeholder_2:		"Images/undefined2.bin"		0	-12
head_placeholder_3:		"Images/undefined3.bin"		0	-12
head_placeholder_4:		"Images/undefined4.bin"		0	-12
head_placeholder_5:		"Images/undefined5.bin"		0	-12
head_placeholder_6:		"Images/undefined6.bin"		0	-12
head_placeholder_7:		"Images/undefined7.bin"		0	-12
head_placeholder_8:		"Images/undefined8.bin"		0	-12
head_placeholder_9:		"Images/undefined9.bin"		0	-12
head_placeholder_10:		"Images/undefined10.bin"	0	-12
head_placeholder_11:		"Images/undefined11.bin"	0	-12
head_placeholder_12:		"Images/undefined12.bin"	0	-12
head_placeholder_13:		"Images/undefined13.bin"	0	-12
head_placeholder_14:		"Images/undefined14.bin"	0	-12
head_placeholder_15:		"Images/undefined15.bin"	0	-12
head_placeholder_16:		"Images/undefined16.bin"	0	-12
head_placeholder_17:		"Images/undefined17.bin"	0	-12
head_placeholder_18:		"Images/undefined18.bin"	0	-12
head_placeholder_19:		"Images/undefined19.bin"	0	-12
head_placeholder_20:		"Images/undefined20.bin"	0	-12
head_placeholder_21:		"Images/undefined21.bin"	0	-12
head_placeholder_22:		"Images/undefined22.bin"	0	-12
head_placeholder_23:		"Images/undefined23.bin"	0	-12
head_placeholder_24:		"Images/undefined24.bin"	0	-12
head_placeholder_25:		"Images/undefined25.bin"	0	-12
head_placeholder_26:		"Images/undefined26.bin"	0	-12
head_placeholder_27:		"Images/undefined27.bin"	0	-12
head_placeholder_28:		"Images/undefined28.bin"	0	-12
head_placeholder_29:		"Images/undefined29.bin"	0	-12
head_placeholder_30:		"Images/undefined30.bin"	0	-12
head_placeholder_31:		"Images/undefined31.bin"	0	-12

avatar_side_image:		"Images/Avatar.bin"	8	0
avatar_peng_image:		"Images/Peng.bin"	8	0
avatar_spid_image:		"Images/Spid.bin"	8	0
avatar_drag_image:		"Images/Drag.bin"	8	0
avatar_gunship_image:		"Images/Gunship.bin"	0	0
avatar_tank_image:		"Images/Tank.bin"	8	0


amulet_image:			"Images/amulet.bin"	0	-4

answering_machine_image:	"Images/ans.bin"	0	-12

aquarium_image:			"Images/ftank2.bin"	28	-16

atm_image:			"Images/atm.bin"	16	-4

bag_image:			"Images/bag.bin"	0	-4

luggage_side_image:		"Images/luggages.bin"	0	-4

ball_image:			"Images/ball1.bin"	0	-36

switches_image:			"Images/switches.bin"	0	4

dials_image:			"Images/dials.bin"	0	8

glue_image:			"Images/glue0.bin"	0	20

bed_side_image:			"Images/beds.bin"	56	20

book_end_image:			"Images/booke.bin"	0	0
book_front_image:		"Images/bookf.bin"	0	-8
magazine_image:			"Images/mag.bin"	0	-4
newspaper_image:		"Images/news.bin"	0	-4
tablets_image:			"Images/tablets.bin"	0	-12
stocks_image:			"Images/stock0.bin"	0	-12

boomerang_image:		"Images/brang.bin"	0	-8

bottle_image:			"Images/bottle.bin"	0	-4

cups_image:			"Images/cups0.bin"	0	-4

box_image:			"Images/box1.bin"	0	-8

treasure_chest_image:		"Images/trchest.bin"	0	-8

bridge_side_image:		"Images/bridges.bin"	84	-8
bridge_front_image:		"Images/bridgef.bin"	40	4

bush_image_0:			"Images/bush1.bin"	16	-8
bush_image_1:			"Images/bush2.bin"	12	-12
bush_image_2:			"Images/bush3.bin"	16	8
bush_image_3:			"Images/bush4.bin"	12	4
bush_image_4:			"Images/grass0.bin"	0	28

chair_front_back_image:		"Images/chairfb.bin"	20	-12
chair_side_image:		"Images/chairs.bin"	20	-4

bar_stool_image:		"Images/stool0.bin"	16	4

changomatic_image:		"Images/chango.bin"	0	-12

chest_front_image:		"Images/chestf.bin"	32	-12
chest_side_image:		"Images/chests.bin"	24	-4

club_image:			"Images/club2.bin"	0	-36

coke_machine_image_1:		"Images/coke1.bin"	24	-4

compass_image:			"Images/compass.bin"	0	-4

couch_front_back_image:		"Images/couchfb.bin"	56	12
couch_side_image:		"Images/couchs.bin"	28	-8

countertop_image:		"Images/counter0.bin"	44	0

crystal_ball_image:		"Images/cball0.bin"	0	-12

die_image:			"Images/die.bin"	0	-12
double_die_image:		"Images/die2.bin"	0	-12

display_case_image:		"Images/dcase.bin"	44	-24

door_image_0:			"Images/door1.bin"	28	-16
door_image_1:			"Images/door2.bin"	28	-16

dropbox_image:			"Images/mdrop.bin"	16	-12

drugs_image:			"Images/pillbot.bin"	0	-4

elevator_image:			"Images/tube0.bin"	28	0

escape_device_image:		"Images/escaper.bin"	0	4

fake_gun_image:			"Images/fgun1.bin"	0	-12

fence_image:			"Images/fence1.bin"	28	8

flag_image:			"Images/flag.bin"	0	-8

flashlight_image:		"Images/flite.bin"	0	-8
torch_image:			"Images/torch0.bin"	0	-8

floor_lamp_image:		"Images/flamp.bin"	8	-8

fortune_machine_image:		"Images/fortun.bin"	8	-8

fountain_image:			"Images/fount2.bin"	44	-8

jack_in_a_box_image:		"Images/bbox0.bin"	20	0

frisbee_image:			"Images/fris.bin"	0	-16

garbage_can_image:		"Images/gcan.bin"	16	-4
kitchen_garbage_image:		"Images/kcan.bin"	12	-8

gemstone_image:			"Images/gem.bin"	0	-8

ghost_image:			"Images/eye0.bin"	0	20

grenade_image:			"Images/gren.bin"	0	-4

ground_image_0:			"Images/floor0.bin"	0	4
ground_image_1:			"Images/floor1.bin"	0	4

gun_image_0:			"Images/gun1.bin"	0	-8
gun_image_1:			"Images/gun2.bin"	0	-8
gun_image_2:			"Images/gun3.bin"	0	-8
mauser_image:			"Images/maus.bin"	0	-16

hand_of_god_image:		"Images/hand.bin"	0	-52
cinder_image:			"Images/cinder.bin"	0	-8

hole_image:			"Images/hole0.bin"	0	12

house_image:			"Images/house2.bin"	56	-4

house_cat_image:		"Images/cat.bin"	24	4

hot_tub_image:			"Images/hottub.bin"	60	8

instant_object_pill_image:	"Images/mpill.bin"	0	-8

jukebox_image:			"Images/juke.bin"	24	-12

key_image_0:			"Images/key1.bin"	0	-12
key_image_1:			"Images/ccard.bin"	0	-4

knick_knack_image_0:		"Images/kk1.bin"	0	-8
knick_knack_image_1:		"Images/kk2.bin"	0	-8
knick_knack_image_2:		"Images/kk3.bin"	0	-8
knick_knack_image_3:		"Images/vase.bin"	0	-4
knick_knack_image_4:		"Images/jug0.bin"	0	-8
knick_knack_image_5:		"Images/saw.bin"	0	-24

knife_image_0:			"Images/knife1.bin"	0	-16
knife_image_1:			"Images/knife2.bin"	0	-16

magic_lamp_image:		"Images/mlamp2.bin"	0	-20

magic_staff_image:		"Images/mstaff.bin"	0	-8
magic_wand_image_0:		"Images/wand1.bin"	0	-4
magic_wand_image_1:		"Images/wand2.bin"	0	-12
magic_wand_image_2:		"Images/wand3.bin"	0	-12
magic_wand_image_3:		"Images/wand4.bin"	0	-12

mailbox_image:			"Images/mbox.bin"	12	-8

matchbook_image:		"Images/mbook0.bin"	0	-8

microphone_image:		"Images/mic0.bin"	0	-8

movie_camera_image:		"Images/camera0.bin"	0	0

paper_image:			"Images/paper.bin"	0	-4

pawn_machine_image:		"Images/pawn.bin"	28	-24

plant_image_0:			"Images/plant1.bin"	0	0
plant_image_1:			"Images/plant2.bin"	0	-4
plant_image_2:			"Images/plant3.bin"	0	-4

pond_image:			"Images/pond0.bin"	0	60

ring_image:			"Images/mring.bin"	0	-8

road_pizza_image:		"Images/flat.bin"	0	-8

rock_image_0:			"Images/rock1.bin"	0	-4
rock_image_1:			"Images/rock2.bin"	0	-8
rock_image_2:			"Images/rock3.bin"	24	4

rubber_ducky_image:		"Images/rduk.bin"	0	-4

safe_image:			"Images/safe1.bin"	0	-4

security_device_image:		"Images/security.bin"	0	-8

sensor_image:			"Images/sensor.bin"	0	-12

sex_changer_image:		"Images/sexo.bin"	24	-4

shovel_image:			"Images/shovel0.bin"	0	-4

picture_image_0:		"Images/varpicture.bin"	16	36
picture_image_1:		"Images/picture1.bin"	16	-4
picture_image_2:		"Images/picture2.bin"	48	4
picture_image_3:		"Images/picture3.bin"	28	16

sign_image_0:			"Images/sign0.bin"	24	12
sign_image_1:			"Images/sign1.bin"	24	20
sign_image_2:			"Images/sign2.bin"	8	4
sign_image_3:			"Images/sign3.bin"	8	-44
sign_image_4:			"Images/sign4.bin"	48	20
sign_image_5:			"Images/sign5.bin"	8	4
sign_image_6:			"Images/sign6.bin"	52	8

sky_image_2:			"Images/bwall3.bin"

sky_image_3:			"Images/bwall4.bin"
sky_image_4:			"Images/bwall5.bin"
sky_image_5:			"Images/bwall6.bin"
sky_image_6:			"Images/bwall7.bin"
sky_image_7:			"Images/bwall8.bin"
mountain_image_0:		"Images/mount1.bin"	0	68
cave_image_0:			"Images/cave0.bin"	0	44

spray_can_image:		"Images/patgun0.bin"	0	-12

stereo_image:			"Images/tapep.bin"	0	-8

street_image:			"Images/road0.bin"	0	-44

streetlamp_image_0:		"Images/slite1.bin"	16	-4
streetlamp_image_1:		"Images/slite2.bin"	16	-4

table_image:			"Images/table0.bin"	32	-12

tape_image:			"Images/cassette.bin"	0	-4

teddy_bear_image:		"Images/tbear.bin"	0	-8

telephone_image_0:		"Images/phone1.bin"	0	16

teleport_image:			"Images/port7.bin"	24	-4

ticket_image:			"Images/ticket.bin"	0	4

tokens_image:			"Images/tok.bin"	0	-4

towel_image:			"Images/towel.bin"	0	-8

trapezoid_image:		"Images/trap0.bin"

trapezoid_rock_image:		"Images/trap1.bin"
super_trapezoid_image:		"Images/super_trap.bin"

tree_image_0:			"Images/tree1.bin"	16	-8
tree_image_1:			"Images/tree2.bin"	16	-8
tree_image_2:			"Images/palm2.bin"	16	-4
tree_image_3:			"Images/tree4.bin"	16	4
tree_image_4:			"Images/tree5.bin"	24	12
tree_image_5:			"Images/tree6.bin"	16	4
tree_image_6:			"Images/tree7.bin"	16	-12
tree_image_7:			"Images/tree8.bin"	0	16
tree_image_8:			"Images/tree9.bin"	12	8
tree_image_9:			"Images/treeA.bin"	0	12
tree_image_10:			"Images/treeB.bin"	16	-8

vendo_front_image:		"Images/vendo1.bin"	0	20
vendo_inside_image:		"Images/vendo0.bin"	40	4
newsvendo_front_image:		"Images/newsstand1.bin"	0	-4
newsvendo_inside_image:		"Images/newsstand0.bin"	24	96

wall_image_2:			"Images/bwall3.bin"
wall_image_3:			"Images/bwall4.bin"
wall_image_4:			"Images/bwall5.bin"
wall_image_5:			"Images/bwall6.bin"
wall_image_6:			"Images/bwall7.bin"
wall_image_7:			"Images/bwall8.bin"
pipes_image:			"Images/pipe0.bin"	0	52

window_image_0:			"Images/window1.bin"	20	-24
window_image_1:			"Images/window3.bin"	20	0
window_image_2:			"Images/crack0.bin"	0	20
window_image_3:			"Images/barred.bin"	24	4

tv_image_0:			"Images/tele0.bin"	24	-4

windup_doll_image:		"Images/doll.bin"	0	-8
windup_penguin_image:		"Images/peng.bin"	0	-12

zone_image:			"Images/region0.bin"	0	20

missing_image:			"Images/undefined.bin"	0	20
game_piece_image:		"Images/chess0.bin"	0	-4

plaque_image:			"Images/plaque.bin"	0	0
door_image_2:			"Images/tdoor.bin"	20	8
door_image_3:			"Images/mhatch.bin"	24	16
bulletin_board_image:		"Images/bboard.bin"	52	8
cafe_chair_image:		"Images/cafechair.bin"	16	28

umbrella_image:			"Images/umbrella.bin"	0	0
pitchfork_image:		"Images/pfork.bin"	0	0
banner_image:			"Images/banner.bin"	0	0
avatar_tentacle_image:		"Images/Tentacle.bin"	8	0
filecabinet_image:	"Images/filecabinet.bin"	0	0
magic_wall_image:		"Images/magic_wall.bin"	0	0
door_glass:			"Images/glassdoor.bin"	20	0
door_dungeon:			"Images/dungdoor.bin"	20	0
door_junk:			"Images/junkdoor.bin"	20	0
pawnstock_image:		"Images/pawnstock.bin"	0	0
copier_image:			"Images/copier.bin"	0	0
}

action {

avatar_do:		"Actions/avatar_do.bin"
avatar_go:		"Actions/avatar_go.bin"
avatar_get:		"Actions/avatar_get.bin"
avatar_put:		"Actions/avatar_put.bin"
avatar_talk:		"Actions/avatar_talk.bin"
avatar_WALK:		"Actions/avatar_WALK.bin"
avatar_ATTACK:		"Actions/avatar_ATTACK.bin"
avatar_BASH:		"Actions/avatar_BASH.bin"
avatar_CLOSE:		"Actions/avatar_CLOSE.bin"
avatar_CLOSECONTAINER:	"Actions/avatar_CLOSECONTAINER.bin"
avatar_GETM:		"Actions/avatar_GET.bin"
avatar_GRABFROM:	"Actions/avatar_GRABFROM.bin"
avatar_OPEN:		"Actions/avatar_OPEN.bin"
avatar_OPENCONTAINER:	"Actions/avatar_OPENCONTAINER.bin"
avatar_POSTURE:		"Actions/avatar_POSTURE.bin"
avatar_PUTM:		"Actions/avatar_PUT.bin"
avatar_THROW:		"Actions/avatar_THROW.bin"
avatar_WEAR:		"Actions/avatar_WEAR.bin"
avatar_REINCARNATE:	"Actions/avatar_REINCARNATE.bin"
avatar_REMOVE:		"Actions/avatar_REMOVE.bin"
avatar_PAID:		"Actions/avatar_PAID.bin"

atm_do:			"Actions/atm_do.bin"
atm_get:		"Actions/atm_get.bin"
atm_put:		"Actions/atm_put.bin"

book_do:		"Actions/book_do.bin"
plaque_do:		"Actions/plaque_do.bin"

bottle_rdo:		"Actions/bottle_rdo.bin"

changomatic_rdo:	"Actions/changomatic_rdo.bin"
changomatic_CHANGE:	"Actions/changomatic_CHANGE.bin"

coke_machine_put:	"Actions/coke_machine_put.bin"

die_do:			"Actions/die_do.bin"
die_ROLL:		"Actions/die_ROLL.bin"

drugs_do:		"Actions/drugs_do.bin"

elevator_talk:		"Actions/elevator_talk.bin"
elevator_ZAPIN:		"Actions/elevator_ZAPIN.bin"
elevator_ZAPTO:		"Actions/elevator_ZAPOUT.bin"

escape_device_do:	"Actions/escape_device_do.bin"

fake_gun_do:		"Actions/fake_gun_do.bin"
fake_gun_rdo:		"Actions/fake_gun_rdo.bin"
fake_gun_FAKESHOOT:	"Actions/fake_gun_FAKESHOOT.bin"
fake_gun_RESET:		"Actions/fake_gun_RESET.bin"

flashlight_do:		"Actions/flashlight_do.bin"

floor_lamp_do:		"Actions/floor_lamp_do.bin"

fortune_machine_put:	"Actions/fortune_machine_put.bin"

garbage_can_do:		"Actions/garbage_can_do.bin"
garbage_can_FLUSH:	"Actions/garbage_can_FLUSH.bin"

grenade_do:		"Actions/grenade_do.bin"
grenade_EXPLODE:	"Actions/grenade_EXPLODE.bin"

gun_do:			"Actions/gun_do.bin"

hand_of_god_BLAST:	"Actions/hand_of_god_BLAST.bin"

head_do:		"Actions/head_do.bin"
head_get:		"Actions/head_get.bin"
head_put:		"Actions/head_put.bin"

hole_do:		"Actions/hole_do.bin"

instant_object_TRANSFORM: "Actions/instant_object_TRANSFORM.bin"

jukebox_do:		"Actions/jukebox_do.bin"
jukebox_put:		"Actions/jukebox_put.bin"
jukebox_talk:		"Actions/jukebox_talk.bin"
jukebox_PLAY:		"Actions/generic_PLAY.bin"

key_do:			"Actions/key_do.bin"

magic_lamp_do:		"Actions/magic_lamp_do.bin"
magic_lamp_talk:	"Actions/magic_lamp_talk.bin"
magic_lamp_GIVEUP:	"Actions/magic_lamp_GIVEUP.bin"
magic_lamp_RUB:		"Actions/magic_lamp_RUB.bin"
magic_lamp_WISH:	"Actions/magic_lamp_WISH.bin"

paper_do:		"Actions/paper_do.bin"

sensor_do:		"Actions/sensor_do.bin"
sensor_SCAN:		"Actions/sensor_SCAN.bin"

sex_changer_do:		"Actions/sex_changer_do.bin"
sex_changer_SEXCHANGE:	"Actions/sex_changer_SEXCHANGE.bin"

shovel_rdo:		"Actions/shovel_rdo.bin"
shovel_DIG:		"Actions/shovel_DIG.bin"

sky_go:			"Actions/sky_go.bin"

spray_can_do:		"Actions/spray_can_do.bin"
spray_can_SPRAY:	"Actions/spray_can_SPRAY.bin"

/* stereo_get:		"Actions/stereo_get.bin" */
/* stereo_put:		"Actions/stereo_put.bin" */
stereo_put:		"Actions/generic_goToAndDropAt.bin"
stereo_get:		"Actions/generic_goToAndGet.bin"
stereo_PLAY:		"Actions/generic_PLAY.bin"


stun_gun_rdo:		"Actions/stun_gun_rdo.bin"

telephone_do:		"Actions/telephone_do.bin"
telephone_get:		"Actions/telephone_get.bin"
telephone_put:		"Actions/telephone_put.bin"
telephone_talk:		"Actions/telephone_talk.bin"

teleport_put:		"Actions/teleport_put.bin"
teleport_talk:		"Actions/teleport_talk.bin"
teleport_PAY:		"Actions/teleport_PAY.bin"
teleport_ZAPIN:		"Actions/teleport_ZAPIN.bin"
teleport_ZAPTO:		"Actions/teleport_ZAPOUT.bin"

tokens_do:		"Actions/tokens_do.bin"
tokens_rdo:		"Actions/tokens_rdo.bin"

vendo_do:		"Actions/vendo_do.bin"
vendo_put:		"Actions/vendo_put.bin"
vendo_SELECT:		"Actions/vendo_SELECT.bin"
vendo_SELL:		"Actions/vendo_SELL.bin"

wall_go:		"Actions/generic_goToCursor.bin"

windup_toy_do:		"Actions/windup_toy_do.bin"
windup_toy_WIND:	"Actions/windup_toy_WIND.bin"

generic_adjacentOpenClose: "Actions/generic_adjacentOpenClose.bin" 
generic_adjacentOpenCloseContainer: "Actions/generic_adjacentOpenCloseContainer.bin"
generic_askOracle:	"Actions/generic_askOracle.bin"
generic_broadcast:	"Actions/generic_broadcast.bin"
generic_cease:		"Actions/generic_cease.bin"
generic_depends:	"Actions/generic_depends.bin"
generic_adjacentDoMagic:	"Actions/generic_adjacentDoMagic.bin"
button_CHANGESTATE:	"Actions/button_CHANGESTATE.bin"
generic_doMagic:	"Actions/generic_doMagic.bin"
generic_doMagicIfMagic:	"Actions/generic_doMagicIfMagic.bin"
generic_rdoMagic:	"Actions/generic_rdoMagic.bin"
generic_rdoMagicIfMagic:"Actions/generic_rdoMagicIfMagic.bin"
generic_enterOrExit:	"Actions/generic_enterOrExit.bin"
generic_getMass:	"Actions/generic_getMass.bin"
generic_goTo:		"Actions/generic_goTo.bin"
generic_goToAndDropAt:	"Actions/generic_goToAndDropAt.bin"
generic_goToAndDropInto:"Actions/generic_goToAndDropInto.bin"
generic_goToAndDropIntoIfOpen: "Actions/generic_goToAndDropIntoIfOpen.bin"
generic_goToAndFill:	"Actions/generic_goToAndFill.bin"
generic_goToAndGet:	"Actions/generic_goToAndGet.bin"
generic_goToAndPickFrom:"Actions/generic_goToAndPickFrom.bin"
generic_goToAndPickFromIfOpen: "Actions/generic_goToAndPickFromIfOpen.bin" 
generic_goToAndPickFromOrGet: "Actions/generic_goToAndPickFromOrGet.bin" 
generic_goToCursor:	"Actions/generic_goToCursor.bin"
generic_goToOrPassThrough: "Actions/generic_goToOrPassThrough.bin" 
generic_read:		"Actions/generic_read.bin"
generic_shoot:		"Actions/generic_shoot.bin"
generic_strike:		"Actions/generic_strike.bin"
generic_switch:		"Actions/generic_switch.bin"
generic_throw:		"Actions/generic_throw.bin"
generic_wearLegs:	"Actions/generic_wearLegs.bin"
generic_wearTorso:	"Actions/generic_wearTorso.bin"
generic_wearHead:	"Actions/generic_wearHead.bin"
generic_wearOrGet:	"Actions/generic_wearOrGet.bin"

generic_CHANGESTATE:	"Actions/generic_CHANGESTATE.bin"
generic_OFF:		"Actions/generic_OFF.bin"
generic_OFFLIGHT:	"Actions/generic_OFFLIGHT.bin"
generic_ON:		"Actions/generic_ON.bin"
generic_ONLIGHT:	"Actions/generic_ONLIGHT.bin"
generic_PAY:		"Actions/generic_PAY.bin"
generic_SPEAK:		"Actions/generic_SPEAK.bin"

generic_coinOp:		"Actions/generic_coinOp.bin"
generic_goToFurniture:	"Actions/generic_goToFurniture.bin"
/* generic_goToFurniture:	"Actions/generic_goTo.bin" */
bottle_FILL:		"Actions/bottle_FILL.bin"
bottle_POUR:		"Actions/bottle_POUR.bin"
drugs_TAKE:		"Actions/drugs_TAKE.bin"
escape_device_BUGOUT:	"Actions/escape_device_BUGOUT.bin"
sex_changer_go:		"Actions/sex_changer_go.bin"
generic_destroy:	"Actions/generic_destroy.bin"
generic_test:		"Actions/generic_test.bin"
stereo_UNLOAD:		"Actions/stereo_UNLOAD.bin"
tape_LOAD:		"Actions/tape_LOAD.bin"
avatar_DIE:		"Actions/avatar_DIE.bin"
avatar_SITORGETUP:	"Actions/avatar_SITORGETUP.bin"
/*avatar_SITORGETUP:	"Actions/illegal.bin"*/
GoToNewRegion:		"Actions/GoToNewRegion.bin"

transit_region:		"Actions/transit_region.bin"
ask_for_help:		"Actions/ask_for_help.bin"
do_a_gesture:		"Actions/do_a_gesture.bin"
toggle_ghost_mode:	"Actions/toggle_ghost_mode.bin"
change_player_color:	"Actions/change_player_color.bin"
BOING:			"Actions/BOING.bin"

pawn_machine_do:	"Actions/pawn_machine_do.bin"
pawn_machine_MUNCH:	"Actions/pawn_machine_MUNCH.bin"

trap_go:		"Actions/trap_go.bin"
trap_put:		"Actions/trap_put.bin"

illegal:		"Actions/illegal.bin"
noEffect:		"Actions/noEffect.bin"

generic_chgState:	"Actions/generic_changeState.bin"
telekenesis_get:	"Actions/telekenesis_get.bin"

fn_key_pressed:		"Actions/fn_key_pressed.bin"
toggle_walking_music:	"Actions/toggle_walking_music.bin"
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
pawn_machine_munching:		"Sounds/parking_meter_crank.bin"
pawn_machine_munching_pw:	"Sounds/parking_meter_crank.pwbin"
}
