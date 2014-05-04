;---------------------------------------
;
;	animation cel data
;

ticket_data::
	byte	swing	+ 0
	byte	0b00000000
	byte	no_animation
	byte	no_cont

	byte	236+right,24+left,252

	byte	0b10000000

	word	ticket_data_a - ticket_data


ticket_data_a:
	byte	0x02, 0x04, 0x00, 0xfd, 0x00, 0x00

	byte	10
	byte	11
	byte	11
	byte	10
	byte	168
	byte	248
	byte	248
	byte	168




