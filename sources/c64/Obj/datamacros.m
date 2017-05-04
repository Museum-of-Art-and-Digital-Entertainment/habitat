; ----------------------------------------------------------------------
; Get Address indirect macros
; ----------------------------------------------------------------------
macro getclassaddr pointer,addr {
    
	ldy pointer
	lda y[Class_table_lo]
	sta addr
	lda y[Class_table_hi]
	sta addr+1
}    

macro getsoundaddr pointer,addr {
    
	ldy pointer
	lda y[Sound_table_lo]
	sta addr
	lda y[Sound_table_hi]
	sta addr+1
}    

macro getimageaddr pointer,addr {
    
	ldy pointer
	lda y[Image_table_lo]
	sta addr
	lda y[Image_table_hi]
	sta addr+1
}    

macro getactionaddr pointer,addr {
    
	ldy pointer
	lda y[Action_table_lo]
	sta addr
	lda y[Action_table_hi]
	sta addr+1
}    

macro getobjectaddr pointer,addr {
    
	ldy pointer
	lda y[Object_table_lo]
	sta addr
	lda y[Object_table_hi]
	sta addr+1
}    

macro fGetClassAddr Address {
	jsr fGet_Class
	stx Address
	sta Address+1
}    

macro fGetSoundAddr Address {
	jsr fGet_Sound
	stx Address
	sta Address+1
}    

macro fGetImageAddr Address {
	jsr fGet_Image
	stx Address
	sta Address+1
}    

macro fGetActionAddr Address {
	jsr fGet_Action
	stx Address
	sta Address+1
}    

macro fGetObjectAddr Address {
	jsr fGet_Object
	stx Address
	sta Address+1
}    

macro lGetClassAddr pointer,Addr {
	ldy pointer
	fGetClassAddr	Addr
}

macro lGetSoundAddr pointer,Addr {
	ldy pointer
	fGetSoundAddr	Addr
}

macro lGetImageAddr pointer,Addr {
	ldy pointer
	fGetImageAddr	Addr
}    

macro lGetActionAddr pointer,Addr {
	ldy pointer
	fGetActionAddr	Addr
}    

macro lGetObjectAddr pointer,Addr {
	ldy pointer
	fGetObjectAddr	Addr
}    

; ----------------------------------------------------------------------
; Put Address indirect macros
; ----------------------------------------------------------------------
macro putClassAddr pointer,Addr {
    
	ldy pointer
	lda Addr+1
	sta y[Class_table_hi]
	lda Addr
	sta y[Class_table_lo]
}    

macro putSoundAddr pointer,Addr {
    
	ldy pointer
	lda Addr+1
	sta y[Sound_table_hi]
	lda Addr
	sta y[Sound_table_lo]
}    

macro putImageAddr pointer,Addr {
    
	ldy pointer
	lda Addr+1
	sta y[Image_table_hi]
	lda Addr
	sta y[Image_table_lo]
}    

macro putActionAddr pointer,Addr {
    
	ldy pointer
	lda Addr+1
	sta y[Action_table_hi]
	lda Addr
	sta y[Action_table_lo]
}    

macro putObjectAddr pointer,Addr {
    
	ldy pointer
	lda Addr+1
	sta y[Object_table_hi]
	lda Addr
	sta y[Object_table_lo]

}    
; ----------------------------------------------------------------------
; Get refrence indirect macros
; ----------------------------------------------------------------------
macro GetClassref pointer {
    
	ldy pointer
	lda y[Class_table_ref]
}    

macro GetSoundref pointer {
    
	ldy pointer
	lda y[Sound_table_ref]
}    

macro GetImageref pointer {
    
	ldy pointer
	lda y[Image_table_ref]
}    

macro GetActionref pointer {
    
	ldy pointer
	lda y[Action_table_ref]
}    

macro GetObjectref pointer {
    
	ldy pointer
	lda y[Object_table_ref]
}    
; ----------------------------------------------------------------------
; Put refrence macros
; ----------------------------------------------------------------------
macro putClassref pointer {
    
	ldy pointer
	sta y[Class_table_ref]
}    

macro putSoundref pointer {
    
	ldy pointer
	sta y[Sound_table_ref]
}    

macro putImageref pointer {
    
	ldy pointer
	sta y[Image_table_ref]
}    

macro putActionref pointer {
    
	ldy pointer
	sta y[Action_table_ref]
}    

macro putObjectref pointer {
    
	ldy pointer
	sta y[Object_table_ref]
}    
