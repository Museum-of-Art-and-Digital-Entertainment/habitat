%%avatar_get.m:		doMyAction ACTION_GO		; My GO walks to this object
atm_get.m:	doMyAction ACTION_GO			; My GO walks to the ATM
atm_put.m:	doMyAction ACTION_GO			; My GO walks to the ATM
avatar_get.m:		doMyAction ACTION_GO		; My GO walks to this object
avatar_put.m:		doMyAction ACTION_GO		; My GO walks to this object
bottle_rdo.m:	doMyAction ACTION_GO		; Walk to object
coke_machine_put.m:	doMyAction	COKE_COINOP
fortune_machine_put.m:	doMyAction	FORTUNE_COINOP
generic_adjacentOpenClose.m:	doMyAction	ACTION_GO		; walk to it.
generic_coinOp.m:	doMyAction ACTION_GO		; First, go to the object
generic_getMass.m:	doMyAction ACTION_GO		; My GO walks to this object
generic_goToAndDropAt.m:	doMyAction ACTION_GO			; My GO walks to this object
generic_goToAndDropInto.m:	doMyAction ACTION_GO		; My GO walks to this object
generic_goToAndDropIntoIfOpen.m:	doMyAction ACTION_GO		; My GO walks to this object
generic_goToAndFill.m:	    	doMyAction ACTION_GO		; My GO walks to this object
generic_goToAndGet.m:	    doMyAction ACTION_GO		; My GO walks to this object
generic_goToAndPickFrom.m:	    doMyAction ACTION_GO		; My GO walks to this object
generic_goToAndPickFromIfOpen.m:	doMyAction ACTION_GO		; My GO walks to this object
generic_goToAndPickFromOrGet.m:	doMyAction ACTION_GO		; My GO walks to this object
generic_sendMail.m:			doMyAction ACTION_GO	; My GO walks to this object
generic_wearHead.m:	doMyAction HEAD_WEAR_ACTION
generic_wearLegs.m:	doMyAction LEGS_WEAR_ACTION
generic_wearOrGet.m:	doMyAction ACTION_GO		; My GO walks to this object
generic_wearTorso.m:	doMyAction TORSO_WEAR_ACTION
head_get.m:    doMyAction ACTION_GO		; My GO walks to this object
head_put.m:    doMyAction	HEAD_INTERNAL_PUT	; otherwise normal drop
hole_do.m:		doMyAction	ACTION_GO		; walk to hole
hole_do.m:		doMyAction	action_OPENCLOSE	; change grstate!
jukebox_do.m:	doMyAction ACTION_GO			; Go to the jukebox first
jukebox_put.m:	doMyAction	JUKEBOX_COINOP
mailbox_get.m:		doMyAction ACTION_GO	; My GO walks to this object
shovel_rdo.m:	doMyAction	ACTION_GO
stereo_get.m:	doMyAction ACTION_GO		; My GO walks to this object
stereo_put.m:	    doMyAction ACTION_GO		; My GO walks to the stereo
telephone_get.m:	doMyAction ACTION_GO			; My go walks to phone
teleport_put.m:	doMyAction	ACTION_GO
teleport_put.m:		doMyAction TELEPORT_COINOP
trap_put.m:	doMyAction ACTION_GO			; My GO walks to this object
vendo_do.m:	doMyAction	ACTION_GO		; walk to it.
vendo_put.m:	doMyAction VENDO_COINOP		; Spend the money if you can
walkie_talkie_get.m:	    doMyAction ACTION_GO		; My GO walks to this object
