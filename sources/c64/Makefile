.SILENT:

disk: jmuddle charset data

jmuddle:
	echo jmuddle: beta.mud
	-jmuddle < beta.mud > beta.jlist

muddle:
	echo muddle: beta.mud
	-muddle < beta.mud > beta.list

charset:
	echo making on_disk_charset.bin
	macross -c -p -o on_disk_charset.obj on_disk_charset.m
	mtobin on_disk_charset.obj on_disk_charset.dat

data:
	dd if=image.dat of=image1.dat bs=30720 count=1        # block size 30720 == 0x7800
	dd if=image.dat of=image2.dat bs=30720 count=1 skip=1 # add conv=sync if padding with zeros needed
	dd if=head.dat of=head1.dat bs=30720 count=1
	dd if=head.dat of=head2.dat bs=30720 count=1 skip=1
	filldisk class_equates.m Habitat-B.d64

#	getpic 0 7800 <image.dat >image1.dat
#	getpic 7800 7800 <image.dat >image2.dat
#	getpic 0 7800 <head.dat >head1.dat
#	getpic 7800 6500 <head.dat >head2.dat
