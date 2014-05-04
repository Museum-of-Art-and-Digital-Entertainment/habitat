;---------------------------------------
;
;	animation cel data
;
	include "../equates.m"

mdevice1_data::
	byte	swing	+ 1
	byte	0b00000000
	byte	mdevice1_start_end - mdevice1_data
	byte	no_cont

	byte	24+left,24+left,255

	byte	0b10000000
	byte	0b01000000

	word	mdevice1_data_a - mdevice1_data
	word	mdevice1_data_b - mdevice1_data

mdevice1_start_end:
	byte	0,0,1,1,cycle+0,1


mdevice1_data_a:
	byte	0x02, 0x19, 0xff, 0x21, 0x00, 0x00
	byte	2
	byte	run,5,9
	byte	42
	byte	run,5,37
	byte	42
	byte	37
	byte	10
	byte	10
	byte	37
	byte	run,6,149
	byte	37
	byte	10
	byte	run,0x80+1
	byte	run,5,128
	byte	160
	byte	run,5,96
	byte	160
	byte	96
	byte	128
	byte	128
	byte	96
	byte	run,6,88
	byte	96
	byte	128




mdevice1_data_b:
	byte	0x02, 0x19, 0xff, 0x21, 0x00, 0x00
	byte	2
	byte	run,10,9
	byte	10
	byte	42
	byte	37
	byte	10
	byte	10
	byte	47
	byte	run,6,191
	byte	47
	byte	10
	byte	run,0x80+1
	byte	run,11,128
	byte	160
	byte	96
	byte	128
	byte	128
	byte	224
	byte	run,6,248
	byte	224
	byte	128




