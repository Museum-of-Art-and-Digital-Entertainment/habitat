; 
; 	this is a FAKE region message
; 

	include	"../Bin/class_equates.m"


start_fake_cv::

; next bytes are region state variables
	byte	0		; Style/ terrain type
	byte	0		; X position
	byte	32		; Y position (horizon)
	byte	0		; ClassGroup
	byte	1		; Who Am I?
	word	32767		; how rich am i?
	word	0

; region contents vector
	byte	1, class_avatar		; NOID,CLASS
	byte	2, class_ground		; NOID,CLASS
	byte	3, class_wall		; NOID,CLASS
	byte	4, class_door		; NOID,CLASS
	byte	5, class_window		; NOID,CLASS
	byte	6, class_sign		; NOID,CLASS
	byte	7, class_countertop	; NOID,CLASS
	byte	8, class_head

	byte	0		; separator, now comes the state info

; FOR NOID 1
	byte	0		; Style
	byte	4*21		; X position
	byte	fg+7		; Y position
	byte	0		; Orientation
	byte	0		; Animation State
	byte	0		; Contained in		(END of standard vars)

	byte	0		; activity
	byte	0		; action
	byte	100		; health
	byte	0		; restrainer
	byte	0		; custom
	byte	0		; custom

; FOR NOID 2
	byte	0		; Style
	byte	0		; X position
	byte	bg+0		; Y position
	byte	st_colr+8*gray_3	; Orientation
	byte	0		; Animation State
	byte	0		; Contained in		(END of standard vars)

; FOR NOID 3
	byte	0		; Style
	byte	0		; X position
	byte	bg+32		; Y position
	byte	st_colr+8*green	; Orientation
	byte	0		; Animation State
	byte	0		; Contained in		(END of standard vars)

; FOR NOID 4
	byte	0		; Style
	byte	4*32		; X position
	byte	bg+33		; Y position
	byte	st_colr+8*white	; Orientation
	byte	0		; Animation State
	byte	0		; Contained in		(END of standard vars)
	byte	0,0,0		; DOOR 

; FOR NOID 5
	byte	0		; Style
	byte	4*17		; X position
	byte	bg+64		; Y position
	byte	0		; Orientation
	byte	0		; Animation State
	byte	0		; Contained in		(END of standard vars)

; FOR NOID 6
	byte	3		; Style
	byte	10*4		; X position
	byte	fg+8		; Y position
	byte	0		; Orientation
	byte	0		; Animation State
	byte	0		; Contained in		(END of standard vars)
	byte	"0123456789",128+6
	byte	123,124,125,126,128+6
	byte	"Hello There",128+6
	byte	9,10,"   ",126,128+6
	byte	11,12,128+6
	byte	"  "

; FOR NOID 7
	byte	0		; Style
	byte	4*22		; X position
	byte	fg+8		; Y position
	byte	st_colr+8*purple	; Orientation
	byte	0		; Animation State
	byte	0		; Contained in		(END of standard vars)
	byte	0,0,0		; COUNTERTOP

	byte	1,8,6,0,0,0		; a good head on his shoulders

	byte	7
	byte	9, class_gun
	byte	10,class_rock
	byte	0			; end of list

	byte	0,0,0,0,0,7		; gun
	byte	0,0,1,0,0,7,0		; what the rock is

end_of_FAKE_region::
	byte	0		; END OF MESSAGE

do_fake::
	movew	#start_fake_cv, response_data
	movew	#end_of_fake_region+1, end_of_packet_stream
	jmp	unpack_region
