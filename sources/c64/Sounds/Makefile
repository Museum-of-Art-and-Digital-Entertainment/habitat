.SILENT:

.SUFFIXES:	.sob .spb .bin .pwbin

OBJECTS = \
atm_thinking.bin \
avatar_injured.bin \
avatar_injured.pwbin \
avatar_killed.bin \
avatar_killed.pwbin \
bag_closing.bin \
bag_opening.bin \
big_explosion.bin \
big_explosion.pwbin \
box_closing.bin \
box_opening.bin \
changomatic.bin \
chest_of_drawers_closing.bin \
chest_of_drawers_opening.bin \
clothes_doffed.bin \
clothes_donned.bin \
coin_accepted_by_coinop.bin \
coin_accepted_by_coinop.pwbin \
coin_deposited_in_coinop.bin \
coin_deposited_in_coinop.pwbin \
coin_rejected_by_coinop.bin \
coin_rejected_by_coinop.pwbin \
crystal_ball.bin \
crystal_ball.pwbin \
door_closing.bin \
door_opening.bin \
door_opening.pwbin \
error_beep.bin \
escape_device_activates.bin \
escape_device_used_up.bin \
farebox_announcement_fanfare.bin \
farebox_announcement_fanfare.pwbin \
farebox_chime.bin \
farebox_chime.pwbin \
fortune_dispensed.bin \
fortune_dispensed.pwbin \
garbage_can_flush.bin \
genie_appears.bin \
gun_safety_off.bin \
gun_safety_on.bin \
gunshot.bin \
hand_o_god_flame.bin \
hand_o_god_lightning.bin \
hand_o_god_lightning.pwbin \
instant_object_pill.bin \
joke_gunshot.bin \
joke_gunshot.pwbin \
knife_hits_avatar.bin \
knife_hits_avatar.pwbin \
knife_hits_object.bin \
magic.bin \
magic.pwbin \
medium_explosion.bin \
money_into_atm.bin \
money_into_atm.pwbin \
money_out_of_atm.bin \
money_out_of_atm.pwbin \
parking_meter_crank.bin \
parking_meter_crank.pwbin \
phone_busy.bin \
phone_dial_tone.bin \
phone_local_ring.bin \
phone_local_ring.pwbin \
phone_remote_hangup.bin \
phone_remote_hangup.pwbin \
phone_remote_ring.bin \
region_boing.bin \
security_device_off.bin \
security_device_on.bin \
sensor_didnt_find_it.bin \
sensor_found_it.bin \
sensor_scanning.bin \
small_explosion.bin \
switch_click.bin \
teleport_departure.bin \
teleport_departure.pwbin \
vendo_changing.bin \
vendo_dispensing.bin \
vendo_dispensing.pwbin \
water_pouring.bin \
winding_up_toy.bin \
winding_up_toy.pwbin \
teleport_activates.bin \
teleport_activates.pwbin \
club_hits_avatar.bin \
club_hits_avatar.pwbin \
club_hits_object.bin \
digging.bin \
footsteps.bin \
fortune_machine_thinking.bin \
genie_out.bin \
grenade_pin_pull.bin \
grenade_pin_pull.pwbin \
mail_into_mailbox.bin \
mail_into_mailbox.pwbin \
mail_out_of_mailbox.bin \
mail_out_of_mailbox.pwbin \
parking_meter_expires.bin \
parking_meter_expires.pwbin \
teleport_activates.bin \
teleport_activates.pwbin \
sex_changer.bin \
sex_changer.pwbin \
message_received.bin \
message_sent.bin \
coins_jingling.bin \
coins_jingling.pwbin \
stingy_coke_machine.bin \
stingy_coke_machine.pwbin \
stun_gun_fire.bin \
stun_gun_fire.pwbin \
stun_gun_hit.bin \
stun_gun_hit.pwbin \
stun_gun_miss.bin \
avatar_out_of_stone.bin \
avatar_out_of_stone.pwbin \
avatar_into_stone.bin \
avatar_into_stone.pwbin \
successful_esp_activation.bin \
failed_esp_activation.bin \
teleport_conf_wait.bin \
teleport_conf_wait.pwbin \
teleport_arrival.bin \
teleport_arrival.pwbin \
magic_2.bin \
magic_2.pwbin \
magic_3.bin \
magic_3.pwbin \
magic_4.bin \
magic_4.pwbin \
teleport_region_change_0.bin \
teleport_region_change_0.pwbin \
teleport_region_change_1.bin \
teleport_region_change_1.pwbin \
teleport_region_change_2.bin \
titles_music_v0.bin \
titles_music_v0.pwbin \
titles_music_v1.bin \
titles_music_v1.pwbin \
titles_music_v2.bin \
titles_music_v2.pwbin \
region_change_music_v0.bin \
region_change_music_v1.bin \
region_change_music_v2.bin \
spraycan.bin

sounds: $(OBJECTS)

.sob.bin:
	echo making $*.bin
	cp org_statement temp.m
	cat $*.sob >>temp.m
	macross -c -p -o $*.obj temp.m
	mtobin $*.obj $*.bin

.spb.pwbin:
	echo making $*.pwbin
	cp org_statement temp.m
	cat $*.spb >>temp.m
	macross -c -p -o $*.obj temp.m
	mtobin $*.obj $*.pwbin

clean:
	rm *.obj *.bin *.pwbin
