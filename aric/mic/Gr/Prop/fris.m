;---------------------------------------
;
;	animation cel data
;

fris_data::
	byte	swing	+ 1
	byte	0b00000000
	byte	fris_start_end - fris_data
	byte	no_cont

	byte	236+right,24+left,255

	byte	0b10000000
	byte	0b01000000

	word	fris_data_a - fris_data
	word	fris_data_b - fris_data

fris_start_end:
	byte	0,0,1,1


fris_data_a:
	byte	0x03, 0x04, 0x01, 0xfb, 0x00, 0x00

	byte	170
	byte	149
	byte	37
	byte	10
	byte	170
	byte	85
	byte	85
	byte	170
	byte	168
	byte	88
	byte	96
	byte	128




fris_data_b:
	byte	0x03, 0x11, 0x01, 0x02, 0x00, 0x00

	byte	run,0x80+1
	byte	2
	byte	9
	byte	37
	byte	37
	byte	149
	byte	149
	byte	run,3,150
	byte	149
	byte	149
	byte	37
	byte	37
	byte	9
	byte	2
	byte	run,0x80+1
	byte	168
	byte	86
	byte	run,3,85
	byte	101
	byte	153
	byte	run,3,86
	byte	153
	byte	101
	byte	run,3,85
	byte	86
	byte	168
	byte	run,0x80+2
	byte	128
	byte	96
	byte	96
	byte	run,7,88
	byte	96
	byte	96
	byte	128
	byte	run,0x80+2




