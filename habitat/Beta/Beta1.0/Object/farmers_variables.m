start_variables::

in_face_cursor::	block	1

caller_save_x::		block	1
caller_save_y::		block	1

region_trans_sound_toggle::	block 1		; minus if quiet region trans

custom_running::	block	1

first_pointed_noid::	block	1

volume_and_filter::	block	1
resonance_and_flags::	block	1
voice::			block	1	; voice number working on
new_command::		block	1	; ramp command byte
extend_command::	block	1	; extended command byte
now_flag::		block	1	; short ramp flag
voice_flag::		block	1	; flag set if voice 0-2
sfx_voices_active::	block	1	; bits indicate voice status

attack_decay::		block	3
sustain_release::	block	3

awaiting_text_input::	block	1
kb_counter::		block	1
text_cursor::		block	1
save_noid::		block	1
keyboard_latch::	block	1
text_left_hand_bound::	block	1

cl_tab::		block	6
ch_tab::		block	6
cx_tab::		block	6
cy_tab::		block	6

UNUMB::			block	9 ; BUFFER FOR UN-NUMBERED MESSAGES

got_ss_packet::		block	1
p_send_packet_lock::	block	1	; so stuff doesn't clobber each other

stack_before_execution::	block	1
face_cursor_x::			block	1
old_light_level::		block	1
hold_subject_object::		block	2
temp_word::			block	2
save_object_pointer::		block	2
out_counter::			block	1

sample_pointer::		block	1		; where on list
throttle_running::		block	1
throttle_count::		block	2

quit_flag::			block	1

;  cursor.m
detach_from_stick::		block	1
flashing::			block	1
flash_count::			block	1
cursor_state::			block	1	; 0-5 nill,do,go,stop,get,put
cursor_lock::			block	1	; use this to FREEZE cursor
old_strobe::			block	1
last_icon::			block	1
reset_to_icon::			block	1

;  keyboard.m
text_line_prestart::		block	1

;  keys.m
kb_buffer_pointer::		block	1
kb_buffer_end::			block	1
kb_buffer::			block	kb_buffer_length

trigger_is_pressed::		block	1
trigger_pulse::			block	1
joystick_state::		block	1
stick_is_left::			block	1		; joystick state vars
stick_is_right::		block	1		; (positive = true)
stick_is_up::			block	1
stick_is_down::			block	1

; comm_control.m

request_OID::			block	1
request_number::		block	1
response_buffer_number::	block	1
last_response_processed::	block	1
;response_buffers::		block	number_of_response_buffers*128
response_buffers::		block	response_free_space

hold_interrupt::		block	1

directory_start::		block	2
quip_timeout::			block	1
xpos::				block	1
end_of_packet_stream::		block	2
packet_stream_seq_header::	block	1

contents_list_pointer::		block	1
hold_class::			block	1
hold_capacity::			block	1
avatar_count::			block	1
talker_color_table::		block	6
hereis_flag::			block	1
region_is_ready::		block	1

head_style_list::		block	max_number_of_heads+1

text_mode_command::		block	1
return_bits::			block	1
write_enabled::			block	1

clock::				block	1
sound_timer::			block	1
sound_started::			block	3

resource_count::	block	1
resource_type::		block	1
resource_offset::	block	1
resource_file::		block	2

hold_noid::		block	1

resource_number::		block	1
object_resource_offset::	block	1
resource_counter::		block	1

saved_stack_position::		block	1
vblank_timer::			block	2
load_this_object::		block	1
qlink_message_waiting::		block	1

;balloon_work_area::		block	(text_window_width*max_balloon_size)
;  bwa is now in page4_space.
balloon_line_used_flag::	block	max_balloon_size 

error_number::			block	4
error_regs_a::			block	1
error_regs_y::			block	1
error_regs_x::			block	1
error_regs_stack::		block	1

tracksector::		block 2
cur_buff_tracksec::	block 2		;tracksector in buffer
buffer_index::		block 1
file_offset::		block 2
cache_a_ts::		block 2
cache_b_ts::		block 2
cache_number::		block 2

write_to_paper_mode::	block 1		; 0-normal nz=page query

bitmap_on_flag::	block	1
NMI_save_IO::		block	1
latch::			block	1
screen_is_off::		block	1

sequence_number::	block	1
buffer_number::		block	1
buffer_offset::		block	1
request_byte::		block	1
response_sequence_number::	block	1
response_length::	block	1

MESSSZ::		block	1
HDRPFX::		block	2
MSGPNT::		block	2

disk_sector_LRC::	block	1

have_been_ported::	block	1
