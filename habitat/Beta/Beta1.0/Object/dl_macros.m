;
; macros.m
;
mif (!isDefined(DLMACROS)) {
    define DLMACROS = 0
;
; save and restore registers
;
macro phr {
    pha
    txa
    pha
    tya
    pha
}
macro plr {
    pla
    tay
    pla
    tax
    pla
}
;
; push an dl_address to rts to
;
macro pushdl_addr dl_address {
    lda #?(dl_address - 1)
    pha
    lda #/(dl_address - 1)
    pha
}
function accessbyte_i(v, n) {
    freturn ((v >> (8*n)) & (0xff))
}
function accessbyte_a(v, n) {
    freturn (v + n)
}
macro bytem n, v {
    mvariable i
    mfor (i=0, i<n, ++i) {
	byte accessbyte_i(v, i)
    }
}
macro clrm n, d {
    mvariable i
    lda #0
    mfor (i=0, i<n, ++i) {
	mif (isImmediateMode(d)) {
	    sta accessbyte_i(d, i)
	} melse {
	    sta accessbyte_a(d, i)
	}
    }
}
macro dl_movm n, d, s {
    mvariable i
    mfor (i=0, i<n, ++i) {
	mif (isImmediateMode(s)) {
	    lda accessbyte_i(s, i)
	} melse {
	    lda accessbyte_a(s, i)
	}
	mif (isImmediateMode(d)) {
	    sta accessbyte_i(d, i)
	} melse {
	    sta accessbyte_a(d, i)
	}
    }
}
macro mv2m n, d0, d1, s {
    mvariable i
    mfor (i=0, i<n, ++i) {
	mif (isImmediateMode(s)) {
	    lda accessbyte_i(s, i)
	} melse {
	    lda accessbyte_a(s, i)
	}
	mif (isImmediateMode(d0)) {
	    sta accessbyte_i(d0, i)
	} melse {
	    sta accessbyte_a(d0, i)
	}
	mif (isImmediateMode(d1)) {
	    sta accessbyte_i(d1, i)
	} melse {
	    sta accessbyte_a(d1, i)
	}
    }
}
macro dl_addm n, d, s0, s1 {
    mvariable i
    clc
    mfor (i=0, i<n, ++i) {
	mif (isImmediateMode(s0)) {
	    lda accessbyte_i(s0, i)
	} melse {
	    lda accessbyte_a(s0, i)
	}
	mif (isImmediateMode(s1)) {
	    adc accessbyte_i(s1, i)
	} melse {
	    adc accessbyte_a(s1, i)
	}
	mif (isImmediateMode(d)) {
	    sta accessbyte_i(d, i)
	} melse {
	    sta accessbyte_a(d, i)
	}
    }
}
macro dl_subm n, d, s0, s1 {
    mvariable i
    sec
    mfor (i=0, i<n, ++i) {
	mif (isImmediateMode(s0)) {
	    lda accessbyte_i(s0, i)
	} melse {
	    lda accessbyte_a(s0, i)
	}
	mif (isImmediateMode(s1)) {
	    sbc accessbyte_i(s1, i)
	} melse {
	    sbc accessbyte_a(s1, i)
	}
	mif (isImmediateMode(d)) {
	    sta accessbyte_i(d, i)
	} melse {
	    sta accessbyte_a(d, i)
	}
    }
}
macro cmpm n, s0, s1 {
    mvariable i
    sec
    mfor (i=0, i<n, ++i) {
	mif (isImmediateMode(s0)) {
	    lda accessbyte_i(s0, i)
	} melse {
	    lda accessbyte_a(s0, i)
	}
	mif (isImmediateMode(s1)) {
	    sbc accessbyte_i(s1, i)
	} melse {
	    sbc accessbyte_a(s1, i)
	}
    }
}
macro eorm n, d, s0, s1 {
    mvariable i
    mfor (i=0, i<n, ++i) {
	mif (isImmediateMode(s0)) {
	    lda accessbyte_i(s0, i)
	} melse {
	    lda accessbyte_a(s0, i)
	}
	mif (isImmediateMode(s1)) {
	    eor accessbyte_i(s1, i)
	} melse {
	    eor accessbyte_a(s1, i)
	}
	mif (isImmediateMode(d)) {
	    sta accessbyte_i(d, i)
	} melse {
	    sta accessbyte_a(d, i)
	}
    }
}
macro negm n, d {
    mvariable i
    sec
    mfor (i=0, i<n, ++i) {
	lda #0
	mif (isImmediateMode(d)) {
	    sbc accessbyte_i(d, i)
	} melse {
	    sbc accessbyte_a(d, i)
	}
	mif (isImmediateMode(d)) {
	    sta accessbyte_i(d, i)
	} melse {
	    sta accessbyte_a(d, i)
	}
    }
}
macro asrm n, d {
    mvariable i = n
    mif (isImmediateMode(d)) {
	lda accessbyte_i(d, i-1)
    } melse {
	lda accessbyte_a(d, i-1)
    }
    cmp #0x80
    mwhile (i--) {
	mif (isImmediateMode(d)) {
	    ror accessbyte_i(d, i)
	} melse {
	    ror accessbyte_a(d, i)
	}
    }
}
macro aslm n, d {
    mvariable i
	mif (isImmediateMode(d)) {
	    asl accessbyte_i(d, 0)
	} melse {
	    asl accessbyte_a(d, 0)
	}
    mfor (i=1, i<n, ++i) {
	mif (isImmediateMode(d)) {
	    rol accessbyte_i(d, i)
	} melse {
	    rol accessbyte_a(d, i)
	}
    }
}
macro lsrm n, d {
    mvariable i = n
    mif (isImmediateMode(d)) {
	lsr accessbyte_i(d, --i)
    } melse {
	lsr accessbyte_a(d, --i)
    }
    mwhile (i--) {
	mif (isImmediateMode(d)) {
	    ror accessbyte_i(d, i)
	} melse {
	    ror accessbyte_a(d, i)
	}
    }
}
macro incm n, d {
    mvariable i
    mif (isImmediateMode(d)) {
	inc accessbyte_i(d, 0)
    } melse {
	inc accessbyte_a(d, 0)
    }
    mfor (i=1, i<n, ++i) {
	if (zero) {
	    mif (isImmediateMode(d)) {
		inc accessbyte_i(d, i)
	    } melse {
		inc accessbyte_a(d, i)
	    }
	}
    }
}
macro clrb d {
    clrm 1, d
}
macro clrw d {
    clrm 2, d
}
macro dl_movb d, s {
    dl_movm 1, d, s
}
macro dl_movw d, s {
    dl_movm 2, d, s
}
macro dl_addb d, s0, s1 {
    dl_addm 1, d, s0, s1
}
macro dl_addw d, s0, s1 {
    dl_addm 2, d, s0, s1
}
macro dl_subb d, s0, s1 {
    dl_subm 1, d, s0, s1
}
macro dl_subw d, s0, s1 {
    dl_subm 2, d, s0, s1
}
macro cmpb s0, s1 {
    cmpm 1, s0, s1
}
macro cmpw s0, s1 {
    cmpm 2, s0, s1
}
macro eorb d, s0, s1 {
    eorm 1, d, s0, s1
}
macro eorw d, s0, s1 {
    eorm 2, d, s0, s1
}
macro negb d {
    negm 1, d
}
macro negw d {
    negm 2, d
}
macro asrb d {
    asrm 1, d
}
macro asrw d {
    asrm 2, d
}
macro aslb d {
    aslm 1, d
}
macro aslw d {
    aslm 2, d
}
macro lsrb d {
    lsrm 1, d
}
macro lsrw d {
    lsrm 2, d
}
macro dl_repeat n, code {
    mvariable i = n
    mwhile (i--) {
	code
    }
}
;
; temporary storage allocator
;
variable stacktop = 0
macro storage dl_addr {
    stacktop = dl_addr
}
macro stack dl_addr, n {
    mif (isDefined(dl_addr)) {
	undefine dl_addr
    }
    define dl_addr = stacktop + 1 - n
    stacktop -= n
}
macro dl_moveb src, dst {
    dl_movb dst, src
}
macro dl_movew src, dst {
    dl_movw dst, src
}
}
;
; end of macros.m
