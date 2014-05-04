; throttle.m or, how to keep a host from overfeeding us.
; F Randall Farmer & Chip Morningstar.


define	History_Size		=	64
define	History_Size_Bits	=	6
define	Sample_Size		=	2
define	Sample_Size_Bits	=	1
define	Sample_Duration		=	60		; jiffies
define	Min_Throttle_Duration	=	1

sample_counter::		byte	Sample_Duration
history_sum:			word	0
sample_sum:			word	0
throttle_duration::		word	Min_Throttle_Duration
mif (0) {
				word	0		; for printf
report_throttle::
	movew	#throttle_duration, printf_parameters
	jsr	balloon_printf
	string	"Throttle = #"
	rts
}

sample_counter_expired::
	moveb	#Sample_Duration, sample_counter
	clearw	history_sum
	sta	sample_sum
	sta	sample_sum+1
	ldy	#History_Size-1
	do {
	    lda	y[history]
	    bump	history_sum
	    dey
	} while (plus)			; sum of entire history
	ldx	#Sample_Size-1
	ldy	sample_pointer
	do {
	    lda	y[history]
	    bump	sample_sum
	    dey
	    dex				; sum of recent sample
	} while (plus)
	repeat (History_Size_Bits) {
	    lsr	history_sum+1
	    ror	history_sum		; /32
	}
	repeat (Sample_Size_Bits) {
	    lsr	sample_sum+1
	    ror	sample_sum		; /4
	}
throttle_selfmod::
	lda	#/Default_throttle_decrement
	ldx	#?Default_throttle_decrement
	ldy	history_sum
	cpy	sample_sum
	if (!carry) {
throttle_selfmod2::
	    lda	#/Default_throttle_increment
	    ldx	#?Default_throttle_increment
	}
	clc
	adc	throttle_duration
	tay
	txa
	adc	throttle_duration+1
	if (minus) {
	    lda	#?Min_Throttle_Duration
	    ldy	#/Min_Throttle_Duration
	}
	sty	throttle_duration
	sta	throttle_duration+1

	ldy	sample_pointer			; set up next unit sample
	iny
	cpy	#History_Size
	if (equal) {
	    ldy	#0
	}
	sty	sample_pointer
	clearb	y[history]
	rts

