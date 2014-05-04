depends::
	moveb	pointed_noid, subject_noid
	movew	pointed_object, subject_object
	movew	pointed_class, subject_class
	moveb	pointed_variables_offset, subject_variables_offset

	lda	in_hand_noid
	if (zero) {
		moveb	actor_noid, pointed_noid
		movew	actor_object, pointed_object
		movew	actor_class, pointed_class
		moveb	actor_variables_offset, pointed_variables_offset
	} else {
		moveb	in_hand_noid, pointed_noid
		movew	in_hand_object, pointed_object
		movew	in_hand_class, pointed_class
		moveb	in_hand_variables_offset, pointed_variables_offset
	}
	lda #ACTION_RDO
	jsr issue_nested_command
	rts
