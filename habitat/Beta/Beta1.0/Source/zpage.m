;
;	Microcosm zero page variables
;

; DO NOT MOVE THESE! IF YOU DO, ALL OF THE ACTIONS WILL HAVE TO BE
; RE_COMPILED AND SENT TO DISK......FRF

temp_var_1:				block	2	; these may be used
temp_var_2:				block	2	; as sort term zpage
temp_var_3:				block	2	; space (NON-interrupt
temp_var_4:				block	2	; routines)
temp_var_5:				block	2
temp_var_6:				block	2
temp_var_7:				block	2
temp_var_8:				block	2

pointed_NOID:				block	1	; where is CURSOR? 
pointed_object:				block	2
pointed_class:				block	2
pointed_variables_offset:		block	1

actor_NOID:				block	1	; who is doing this?
actor_object:				block	2
actor_class:				block	2
actor_variables_offset:			block	1

subject_NOID:				block	1
subject_object:				block	2	; to what?
subject_class:				block	2
subject_variables_offset:		block	1

in_hand_NOID:				block	1	; what is this avatar
in_hand_object:				block	2	; holding?
in_hand_class:				block	2
in_hand_variables_offset:		block	1

me_noid:				block	1
waitfor_noid:				block	1
waitfor_object:				block	2

; 	
;		KEEP THIS BLOCK OF 7 BYTES TOGETHER!!!

cel_address:		block	2		; cel animation
cel_x:			block	1
cel_y:			block	1
cel_dx:			block	1
cel_x_origin:		block	1
cel_y_origin:		block	1
cel_number:		block	1		; LEAVE BLOCK TOGETHER!


;		KEEP THIS BLOCK OF 14 BYTES TOGETHER!!!

image_control:
cel_width:		block	1
cel_height:		block	1
cel_x_offset:		block	1
cel_y_offset:		block	1
cel_x_rel:		block	1
cel_y_rel:		block	1

shape_pattern: 		block	1		; color to fill/and pattern
x1a:			block	1		; horiz_from
x1b:			block	1		; horiz_to
x2a:			block	1
x2b:			block	1

y1:			block	1
y2:			block	1


;		KEEP THIS BLOCK OF 6 BYTES TOGETHER!!!

object_address:		block	2		; MUST BE FIRST
prop_address:		block	2		; for drawing props
drawing_which_object:	block	1
d_wild:			block	1

;

display_page:		block	1		; general variables
cel_index:		block	1

screen_x:		block	1		; cel painter
screen_y:		block	1
screen_x_limit:		block	1
screen_y_limit:		block	1

cel_state_table:	block	2		; used in animate
screen_address:		block	2		; used by all!

cartoon_buffer:		block	16		; fast zero page line buffer

display_window:		block	1		; which window is current
color_map_addr_1:	block	2		; not used
color_map_addr_2:	block	2		; not used

x_index:		block	1		; # of bytes across line
x1a_and_3:		block	1		; used for speed
x1b_and_3:		block	1
or_value:		block	1		; in plot

pnt_tmp:		block	2		; paint,motion
plot_color:		block	1
vcount:			block	1		; # of vertical lines

delta_y:		block	1		; trap info
delta_x_a:		block	1
delta_x_b:		block	1
count_max_a:		block	1
count_max_b:		block	1

y1a_lo:			block	1
y1b_lo:			block	1
x1a_lo:			block	1
x1b_lo:			block	1
x1a_div_4:		block	1		; get byte # across

text_adr:		block	2		; used in text
v_count:		block	1
h_count:		block	1
x_temp:			block	1		; used in text
y_temp:			block	1

background_render:	block	1
object_count:		block	1		; used in render
temp_address:		block	2		; used in Fill,paint,page


;****************************************
;	Ron's zero page
;****************************************
tbl_ptr1:		block	2
tbl_ptr2:		block	2
class_ptr1:		block	2
object_ptr1:		block	2
temp_ptr1:		block	2
mem_ptr1:		block	2
structure_ptr:		block	2
temp2:			block	2
temp3:			block	2

switcher:		block	1		; used by waitfor!

object_list_pointer:	block	1		; used by render
largest_object:		block	1

source:			block	2
destination:		block	2
length:			block	2

save_a:			block	1

color:			block	1
text_line_length:	block	1		; current kbinput byte #

; comm_control.m
request_buffer:		block	2
response:		block	2

; protocol.m
TMPPNT:			block	2
TMPPNT_2:		block	2
INDPTR:			block	2
packet:			block	2
p_output_buffer:	block	2
CRC:			block	2
VALUE:			block	1

;  rs232.m

rs232_input_bit:		block	1
rs232_input_bit_count:		block	1
rs232_start_bit_flag:		block	1
rs232_input_byte:		block	1
rs232_input_parity:		block	1
rs232_output_bit_count:		block	1
rs232_output_bit:		block	1
rs232_output_byte:		block	1
rs232_output_parity:		block	1
rs232_control:			block	1
rs232_command:			block	1
rs232_status:			block	1
rs232_bit_count:		block	1
rs232_rcv_buffer_end:		block	1
rs232_rcv_buffer_start:		block	1
rs232_send_buffer_start:	block	1
rs232_send_buffer_end:		block	1
rs232_enable:			block	1

rs232_input_buffer:		block	2
rs232_output_buffer:		block	2
rs232_timing:			block	2
rs232_half_time:		block	2

; sfx
sfx_sound:				block	2

; contents_vector
response_data:				block	2
contents_list:				block	2

class_address:				block	2
state_variables_offset:			block	1
input_text_length:			block	1
orientation_byte:			block	1
pointed_at_cel_number:			block	1
horiz_and_mask:				block	1	; used for patterns
vert_and_mask:				block	1

pointed_at_limb:			block	1
print_ptr:				block	2
c_value_ptr:				block	2
ASYNC_object:				block	2
target_routine:				block	2	; used for caller
save_accumulator:			block	1	; used for caller
save_status:				block	1

cursor_x:				block	1
cursor_y:				block	1

resource_table_hi:			block	2
resource_table_lo:			block	2

current_action_number:			block	1
desired_size:				block	2	; for alloc

resource_table_ref:			block	2
object_noid:				block	1
