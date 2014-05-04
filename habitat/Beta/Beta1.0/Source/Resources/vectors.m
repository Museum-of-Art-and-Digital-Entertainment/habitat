; 	vectors.m	jump vectors so ACTIONS can use routines in mainline

	org	0x8000			; Note this MUST BE CORRECT!

v_prepare_to_send_request:	block	3
v_send_request_byte:		block	3
v_send_request:			block	3
v_send_string:			block	3
v_balloonMessage:		block	3
v_set_actor_chore:		block	3
v_issue_nested_command:		block	3
v_goXY:				block	3
v_do_a_sound:			block	3
v_talk:				block	3
v_wait_for_something:		block	3
v_toggle_walking_music:		block	3
v_putInto:			block	3
v_get_subject_object:		block	3
v_change_containers:		block	3
; Chip added these:
v_beep:				block	3
v_depends:			block	3
v_delete_object:		block	3
v_unpack_contents_vector:	block	3
v_purge_contents:		block	3
v_pick_from_container:		block	3
v_create_object:		block	3
v_select_denomination:		block	3
v_spend:			block	3
v_text_handler:			block	3
v_boing:			block	3
v_init_state_animation:		block	3
v_balloon_printf:		block	3
v_send_arguments:		block	3
v_go_to_new_region:		block	3
v_wait_for_region:		block	3
v_ASYNC_animation_wait:		block	3
v_adjacency_check:		block	3
v_punt_if_not_adjacent:		block	3
v_face_cursor:			block	3
v_find_goto_coords:		block	3
v_set_up_actor_pointers:	block	3
v_caller:			block	3
v_set_up_pointed_pointers:	block	3
v_change_light_level:		block	3
v_do_a_complex_sound:		block	3
v_get_ESP_text:			block	3
v_throw_it_away:		block	3
v_ESP_talk:			block	3
v_all_sfx_off:			block	3
v_get_furniture_xy:		block	3
v_update_cursor:		block	3
v_region_change:		block	3
v_clear_text_line:		block	3
v_change_player_color:		block	3
v_beep_or_boing:		block	3
v_start_walk:			block	3
v_find_goto_alt_entry:		block	3
