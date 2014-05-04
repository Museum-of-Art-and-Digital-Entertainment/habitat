req? p1000
   1 ;    Computes the CRC for an out-going packet pointed to by R0. The
   2 ;    number of bytes in the packet is expected to be in "pkt_size".
   3 ;    The CRC is inserted directly in the appropriate bytes of the packet.
   4 ;
   5 ;
   6           DSEG
   7 ;
   8 value     ds   1              ; Temporary storage while computing CRC valu
+e
   9 CRCvalue  ds   2              ; Computed CRC value
  10 ;
  11           CSEG
  12 ;
  13 PLY       dfb   $A0,$01       ; Polynomial used in doing CRC = X^16+X^15+X
+^2+X^0
  14 ;
  15 comp_CRC  lda  CRCvalue       ; Save the current contents of "CRCvalue" in
  16           pha                 ; case it holds the partially computed CRC
  17           lda  CRCvalue+1     ; of a packet being received
  18           pha                 ;
  19 ;
  20           jsr  init_CRC       ; Initialize the CRC
  21 ;
  22           ldy  #OFF_PCRC      ; Position to bytes where CRC calculation be
+gins
  23 comp_lp   lda  (R0),y         ;
  24           jsr  CRC16          ; Process the CRC (preserves Y-reg)
  25           iny                 ; On to the next byte
  26           cpy  pkt_size       ; Done yet?
  27           bcc  comp_lp        ; Do NOT include the CARRIAGE RETURN
  28 ;
  29           ldy  #OFF_CRC       ; Position to the first byte of the CRC
  30           lda  CRCvalue       ; Get the LSByte of the just computed CRC
  31           jsr  split_CRC      ; Split CRC into 2 chars & store into output
+ buf
  32 ;
  33           iny                 ; Get ready for the next byte of CRC
  34           lda  CRCvalue+1     ; Now MSByte
  35           jsr  split_CRC      ;
  36 ;
  37           pla                 ; Restore the original contents of "CRCvalue
+"
  38           sta  CRCvalue+1     ;
  39           pla                 ;
  40           sta  CRCvalue       ;
  41 ;
  42           rts                 ;
  43 ;
  44 ;
  45 ;    CRC16 - TAKES A BYTE IN THE A REGISTER AND RUNS IT THROUGH THE CRC.
  46 ;            FROM 6502 ASSEM LANG SUBROUTINES      PAGE 434
  47 ;            STATUS, A, AND X REGS ARE AFFECTED BY THIS ROUTINE.
  48 
  49 CRC16     sta  value          ; Save the value
  50 ;
  51           tya                 ; Save the current Y-reg
  52           pha                 ;
  53 ;
  54           ldx  #$08           ; 8 bits per byte
  55 CRCLP     lsr  value          ; MOVE BIT 0 TO CARRY
  56           rol  A              ; MOVE CARRY TO BIT 0
  57           and  #$01           ; AND OFF OTHER BITS
  58           eor  CRCvalue+1     ; EOR BIT 7 W/ BIT 16 OF CRC
  59           lsr  CRCvalue       ; SHIFT CRC RIGHT 1 BIT
  60           ror  A              ; FIRST LOWBYTE, THEN HIGH
  61           bcc  CRCLP1         ; BRANCH IF MSB OF CRC IS 1
  62 ;
  63 ;    BIT 0 WAS ONE SO EOR THE CRC W/ THE POLYNOMIAL
  64 ;
  65           tay                 ; SAVE CRC HIGH IN Y
  66           lda  CRCvalue
  67           eor  PLY            ; EOR LOW BYTE W/ POLY
  68           sta  CRCvalue
  69           tya  
  70           eor  PLY+1          ; EOR HIGH BYTE TOO
  71 CRCLP1    sta  CRCvalue+1     ; STORE CRC HIGH BYTE
  72           dex
  73           bne  CRCLP          ; BRANCH IF NOT ALL 8 BITS DONE
  74 ;
  75           pla                 ; RESTORE Y REG
  76           tay
  77           rts
  78 ;
  79 **************************************************************************
+****
  80 ;    Take the value in the A-reg and split it into two bytes to allow
  81 ;    all values of the CRC to be transmitted while avoiding certain chars.
  82 ;    Store these two bytes at (R0),y and (R0),y+1.
  83 ;    if (A-reg = aA)
  84 ;         split --> a1 4A
  85 ;
  86 split_CRC tax                 ; Save the original value in X-reg
  87           and  #$F0           ; Do the high nybble (mask out the low nybbl
+e)
  88           ora  #$01           ; Add in the offset
  89           sta  (R0),y         ; Save into the output buffer
  90           iny                 ; On to the low nybble
  91           txa                 ; Recall the original value
  92           and  #$0F           ; Mask out the high nybble
  93           ora  #$40           ; Add in the offset
  94           sta  (R0),y         ;
  95           rts                 ;
  96 ;
  97 ;
  98 init_CRC  lda  #$00           ; Initialize the CRC
  99           sta  CRCvalue       ;
 100           sta  CRCvalue+1     ;
 101           rts                 ;
 102 
req? q
eh? edit rs232}i_IN.6502
req? p1000
   1           DSEG
   2 ;
   3 chars_232 ds   1              ; Number of characters received from RS-232 
+buf
   4 in_sync   ds   1              ; Flag:  TRUE ==> building a pkt
   5 pkt_time  ds   1              ; Give up if haven't seen a new char by turn
+over
   6 rcvd_CRC  ds   2              ; CRC value sent with the packet
   7 HB_delay  ds   1              ; Counter for inter HEARTBEAT timer
   8 HB_left   ds   1              ; Number of unACKed HEARTBEATS we can still 
+send
   9 INITstate ds   1              ; Flag: 0 ==> initializED, >0 ==> initializI
+NG
  10 INIT_dly  ds   1              ; Counter for delay between comm line init a
+ttempts
  11 bufindex  ds   1              ; Index # of buf being tested (used by "ck_A
+CKed")
  12 temp_cnt  ds   1              ; Local counter               (used by "ck_A
+CKed")
  13 ;
  14 ;
  15           CSEG
  16 ;
  17 msg_types dw   got_DATA       ; ($20) JMP table for expected message types
  18           dw   got_SS         ; ($21)
  19           dw   got_SSR        ; ($22)
  20           dw   nullrt         ; ($23) only C64 can send INIT
  21           dw   got_ACK        ; ($24)
  22           dw   got_NAK        ; ($25)
  23           dw   got_HBEAT      ; ($26)
  24 
  25 
  26 
  27 rs232I    lda  rs232_rdy      ; Process no characters if the last packet
  28           bne  exit_232I      ; received is still in use
  29 ;
  30           jsr  count_HB       ; See if any INITs, HBEATs or bufs ignored b
+y Stratus
  31           bcs  exit_232I      ; CARRY set if C64 has determined comm line 
+DEAD
  32 ;
  33           ldy  RIDBS          ; See if there are any new bytes in the INPU
+T buf
  34           cpy  RIDBE          ;
  35           bne  got_char       ;
  36 ;
  37           lda  in_sync        ; Do we care about inter byte timer (in pkt 
+yet)?
  38           beq  exit_232I      ; Not yet building a pkt ... timer not impor
+tant
  39 ;
  40           dec  pkt_time       ; In a pkt, see if exceeded our inter char t
+imeout
  41           bne  exit_232I      ; We have not yet timed out ...
  42 ;
  43           jsr  init_232I      ; We have timed out!! (get ready for a new p
+acket)
  44           jmp  exit_232I      ; and fight again some other day
  45 ;
  46 ;
  47 got_char  lda  #PKT_TOUT      ; Got a byte, reset inter byte timeout
  48           sta  pkt_time       ;
  49 ;
  50 char_loop lda  (RIBUF),y      ; Get a byte from the RS-232 input buffer
  51           inc  RIDBS          ; and bump the KERNAL's BUFFER START POINTER
  52 ;
  53           jsr  rs232P         ; Process this byte
  54           bcs  got_pkt        ; CARRY set if we have a complete, valid pkt
  55 ;
  56           ldy  RIDBS          ; See if there are any MORE bytes to process
  57           cpy  RIDBE          ;
  58           bne  char_loop      ; More characters
  59           beq  exit_232I      ;
  60 
  61 ;
  62 got_pkt   lda  #MAX_HBEAT     ; We now have a COMPLETE, VALID packet
  63           sta  HB_left        ; Got a good packet, reset HEARTBEAT counter
  64 ;
  65           jsr  init_232I      ; Re-initialize to get ready for the next pa
+cket
  66 ;
  67           jsr  ck_ACKed       ; See if this packet ACKs any transmitted bu
+ffers
  68 ;
  69           lda  rsINBUF+OFF_TYPE; Get the message type
  70           cmp  #LAST_TYPE+1   ;
  71           bcs  exit_232I      ; Specified msg type > highest expected (ign
+ore it?)
  72 ;
  73           sec                 ;
  74           sbc  #FRST_TYPE     ; Compute an index into message type jmp tab
+le
  75           bmi  exit_232I      ; Specified msg type < lowest expected (igno
+re it?)
  76 ;
  77           asl  A              ; Got a good msg type, convert it to table i
+ndex
  78           tay                 ;
  79           lda  msg_types,y    ; Get LSByte of routine address
  80           tax                 ; Put it in X-reg for use by 'take_actn'
  81           lda  msg_types+1,y  ; MSByte
  82           tay                 ; Put it in Y-reg for use by 'take_actn'
  83           jsr  take_actn      ; Go process this message type
  84 ;
  85           jsr  cksnd_ACK      ; See if we NEED to send an ACK
  86 ;
  87 exit_232I rts                 ;
  88 ;
  89      PAGE
  90 ;
  91 rs232P    ldx  chars_232      ; Get buffer index of the next "processed" c
+har
  92           cpx  #MAX_PSIZE     ; Too many bytes in this packet?
  93           bcs  bad_pkt        ; Yes
  94 ;
  95           sta  rsINBUF,x      ; Ok to save the character
  96 ;
  97           ldy  in_sync        ; Are we searching for the start of a packet
+?
  98           bne  in_packet      ; Already have SYNC (FALSE == 0)
  99 ;
 100           cmp  #SYNC          ; We are searching for the start of a packet
 101           bne  quit_232P      ; and have NOT found it
 102 ;
 103           jsr  init_CRC       ; Found SYNC, get ready to CRC incoming pack
+et
 104           lda  #TRUE          ;
 105           sta  in_sync        ;
 106           bne  done_232P      ; and this does NOT complete the packet
 107 ;
 108 in_packet cpx  #OFF_PCRC      ; Are we past the CRC bytes yet?
 109           bcs  past_CRC       ;
 110 ;
 111           pha                 ; Save byte, it's one of the CRC bytes
 112 ;
 113           dex                 ; Convert pkt's byte number to CRC's byte nu
+mber
 114           txa                 ; Take a look at the byte count
 115           lsr  A              ; Is it LSNybble or MSNybble
 116           tax                 ; Byte (0/1) of rcvd CRC word {(CRC byte num
+ber)/2}
 117           pla                 ; Restore the saved byte
 118           bcs  LSNyb_CRC      ; Byte number 2 or 4 of packet (1 or 3 of CR
+C)
 119 ;
 120           and  #$F0           ; This is MSNybble, mask off LSNybble
 121           sta  rcvd_CRC,x     ; and is the first nybble rcvd, just store i
+t
 122           bcc  done_232P      ; This byte did NOT complete the packet
 123 ;
 124 LSNyb_CRC and  #$0F           ; This is the LSNybble, mask off MSNybble
 125           ora  rcvd_CRC,x     ; Include the already received MSNybble
 126           sta  rcvd_CRC,x     ; Done with this byte of the CRC word
 127           bcs  done_232P      ; This byte did NOT complete the packet
 128 ;
 129 past_CRC  cmp  #CR            ; Is it the end of the packet?
 130           beq  EndOfPkt       ;
 131 ;
 132           jsr  CRC16          ; Include this character in our CRC calculat
+ion
 133 ;
 134 done_232P inc  chars_232      ; This byte belongs in pkt, get ready for ne
+xt one
 135 quit_232P clc                 ; This byte did NOT complete the packet
 136 exit_232P rts                 ;
 137 ;
 138 ;
 139 EndOfPkt  lda  CRCvalue       ; END OF PACKET, get 1st byte of CRC WE calc
+ulated
 140           cmp  rcvd_CRC       ; Does it match the one SENT to us?
 141           bne  bad_pkt        ;
 142 ;
 143           lda  CRCvalue+1     ; Now test the MSByte
 144           cmp  rcvd_CRC+1     ;
 145           bne  bad_pkt        ;
 146 ;
 147           sec                 ; This is a COMPLETE, VALID packet
 148           rts                 ; Do "init_232I" back in the calling proc
 149 ;
 150 bad_pkt   jsr  snd_NAK        ; NAK this bad packet
 151           jsr  init_232I      ; Get ready for a NEW packet
 152           clc                 ; We do not have a complete, VALID packet
 153           rts                 ;
 154 ;
 155      PAGE
 156 ;
 157 got_SS    jsr  snd_SSR        ; No test of the sequence number
 158           rts                 ;
 159 ;
 160 ;
 161 ;
 162 got_SSR   lda  rsINBUF+OFF_TXSEQ
 163           cmp  lst_RXseq      ; Is his XMIT number same as last one we rec
+eived?
 164           beq  good_SSR       ;
 165 ;
 166           jsr  snd_NAK        ; Packet's sequence number not what was expe
+cted
 167 good_SSR  rts                 ;
 168 ;
 169 ;
 170 ;
 171 got_ACK   lda  INITstate      ; See if THIS ACK is establishing the comm l
+ink
 172           beq  done_ACK       ; NO, comm already up!
 173 ;
 174           lda  #$00           ;
 175           sta  INITstate      ; Flag the comm link as UP!
 176 comm_live ldx  #'S'           ; Force the "comm line ready" token into
 177           ldy  #'['           ; the input buffer and
 178           jsr  force_pkt      ; tell token processor that the buffer is re
+ady
 179 ;         
 180 done_ACK  lda  #FALSE         ; VALID, in sequence pkt allows
 181           sta  NAK_sent       ; NAKs to be sent again
 182           rts                 ; No test of the sequence number
 183 ;
 184 ;
 185 ;
 186 got_NAK   lda  INITstate      ; See if comm link has been established yet
 187           beq  comm_up        ;
 188 ;
 189           jsr  snd_INIT       ; Comm link not up yet, retry an INIT
 190           rts                 ;
 191 ;
 192 comm_up   lda  rsINBUF+OFF_TXSEQ
 193           cmp  nxt_RXseq      ; Is his XMIT number the one we expect to re
+ceive?
 194           beq  good_NAK       ;
 195 ;
 196           jsr  snd_NAK        ; Packet's sequence number not what was expe
+cted
 197           jmp  all_NAKs       ; (do not bump sequence numbers if out of or
+der)
 198 ;
 199 good_NAK  jsr  inc_RXseq      ; Good NAK pkts bump received (RX) sequence 
+numbers
 200           lda  #FALSE         ; VALID, in sequence pkt allows
 201           sta  NAK_sent       ; NAKs to be sent again
 202 ;
 203 all_NAKs  lda  ack_cnt        ; See if this NAK has left some packets unAC
+Ked
 204           beq  exit_NAK       ; No packets need be retransmitted
 205 ;
 206           clc                 ; There are some packets which need to be re
+-sent
 207           adc  send_cnt       ; Compute the total number of buffers to be 
+sent
 208           sta  send_cnt       ; (number to re-send + those not yet sent)
 209           lda  #$00           ;
 210           sta  ack_cnt        ; No more to be ACKed (they are being re-sen
+t)
 211 ;
 212           lda  ack_nxt        ; Get the index of the next buffer to have b
+een
 213           sta  send_nxt       ; ACKed, and start re-sending with that one
 214 ;
 215 exit_NAK  rts                 ;
 216 ;
 217 ;
 218 ;
 219 got_DATA  lda  rsINBUF+OFF_TXSEQ
 220           cmp  nxt_RXseq      ; Is his XMIT number the one we expect to re
+ceive?
 221           beq  good_DATA      ;
 222 ;
 223           jsr  snd_NAK        ; Packet's sequence number not what was expe
+cted
 224           rts                 ;
 225 ;
 226 good_DATA lda  #FALSE         ; VALID, in sequence pkt allows
 227           sta  NAK_sent       ; NAKs to be sent again
 228 ;
 229           jsr  inc_RXseq      ; Good DATA pkts bump received (RX) sequence
+ numbers
 230           jsr  show_pkt       ; Tell "dispatcher" a token is available
 231           rts                 ;
 232 ;
 233 ;
 234 ;
 235 got_HBEAT lda  #FALSE         ; Allow NAK to be sent (ALWAYS answer a HEAR
+TBEAT)
 236           sta  NAK_sent       ;
 237 ;
 238           lda  rsINBUF+OFF_TXSEQ
 239           cmp  lst_RXseq      ; Is his XMIT number same as the last one re
+ceived?
 240           beq  good_BEAT      ;
 241 ;
 242           jsr  snd_NAK        ; Packet's sequence number not what was expe
+cted
 243           rts                 ;
 244 ;
 245 good_BEAT jsr  snd_ACK        ; As good a way as any to respond to HEARTBE
+AT
 246           rts                 ;
 247 ;
 248 ;
 249 ;
 250 init_232I lda  #$00           ; Start looking for a (new) packet
 251           sta  chars_232      ; Re-initialize to NO chars received
 252           sta  in_sync        ; Go back to searching for SYNC char (FALSE 
+== 0)
 253           rts                 ;
 254 ;
 255      PAGE
 256 ;
 257 count_HB  lda  INITstate      ; See if comm link has been established yet
 258           bne  do_comm        ; Not yet up ...
 259 ;
 260           lda  ack_cnt        ; Comm link up, any (DATA) buffers not yet A
+CKed?
 261           beq  HB_done        ;
 262 ;
 263           dec  HB_delay       ; Is it time to consider sending a HEARTBEAT
+?
 264           bne  HB_done        ;
 265 ;
 266           dec  HB_left        ; Can we send another one?
 267           beq  HB_quit        ; Oops!  line must be dead
 268 ;
 269           jsr  snd_HEART      ; Time to send (another?) HEARTBEAT
 270 ;
 271 HB_done   clc                 ; Tell caller we think the comm line is stil
+l OK
 272           rts                 ;
 273 ;
 274 HB_quit   ldx  #'S'           ; Force the "comm line dead" token into
 275           ldy  #'Z'           ; the input buffer and
 276           jsr  force_pkt      ; tell token processor that the buffer is re
+ady
 277 ;
 278           sec                 ; Stratus has not answered ==> comm line dea
+d
 279           rts                 ;
 280 ;
 281 do_comm   dec  INIT_dly       ; Is it time to retry sending INIT?
 282           bne  HB_done        ;
 283 ;
 284           dec  INITstate      ; Try to send another INIT
 285           beq  HB_quit        ; Expended all of our trys ... flag comm lin
+e dead
 286 ;
 287           jsr  snd_INIT       ; Send another INIT (resets "INIT_dly" too)
 288           jmp  HB_done        ; and return un-eventfully
 289 ;
 290 ;
 291 ;    Return any "ACKed" buffers to the AVAILABLE list
 292 ;
 293 ck_ACKed  lda  R0             ; Save the current contents of R0
 294           pha                 ;
 295           lda  R0+1           ;
 296           pha                 ;
 297 ;
 298           lda  ack_cnt        ;
 299           beq  exit_ck        ; There are NO un-ACKed buffers
 300 ;
 301           sta  temp_cnt       ;
 302 ;
 303           lda  ack_nxt        ; Start with the first buf not yet ACKed and
+ find
 304 window_lp sta  bufindex       ; the buf which matches RECEIVED sequence nu
+mber
 305 ;
 306           jsr  buf_addr       ; Get the address of this buffer
 307           stx  R0             ;
 308           sty  R0+1           ; R0 is now a pointer to this buffer
 309 ;
 310           ldy  #OFF_TXSEQ     ; Access this buffer's sequence number
 311           lda  (R0),y         ;
 312           cmp  rsINBUF+OFF_RXSEQ
 313           beq  in_window      ; Is this the one we want?
 314 ;
 315           lda  bufindex       ;
 316           jsr  next_buf       ; Bump index to next buffer (modulo "MAX_BUF
+S")
 317 ;
 318           dec  temp_cnt       ; Any (more) buffers to test?
 319           bne  window_lp      ;
 320           beq  exit_ck        ; No un-ACKed buffers were ACKed
 321 ;
 322 in_window lda  ack_nxt        ; Some buffer(s) were ACKed, free all bufs o
+n ACK
 323           pha                 ; list INCLUDING one with matching sequence 
+number
 324 ;
 325           jsr  next_buf       ; Bump index to next buffer (modulo "MAX_BUF
+S")
 326           sta  ack_nxt        ; 
 327           dec  ack_cnt        ;
 328           inc  avail_cnt      ; Another "ACK needed" buffer becomes "avail
+able"
 329 ;
 330           pla                 ; Restore the original index
 331           cmp  bufindex       ; Was this the one we found?
 332           bne  in_window      ; There are more buffers to be made AVAILABL
+E
 333 ;
 334 exit_ck   pla                 ; Restore original value of R0
 335           sta  R0+1           ;
 336           pla                 ;
 337           sta  R0             ;
 338 ;
 339           rts                 ;
 340 ;
 341 ;
 342 ;
 343 force_pkt stx  rsINBUF+OFF_DATA
 344           sty  rsINBUF+OFF_DATA+1
 345 ;
 346 show_pkt  lda  #TRUE          ; Tell the dispatcher that an RS-232 token i
+s
 347           sta  rs232_rdy      ; ready to be processed
 348 ;
 349           ldx  #TASKMASTR     ; Allow the dispatcher to be activated immed
+iately
 350           jsr  UNBLOCK        ;
 351           rts                 ;
 352 
req? q
eh? edit rs232_OUT.56502
req? p1000
   1 MAX_BUFS  EQU  $08            ; Number of 128 byte output buffers
   2 VERSION   EQU  $0800          ; 8.0 - GEOS demo stuff (07-11-86)
   3 ;
   4           DSEG
   5 ;
   6 ACKneeded ds   1              ; Pkts rcvd since last ACK sent, 0 ==> must 
+ACK
   7 NAK_sent  ds   1              ; Flag:  TRUE ==> send no NAKs til get in se
+q DATA
   8 ack_nxt   ds   1              ; Ring buf index of next pkt for which expec
+t ACK
   9 ack_cnt   ds   1              ; Number of pkts transmitted but not yet ACK
+ed
  10 avail_nxt ds   1              ; Ring buf index of next buf for "packeting"
+ msg
  11 avail_cnt ds   1              ; Number of bufs available for "packeting" a
+ msg
  12 send_nxt  ds   1              ; Ring buf index of next packet to be transm
+itted
  13 send_cnt  ds   1              ; Number of packets ready to be transmitted
  14 msg_size  ds   1              ; Length of msg excluding prefix (ZERO if no
+ msg)
  15 msg_prefx ds   2              ; The two char prefix to be inserted in this
+ pkt
  16 msg_cnt   ds   1              ; Local counter used in copying msg to pkt
  17 pkt_size  ds   1              ; Computed byte count of packet (SYNC+hdr+ms
+g+CR)
  18 lst_RXseq ds   1              ; LAST sequence # RCVD (used as response to 
+Stratus)
  19 nxt_RXseq ds   1              ; Sequence number we expect to RECEIVE NEXT
  20 lst_TXseq ds   1              ; LAST sequence # SENT (Stratus responds wit
+h this)
  21 nxt_TXseq ds   1              ; NEXT sequence # to be SENT
  22 quick_buf ds  11              ; Buffer to be used for all non-DATA packets
  23 ;
  24 ;
  25           CSEG
  26 ;
  27 rs232O    lda  send_cnt       ; ANY prepared buffers to send?
  28           beq  no_output      ;
  29 ;
  30           lda  send_nxt       ; Get index of NEXT buf to send (know there 
+is one)
  31           pha                 ; Save it (this is the guy we will use)
  32 ;
  33           jsr  next_buf       ; Bump this index to the next buffer (modulo
+)
  34           sta  send_nxt       ; and save it (will be the NEXT buffer we se
+nd)
  35           dec  send_cnt       ; There is one less buffer to send
  36           inc  ack_cnt        ; but one MORE to be ACKed
  37 ;
  38           pla                 ; Restore the index of the buffer to be used
  39           jsr  buf_addr       ; and compute it's address (returned in X & 
+Y-regs)
  40           stx  R0             ;
  41           sty  R0+1           ; R0 <== address of next buffer to send
  42           jsr  send_buf       ; And send it
  43 ;
  44 no_output rts                 ;
  45 ;
  46      PAGE
  47 ;
  48 ;    Send the packet pointed to by R0 using C64 KERNAL routines
  49 ;
  50 send_buf  sei                 ; Disable interrupts while we swap in the KE
+RNAL
  51           lda  $01            ; Save the current memory configuration
  52           pha                 ;
  53           ora  #$06           ; Bring in the KERNAL and the I/O page
  54           sta  $01            ; and set our new memory map
  55 ;
  56           ldx  #$02           ;
  57           jsr  CHKOUT         ; SET RS232 AS OUTPUT THROUGH THE KERNAL
  58 ;
  59           ldy  #$00           ; Copy the packet to the KERNAL's output buf
+fer
  60 out_loop  cpy  pkt_size       ; More to copy?
  61           beq  send_char      ; Send LAST byte (RETURN unless from modem s
+tuff)
  62           bcs  out_done       ; LAST byte already sent
  63 ;
  64 send_char lda  (R0),y         ; Get a byte
  65           jsr  CHROUT         ; Output this byte
  66           iny                 ; any move on to the next
  67           bne  out_loop       ;
  68 ;
  69 out_done  jsr  CLRCHN         ; So restore the default
  70 ;
  71           pla                 ; Recall the original memory configuration
  72           sta  $01
  73           cli                 ; and re-enable interrupts
  74 ;   
  75           lda  #ACK_NOW       ; ANYTHING sent to Stratus satisfies need to
+ ACK
  76           sta  ACKneeded      ; Resets countdown to required ACK
  77 ;
  78 reset_HB  lda  #HB_TOUT       ; Something has been sent to the Stratus ...
  79           sta  HB_delay       ; Give him a chance to answer before send HE
+ARTBEAT
  80 ;
  81           rts                 ;
  82 ;
  83      PAGE
  84 quick_snd pha                 ; Save the supplied message type
  85 ;
  86           lda  #<quick_buf    ; 
  87           sta  R0+1           ;
  88           lda  #>quick_buf    ;
  89           sta  R0             ; R0 is now a pointer to the "always ready" 
+buffer
  90 ;
  91           lda  #CR            ; Add the CARRIAGE RETURN to the end of the 
+packet
  92           sta  (R0),y         ; Y-reg holds index of last byte of packet
  93 ;
  94           sty  pkt_size       ; and tell CRC calculation routine the packe
+t size
  95 
  96           pla                 ; Restore the message type
  97           jsr  add_hdr        ; Add SYNC byte & pkt header stuff to the bu
+ffer
  98           jsr  comp_CRC       ;
  99           jsr  send_buf       ; Send the packet pointed to by R0
 100           rts                 ;
 101 ;
 102 ;
 103 cksnd_ACK dec  ACKneeded      ; Is it time to send an ACK?
 104           bne  no_ACK         ;
 105 ;
 106 snd_ACK   lda  #ACK           ; Message type
 107           ldy  #OFF_DATA      ; Index of last byte
 108           jsr  quick_snd      ;
 109 no_ACK    rts                 ; ACKs do not affect the transmit sequence n
+umber
 110 ;
 111 ;
 112 snd_NAK   lda  INITstate      ; See if the comm link is initialized yet
 113           beq  got_comm       ;
 114 ;
 115           jsr  snd_INIT       ; Not yet initialized, send INIT instead of 
+NAK
 116           rts                 ;
 117 ;
 118 got_comm  lda  NAK_sent       ; Are we allowed to send a NAK?
 119           bne  done_NAK       ;
 120 ;
 121           jsr  inc_TXseq      ; NAK bumps transmit sequence number
 122           lda  #NAK           ; YES! ...
 123           ldy  #OFF_DATA      ; Index of last byte
 124           jsr  quick_snd      ;
 125           lda  #TRUE          ;
 126           sta  NAK_sent       ; A NAK has been sent
 127 done_NAK  rts                 ;
 128 ;
 129 ;
 130 snd_SS    lda  #SS            ; Message type
 131           ldy  #OFF_DATA      ; Index of last byte
 132           jsr  quick_snd      ;
 133           rts                 ; SS does NOT bump transmit sequence number
 13 kc
 135 ;
 136 snd_SSR   lda  #SSR           ; Set the message type
 137           ldy  #OFF_DATA      ; Index of last byte
 138           jsr  quick_snd      ; Send it using the "always ready" buffer
 139           rts                 ; SSR does NOT bump transmit sequence number
 140      PAGE
 141 ;
 142 snd_HEART lda  #HEARTB        ; Set the message type
 143           ldy  #OFF_DATA      ; Index of last byte
 144           jsr  quick_snd      ; Send it using the "always ready" buffer
 145           rts                 ; HEARTBEAT does NOT bump transmit sequence 
+number
 146 ;
 147 ;
 148 snd_INIT  lda  #INIT_SEQ      ; Set up initial transmit and rcv sequence n
+umbers
 149           sta  lst_RXseq      ;
 150           sta  nxt_RXseq      ;
 151           sta  lst_TXseq      ;
 152           sta  nxt_TXseq      ;
 153           jsr  inc_RXseq      ; Bump "nxt_RXseq" to sequence number NEXT e
+xpected
 154 ;
 155           lda  #$00           ; Set all buffer pools to the ZEROth buffer
 156           sta  ack_nxt        ;
 157           sta  send_nxt       ;
 158           sta  avail_nxt      ;
 159 ;
 160           sta  ack_cnt        ; No packets yet transmitted
 161           sta  send_cnt       ; No packets yet ready to transmit
 162           lda  #MAX_BUFS      ;
 163           sta  avail_cnt      ; All the buffers are available for making p
+ackets
 164 ;
 165           lda  #FALSE         ;
 166           sta  NAK_sent       ; No NAK has been sent
 167           sta  in_sync        ; We are LOOKING for SYNC
 168 ;
 169           lda  #<VERSION      ; Store the software version in the DATA fie
+ld
 170           sta  quick_buf+OFF_DATA
 171           lda  #>VERSION
 172           sta  quick_buf+OFF_DATA+1
 173 ;
 174           lda  #INIT          ; Set message type
 175           ldy  #OFF_DATA+2    ; Set the last byte of the packet
 176           jsr  quick_snd      ; And go send Stratus the INIT packet
 177 ;
 178           lda  #INIT_TOUT     ;
 179           sta  INIT_dly       ; Set delay before we try to send another IN
+IT
 180 ;
 181           rts                 ;
 182 
req? q
eh? edit rs232_PROCS.6502
req? p10000
   1 add_hdr   ldy  #OFF_TYPE      ;
   2           sta  (R0),y         ; Set the MESSAGE TYPE field of the packet
   3 ;
   4           lda  nxt_TXseq      ;
   5           ldy  #OFF_TXSEQ     ;
   6           sta  (R0),y         ; Set OUR sequence number
   7 ;
   8           lda  lst_RXseq      ;
   9           ldy  #OFF_RXSEQ     ;
  10           sta  (R0),y         ; Set the RESPONSE sequence number (= last r
+cvd)
  11 ;
  12           lda  #SYNC          ;
  13           ldy  #OFF_SYNC      ;
  14           sta  (R0),y         ; Add the SYNC byte to the output buffer
  15 ;
  16           rts                 ;
  17 ;
  18 ;
  19 ;    Calculates address of the buffer whose number is supplied in the A-re
+g.
  20 ;    Concept is to multiply the number by 128 and add the address of "OBUF
+FS".
  21 ;    The address of the buffer is returned in the X & Y-regs (Y <== MSByte
+).
  22 ;
  23 buf_addr  lsr  A              ; Shift RIGHT 2 ==> shift LEFT 7 ==> A*128
  24           tay                 ; Save MSByte of A*128
  25 ;
  26           lda  #$00           ; Make the LSByte with the bit remaining aft
+er 7
  27           ror  A              ; shift LEFTs.  Note rotated a ZERO into CAR
+RY
  28 ;
  29           adc  #>OBUFFS       ; Add in the LSByte of the base of the buffe
+rs
  30           tax                 ; This is the LSByte of THIS buffer's addr
  31 ;
  32           tya                 ;
  33           adc  #<OBUFFS       ; Now compute the MSByte
  34           tay                 ; and return it in the Y-reg
  35 ;
  36           rts                 ;
  37 ;
  38 ;
  39 ;    Bump the buffer index number supplied in the A-reg to the next buffer
+,
  40 ;    but when we get to the last buffer, wrap back to the ZEROth.  Return
  41 ;    the new index in the A-reg.
  42 ;
  43 next_buf  clc                 ;
  44           adc  #$01           ; Bump it
  45           cmp  #MAX_BUFS      ; Modulo ...
  46           bcc  next_done      ; (more buffers to go before wrap)
  47 ;
  48           lda  #$00           ; Whoops! time to wrap back to the first one
  49 next_done rts                 ;
  50 ;
  51      PAGE
  52 ;
  53 inc_RXseq ldx  nxt_RXseq      ; Get the sequence number we JUST RECEIVED
  54           stx  lst_RXseq      ; and update our record of the LAST seq # RC
+VD
  55 ;
  56           inx                 ; Bump to the next sequence number
  57           cpx  #HIGH_SEQ+1    ; Time to wrap around yet?
  58           bcc  no_wrap1       ;
  59 ;
  60           ldx  #LOW_SEQ       ; Wrap around, restart the sequence numbers
  61 no_wrap1  stx  nxt_RXseq      ; Save NEXT sequence number we expect to REC
+EIVE
  62 ;
  63           rts                 ;
  64 ;
  65 ;
  66 inc_TXseq ldx  nxt_TXseq      ; Get the sequence number JUST SENT
  67           stx  lst_TXseq      ; and update our record of the LAST seq # SE
+NT
  68 ;
  69           inx                 ; Bump to the next sequence number
  70           cpx  #HIGH_SEQ+1    ; Time to wrap around yet?
  71           bcc  no_wrap2       ;
  72 ;
  73           ldx  #LOW_SEQ       ; Wrap around, restart the sequence numbers
  74 no_wrap2  stx  nxt_TXseq      ; Save the NEXT sequence number we expect to
+ SEND
  75 ;
  76           rts                 ;
  77 
req? q
eh? ~
