end_of_program::

; Record_header
	byte	0x01				; Encoding byte
	byte	/0x801
	byte	?0x801
	byte	/(BASIC_end-BASIC_start)
	byte	?(BASIC_end-BASIC_start)

BASIC_start:
	byte	13,0x8,0,0
	byte	158				;sys
	byte	"  2070"
	byte	0,0,0
	byte	0,0,0,0

BASIC_end:

	byte	0x80				; eof

end_of_everything::
