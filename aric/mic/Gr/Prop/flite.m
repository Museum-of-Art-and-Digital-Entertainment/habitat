;---------------------------------------
;
;	animation cel data
;

flite_data::
	byte	swing	+ 0
	byte	0b00000000
	byte	flite_start_end - flite_data
	byte	no_cont

	byte	236+right,20+left,251

	byte	0b10000000

	word	flite_data_a - flite_data

flite_start_end:
	byte	0,0,0,0


flite_data_a:
	byte	0x03, 0x07, 0x00, 0xfc, 0x00, 0x00

	byte	run,0x80+1
	byte	170
	byte	run,3,149
	byte	170
	byte	run,0x80+1
	byte	2
	byte	169
	byte	run,3,85
	byte	169
	byte	2
	byte	167
	byte	run,5,87
	byte	167




