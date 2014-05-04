;---------------------------------------
;
;	animation cel data
;

shovel0_data::
	byte	swing	+ 0
	byte	0b00000000
	byte	no_animation
	byte	no_cont

	byte	244+right,32+left,247

	byte	0b11000000

	word	shovel0_data_a - shovel0_data
	word	shovel0_data_b - shovel0_data


shovel0_data_a:
	byte	0x03, 0x0c, 0xff, 0xff, 0x00, 0x00
	byte	run,0x80+4
	byte	32
	byte	168
	byte	170
	byte	42
	byte	10
	byte	2
	byte	run,0x80+4
	byte	2
	byte	10
	byte	42
	byte	168
	byte	160
	byte	128
	byte	160
	byte	168
	byte	168
	byte	32
	byte	42
	byte	168
	byte	160
	byte	128
	byte	run,0x80+8




shovel0_data_b:
	byte	0x04, 0x0d, 0x01, 0xf3, 0x00, 0x00
	byte	run,0x80+11
	byte	2
	byte	10
	byte	run,0x80+2
	byte	2
	byte	9
	byte	37
	byte	149
	byte	149
	byte	38
	byte	9
	byte	37
	byte	150
	byte	168
	byte	128
	byte	42
	byte	149
	byte	run,4,85
	byte	165
	byte	85
	byte	101
	byte	149
	byte	86
	byte	152
	byte	32
	byte	160
	byte	88
	byte	run,5,86
	byte	88
	byte	96
	byte	128
	byte	run,0x80+3




