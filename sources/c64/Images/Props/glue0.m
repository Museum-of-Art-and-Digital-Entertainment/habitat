;---------------------------------------
;
;	animation cel data
;

glue0_data::
	byte	swing	+ 1
	byte	0b00000000
	byte	glue0_start_end - glue0_data
	byte	glue0_contents_xy - glue0_data

	byte	0+right,0+right,0

	byte	0b10000000
	byte	0b01000000

	word	glue0_data_a - glue0_data
	word	glue0_data_b - glue0_data

glue0_start_end:
	byte	0,0,1,1

glue0_contents_xy:
	byte	0,0,1,1,2,2,3,3,4,4,5,5


glue0_data_a:
	byte	cel_box + 0x04, 0x34, 0xfe, 0x34, 0x00, 0x00
	byte	0xff

glue0_data_b:
	byte	cel_box + 0x04, 0x01, 0xfe, 0x01, 0x00, 0x00
	byte	pat_glass

