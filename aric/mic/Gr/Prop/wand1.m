;---------------------------------------
;
;	animation cel data
;
	include "../equates.m"

wand1_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	wand1_start_end - wand1_data
	byte	no_cont

	byte	240+right,24+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b00100000

	word	wand1_data_a - wand1_data
	word	wand1_data_b - wand1_data
	word	wand1_data_c - wand1_data

wand1_start_end:
	byte	0,0,1,1,2,2


wand1_data_a:
	byte	0x03, 0x27, 0x00, 0x19, 0x00, 0x00
	byte	run,13,2
	byte	10
	byte	run,0x80+1
	byte	10
	byte	run,0x80+1
	byte	10
	byte	run,0x80+9
	byte	40
	byte	38
	byte	37
	byte	9
	byte	9
	byte	37
	byte	149
	byte	41
	byte	2
	byte	2
	byte	run,0x80+2
	byte	run,8,160
	byte	168
	byte	184
	byte	168
	byte	160
	byte	160
	byte	168
	byte	128
	byte	168
	byte	128
	byte	168
	byte	run,9,128
	byte	138
	byte	166
	byte	150
	byte	88
	byte	88
	byte	86
	byte	85
	byte	90
	byte	96
	byte	96
	byte	128
	byte	128
	byte	run,0x80+33
	byte	128
	byte	run,0x80+5




wand1_data_b:
	byte	0x04, 0x15, 0x00, 0x09, 0x00, 0x00
	byte	run,0x80+7
	byte	32
	byte	168
	byte	170
	byte	184
	byte	32
	byte	run,0x80+9
	byte	42
	byte	37
	byte	run,4,38
	byte	37
	byte	9
	byte	42
	byte	160
	byte	run,3,2
	byte	10
	byte	37
	byte	37
	byte	10
	byte	2
	byte	run,0x80+3
	byte	128
	byte	128
	byte	run,0x80+4
	byte	160
	byte	106
	byte	149
	byte	149
	byte	170
	byte	85
	byte	170
	byte	170
	byte	85
	byte	85
	byte	170
	byte	255
	byte	191
	byte	46
	byte	8
	byte	run,0x80+8
	byte	128
	byte	128
	byte	160
	byte	96
	byte	160
	byte	168
	byte	86
	byte	86
	byte	168
	byte	224
	byte	128
	byte	run,0x80+2




wand1_data_c:
	byte	0x03, 0x18, 0xff, 0x06, 0x00, 0x00
	byte	run,0x80+4
	byte	2
	byte	2
	byte	run,0x80+12
	byte	2
	byte	2
	byte	run,0x80+4
	byte	10
	byte	45
	byte	190
	byte	170
	byte	170
	byte	85
	byte	149
	byte	37
	byte	10
	byte	9
	byte	10
	byte	9
	byte	10
	byte	9
	byte	10
	byte	9
	byte	37
	byte	149
	byte	85
	byte	170
	byte	170
	byte	190
	byte	45
	byte	10
	byte	128
	byte	224
	byte	248
	byte	168
	byte	170
	byte	86
	byte	88
	byte	96
	byte	run,8,128
	byte	96
	byte	88
	byte	86
	byte	170
	byte	168
	byte	248
	byte	224
	byte	128




