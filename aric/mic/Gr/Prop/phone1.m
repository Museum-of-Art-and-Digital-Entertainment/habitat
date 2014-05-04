;---------------------------------------
;
;	animation cel data
;
	include "../equates.m"

phone1_data::
	byte	swing	+ 0
	byte	0b00000000
	byte	no_animation
	byte	no_cont

	byte	240+right,24+left,255

	byte	0b11000000

	word	phone1_data_a - phone1_data
	word	phone1_data_b - phone1_data


phone1_data_a:
	byte	0x03, 0x0b, 0x00, 0xfc, 0x00, 0x00
	byte	170
	byte	run,3,42
	byte	10
	byte	2
	byte	2
	byte	run,0x80+4
	byte	170
	byte	170
	byte	186
	byte	254
	byte	238
	byte	254
	byte	186
	byte	168
	byte	32
	byte	168
	byte	136
	byte	168
	byte	run,3,160
	byte	128
	byte	run,0x80+6




phone1_data_b:
	byte	0x03, 0x06, 0x00, 0xff, 0x00, 0x00
	byte	40
	byte	168
	byte	168
	byte	170
	byte	42
	byte	10
	byte	run,0x80+3
	byte	run,3,170
	byte	160
	byte	run,3,168
	byte	160
	byte	128




