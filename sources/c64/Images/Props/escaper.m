;---------------------------------------
;
;	animation cel data
;

escaper_data::
	byte	swing	+ 0
	byte	0b00000000
	byte	no_animation
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000

	word	escaper_data_a - escaper_data


escaper_data_a:
	byte	0x03, 0x20, 0xff, 0x12, 0x00, 0x00
	byte	run,0x80+24
	byte	2
	byte	3
	byte	2
	byte	run,0x80+6
	byte	run,9,2
	byte	run,3,10
	byte	2
	byte	10
	byte	2
	byte	2
	byte	10
	byte	2
	byte	2
	byte	10
	byte	run,0x80+1
	byte	32
	byte	40
	byte	46
	byte	175
	byte	46
	byte	40
	byte	32
	byte	run,0x80+3
	byte	128
	byte	run,5,160
	byte	184
	byte	184
	byte	160
	byte	160
	byte	run,3,168
	byte	224
	byte	168
	byte	224
	byte	224
	byte	168
	byte	224
	byte	224
	byte	168
	byte	run,5,136
	byte	8
	byte	8
	byte	42
	byte	8
	byte	46
	byte	8




