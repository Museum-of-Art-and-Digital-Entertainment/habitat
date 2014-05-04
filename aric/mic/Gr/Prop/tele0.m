;---------------------------------------
;
;	animation cel data
;

tele0_data::
	byte	swing	+ 0
	byte	0b10000000
	byte	no_animation
	byte	no_cont

	byte	240+right,28+left,255

	byte	0b10000000

	word	tele0_data_a - tele0_data


tele0_data_a:
	byte	0x06, 0x1c, 0xfe, 0x14, 0x00, 0x00
	byte	10
	byte	170
	byte	191
	byte	run,3,170
	byte	175
	byte	175
	byte	run,16,174
	byte	175
	byte	175
	byte	run,4,170
	byte	255
	byte	run,3,170
	byte	255
	byte	170
	byte	run,9,85
	byte	run,4,117
	byte	93
	byte	85
	byte	85
	byte	170
	byte	255
	byte	run,4,170
	byte	255
	byte	run,3,170
	byte	255
	byte	170
	byte	run,16,85
	byte	170
	byte	255
	byte	run,4,170
	byte	255
	byte	run,3,170
	byte	255
	byte	170
	byte	run,16,85
	byte	170
	byte	255
	byte	run,4,170
	byte	255
	byte	run,3,170
	byte	254
	byte	190
	byte	run,16,110
	byte	190
	byte	254
	byte	170
	byte	170
	byte	160
	byte	170
	byte	254
	byte	run,3,170
	byte	254
	byte	run,3,170
	byte	254
	byte	170
	byte	254
	byte	170
	byte	254
	byte	170
	byte	254
	byte	170
	byte	170
	byte	238
	byte	170
	byte	238
	byte	170
	byte	238
	byte	run,4,170




