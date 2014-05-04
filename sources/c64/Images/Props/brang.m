;---------------------------------------
;
;	animation cel data
;

brang_data::
	byte	swing	+ 0
	byte	0b00000000
	byte	no_animation
	byte	no_cont

	byte	244+right,28+left,253

	byte	0b10000000

	word	brang_data_a - brang_data


brang_data_a:
	byte	0x04, 0x07, 0x00, 0xfc, 0x00, 0x00

	byte	2
	byte	11
	byte	2
	byte	run,0x80+4
	byte	128
	byte	224
	byte	248
	byte	190
	byte	47
	byte	11
	byte	2
	byte	run,0x80+1
	byte	2
	byte	11
	byte	175
	byte	254
	byte	248
	byte	160
	byte	160
	byte	248
	byte	224
	byte	128
	byte	run,0x80+3




