; 	variable space availible 0x400 - 0x800
; 	NOTE: THIS FILE IS ASSEMBLED INTO all action code....

		org	0x200
class_table_hi::	block	256
class_table_lo::	block	256

arguments::	block	128
end_arguments:
		org	arguments
desired_x::		block	1		; for go actions
desired_y::		block	1
walk_how::		block	1
last_command_selected::	block	1
go_success::		block	1
prevent_region_trans::	block	1

		org	arguments
container::	block	1			; for drop actions
container_x::	block	1
container_y::	block	1
obj_orient::	block	1

		org	arguments
NewRegionDirection::	block	1

		org	end_arguments
object_list::		block	region_max_capacity	; active objects

		org	0x500
rs232_input::		block	256
rs232_output::		block	256
disk_buffer::
balloon_work_area::		;(text_window_width*max_balloon_size);
sort_y::
			block	128
balloon_work_area_2::
			block	128


; KEEP THE NEXT 9 BYTES IN A BLOCK
terrain_type::		block	1
light_level::		block	1	
region_depth::		block	1
region_class::		block	1
Who_am_I::		block	1
bank_account_balance::	block	4		; THERE IS SPACE
printf_parameters::	block	4		; FROM  0x800 to 0x816
region_trans_type::	block	1		; 0/1-walk 2/3-port etc.
select_value::		block	2
Im_sitting::		block	1
new_region_flag::	block	1
change_background_object::	block	1
async_workspace::	block	4		; for ASYNC BEHAVIOURS
