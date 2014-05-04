.SUFFIXES:	.m .obj

.SILENT:

OBJS = main.obj\
general.obj\
gestures.obj\
datacrunch.obj\
render.obj\
keyboard.obj\
pointer.obj\
decimal.obj\
rs232.obj\
box.obj\
text.obj\
diskdriver.obj\
dline.obj\
cursor.obj\
diskdos.obj\
animate.obj\
mix.obj\
contents_vector.obj\
paint.obj\
chore.obj\
throw.obj\
text_handler.obj\
quit.obj\
mem_use.obj\
actions.obj\
page.obj\
walkto.obj\
sfx.obj

OBJS2 = vectors.obj\
vblank.obj\
routines.obj\
keys.obj\
trap.obj\
error.obj\
throttle.obj\
fastlink.obj\
auto.obj\
pick.obj\
comm_control.obj\
protocol.obj\
balloons.obj\
database.obj\
basic_loader.obj\
farmers_variables.obj\
datavars.obj\
dataheap.obj

OBJS3 =  saver.obj\
diskinit.obj\
init.obj\
page4_space.obj\
charset.obj\
sprites.obj\
loader.obj\
custom.obj

OBJS4 = habsill3.obj

OBJS5 = tables.obj

OBJS6 = variables_186.obj

OBJS7 = animinit.obj

.m.obj:
	echo 'macrossing' $*'.m' ; macross -c -o $*.obj all.m $*.m

all:
	echo	"type 'Habitat' from my Io Directory"

new: $(OBJS) $(OBJS2) $(OBJS3) $(OBJS4) $(OBJS5) $(OBJS6) $(OBJS7)
	echo 'slinking'
	slinky -e -o ../all.out -n -m ../all.sym\
-l 0x0800 $(OBJS)\
-l 0x4b40 $(OBJS4)\
-l 0x5f40 $(OBJS7)\
-l 0x6400 $(OBJS5)\
-l 0x6a00 $(OBJS3)\
-l 0x8000 $(OBJS2)\
-l 0xff40 $(OBJS6) > SIZE

