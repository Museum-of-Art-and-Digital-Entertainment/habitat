.SILENT:

.SUFFIXES: .m .bin

OBJECTS = \
 atm_do.bin atm_get.bin atm_put.bin \
 avatar_do.bin avatar_get.bin avatar_go.bin avatar_put.bin avatar_talk.bin \
  avatar_ATTACK.bin avatar_BASH.bin avatar_CLOSE.bin \
  avatar_CLOSECONTAINER.bin avatar_DIE.bin avatar_GET_uppercase.bin \
  avatar_GRABFROM.bin avatar_OPEN.bin avatar_REINCARNATE.bin \
  avatar_OPENCONTAINER.bin avatar_PAID.bin avatar_POSTURE.bin \
  avatar_PUT_uppercase.bin avatar_REMOVE.bin avatar_SITORGETUP.bin\
  avatar_THROW.bin avatar_WALK.bin avatar_WEAR.bin \
 book_do.bin \
 bottle_rdo.bin bottle_FILL.bin bottle_POUR.bin\
 BOING.bin\
 change_player_color.bin \
 changomatic_rdo.bin changomatic_CHANGE.bin \
 coke_machine_put.bin\
 do_a_gesture.bin\
 die_do.bin die_ROLL.bin \
 drugs_do.bin drugs_TAKE.bin \
 elevator_talk.bin elevator_ZAPIN.bin elevator_ZAPOUT.bin \
 escape_device_do.bin escape_device_BUGOUT.bin\
 fake_gun_do.bin fake_gun_rdo.bin fake_gun_FAKESHOOT.bin fake_gun_RESET.bin \
 flashlight_do.bin \
 floor_lamp_do.bin \
 fortune_machine_put.bin \
 garbage_can_do.bin garbage_can_FLUSH.bin \
 grenade_do.bin grenade_EXPLODE.bin \
 gun_do.bin \
 hand_of_god_BLAST.bin \
 head_do.bin head_get.bin head_put.bin head_talk.bin \
 hole_do.bin \
 instant_object_TRANSFORM.bin \
 jukebox_do.bin jukebox_put.bin jukebox_talk.bin \
 key_do.bin \
 magic_lamp_do.bin magic_lamp_talk.bin magic_lamp_RUB.bin magic_lamp_WISH.bin\
 paper_do.bin \
 plaque_do.bin \
 pawn_machine_do.bin pawn_machine_MUNCH.bin \
 sensor_do.bin sensor_SCAN.bin \
 sex_changer_do.bin sex_changer_SEXCHANGE.bin sex_changer_go.bin\
 shovel_rdo.bin shovel_DIG.bin \
 sky_go.bin \
 spray_can_do.bin spray_can_SPRAY.bin \
 stereo_UNLOAD.bin\
 stun_gun_rdo.bin \
 tape_LOAD.bin \
 teleport_put.bin teleport_talk.bin teleport_ZAPIN.bin teleport_ZAPOUT.bin \
  teleport_PAY.bin \
 toggle_ghost_mode.bin toggle_walking_music.bin \
 tokens_do.bin tokens_rdo.bin \
 vendo_do.bin vendo_put.bin vendo_SELECT.bin vendo_SELL.bin \
 wall_go.bin \
 windup_toy_do.bin windup_toy_WIND.bin \
 generic_adjacentOpenClose.bin generic_adjacentOpenCloseContainer.bin \
  generic_askOracle.bin generic_broadcast.bin generic_cease.bin \
  generic_depends.bin generic_doMagic.bin generic_doMagicIfMagic.bin \
  generic_rdoMagic.bin generic_rdoMagicIfMagic.bin \
  generic_adjacentDoMagic.bin button_CHANGESTATE.bin \
  generic_getMass.bin generic_goTo.bin generic_goToAndDropAt.bin \
  generic_goToAndDropInto.bin generic_goToAndDropIntoIfOpen.bin \
  generic_goToAndGet.bin generic_goToAndFill.bin generic_goToAndPickFrom.bin \
  generic_goToAndPickFromIfOpen.bin generic_goToAndPickFromOrGet.bin \
  generic_goToCursor.bin generic_goToOrPassThrough.bin generic_read.bin \
  generic_shoot.bin generic_strike.bin \
  generic_switch.bin generic_throw.bin generic_PAY.bin \
  generic_test.bin \
  generic_enterOrExit.bin \
  generic_changeState.bin generic_CHANGESTATE_uppercase.bin\
  generic_OFF.bin generic_OFFLIGHT.bin \
  generic_ON.bin generic_ONLIGHT.bin generic_PLAY.bin generic_SPEAK.bin \
  generic_coinOp.bin generic_destroy.bin \
  generic_goToFurniture.bin \
  telekenesis_get.bin \
  transit_region.bin GoToNewRegion.bin ask_for_help.bin fn_key_pressed.bin\
  trap_go.bin trap_put.bin\
  illegal.bin noEffect.bin unimplemented.bin

actions: $(OBJECTS)
.m.bin:
	echo making $*.bin
	macross -c -p -o $*.obj $*.m
	mtobin $*.obj $*.bin
	cp -f $*.bin ../Actions/$*.bin

clean:
	rm *.obj *.bin

