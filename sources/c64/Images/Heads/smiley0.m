;---------------------------------------
;
;	animation cel data
;

smiley0_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	smiley0_start_end - smiley0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	smiley0_data_a - smiley0_data
	word	smiley0_data_b - smiley0_data
	word	smiley0_data_c - smiley0_data

smiley0_start_end:
	byte	0,0,1,1,0,0,2,2


smiley0_data_a:
	byte	0x02, 0x19, 0x01, 0x03, 0x00, 0x00
	byte	run,0x80+1
	byte	47
	byte	10
	byte	9
	byte	run,20,37
	byte	10
	byte	40
	byte	184
	byte	96
	byte	104
	byte	run,20,88
	byte	160




smiley0_data_b:
	byte	0x05, 0x19, 0xfe, 0x02, 0x00, 0x00
	byte	run,0x80+7
	byte	2
	byte	2
	byte	9
	byte	9
	byte	run,6,37
	byte	run,3,9
	byte	2
	byte	2
	byte	run,0x80+3
	byte	3
	byte	run,3,2
	byte	10
	byte	37
	byte	149
	byte	85
	byte	85
	byte	90
	byte	101
	byte	101
	byte	run,3,149
	byte	86
	byte	86
	byte	run,5,85
	byte	149
	byte	41
	byte	2
	byte	255
	byte	254
	byte	170
	byte	170
	byte	86
	byte	run,3,85
	byte	169
	byte	86
	byte	run,3,85
	byte	101
	byte	85
	byte	86
	byte	86
	byte	run,7,85
	byte	170
	byte	run,0x80+4
	byte	128
	byte	96
	byte	88
	byte	86
	byte	86
	byte	149
	byte	101
	byte	101
	byte	run,3,89
	byte	run,5,85
	byte	86
	byte	86
	byte	88
	byte	160
	byte	run,0x80+10
	byte	128
	byte	128
	byte	run,6,96
	byte	run,3,128
	byte	run,0x80+5




smiley0_data_c:
	byte	cel_box + 0x03, 0x09, 0xff, 0xfa, 0x00, 0x00
	byte	0x55

