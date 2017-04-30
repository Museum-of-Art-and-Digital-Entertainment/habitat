.SILENT:

.SUFFIXES: .m .bin

OBJECTS = \
amulet.bin ans.bin atm.bin bag.bin ball1.bin banner.bin barred.bin\
bboard.bin bbox0.bin bbush.bin beds.bin booke.bin bookf.bin bottle.bin\
box1.bin brang.bin bridgef.bin bridges.bin bush1.bin bush2.bin\
bush3.bin bush4.bin bwall3.bin bwall4.bin bwall5.bin bwall6.bin\
bwall7.bin bwall8.bin bwall9.bin c.bin cafechair.bin cage2.bin\
camera0.bin car4.bin carb.bin carf.bin cassette.bin cat.bin cave0.bin\
cball0.bin cbolt.bin ccard.bin chairfb.bin chairs.bin chango.bin\
chess0.bin chestf.bin chests.bin cinder.bin club2.bin coke1.bin\
compass.bin copier.bin couchfb.bin couchs.bin counter0.bin \
crack0.bin cups0.bin dcase.bin dials.bin die.bin die2.bin doll.bin\
door1.bin door2.bin dungdoor.bin empty.bin escaper.bin\
explo1.bin explo2.bin explo3.bin eye0.bin fence1.bin fgun1.bin\
filecabinet.bin flag.bin flamp.bin flat.bin flite.bin floor0.bin\
floor1.bin fortun.bin fount2.bin fris.bin ftank2.bin gcan.bin\
gdoor.bin gem.bin glassdoor.bin glue0.bin grass0.bin gren.bin\
gun1.bin gun2.bin gun3.bin hand.bin hand2.bin hole0.bin hottub.bin\
house2.bin icecream.bin jug0.bin juke.bin junkdoor.bin kcan.bin\
key1.bin kk1.bin kk2.bin kk3.bin knife1.bin knife2.bin luggages.bin\
mag.bin magic_wall.bin maus.bin mbikes.bin mbook0.bin mbox.bin\
mdevice1.bin mdrop.bin mhatch.bin mic0.bin mlamp2.bin mount1.bin\
mpill.bin mring.bin mstaff.bin news.bin newsstand0.bin\
newsstand1.bin palm2.bin paper.bin patgun0.bin pawn.bin\
pawnstock.bin peng.bin pfork.bin phone1.bin picture1.bin\
picture2.bin picture3.bin pillbot.bin pipe0.bin plant1.bin\
plant2.bin plant3.bin plaque.bin pond0.bin port7.bin rduk.bin\
region0.bin road0.bin rock1.bin rock2.bin rock3.bin safe1.bin\
saw.bin security.bin sensor.bin sexo.bin shovel0.bin sign0.bin\
sign1.bin sign2.bin sign3.bin sign4.bin sign5.bin sign6.bin\
slite1.bin slite2.bin stock0.bin stool0.bin super_trap.bin\
switches.bin table0.bin tablets.bin tapep.bin tbear.bin tdoor.bin\
tele0.bin temp.bin test.bin ticket.bin toad.bin tok.bin torch0.bin\
towel.bin trap0.bin trap1.bin trchest.bin tree1.bin tree2.bin\
tree4.bin tree5.bin tree6.bin tree7.bin tree8.bin tree9.bin\
treeA.bin treeB.bin tube0.bin umbrella.bin undefined.bin\
varpicture.bin vase.bin vendo0.bin vendo1.bin wand1.bin wand2.bin\
wand3.bin wand4.bin window1.bin window3.bin 

props: $(OBJECTS)
.m.bin:
	echo making $*.bin
	cp include.txt _tmp_.m
	cat $*.m >> _tmp_.m
	macross -c -p -o _tmp_.obj _tmp_.m
	mtobin _tmp_.obj ../$*.bin
