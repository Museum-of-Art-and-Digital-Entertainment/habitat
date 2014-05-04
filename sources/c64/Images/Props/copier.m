;---------------------------------------
;
;	animation cel data
;
	include "../equates.m"

copier_data::
	byte	at_side	+ 1
	byte	0b10100000
	byte	copier_start_end - copier_data
	byte	no_cont

	byte	28+left,28+left,1

	byte	0b10100000
	byte	0b11100000

	word	copier_data_a - copier_data
	word	copier_data_b - copier_data
	word	copier_data_c - copier_data

copier_start_end:
	byte	0,0,cycle+0,1


copier_data_a:
	byte	0x0a, 0x19, 0xfb, 0x08, 0x00, 0x00
	byte	run,0x80+12
	byte	run,12,2
	byte	run,0x80+1
	byte	168
	byte	170
	byte	149
	byte	149
	byte	154
	byte	153
	byte	153
	byte	run,5,149
	byte	85
	byte	170
	byte	run,9,85
	byte	170
	byte	run,0x80+2
	byte	170
	byte	85
	byte	85
	byte	170
	byte	105
	byte	105
	byte	run,6,85
	byte	170
	byte	run,9,85
	byte	170
	byte	170
	byte	run,0x80+1
	byte	170
	byte	85
	byte	85
	byte	170
	byte	105
	byte	105
	byte	run,6,85
	byte	170
	byte	run,9,85
	byte	170
	byte	170
	byte	run,0x80+1
	byte	170
	byte	85
	byte	85
	byte	170
	byte	105
	byte	105
	byte	run,6,85
	byte	170
	byte	run,9,85
	byte	170
	byte	168
	byte	run,0x80+1
	byte	170
	byte	85
	byte	85
	byte	170
	byte	105
	byte	105
	byte	run,6,85
	byte	170
	byte	run,9,85
	byte	170
	byte	run,0x80+2
	byte	170
	byte	85
	byte	85
	byte	170
	byte	105
	byte	105
	byte	run,6,85
	byte	170
	byte	run,9,85
	byte	170
	byte	run,0x80+2
	byte	170
	byte	85
	byte	85
	byte	170
	byte	105
	byte	105
	byte	run,6,85
	byte	170
	byte	85
	byte	85
	byte	169
	byte	169
	byte	185
	byte	169
	byte	169
	byte	85
	byte	85
	byte	170
	byte	run,0x80+1
	byte	42
	byte	170
	byte	86
	byte	86
	byte	166
	byte	102
	byte	102
	byte	run,5,86
	byte	85
	byte	170
	byte	85
	byte	85
	byte	169
	byte	169
	byte	185
	byte	169
	byte	169
	byte	85
	byte	85
	byte	170
	byte	run,0x80+13
	byte	run,12,128
	byte	run,0x80+1




copier_data_b:
	byte	cel_box + 0x01, 0x01, 0xfd, 0x07, 0x01, 0xfe
	byte	0x08

copier_data_c:
	byte	0x08, 0x1d, 0xfa, 0x25, 0x00, 0x00
	byte	run,0x80+9
	byte	8
	byte	run,3,42
	byte	38
	byte	8
	byte	run,0x80+21
	byte	2
	byte	10
	byte	40
	byte	160
	byte	128
	byte	run,0x80+4
	byte	2
	byte	2
	byte	9
	byte	9
	byte	37
	byte	37
	byte	run,3,149
	byte	170
	byte	149
	byte	37
	byte	42
	byte	2
	byte	10
	byte	42
	byte	11
	byte	2
	byte	42
	byte	170
	byte	139
	byte	2
	byte	2
	byte	9
	byte	9
	byte	37
	byte	37
	byte	149
	byte	149
	byte	run,9,85
	byte	170
	byte	85
	byte	85
	byte	run,4,170
	byte	255
	byte	run,3,170
	byte	255
	byte	170
	byte	run,3,85
	byte	86
	byte	91
	byte	111
	byte	170
	byte	run,8,86
	byte	85
	byte	170
	byte	85
	byte	85
	byte	run,4,170
	byte	255
	byte	run,3,170
	byte	255
	byte	170
	byte	85
	byte	101
	byte	185
	byte	254
	byte	255
	byte	255
	byte	run,8,254
	byte	170
	byte	85
	byte	170
	byte	85
	byte	85
	byte	run,4,170
	byte	255
	byte	run,3,170
	byte	255
	byte	170
	byte	86
	byte	run,3,85
	byte	149
	byte	229
	byte	169
	byte	run,9,85
	byte	170
	byte	85
	byte	85
	byte	170
	byte	run,0x80+1
	byte	128
	byte	160
	byte	128
	byte	run,0x80+1
	byte	128
	byte	160
	byte	128
	byte	run,0x80+2
	byte	128
	byte	128
	byte	96
	byte	96
	byte	88
	byte	88
	byte	86
	byte	86
	byte	run,7,85
	byte	170
	byte	85
	byte	85
	byte	170
	byte	run,0x80+18
	byte	128
	byte	128
	byte	96
	byte	96
	byte	run,3,88
	byte	168
	byte	88
	byte	96
	byte	160




