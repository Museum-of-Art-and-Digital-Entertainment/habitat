;---------------------------------------
;
;	animation cel data
;

pillbot_data::
	byte	swing	+ 0
	byte	0b00000000
	byte	no_animation
	byte	no_cont

	byte	240+right,24+left,255

	byte	0b10000000

	word	pillbot_data_a - pillbot_data


pillbot_data_a:
	byte	0x02, 0x0c, 0x00, 0x00, 0x00, 0x00

	byte	run,0x80+1
	byte	run,6,2
	byte	run,0x80+5
	byte	168
	byte	run,4,86
	byte	170
	byte	2
	byte	136
	byte	136
	byte	168
	byte	184
	byte	168




