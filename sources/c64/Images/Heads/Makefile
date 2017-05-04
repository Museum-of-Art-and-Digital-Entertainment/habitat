.SILENT:

.SUFFIXES: .m .bin

OBJECTS = \
afro0.bin airforce0.bin angel0.bin angel1.bin army0.bin army1.bin arrowgag.bin\
ascot0.bin baron.bin bean0.bin beard0.bin beaver0.bin bem1.bin bem2.bin bem3.bin\
bigmama0.bin bimbi.bin bizzaro0.bin block0.bin bluegill.bin bluehorn.bin\
bman0.bin boldhead.bin bolthead.bin boone0.bin bozo0.bin brain.bin brain0.bin\
bride.bin brow.bin buckw0.bin bum0.bin cent0.bin chaplin0.bin chef0.bin cleo.bin\
coldlady0.bin coolcat0.bin cootie0.bin cyclops0.bin dandy0.bin darth0.bin\
deer.bin demon1.bin demon2.bin deviltail.bin dobbs0.bin doctor0.bin dodo0.bin\
dragon0.bin duck0.bin elephead.bin executioner0.bin fbeany0.bin fhead.bin\
fhippie0.bin fishead0.bin fly0.bin fstien0.bin gabor0.bin gamorrean0.bin\
george.bin grandma0.bin grit0.bin groom.bin groucho.bin hammer0.bin hardhat0.bin\
head0.bin head1.bin head2.bin head3.bin head4.bin head5.bin head6.bin head7.bin\
head8.bin helmet0.bin hiawatha0.bin hillbilly0.bin hunter0.bin invsman.bin\
irma0.bin jaggi.bin jaws0.bin jerk0.bin juvie0.bin keystone0.bin king.bin\
kitty3.bin knight1.bin knight2.bin lioness.bin lizard0.bin madsci0.bin mask.bin\
mbeany0.bin melvin.bin metro0.bin milkman0.bin ming0.bin minister.bin monk.bin\
moto0.bin motohead.bin mr_mike0.bin nailhead0.bin necknod.bin\
newsboy0.bin ninja0.bin oink0.bin oldman0.bin ostrich0.bin\
peakhead.bin penguin0.bin phair0.bin phydeaux0.bin pigtail0.bin pirate1.bin\
pirate2.bin plughead.bin pony3.bin pony4.bin pothead.bin princess0.bin\
princess1.bin rabbit0.bin resident.bin rhood.bin riotcop.bin rivithead.bin\
robot0.bin rotohead.bin sailor0.bin santa0.bin satan0.bin scruffy0.bin\
shades0.bin sheriff.bin sherlock0.bin skull0.bin smiley0.bin spacesuit0.bin\
stalk0.bin statesman0.bin steve.bin tasha0.bin test.bin test2.bin tex0.bin\
thug0.bin tiger.bin tknot1.bin tknot2.bin tonto0.bin tonto1.bin tophat0.bin\
turban0.bin turkey0.bin unicorn0.bin vampire0.bin viking0.bin wimpy0.bin\
witch0.bin wizard0.bin woman0.bin woman1.bin wwolf.bin

props: $(OBJECTS)
.m.bin:
	echo making $*.bin
	cp include.txt _tmp_.m
	cat $*.m >> _tmp_.m
	macross -c -p -o _tmp_.obj _tmp_.m
	mtobin _tmp_.obj ../$*.bin
