;---------------------------------------
;
;	animation cel data
;

kk3_data::
	byte	swing	+ 0
	byte	0b00000000
	byte	kk3_start_end - kk3_data
	byte	no_cont

	byte	240+right,24+left,255

	byte	0b10000000

	word	kk3_data_a - kk3_data

kk3_start_end:
	byte	0,0,0,0


kk3_data_a:
	byte	0x03, 0x0c, 0x00, 0x00, 0x00, 0x00

	byte	10
	byte	37
	byte	37
	byte	42
	byte	47
	byte	42
	byte	46
	byte	46
	byte	11
	byte	11
	byte	2
	byte	run,0x80+1
	byte	170
	byte	85
	byte	85
	byte	170
	byte	255
	byte	174
	byte	238
	byte	170
	byte	170
	byte	235
	byte	255
	byte	170
	byte	168
	byte	86
	byte	86
	byte	170
	byte	254
	byte	170
	byte	238
	byte	254
	byte	248
	byte	248
	byte	224
	byte	128




