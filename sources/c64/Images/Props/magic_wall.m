;---------------------------------------
;
;	animation cel data
;

	include "../equates.m"

magic_wall_data::
	byte	swing	+ 0
	byte	0b10000000
	byte	no_animation
	byte	magic_wall_contents_xy - magic_wall_data

	byte	6*4+up,32*4+up,28

	byte	0b10000000

	word	magic_wall_data_a - magic_wall_data


magic_wall_contents_xy:
    byte 4+0,173,4+4,173,4+8,173,4+12,173,4+16,173,4+20,173,4+24,173,4+28,173
    byte 4+0,197,4+4,197,4+8,197,4+12,197,4+16,197,4+20,197,4+24,197,4+28,197
    byte 4+0,221,4+4,221,4+8,221,4+12,221,4+16,221,4+20,221,4+24,221,4+28,221
    byte 4+0,245,4+4,245,4+8,245,4+12,245,4+16,245,4+20,245,4+24,245,4+28,245


magic_wall_data_a:
	byte	cel_trap + col + 0x01, 0x80, 0x01, 0x69, 0x00, 0x00
	byte	pat_wild

	byte	0,	159,	0,	159



