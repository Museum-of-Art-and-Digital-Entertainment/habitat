;---------------------------------------
;
;	animation cel data
;

gem_data::
	byte	swing	+ 4
	byte	0b00000000
	byte	gem_start_end - gem_data
	byte	no_cont

	byte	236+right,20+left,251

	byte	0b10000000
	byte	0b10000000
	byte	0b10000000
	byte	0b11000000
	byte	0b10100000

	word	gem_data_a - gem_data
	word	gem_data_b - gem_data
	word	gem_data_c - gem_data

gem_start_end:
	byte	0,0,cycle+0,4


gem_data_a:
	byte	0x01, 0x05, 0x01, 0xfe, 0x00, 0x00

	byte	40
	byte	run,3,150
	byte	40




gem_data_b:
	byte	0x01, 0x07, 0x01, 0xff, 0x00, 0x00

	byte	48
	byte	56
	byte	182
	byte	254
	byte	182
	byte	56
	byte	48




gem_data_c:
	byte	0x02, 0x10, 0x00, 0x04, 0x00, 0x00

	byte	run,0x80+7
	byte	3
	byte	run,0x80+8
	byte	run,5,48
	byte	56
	byte	182
	byte	255
	byte	182
	byte	56
	byte	run,6,48




