	include	"farmers_equates.m"
	include "../Obj/macros.m"

	org	0x4000
	start 	mini

current_screen:		byte	0x18
delay_time:		byte 	0

delay:
	ldx 	delay_time
	do {
	    nop
	    nop
	    dex
	} until (zero)
	rts

mini:
;	moveb	#0b00011000,	vic_control_2		; 6
;	jsr delay
;	moveb	current_screen,	vic_memory_control
;	jsr delay

;	moveb	#0b00011000,	vic_memory_control	; charset at +x2000
;	jsr delay
;	moveb	#0b00001000,	vic_control_2		; to text mode
;	jsr delay

	moveb	#0b00111011,	vic_control		; 6
	lda	0xd012
	cmp	#251
	if (carry) {
	    moveb	#0b00011011,	vic_control		; to text!
	}
	jmp	mini
