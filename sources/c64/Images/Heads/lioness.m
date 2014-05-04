;---------------------------------------
;
;	animation cel data
;

lioness_data::
	byte	swing	+ 1
	byte	0b10000000
	byte	lioness_start_end - lioness_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000

	word	lioness_data_a - lioness_data
	word	lioness_data_b - lioness_data

lioness_start_end:
	byte	0,0,1,1,0,0,1,1


lioness_data_a:
	byte	0x06, 0x1a, 0x00, 0x03, 0x00, 0x00
	byte	run,0x80+2
	byte	run,9,2
	byte	run,0x80+15
	byte	3
	byte	86
	byte	25
	byte	85
	byte	86
	byte	89
	byte	89
	byte	85
	byte	85
	byte	86
	byte	86
	byte	run,3,149
	byte	165
	byte	37
	byte	37
	byte	41
	byte	9
	byte	10
	byte	2
	byte	2
	byte	run,0x80+4
	byte	24
	byte	86
	byte	86
	byte	149
	byte	85
	byte	89
	byte	101
	byte	149
	byte	149
	byte	run,12,85
	byte	149
	byte	149
	byte	165
	byte	41
	byte	10
	byte	run,0x80+3
	byte	128
	byte	128
	byte	106
	byte	run,9,85
	byte	105
	byte	169
	byte	85
	byte	86
	byte	88
	byte	160
	byte	run,5,128
	byte	run,0x80+4
	byte	160
	byte	88
	byte	86
	byte	170
	byte	run,5,85
	byte	86
	byte	88
	byte	96
	byte	128
	byte	128
	byte	run,0x80+16
	byte	128
	byte	128
	byte	160
	byte	96
	byte	128
	byte	run,0x80+13




lioness_data_b:
	byte	0x05, 0x19, 0xfe, 0x03, 0x00, 0x00
	byte	run,0x80+9
	byte	run,10,2
	byte	run,3,9
	byte	37
	byte	38
	byte	40
	byte	46
	byte	41
	byte	37
	byte	38
	byte	38
	byte	run,3,41
	byte	165
	byte	149
	byte	run,5,85
	byte	90
	byte	105
	byte	85
	byte	85
	byte	101
	byte	89
	byte	86
	byte	104
	byte	128
	byte	run,0x80+1
	byte	86
	byte	85
	byte	85
	byte	170
	byte	86
	byte	85
	byte	169
	byte	101
	byte	101
	byte	153
	byte	run,5,85
	byte	86
	byte	run,5,85
	byte	170
	byte	run,0x80+3
	byte	224
	byte	160
	byte	run,3,96
	byte	run,3,160
	byte	104
	byte	90
	byte	run,5,86
	byte	150
	byte	166
	byte	86
	byte	86
	byte	101
	byte	149
	byte	85
	byte	165
	byte	10
	byte	run,0x80+20
	byte	run,3,128
	byte	96
	byte	96
	byte	160




