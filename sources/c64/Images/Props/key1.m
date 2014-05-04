;---------------------------------------
;
;	animation cel data
;
	include "../equates.m"

key1_data::
	byte	swing	+ 1
	byte	0b00000000
	byte	key1_start_end - key1_data
	byte	no_cont

	byte	236+right,24+left,253

	byte	0b11000000
	byte	0b10100000

	word	key1_data_a - key1_data
	word	key1_data_b - key1_data
	word	key1_data_c - key1_data

key1_start_end:
	byte	0,0,1,1


key1_data_a:
	byte	cel_box + 0x02, 0x06, 0x01, 0xfa, 0x00, 0x00
	byte	pat_glass

key1_data_b:
	byte	0x02, 0x06, 0x01, 0xfa, 0x00, 0x00
	byte	run,0x80+1
	byte	16
	byte	116
	byte	117
	byte	116
	byte	16
	byte	68
	byte	84
	byte	16
	byte	84
	byte	run,0x80+2




key1_data_c:
	byte	0x02, 0x06, 0x01, 0xfa, 0x00, 0x00
	byte	run,0x80+1
	byte	16
	byte	116
	byte	117
	byte	116
	byte	16
	byte	68
	byte	run,3,84
	byte	run,0x80+2




