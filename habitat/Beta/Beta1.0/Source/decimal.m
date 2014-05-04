;
; multiple precision decimal conversion
; leading zero suppression
; d. levine
; copyright 1986 Lucasfilm Ltd.
;
; macros are in /net/mycroft/u0/dl/lib/macros.m
;
include "dl_macros.m"
;
;define zeropage = 0x0010
;define relocatable = 0x1000
;
;
;    
; the following zeropage locations are used
;
;    org zeropage
;print_ptr:	block 2			; put address of output stream here
;c_value_ptr:	block 2			; put address of c_value here
;precision:	block 1			; put number of bytes in c_value here
;
;c_value:		block maxprecision
;digit:		block 1
;

define zero_bias = '0'			; c_value of zero in character set
define maxprecision = 4			; largest c_values will be 4 bytes

precision::	byte	0
digit:		byte	0
c_value:	block	maxprecision

; powers of ten table
;
;    org relocatable
;

variable entry[maxprecision]
tens:
    bytem maxprecision, 1
    bytem maxprecision, 10
entry[0] = maxprecision * 2
    bytem maxprecision, 100
mif (maxprecision > 1) {
    bytem maxprecision, 1000
entry[1] =  maxprecision * 4
    bytem maxprecision, 10000
mif (maxprecision > 2) {
    bytem maxprecision, 100000
    bytem maxprecision, 1000000
entry[2] =  maxprecision * 7
    bytem maxprecision, 10000000
mif (maxprecision > 3) {
    bytem maxprecision, 100000000
entry[3] =  maxprecision * 9
    bytem maxprecision, 1000000000
}}}
;
variable i
tens_pointers:
    mfor (i=0, i<maxprecision, ++i) {
	byte entry[i]
    }
;
; conversion routine
;
decimal::
    ldy precision
    dey
    cpy #maxprecision
    if (carry) {			; return if precision < 1 or > max
	rts
    }
    lda y[tens_pointers]
    tax					; x -> powers of ten
    ldy #maxprecision-1			; c_value = (unsigned long)(*c_value_ptr)
    lda #0
    do {
	cpy precision
	if (!carry) {
	    lda y[@c_value_ptr]
	}
	sta y[c_value]
	dey
    } while (!minus)
    ldy #0				; y -> print column
    do {
	clrb digit			; column accumulator
	do {
	    inc digit
	    dl_subm maxprecision, c_value, c_value, x[tens]
	} while (carry)
	dl_addm maxprecision, c_value, c_value, x[tens]
	dec digit
	if (zero) {			; its a zero
	    tya
	    if (zero) {			; and the leftmost digit
		txa
		if (!zero) {		; and not the ones column
		    jmp $supress	; so don't print it
		}
	    }
	}
	dl_addb y[@print_ptr], digit, #zero_bias
	iny				; bump column pointer
    $supress:
	dl_repeat maxprecision {		; bump power of ten pointer
	    dex
	}
    } while (!minus)
    rts
;
; end of decimal.m

	
convert_decimal::			; source => string
					; destination = result
					; carry set if error
	clearw	destination
	tay
next_digit:
	lda	y[@source]		; end of string
	if (zero) {
		clc
		rts			; must be success
	}
	sec
	sbc	#'0'
	if (geq) {
		cmp	#9
		if (leq) {
		    sta		save_a
		    movew	destination,length
		    ldx	#9
		    do {
			add16	length,destination,destination
			bcs	cd_exit				; overflow
			dex
		    } while (!zero)			; x10
		    lda		save_a
		    longbump	destination
		    bcs	cd_exit
		    iny
		    cpy	#6
		    bcc	next_digit	; do another one
		}
	}
cd_exit:
	rts		    
