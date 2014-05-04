;---------------------------------------
;
;	animation cel data
;
	include "../equates.m"

wand2_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	wand2_start_end - wand2_data
	byte	no_cont

	byte	236+right,20+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b00100000

	word	wand2_data_a - wand2_data
	word	wand2_data_b - wand2_data
	word	wand2_data_c - wand2_data

wand2_start_end:
	byte	0,0,1,1,2,2


wand2_data_a:
	byte	0x01, 0x20, 0x01, 0x0b, 0x00, 0x00
	byte	168
	byte	run,4,184
	byte	run,22,152
	byte	run,4,184
	byte	168




wand2_data_b:
	byte	0x04, 0x16, 0x01, 0xfe, 0x00, 0x00
	byte	run,0x80+10
	byte	2
	byte	10
	byte	run,3,8
	byte	run,3,42
	byte	38
	byte	8
	byte	run,0x80+2
	byte	42
	byte	run,7,37
	byte	42
	byte	170
	byte	191
	byte	42
	byte	37
	byte	9
	byte	run,6,2
	byte	run,0x80+2
	byte	160
	byte	run,7,96
	byte	160
	byte	160
	byte	248
	byte	160
	byte	96
	byte	130
	byte	10
	byte	38
	byte	38
	byte	150
	byte	38
	byte	38
	byte	10
	byte	2
	byte	run,0x80+13
	byte	128
	byte	run,0x80+2
	byte	8
	byte	174
	byte	8
	byte	run,0x80+2
	byte	128




wand2_data_c:
	byte	0x06, 0x0b, 0x00, 0x01, 0x00, 0x00
	byte	run,0x80+4
	byte	10
	byte	9
	byte	10
	byte	run,0x80+8
	byte	170
	byte	85
	byte	170
	byte	8
	byte	40
	byte	run,0x80+5
	byte	2
	byte	162
	byte	106
	byte	162
	byte	2
	byte	run,0x80+6
	byte	34
	byte	34
	byte	170
	byte	34
	byte	34
	byte	run,0x80+3
	byte	2
	byte	2
	byte	10
	byte	46
	byte	46
	byte	174
	byte	46
	byte	46
	byte	10
	byte	2
	byte	2
	byte	run,0x80+2
	byte	128
	byte	run,0x80+2
	byte	160
	byte	run,0x80+2
	byte	128
	byte	run,0x80+2




