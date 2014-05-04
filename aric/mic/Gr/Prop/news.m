;---------------------------------------
;
;	animation cel data
;
	include "../equates.m"

news_data::
	byte	swing	+ 0
	byte	0b00000000
	byte	news_start_end - news_data
	byte	no_cont

	byte	240+right,24+left,255

	byte	0b10000000

	word	news_data_a - news_data

news_start_end:
	byte	0,0,0,0


news_data_a:
	byte	0x03, 0x17, 0x00, 0x04, 0x00, 0x00
	byte	170
	byte	149
	byte	149
	byte	154
	byte	149
	byte	154
	byte	149
	byte	154
	byte	149
	byte	154
	byte	149
	byte	154
	byte	149
	byte	154
	byte	149
	byte	154
	byte	149
	byte	154
	byte	149
	byte	170
	byte	149
	byte	149
	byte	170
	byte	170
	byte	85
	byte	85
	byte	154
	byte	85
	byte	154
	byte	85
	byte	154
	byte	85
	byte	154
	byte	85
	byte	154
	byte	85
	byte	154
	byte	90
	byte	154
	byte	90
	byte	154
	byte	85
	byte	170
	byte	85
	byte	85
	byte	170
	byte	168
	byte	88
	byte	88
	byte	152
	byte	88
	byte	152
	byte	88
	byte	152
	byte	88
	byte	152
	byte	88
	byte	152
	byte	88
	byte	run,5,152
	byte	88
	byte	168
	byte	88
	byte	88
	byte	168




