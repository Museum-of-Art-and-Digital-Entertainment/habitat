answering_machine_do.m:	jsr	v_punt_if_not_adjacent
avatar_do.m:		jsr	v_punt_if_not_adjacent	; punt to depends if not near
floor_lamp_do.m:	jsr	v_punt_if_not_adjacent
garbage_can_do.m:	jsr	v_punt_if_not_adjacent
generic_adjacentDoMagic.m:	jsr	v_punt_if_not_adjacent
generic_adjacentOpenClose.m:	jsr	v_punt_if_not_adjacent
generic_adjacentOpenCloseContainer.m:	jsr	v_punt_if_not_adjacent
pawn_machine_do.m:	jsr	v_punt_if_not_adjacent
phone_booth_do.m:	jsr	v_punt_if_not_adjacent
sex_changer_do.m:	jsr	v_punt_if_not_adjacent		; Must be next to machine
telephone_do.m:	jsr	v_punt_if_not_adjacent
vectors.m:v_punt_if_not_adjacent:		block	3
vendo_do.m:	jsr	v_punt_if_not_adjacent		; if not adj, depends
