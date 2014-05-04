; ================================================================
; some auxiliary functions for the macros that follow
;

; MAKE-FIRST-BYTE - access low byte for any addressing mode
function makeFirstByteImmediate(operand) {
	freturn(/operand)
}
function makeFirstByte(operand) {
	freturn(operand)
}

; MAKE-SECOND-BYTE - access high byte for any addr mode except (post y zzz)
function makeSecondByteImmediate(operand) {
	freturn(?operand)
}
function makeSecondByte(operand) {
	freturn(operand + 1)
}

; MAKE-NTH-BYTE - similarly access arbitrary byte
function makeNthByteImmediate(operand, n) {
	freturn((operand >> (8 * (n - 1))) & 0xFF)
}
function makeNthByte(operand, n) {
	freturn(operand + n - 1)
}

; ================================================================
; MOVM, MOVEB, MOVB, MOVEW, MOVW, CLEARB, and CLEARW
; Note that the args on MOVEx are src,dst as opposed to
; MOVx, which uses dst,src.
; 

; MOVEB - move byte from src to dst
macro	moveb	src, dst {
	lda 	src
	sta	dst
}


; MOVEW - move word from src to dst
;	works for all addressing moves EXCEPT (post y zzz)
macro	movew	src, dst {
	mif (isImmediateMode(src)) {
		lda	makeFirstByteImmediate(src) 
		sta	makeFirstByte(dst)
		lda	makeSecondByteImmediate(src)
		sta	makeSecondByte(dst)
	} melse {
		lda	makeFirstByte(src) 
		sta	makeFirstByte(dst)
		lda	makeSecondByte(src)
		sta	makeSecondByte(dst)
	}
}

; CLEARB - zero byte dst
macro	clearb	dst {
	lda	#0
	sta	dst
}

; CLEARW - zero word dst
;	works for all addressing modes EXCEPT (post y dst)
macro	clearw	dst {
	lda	#0
	sta	makeFirstByte(dst)
	sta	makeSecondByte(dst)
}


; ================================================================
; the general macros
; 

; ADDB - byte dst = byte src0 + byte src1
macro	addb	dst, src0, src1 {
	clc
	lda	src0
	adc	src1
	sta	dst
}

; ADDW - word dst = word src0 + word src1
;	works for all addressing modes EXCEPT (post y zzz)
macro addw dst, src0, src1 {
	clc
	mif (isImmediateMode(src0)) {
		lda	makeFirstByteImmediate(src0)
	} melse {
		lda	makeFirstByte(src0)
	}
	mif (isImmediateMode(src1)) {
		adc	makeFirstByteImmediate(src1)
	} melse {
		adc	makeFirstByte(src1)
	}
	sta	makeFirstByte(dst)
	mif (isImmediateMode(src0)) {
		lda	makeSecondByteImmediate(src0)
	} melse {
		lda	makeSecondByte(src0)
	}
	mif (isImmediateMode(src1)) {
		adc	makeSecondByteImmediate(src1)
	} melse {
		adc	makeSecondByte(src1)
	}
	sta	makeSecondByte(dst)
}

; ADDWWB - word dst = word src0 + byte src1
;	works for all addressing modes EXCEPT (post y zzz)
macro	addwwb	dst, src0, src1 {
	clc
	mif (isImmediateMode(src0)) {
		lda	makeFirstByteImmediate(src0)
	} melse {
		lda	makeFirstByte(src0)
	}
	adc	src1
	sta	makeFirstByte(dst)
	mif (isImmediateMode(src0)) {
		lda	makeSecondByteImmediate(src0)
	} melse {
		lda	makeSecondByte(src0)
	}
	adc	#0
	sta	makeSecondByte(dst)
}

; SUBB - byte dst = byte src0 - byte src1
macro	subb	dst, src0, src1 {
	sec
	lda	src0
	sbc	src1
	sta	dst
}

; SUBW - word dst = word src0 - word src1
;	works for all addressing modes EXCEPT (post y zzz)
macro	subw	dst, src0, src1 {
	sec
	mif (isImmediateMode(src0)) {
		lda	makeFirstByteImmediate(src0)
	} melse {
		lda	makeFirstByte(src0)
	}
	mif (isImmediateMode(src1)) {
		sbc	makeFirstByteImmediate(src1)
	} melse {
		sbc	makeFirstByte(src1)
	}
	sta	makeFirstByte(dst)
	mif (isImmediateMode(src0)) {
		lda	makeSecondByteImmediate(src0)
	} melse {
		lda	makeSecondByte(src0)
	}
	mif (isImmediateMode(src1)) {
		sbc	makeSecondByteImmediate(src1)
	} melse {
		sbc	makeSecondByte(src1)
	}
	sta	makeSecondByte(dst)
}

; SUBWWB - word dst = word src0 - byte src1
;	works for all addressing modes EXCEPT (post y zzz)
macro	subwwb	dst, src0, src1 {
	sec
	mif (isImmediateMode(src0)) {
		lda	makeFirstByteImmediate(src0)
	} melse {
		lda	makeFirstByte(src0)
	}
	sbc	src1
	sta	makeFirstByte(dst)
	mif (isImmediateMode(src0)) {
		lda	makeSecondByteImmediate(src0)
	} melse {
		lda	makeSecondByte(src0)
	}
	sbc	#0
	sta	makeSecondByte(dst)
}

; ================================================================
; repeat n {code. . .}
; 	repeat n instances of code.  e.g.,
;	repeat 6 {
; 		lda	x[foo]
; 		sta	x[bar]
; 		inx
;	}
; 	will generate inline code to move 6 bytes
; 
macro	repeat	count, blockToRepeat {
	mvariable i = count
	mwhile (i-- > 0) {
		blockToRepeat
	}
}

macro	includef fname {
	printf("Including %s\n", fname)
	include	fname
}


;
;	Fill - Fill dst with Nbytes of fillchar - destroys A, X, Y.
;		valid for 32K > Nbytes > 1
;
;	The new destination is
;	the base destination plus as many whole pages
;	as are in the number of bytes to transfer

macro	fill	dst, nbytes, fillchar {

	movew	#(dst+((nbytes-1)&0xFF00)),temp_address
	lda	#fillchar
	sta	(dst + nbytes - 1)	; Last byte is special case

	ldy	#/(nbytes - 1)	; Start by transfering fractional page
	ldx	#?(nbytes - 1)	; X counts number of whole pages, backwards
	jsr	DoFill		; go do it

}				; End Fill


;****************************************
;	Randy's macros
;****************************************

macro	ADD16	a1,a2,ds {
    addw ds,a1,a2
}

macro	SUB16	s1,s2,ds {
    subw ds,s1,s2
}

macro	CMP16	src0, src1 {
	sec
	mif (isImmediateMode(src0)) {
		lda	makeFirstByteImmediate(src0)
	} melse {
		lda	makeFirstByte(src0)
	}
	mif (isImmediateMode(src1)) {
		sbc	makeFirstByteImmediate(src1)
	} melse {
		sbc	makeFirstByte(src1)
	}
	mif (isImmediateMode(src0)) {
		lda	makeSecondByteImmediate(src0)
	} melse {
		lda	makeSecondByte(src0)
	}
	mif (isImmediateMode(src1)) {
		sbc	makeSecondByteImmediate(src1)
	} melse {
		sbc	makeSecondByte(src1)
	}
}

macro	TEST16	src0, src1 {
	mif (isImmediateMode(src0)) {
		lda	makeFirstByteImmediate(src0)
	} melse {
		lda	makeFirstByte(src0)
	}
	mif (isImmediateMode(src1)) {
		cmp	makeFirstByteImmediate(src1)
	} melse {
		cmp	makeFirstByte(src1)
	}
	if (equal) {
	mif (isImmediateMode(src0)) {
		lda	makeSecondByteImmediate(src0)
	} melse {
		lda	makeSecondByte(src0)
	}
	mif (isImmediateMode(src1)) {
		cmp	makeSecondByteImmediate(src1)
	} melse {
		cmp	makeSecondByte(src1)
	}
	}
}

macro	INC16	w {
    inc	w
    if (zero) {
	inc	w+1
    }
}

macro	DEC16	w {
    lda	w
    if (zero) {
	dec	w+1
    }
    dec	w
}

macro	BUMP	w {
    clc
    adc	w
    sta	w
    if (carry) {
	inc	w+1
    }
}

macro	LONGBUMP	w {
    clc
    adc	w
    sta	w
    lda	w+1
    adc	#0
    sta	w+1
}



macro	bank_IO_in {
    lda	#0x25
    sta	0x01
}

macro	bank_IO_in_y {
    ldy	#0x25
    sty	0x01
}

macro	save_and_bank_IO_in {
    lda	0x01
    pha
    bank_IO_in
}

macro	bank_IO_out {
    lda	#0x24
    sta	0x01
}

macro	bank_IO_out_y {
    ldy	#0x24
    sty	0x01
}

macro	restore_IO {
    pla
    sta	0x01
}

macro	read_file_directory	fnam {
	movew	fnam,	directory_start
	jsr	read_into_cache
}

macro	inc_border_color {
    save_and_bank_io_in
    inc	border_color
    restore_io
}

macro	error errnum {
    sta	error_regs_a
    lda	#errnum
    jsr	process_error
}

macro waitfor num {
	do {
	        lda switcher
	       	cmp num
	} until (equal)
	lda	#0
	sta	switcher
}

