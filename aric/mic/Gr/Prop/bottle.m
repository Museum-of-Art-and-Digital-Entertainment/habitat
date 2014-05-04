;---------------------------------------
;
;	animation cel data
;

bottle_data::
	byte	swing	+ 1
	byte	0b00000000
	byte	bottle_start_end - bottle_data
	byte	no_cont+0x01

	byte	240+right,24+left,252

	byte	0b10000000
	byte	0b01000000

	word	bottle_data_a - bottle_data
	word	bottle_data_b - bottle_data

bottle_start_end:
	byte	0,0,1,1


bottle_data_a:
	byte	0x03, 0x06, 0x00, 0xfd, 0x00, 0x00
	byte	42
	byte	run,4,32
	byte	42
	byte	170
	byte	run,0x80+4
	byte	170
	byte	128
	byte	170
	byte	10
	byte	10
	byte	170
	byte	128




bottle_data_b:
	byte	0x02, 0x10, 0x00, 0x00, 0x00, 0x00
	byte	10
	byte	run,8,9
	byte	8
	byte	run,6,2
	byte	168
	byte	run,8,88
	byte	8
	byte	run,5,32
	byte	160




