;---------------------------------------
;
;	animation cel data
;

booke_data::
	byte	swing	+ 0
	byte	0b11000000
	byte	booke_start_end - booke_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000

	word	booke_data_a - booke_data

booke_start_end:
	byte	0,0,0,0


booke_data_a:
	byte	0x04, 0x0b, 0xff, 0x00, 0x00, 0x00
	byte	run,0x80+2
	byte	run,7,2
	byte	run,0x80+2
	byte	32
	byte	154
	byte	101
	byte	186
	byte	run,3,191
	byte	186
	byte	101
	byte	154
	byte	32
	byte	run,0x80+1
	byte	170
	byte	85
	byte	170
	byte	run,3,255
	byte	170
	byte	85
	byte	170
	byte	run,0x80+2
	byte	170
	byte	86
	byte	168
	byte	run,3,248
	byte	168
	byte	86
	byte	170
	byte	run,0x80+1




