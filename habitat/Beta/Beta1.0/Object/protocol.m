; 	protocol.m
; 	taken from original code written by Quantum
; 	re-written (optimised) by F Randall Farmer, Lucasfilm Games
; 
;  intended use:
;  RS232O/p_send_numbered_packet
; 	move POINTER, to MSGPNT
; 	move buffersize, MESSSZ
; 	jsr	RS232O/p_send_numbered_packet
; 
; RS232/p_get_bytes
; 
; [userpacket] > RS232O > [OBUFFS]
; 
; [OBUFFS] > send_a_buffer > [rs232_output]
; 
; [rs232_input] > RS232I > (handle message, que response)
; 
; 

define	DATA		=	0x20
define	SS		=	0x21
define	SSR		=	0x22
define	INIT		=	0x23
define	ACK		=	0x24
define	NAK		=	0x25
define	HEARTB		=	0x26
define	SYNC		=	0x5A

define	OFF_SYNC 	=	0
define	OFF_CRC  	=	1
define	OFF_TXSQ 	=	5
define	OFF_RXSQ 	=	6
define	OFF_TYPE 	=	7
define	OFF_DATA 	=	8
define	OFF_PCRC 	=	OFF_CRC + 4	; OFFSET OF 1ST BYTE PAST CRC

define	ACKNUM		=	8
define	poly_low	=	0xa0
define	poly_high	=	0x01
define	heartbeat_value	=	2

; protocol.m

NXTSEQ::	byte    0x10	; NEXT EXPECTED SEQ #
LSTSEQ::	byte    0x7F	; LAST SEQ # RECIEVED, USED AS RESP #
SEQOUT::	byte    0x10	; NEXT SEQ # FOR OUTPUT
LSTSQO::	byte    0x7F	; LAST SEQ # SENT
ACKNED:		byte    ACKNUM	; COUNTDOWN TO ACK NEEDED
INITST::	byte	1	; INIT STATE FLAG

COUNT:		byte	0	; RS INPUT COUNT
SYNCD_UP:	byte	0	; NON-0 IF IN SYNC
NAKSNT:		byte	0	; BUFFER of last NAK sent
BUFFS:		byte	0	; NUMBER OF BUFFERS IN USE
Local_TEMP:	byte	0
Local_TEMP2:	byte	0
BUFPNT:		byte	0	; POINTER TO CURRENT OUTPUT BUFFER
LSTOUT:		byte	0	; POINTER TO LAST MESSAGE OUTPUT=BUFPNT IF N
YINDEX:		byte	0	

define	lost_carrier_HB_count	=	12	; appox 10sec apart
define	regionproc_crash_timer_value  =	6*60*3	; no RP communications

regionproc_crash_timer::	word	regionproc_crash_timer_value
heartbeat_counter::		byte	lost_carrier_HB_count
heartbeat_wait:	byte	2
Qlink_packet::	byte	"ZCCCCSSTSG",13
					; for SG and other messages to Host


p_packet_length:	byte	0
p_character_timer:	byte	0	; in IRQs
p_packet_type:		byte	0
; -----------------------------------------------------------------
RIBTM:
maintain_rs232::
	lda	p_send_packet_lock
	if (minus) {rts}		; no if in RS232O or re-entrant

	moveb	#0xff,p_send_packet_lock
	jsr	p_send_a_buffer		; if we can, put buffer out!

	jsr	RS232I			; take care of input
	clearb	p_send_packet_lock
	rts

; -----------------------------------------------------------------

RS232O::
p_send_numbered_packet:
	clearb	p_send_packet_lock
mif (debug_mode) {
	sta	fastlink_on
}
	jsr	p_wait_for_a_free_buffer	; when found, locks s_p_l
	moveb	#DATA,p_packet_type
	movew	MSGPNT,	packet
	lda	MESSSZ
	clc
	adc	#10
	sta	p_packet_length

	ldy	#OFF_DATA
	lda	HDRPFX
	sta	y[@packet]
	iny
	lda	HDRPFX+1
	sta	y[@packet]
	jsr	p_prepare_packet_for_send
	clearb	p_send_packet_lock		; free up RS232I
	sta	INITST				; let it all hang out
	rts

p_prepare_packet_for_send:
	jsr	p_get_next_buffer_number
	lda	p_packet_type			; DATA or NAK
	ldx	SEQOUT
	jsr	p_add_header
	jsr	p_calc_crc_and_copy
	jsr	p_get_next_seq_number
	rts

; -----------------------------------------------------------------

p_send_a_buffer:			; FROM OBUFFS!
	lda	INITST
	if (!zero) {rts}
	lda	resend_everything	;  ALL buffers waiting?
	if (zero) {
	    lda	BUFPNT
	    cmp	LSTOUT
	    if (equal) {rts}		; no buffers waiting
	}
	lda	rs232_send_buffer_start
	cmp	rs232_send_buffer_end
	if (!equal) {rts}
	clearb	resend_everything

	ldx	LSTOUT
	inx
	txa
	and	#max_BUFFS-1
	sta	LSTOUT
	jsr	p_calc_buffer_address	; get pointer to buffer to go!

p_transmit_buffer:

	ldy	#0
	ldx	rs232_send_buffer_end
	do {
	    lda	y[@p_output_buffer]
	    sta	x[rs232_output]
	    inx
	    iny
	    cmp	#end_of_message
	} while (!equal)
	stx	rs232_send_buffer_end

	save_and_bank_IO_in		; just in case!?
	jsr	rs232_put		; start xmission
	restore_IO			; jic

	moveb	#heartbeat_value, heartbeat_wait	; somethins goin on
	moveb	#ACKNUM,ACKNED		; count down for courtesy ACK to host.
	rts

; -----------------------------------------------------------------

RS232I:
	dec	p_character_timer	; 0 = 255 IRQs, throw away stuff
	if (zero) {
	    jsr	p_throw_away_input
	    dec	heartbeat_wait
	    if (zero) {jmp	send_heartbeat}		;*
	}

p_get_byte:
	ldy	rs232_rcv_buffer_start
;	lda	nak_everything			; lockout (region trans)
;	if (!equal) {
;	    sty	rs232_rcv_buffer_end
;	}
	cpy	rs232_rcv_buffer_end
	if (equal) {rts}			; nothing to read...

	moveb	#heartbeat_value, heartbeat_wait
	clearb	p_character_timer		; hey, we got one!

	lda	y[@rs232_input_buffer]
	inc	rs232_rcv_buffer_start

	ldx	SYNCD_UP
	if (zero) {			; not in sync
	    cmp	#SYNC
	    if (equal) {
		sta	SYNCD_UP
	    } else {
		; forget this char, it's trash
	    } 
	} else {
	    ldx	sample_pointer
	    inc	x[history]			; keep char count for throttle

	    ldy	COUNT
	    sta	y[RSINBF]

	    cmp	#end_of_message
	    beq	p_end_of_message
	    ldy	COUNT
	    bmi	p_bad_packet
	    cpy	#OFF_PCRC-1
	    if (lt) {
		jsr	p_unham
	    } else {
		jsr	CRC16
	    }

	    inc	COUNT			; character was accepted
	}
	jmp	p_get_byte		; no packet ready, try again

p_bad_packet::
	jsr	NAKSND			; send a nak & return
	jmp	IGNORE

p_end_of_message:
	lda	#0
;	sta	y[RSINBF]		;balloons uses 0 for EOM
	sta	SYNCD_UP

	ldx	#1
	do {
	    lda	x[CRC]
	    cmp	x[RSINBF]
	    bne	p_bad_packet
	    dex
	} while (plus)
	clearw	CRC

	moveb	#lost_carrier_HB_count, heartbeat_counter

	LDX   INITST
	if (!zero) {			; hey! our FIRST packet!
	    jsr	DOINIT
	}

	LDA   RSINBF+5		; GET RESP #
	JSR   WINACK		; ADJUST WINDOW


	lda	RSINBF+OFF_TYPE-1
	cmp	#SS
	if (equal) {
	    jmp	SNDSSR
	}

	ldy	COUNT
	jsr	is_there_space		; can we save it away?
	if (carry) {
	    jmp	IGNORE			; no, sorry, host:retrans later
	}

	lda	RSINBF+OFF_TYPE-1
	cmp	#SSR
	if (equal) {
	    jmp	GOTSSR
	}
	cmp	#ACK
	if (equal) {
	    jmp	GOTACK
	}
	cmp	#HEARTB
	if (equal) {
	    jmp	GOTHB
	}

	cmp	#NAK
	if (equal) {
	    jmp	GOTNAK
	}
					; must be a 'numbered' message
	lda	RSINBF+OFF_TXSQ-1	; get seq num
	cmp	NXTSEQ
	if (!equal) {			;*out of seq
	    jsr	INWIND			;*recent?
	    bcc	p_bad_packet		;*
	    JMP	IGNORE			;*yep
	}				;*^^^^^^^^^^^^^^^^^^^^^

	movew	#regionproc_crash_timer_value, regionproc_crash_timer

	jsr	handle_response		; we got a live one!

	jsr	WINADJ			; adjust & ack
	jsr	GETSEQ			; get NEXT expected sequence #

	JMP	IGNORE

; -----------------------------------------------------------------

	do {
	    clearb	p_send_packet_lock	; free IRQ for input process
	    jsr	maintain_frame			; do something while we wait
			    			; (will free input buffers &
						; therfore allow winack's)
p_wait_for_a_free_buffer:
	    dec	p_send_packet_lock		; if one is free, LOCK it!
	    lda	BUFFS
	    cmp	#max_BUFFS
	} while (equal)
	rts

p_get_next_seq_number:
	ldx	SEQOUT
	stx	LSTSQO
	inx
	if (minus) {
	    ldx	#0x10
	}
	stx	SEQOUT
	rts

p_get_next_buffer_number:
	ldx	BUFPNT
	inx
	txa
	and	#max_BUFFS-1
	sta	BUFPNT
	cmp	LSTOUT		; hey! filled all buffers before 1st got x'd
	if (equal) {
	    dec	resend_everything
	}
	inc	BUFFS
	lda	BUFPNT
p_calc_buffer_address:			; buffer # in A
	ldx	#0
	lsr	a
	tay				; save
	if (carry) {
	    ldx	#0x80
	}
	clc
	txa
	adc	#/OBUFFS
	sta	p_output_buffer
	tya
	adc	#?OBUFFS
	sta	p_output_buffer+1
	rts

p_add_header:				; a = packet type
	ldy	#OFF_TYPE		; x = sequence #
	sta	y[@packet]		; Sta data type
	dey
	lda	LSTSEQ
	sta	y[@packet]		; sta RX seq
	dey
	txa
	sta	y[@packet]		; sta TX seq
	rts

p_calc_crc_and_copy:
	lda	CRC
	pha
	lda	CRC+1
	pha
	clearw	CRC
	ldy	#OFF_PCRC		; bytes AFTER CRC
	do {
	    lda	y[@packet]
	    sta	y[@p_output_buffer]	; a time saver...
	    jsr	CRC16
	    iny
	    cpy	p_packet_length
	} while (!equal)
	lda	#end_of_message
	sta	y[@p_output_buffer]

	ldy	#OFF_SYNC
	lda	#SYNC
	sta	y[@p_output_buffer]

	ldy	#OFF_CRC
	lda	crc
	jsr	HAMING
	lda	crc+1
	jsr	HAMING

	pla
	sta	crc+1
	pla
	sta	crc			;  now the real thing is in
	rts				; (@p_output_buffer)

;  CRC16 speed improvements by F. Randall Farmer
; 	VALUE and CRC moved to zeropage & polynomial is now a constant

; 	old routine used about 358 cycles
; 	new routine uses about 300 cycles

CRC16:	STA	VALUE		;				(save 1)
	TYA
	PHA
	LDX	#0x08		; 8 BITS PER BYTE
CRCLP:
	lda	#0
	LSR	VALUE		; MOVE BIT 0 TO CARRY		(save 8)
	ROL	A		; MOVE CARRY TO BIT 0
	EOR	CRC+1		; 				(save 8)
	LSR	CRC		;				(save 8)
	ROR	A
	BCC	CRCLP1		; BIT 0 WAS ONE SO EOR CRC W/THE POLYNOMIAL

	TAY			; SAVE CRC HIGH IN Y
	LDA	CRC		;	 			(save ~4)
	EOR	#poly_low	; EOR LOW BYTE W/ POLY		(save ~8)
	STA	CRC		; 				(save ~4)
	TYA
	EOR	#poly_high	; EOR HIGH BYTE TOO		(save ~8)

CRCLP1:	STA	CRC+1		; STORE CRC HIGH BYTE		(save 8)
	DEX
	BNE	CRCLP		; BRANCH IF NOT ALL 8 BITS DONE
	PLA
	TAY
	RTS

p_unham:				; un ham A into Y/2[RSINBF]
	pha				; (creams x)
	tya
	lsr	a			; count/2
	tax
	pla
	if (carry) {
	    and	#0x0f
	    ora	x[RSINBF]
	} else {
	    and	#0xf0
	}
	sta	x[RSINBF]
	rts

HAMING:	TAX
	AND   #0xF0
	ORA   #0x01
	STA   y[@p_output_buffer]
	INY
	TXA
	AND   #0x0F
	ORA   #0x40
	STA   y[@p_output_buffer]
	INY
	RTS

;    COMMODORE REGISTER LOCATIONS

define	RIBUF	=	rs232_input_buffer	; RS-232 INPUT BUFFER POINTER
define	RIDBS	=	rs232_rcv_buffer_start	; RS-232 INPUT BUFFER START
define	RIDBE	=	rs232_rcv_buffer_end	; RS-232 INPUT BUFFER END

DOINIT:
	LDY   #0x04
	LDA   y[RSINBF]
	sta   LSTSEQ
	tax
	inx
	STx   NXTSEQ		; RESET
	INY			; SEQ #
	LDA   y[RSINBF]		;
	STA   LSTSQO		; TO WHAT
	TAX			;
	INX			; THE STRATUS THINKS THEY ARE_
	STx   SEQOUT
				;    NOW RESET VARIABLES
	LDA   BUFPNT		; GET CURRENT OUTPUT BUFFER
	STA   LSTOUT		; INDICATE NO OTHER BUFFERS IN WINDOW
				;    RETURN TO DATA TRANSMISSION STATE
	LDY   #0x00
	STY   NAKSNT		; NACK WASN'T LAST THING SENT
	STY   BUFFS		; ONE (1) BUFFER IN USE
;	jsr	send_ack
	jmp	send_SG

INBUFF:	STA   Local_TEMP		; SAVE VALUE FOR COMPARE
	LDA   BUFFS			; IF NONE IN USE RETURN FALSE
	STA   Local_TEMP2		; SAVE # OF BUFFERS TO CHECK
	BEQ   EXNO
	LDA   BUFPNT			; GET POINTER TO CURRENT BUFFER
INLOOP:	PHA				; SAVE POINTER
	JSR   p_calc_buffer_address
	LDY   #OFF_TXSQ			; POINTER TO SEQ #
	LDA   y[@p_output_buffer]	; GET SEQ #
	CMP   Local_TEMP		; EQUAL VALUE ?
	BEQ   EXYES			; YES-EXIT
	PLA				; GET POINTER
	DEC   Local_TEMP2		; DEC   # OF BUFFERS LEFT TO EXAMINE
	BEQ   EXNO			; IF 0, EXIT
	SEC				; PREP FOR SBC
	SBC   #1			; DECREMENT
	AND   #max_BUFFS-1
	BPL   INLOOP			; LOOP
EXYES:
	PLA			; GET BUFF PNTR
	SEC			; FLAG-FOUND
	RTS			; EXIT

EXNO:	CLC			; FLAG-NOT FOUND
	RTS			; EXIT

INWIND:	
	sec
	sbc   NXTSEQ
	if (carry) {			;  new is LARGER than expected
		cmp	#32
		bcs	WINYES		; much larger, so it must be OLD news
		bcc	WINNO		; otherwise OUT OF SEQ
	}
	eor	#0xff			; negate (smaller) result
	sec
	sbc	#32			
	bcc	WINYES			; much smaller, so it must be OLD news
					; else OUT OF SEQ
WINNO:	CLC				; SET FLAG FOR NO
	RTS

WINYES:	SEC				; SET FLAG FOR YES
	RTS


SNDSSR:
	LDA   #SSR		; SET MSG-TYPE
	JSR   SND_UNUM		; SEND THE UN-NUMBERED PACKET (SSR)
	JMP   IGNORE		; EXIT


WINACK:
	JSR   INBUFF		; IS IT IN THE BUFFER ?
	BCC   WINEXT		; NO, EXIT

	STA   Local_TEMP	; SAVE VALUE
	LDA   BUFPNT		; YES, GET NUMBER OF TOP BUFF
	SEC
	SBC   Local_TEMP	; SUBTRACT ACKED BUFFER
	sta	Local_TEMP+1
	if (minus) {
	    clc
	    adc	#max_BUFFS	; correct buffer count
	}
	STA   BUFFS		; STORE IN BUFFS

	clearb	NAKSNT		; COULD have been nak, at least there is
				; ROOM for another NAK, anyway
	RTS

WINADJ:
	DEC   ACKNED		; CNT DOWN TO ACK
	if (zero) {
send_ack:
	    LDA   #ACK		; SET MSG-TYPE
	    JSR   SND_UNUM	; SEND THE UN-NUMBERED PACKET (ACK)
	}
WINEXT:	RTS

SNDNAK:
	dec	p_send_packet_lock
	movew	#UNUMB,packet
	moveb	#NAK,p_packet_type
	LDA	#0x08			; USE 7 LEN
	STA	p_packet_length
	JSR	p_prepare_packet_for_send
	inc	NAKSNT			; yessirreebob, sent one
	inc	p_send_packet_lock
	RTS

SND_UNUM:				; type in A
	ldx	#/UNUMB
	stx	p_output_buffer
	stx	packet
	ldx	#?UNUMB
	stx	p_output_buffer+1
	stx	packet+1

	LDX   LSTSQO			; RESP #
	JSR   BLD_HDR			; SET BYTES & CALCULATE CRC
	JSR   p_transmit_buffer		; SEND IT
	RTS

BLD_HDR:
	JSR   p_add_header		; SET SEQ #'S & MSG-TYPE
	LDA   #0x08			; SET LEN=7
	STA   p_packet_length
	JSR   p_calc_crc_and_copy	; CALCULATE CRC
	RTS

NAKSND:
	LDA   INITST			; ARE WE IN INITIALIZING STATE ?
	if (!zero) {jmp	ignore}
	lda   NAKSNT
	if (zero) {
	    LDA   BUFFS			; GET # OF BUFFS IN USE
	    CMP   #max_BUFFS		; ALL IN USE ?
	    if (!carry) {
		jmp   SNDNAK
	    }
	}
	rts

GOTSSR:
GOTACK:
GSEXIT:	JMP   IGNORE		; BYEBYE


GOTNAK:	LDA   INITST		; ARE WE IN INITIALIZING STATE ?
	if (!zero) {
	    JMP IGNORE
	}
	lda	rsinbf+4
	cmp	nxtseq			; in sequence?
	if (equal) {
	    jsr	getseq			; Yup, move on to next
	} else {
	    jsr	naksnd
	}


GNPROC:
	LDA   RSINBF+5		; GET RESP #
	CLC			; ADD 1 - GET MESSAGE TO TRANSMIT
	ADC   #0x01
	if (minus) {		; 0x7f highest #
	    lda	#0x10
	}
	JSR   INBUFF		; GET BUFFER
	bcc	got_nak_exit
	SBC   #0x01		; GET RIGHT BUFFER # - CARRY IS SET
	AND   #max_BUFFS-1
	STA   LSTOUT		; QUEUE MSGS
	cmp	BUFPNT
	if (equal) {
	    dec	resend_everything
	}
got_nak_exit:		
	JMP   IGNORE

newest_pack:
	byte	0
resend_everything:
	byte	0

GETSEQ:
	LDX   NXTSEQ		; GET PRESENT #
	STX   LSTSEQ		; SAVE AS LAST SEQ # RECIEVED
	INX			; INCREMENT
	BPL   NOWRAP		; IF ?() 0x7F
	LDX   #0x10		; YES, RESET TO LOWEST SEQUENCE NUMBER
NOWRAP:	STX   NXTSEQ		; SAVE
	RTS

NXTBUF:	INX
	TXA
	AND   #max_BUFFS-1
	JSR   p_calc_buffer_address
	RTS

GOTHB:
	LDA   INITST
	if (!zero) {
	    jmp	IGNORE
	}
	LDA   RSINBF+4		; GET SEQUENCE # FROM INPUT BUFFER
	CMP   LSTSEQ
	if (!equal) {
	    clearb	NAKSNT
	    JSR   	NAKSND		; SEND OR QUEUE NAK (unless already)
	    JMP   	GNPROC		; treat as a NAK
	}
	LDA   #ACK		; SET MSG-TYPE
	JSR   SND_UNUM		; SEND THE UN-NUMBERED PACKET (ACK)
	JMP   IGNORE

send_heartbeat:
	lda	INITST
	if (!zero) {rts}
	moveb	#heartbeat_value, heartbeat_wait
	lda	buffs
	if (!zero) {
send_bad_packet::
	    lda	fastlink_on
	    if (!zero) {rts}
	    dec	heartbeat_counter
	    lda	#HEARTB
	    JMP	SND_UNUM
	}
	rts

p_throw_away_input:
IGNORE:
	clearb	COUNT
	sta	SYNCD_UP
	sta	CRC
	sta	CRC+1
	lda	fastlink_on
	rts

send_SG::
	lda	#'G'
	bne	send_flow_control
send_SS::
	clearb	got_ss_packet
	lda	#'S'
send_flow_control:
	sta	HDRPFX+1
	moveb	#'S',HDRPFX
	moveb	#OFF_DATA+2-10,MESSSZ
	movew	#qlink_packet,MSGPNT
	jmp	RS232O			; tell host we are here!
