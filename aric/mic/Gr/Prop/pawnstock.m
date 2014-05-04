;---------------------------------------
;
;	animation cel data
;
	include "../equates.m"

pawnstock_data::
	byte	at_side	+ 0
	byte	0b11000000
	byte	no_animation
	byte	no_cont

	byte	28+left,28+left,1

	byte	0b11000000

	word	pawnstock_data_a - pawnstock_data
	word	pawnstock_data_b - pawnstock_data


pawnstock_data_a:
	byte	0x08, 0x1c, 0x02, 0x31, 0x00, 0x00
	byte	run,0x80+2
	byte	run,26,2
	byte	10
	byte	9
	byte	170
	byte	170
	byte	85
	byte	85
	byte	105
	byte	89
	byte	105
	byte	101
	byte	105
	byte	85
	byte	85
	byte	106
	byte	111
	byte	110
	byte	110
	byte	111
	byte	106
	byte	85
	byte	85
	byte	90
	byte	85
	byte	90
	byte	89
	byte	90
	byte	85
	byte	170
	byte	170
	byte	85
	byte	170
	byte	170
	byte	85
	byte	85
	byte	run,4,101
	byte	169
	byte	85
	byte	85
	byte	170
	byte	255
	byte	170
	byte	170
	byte	255
	byte	170
	byte	85
	byte	85
	byte	154
	byte	153
	byte	154
	byte	89
	byte	154
	byte	85
	byte	170
	byte	170
	byte	85
	byte	170
	byte	170
	byte	85
	byte	85
	byte	169
	byte	run,3,153
	byte	169
	byte	85
	byte	85
	byte	170
	byte	255
	byte	170
	byte	170
	byte	255
	byte	170
	byte	85
	byte	85
	byte	154
	byte	run,3,89
	byte	153
	byte	85
	byte	170
	byte	170
	byte	85
	byte	170
	byte	170
	byte	85
	byte	85
	byte	166
	byte	run,3,150
	byte	166
	byte	85
	byte	85
	byte	170
	byte	255
	byte	170
	byte	170
	byte	255
	byte	170
	byte	85
	byte	85
	byte	154
	byte	run,4,89
	byte	85
	byte	170
	byte	170
	byte	85
	byte	170
	byte	170
	byte	85
	byte	85
	byte	102
	byte	102
	byte	150
	byte	101
	byte	101
	byte	86
	byte	86
	byte	166
	byte	run,4,230
	byte	166
	byte	86
	byte	86
	byte	150
	byte	run,4,86
	byte	85
	byte	170
	byte	168
	byte	88
	byte	170
	byte	170
	byte	85
	byte	85
	byte	run,3,170
	byte	85
	byte	85
	byte	170
	byte	170
	byte	254
	byte	170
	byte	170
	byte	254
	byte	170
	byte	170
	byte	186
	byte	254
	byte	238
	byte	238
	byte	254
	byte	186
	byte	170
	byte	85
	byte	170
	byte	run,0x80+2
	byte	160
	byte	160
	byte	run,23,96
	byte	160




pawnstock_data_b:
	byte	0x08, 0x20, 0x02, 0x16, 0x00, 0x00
	byte	run,32,2
	byte	170
	byte	run,3,85
	byte	90
	byte	run,22,89
	byte	90
	byte	run,3,85
	byte	170
	byte	170
	byte	run,3,85
	byte	170
	byte	run,19,85
	byte	run,3,90
	byte	170
	byte	run,3,85
	byte	170
	byte	170
	byte	run,3,85
	byte	170
	byte	run,19,85
	byte	run,4,170
	byte	run,3,85
	byte	170
	byte	170
	byte	run,3,85
	byte	170
	byte	run,19,85
	byte	run,4,170
	byte	run,3,85
	byte	170
	byte	170
	byte	run,3,85
	byte	170
	byte	run,19,85
	byte	run,3,169
	byte	170
	byte	run,3,85
	byte	170
	byte	run,0x80+1
	byte	run,3,85
	byte	169
	byte	run,22,89
	byte	169
	byte	run,3,85
	byte	170
	byte	run,0x80+1
	byte	run,30,96
	byte	160




