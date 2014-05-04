function set1bit (bp1) {

	freturn 1<<bp1

	}

function set2bits (bp1,bp2) {

	freturn (1<<bp1) | (1<<bp2)

	}

function set3bits (bp1,bp2,bp3) {

	freturn (1<<bp1) | (1<<bp2) | (1<<bp3)

	}

function set4bits (bp1,bp2,bp3,bp4) {

	freturn (1<<bp1) | (1<<bp2) | (1<<bp3) | (1<<bp4)

	}

macro lockup color {
    lda color
    sta 0xd020
temp: jmp temp
}


macro stxy addr {
    
    stx addr
    sty addr+1
}

macro ldxy addr {

	mif (isImmediateMode(addr)) {
		ldx	makeFirstByteImmediate(addr) 
		ldy	makeSecondByteImmediate(addr)
	} melse {
		ldx	makeFirstByte(addr) 
		ldy	makeSecondByte(addr)
	}
}

macro movemb	src, dst[] {
	mif (!isAregister(src)) {
	    lda src
	}
	mvariable i
	mvariable num = arraylength(dst)
	mfor (i=0, i<num, ++i) {
	    sta	dst[i]
	}
}

macro movemw	src, dst[] {
	mvariable i
	mif (isImmediateMode(src)) {
	    lda	makeFirstByteImmediate(src) 
	} melse {
	    lda makeFirstByte(src)
	}
	mfor (i=0, i<arraylength(dst), ++i) {
	    mif (isImmediateMode(dst[i])) {
	        lda makeFirstByteImmediate(dst[i]) 
	    } melse {
	        lda makeFirstByte(dst[i])
	    }
	}
	mif (isImmediateMode(src)) {
	    lda	makeSecondByteImmediate(src)
	} melse {
	    lda makeSecondByte(src)
	}
	mfor (i=0, i<arraylength(dst), ++i) {
	    mif (isImmediateMode(dst[i])) {	
		sta makeSecondByteImmediate(dst[i])
	    } melse {
		sta makeSecondByte(dst[i])
	    }
	}
}

macro addlh destl,desth,src1l,src1h,src2l,src2h {

	lda src1l
	clc
	adc src2l
	sta destl

	lda src1h
	adc src2h
	sta desth

}

macro addhl desth,destl,src1h,src1l,src2h,src2l {

	lda src1l
	clc
	adc src2l
	sta destl

	lda src1h
	adc src2h
	sta desth

}

macro sublh destl,desth,src1l,src1h,src2l,src2h {

	lda src1l
	sec
	sbc src2l
	sta destl

	lda src1h
	sbc src2h
	sta desth

}

macro subhl desth,destl,src1h,src1l,src2h,src2l {

	lda src1l
	sec
	sbc src2l
	sta destl

	lda src1h
	sbc src2h
	sta desth

}

macro movehl srch,srcl , desth,destl {

	lda srch
	sta desth

	lda srcl
	sta destl

}

macro movelh srcl,srch , destl,desth {

	lda srch
	sta desth

	lda srcl
	sta destl

}

macro add num {

	clc
	adc num
}

macro sub num {

	sec
	sbc num
}

macro mbyte num,val {	

	repeat num{
	  byte val
	}

}

macro loop_up counter,start_loop,end_loop,ablock {

	mif (isXregister(counter)) {
	     ldx start_loop
	} melseif (isYregister(counter)) {
	          ldy start_loop
        } melse {
                  lda start_loop
		  sta counter
	}

	mif (IsImmediateMode(end_loop)) {
	
	do {
	    ablock

	    mif (isXregister(counter)) {
	         inx
	         cpx (end_loop+1)%256
	    } melseif (isYregister(counter)) {
		      iny
		      cpy (end_loop+1)%256
	    } melse {
		      inc counter
		      lda counter
		      cmp (end_loop+1)%256
	    }
	} until (equal)

	} melse {
	
	do {
	    ablock

	    mif (isXregister(counter)) {
	         inx
	         cpx end_loop
	    } melseif (isYregister(counter)) {
		      iny
		      cpy end_loop
	    } melse {
		      inc counter
		      lda counter
		      cmp end_loop
	    }

	} until (gt)				  
	}
}

macro loop_down counter,start_loop,end_loop,ablock {

	mif (isXregister(counter)) {
	     ldx start_loop
	} melseif (isYregister(counter)) {
	          ldy start_loop
        } melse {
                  lda start_loop
		  sta counter
	}

	mif (IsImmediateMode(end_loop)) {
	
	do {
	    ablock

	    mif (isXregister(counter)) {
	         dex
	         cpx (end_loop-1)%256
	    } melseif (isYregister(counter)) {
		      dey
		      cpy (end_loop-1)%256
	    } melse {
		      dec counter
		      lda counter
		      cmp (end_loop-1)%256
	    }
	} until (equal)

	} melse {
	
	do {
	    ablock

	    mif (isXregister(counter)) {
	         dex
	         cpx end_loop
	    } melseif (isYregister(counter)) {
		      dey
		      cpy end_loop
	    } melse {
		      dec counter
		      lda counter
		      cmp end_loop
	    }

	} until (lt)				  
	}
}

macro loop_to_zero counter,start_loop,ablock {

	mif (isXregister(counter)) {
	     ldx start_loop
	} melseif (isYregister(counter)) {
	          ldy start_loop
        } melse {
                  lda start_loop
		  sta counter
	}

	do {
	    ablock

	    mif (isXregister(counter)) {
	         dex
	    } melseif (isYregister(counter)) {
		      dey
	    } melse {
		      dec counter
	    }
	} until (minus)
}

macro Set_Next_IRQ name,video_line {

	movew #name,0xFFFE
	moveb #video_line,0xd012
	lda #0x81
	sta 0xD019
	sta 0xD01A
	lda 0xDC0D

}

macro savereg reg1,reg2,reg3 {

	mif (isdefined(reg1)) {
	    mif (isAregister(reg1)) {
		    sta A_save
	    }
	    mif (isXregister(reg1)) {
		    stx X_save
	    }
	    mif (isYregister(reg1)) {
		    sty Y_save
	    }
	}

	mif (isdefined(reg2)) {
	    mif (isAregister(reg2)) {
		    sta A_save
	    }
	    mif (isXregister(reg2)) {
		    stx X_save
	    }
	    mif (isYregister(reg2)) {
		    sty Y_save
	    }
	}

	mif (isdefined(reg3)) {
	    mif (isAregister(reg3)) {
		    sta A_save
	    }
	    mif (isXregister(reg3)) {
		    stx X_save
	    }
	    mif (isYregister(reg3)) {
		    sty Y_save
	    }
	}
}


macro loadreg reg1,reg2,reg3 {

	mif (isdefined(reg1)) {
	    mif (isAregister(reg1)) {
		    lda A_save
	    }
	    mif (isXregister(reg1)) {
		    ldx X_save
	    }
	    mif (isYregister(reg1)) {
		    ldy Y_save
	    }
	}

	mif (isdefined(reg2)) {
	    mif (isAregister(reg2)) {
		    lda A_save
	    }
	    mif (isXregister(reg2)) {
		    ldx X_save
	    }
	    mif (isYregister(reg2)) {
		    ldy Y_save
	    }
	}

	mif (isdefined(reg3)) {
	    mif (isAregister(reg3)) {
		    lda A_save
	    }
	    mif (isXregister(reg3)) {
		    ldx X_save
	    }
	    mif (isYregister(reg3)) {
		    ldy Y_save
	    }
	}
}

macro dinc value {

      inc value
      if (equal) {
         inc value+1
      }
}

macro ddec value {

	lda value
	if (equal) {
	   dec value+1
	}
	dec value
}

macro incw value {

      inc value
      if (equal) {
         inc value+1
      }
}

macro decw value {

	lda value
	if (equal) {
	   dec value+1
	}
	dec value
}

macro movemem from,to,number {

	movew #from,temp2
	movew #to,temp3
	movew #number,temp

    mif(Isdefined(movefirst)) {
	jsr move_mem_sub
    } melse {
        variable movefirst = 1
	jsr move_mem_sub
	jmp over_move_mem_sub
move_mem_sub:
	do {
	   ldy #0
	   lda y[@temp2]
	   sta y[@temp3]
	   dinc temp2
	   dinc temp3
	   ddec temp
	   lda temp
	   ora temp+1
	} until(zero)
	rts
over_move_mem_sub:
    }
}
   
macro fillmem from,number,code {

	movew from,temp2
	movew number,temp3
	lda temp3
	sec
	sbc temp2
	sta temp3
	lda temp3+1
	sbc temp2+1
	sta temp3+1
	ldx code

    mif(Isdefined(fillfirst)) {
	jsr fill_mem_sub
    } melse {
        variable fillfirst = 1
	jsr fill_mem_sub
	jmp over_fill_mem_sub
fill_mem_sub:
	do {
	   ldy #0
	   txa
	   sta y[@temp2]
	   dinc temp2
	   ddec temp3
	   lda temp3
	   ora temp3+1
	} until(zero)
	rts
over_fill_mem_sub:
    }
}
   
macro loop counter,start_loop,end_loop,ablock {

	mif (end_loop==0) {
	     loop_to_zero counter,start_loop,ablock
	} melse {
	     loop_up counter,start_loop,end_loop,ablock
	}
}

;	} melseif ((start_loop>end_loop)&&
;		   (isimmediatemode(start_loop))&&
;	           (isimmediatemode(end_loop))) {
;	     loop_up counter,start_loop,end_loop,ablock
;	} melse {
;	     loop_down counter,start_loop,end_loop,ablock
;	}
;}

macro cmpw arg1,arg2 {
    
    mif(isImmediateMode(arg1)) {
        lda MakeSecondByteImmedate(arg1)
    } melse {
        lda MakeSecondByte(arg1)
    }		
    mif(isImmediateMode(arg2)) {
        cmp MakeSecondByteImmedate(arg2)
    } melse {
        cmp MakeSecondByte(arg2)
    }		
    if (equal) {
	mif(isImmediateMode(arg1)) {
	    lda MakeFirstByteImmedate(arg1)
	} melse {
	    lda MakeFirstByte(arg1)
	}		
	mif(isImmediateMode(arg2)) {
	    cmp MakeFirstByteImmedate(arg2)
	} melse {
	    cmp MakeFirstByte(arg2)
	}		
    }
}

macro clx {
    
    ldx #0x00
}

macro cly {
    
    ldy #0x00
}

macro cla {
    
    lda #0x00
}
