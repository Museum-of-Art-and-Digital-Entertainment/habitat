	include	"ronmacros2.m"

; ----------------------------------------------------------------------
; Heap storage
; ----------------------------------------------------------------------
			align 0x0100

object_table_hi::	block	256
object_table_lo::	block	256

sound_table_hi::	block	256
sound_table_lo::	block	256

image_table_hi::	block	256
image_table_lo::	block	256

action_table_hi::	block	256
action_table_lo::	block	256

class_table_ref::	block	256
sound_table_ref::	block	256
image_table_ref::	block	256
action_table_ref::	block	256

static_end_of_heap::			; indicates start of heap storage!

