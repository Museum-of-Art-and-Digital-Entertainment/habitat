*Habitat* is a massively multiplayer online role-playing game for the Commodore 64 on top of the QuantumLink online platform.

# History

[Habitat](https://en.wikipedia.org/wiki/Habitat_(video_game)) was developed between 1985 and 1987 by Chip Morningstar and Randy Farmer at Lucasfilm Ltd.

The game was originally codenamed "Microcosm", released as "Habitat" in 1986, and re-launched as "Club Caribe" in 1988.

The original source has been resurrected in the context of preservation and restoration by [The Museum of Art and Digital Entertainment](http://www.themade.org/).

# Contents

This repository is based on the original Fujitsu technology transfer archive, and contains

* the Commodore 64 [macross](https://github.com/Museum-of-Art-and-Digital-Entertainment/macross) assembly source and art (aric/mic/Gr, habitat/Beta, sources/c64)
* the PL/I source for Stratus VOS (Habitape, chip/habitat/stratus, chip/habitat/tape1, sources/stratus)
* tools for the server database (chip/habitat/ghu, chip/habitat/muddle, sources/tools/ghu)
* lots of documentation on planning, design and the beta phase (chip/habitat/docs)

The original archive aimed to collect all information on and all source for the project, so it consisted of several independent disk/tape dumps. Consequently, some of the source in this repository exists in multiple versions in different subdirectories.

**Caveat**: There are C64 source files in the same directory that only differ in case. A checkout of this repository requires a case sensitive filesystem. On Linux, this is the default; on OS X, you can create a case sensitive HFS disk image using *Disk Utility*.

# License

MIT

# Credits

Habitat was created by the Lucasfilm Games Division and Quantum Computer
Services.

## For Lucasfilm Games

Chip Morningstar was project leader, programmer and principal designer.  Randy
Farmer and Aric Wilmunder wrote the Commodore 64 software.  Gary Winnick
created most of the artwork and animation, with additional artwork by Ken
Macklin.  Chris Grigg created the sounds.  Additional technical contributions
by Charlie Kellner (the original cel animation system), Kevin Furry
(high-speed Commodore disk routines) and Ron Gilbert (the original Commodore
object memory manager).  Additional creative support was provided by Noah
Falstein, David Fox, Douglas Crockford, Mary Paterno, Chris Werner and David
Martin.  Creative irritation provided by David Levine.  The "Official Avatar
Handbook" was written by Jamie Williams and Chip Morningstar.  Project
schedule coordination at Lucasfilm was handled by Nancy Mohler.  General
Manager of the Lucasfilm Games Division was Steve Arnold.  Thanks to Janice
Morningstar, Pamela Farmer and Lori Wilmunder for tolerance and support beyond
the call of duty.  Special thanks to George Lucas.

## For Quantum

Janet Hunter was the primary Q-Link host system programmer.  Additional
technical support provided by Ken Huntsman, Craig Dykstra and Mike Ficco.
Project schedule coordination at Quantum was handled by Cathy Anderson.  Marc
Serrif was technical manager at Quantum.  Special thanks to Clive Smith of
Commodore Business Machines without whose support and interest this project
would never have come to be.


# Notes on the Client

## Toolchain
Habitat is assembled with the macross assembler and linked with the slinky linker. If you compile macross and slinky yourself with “make” in both the macross and the slinky directories, you will get binaries that can successfully assemble and link Habitat.

macross and slinky have been hacked to be binary compatible with existing .o files, so you can mix and match existing .o files and newly assembled ones, and link them with slinky. See the comments in macross/Makefile for details.

## Version
There is a recurring version number of “6.4” in the source and the binaries. Lower version numbers can be found in documentation files. In other places, the version is called “Beta 1.0”. The documentation says Beta 1.0 is from December 1987. According to documentation, the version was at “6.4” when they declared it was not “Beta 1.0”. There was an “Alpha 6.4”, and a “Beta 1.0”. Since “Beta 1.0”, the exact version is no longer used, but encoded in code.

## Components
The C64 application consists of the following components:

* "Main" ("all.out"): The main logic
* "Behaviors" ("Actions", "action.dat"): sources that implement actions on objects
* "Heads" ("head.dat"): images for avatar heads, expressed in macross source
* "Props" ("Images", "image.dat"): images for objects, expressed in macross source
* "Sounds" ("sound.dat"): tables for sound effects, expressed in macross source
* "Classes" ("class.dat"): Index that links Behaviors, Heads, Props and Sounds, created by the muddle tool from a .mud file
The "muddle" tool uses the .mud description files as an input to pick up the individual binaries of "Behaviors", "Heads", "Props" and "Sounds", links them into a .dat file per component, and creates the class.dat index.

## Disk Layout
Habitat consists of two disks sides:
* Side A, “program disk”: "Main" resides on this side
* Side B, “image disk”: The rest is on this side, so after the main program is loaded, side B can remain in the drive.
The layout of side B is defined like this:

```
                (TRACK)
             1         2         3
    12345678901234567890123456789012345
  0 cccaaasssiiiiiiiiIiiiiiihhhhhhhhhhh
S 1 cccaaasssiiiiiiii*iiiiiihhhhhhhhhhh
E 2 cccaaasssiiiiiiii*iiiiiihhhhhhhhhhh
C 3 cccaaasssiiiiiiii*iiiiiihhhhhhhhhhh
T 4 cccaaasssiiiiiiii*iiiiiihhhhhhhhhhh
O 5 cccaaasssiiiiiiii*iiiiiihhhhhhhhhhh
R 6 cccaaasssiiiiiiii?iiiiiihhhhhhhhhhh
  7 cccaaasssiiiiiiii?iiiiiihhhhhhhhhhh
  8 cccaaasssiiiiiiiiCiiiiiihhhhhhhhhhh
  9 cccaaasssiiiiiiiiCiiiiiihhhhhhhhhhh
 10 cccaaasssiiiiiiiiCiiiiiihhhhhhhhhhh
 11 cccaaasssiiiiiiiiCiiiiiihhhhhhhhhhh
 12 cccaaasssiiiiiiiiCiiiiiihhhhhhhhhhh
 13 cccaaasssiiiiiiii?iiiiiihhhhhhhhhhh
 14 cccaaasssiiiiiiii?iiiiiihhhhhhhhhhh
 15 cccaaasssiiiiiiii?iiiiiihhhhhhhhhhh
 16 cccaaasssiiiiiiii?iiiiiihhhhhh
 17 cccaaasssiiiiiiii?iiiiii
 18 cccaaasssiiiiiiii
 19 cccaaasssiiiiiiii

                        max size
c=class file            15360
a=action file           15360
s=sound file            15360
i=images file           68608
h=head file             46592
C=on_disk_charset
I=id_file.dat
*=required directory files
?=free? (current dos will not read)
```
id_file.dat is interesting: it’s the BAM sector, but it doesn’t contain a BAM. It doesn’t even contain the 18/01 link. It’s all ASCII, with a disk number and version at the beginning, and lots of credits after that. The region after 0x90 is laid out so the disk title looks OK though.

The "filldisk" tool creates a disk image from the inputs according to this specification. It is missing from our tree though.

## Tree Layout
* The tree layout is quite messy. There are up to five versions of the same data in the tree, and there are lots of intermediate build products everywhere.
* Just because sources and binaries reside in the same directory, it doesn't mean they need to correspond to each other. habitat/Beta/Beta1.0/Object is one such case.
* sources/c64 is generally the latest version, it also has the more correct component names and has the least amount of binaries in the tree.
* Binaries are helpful nevertheless to compare the assembler output with them and to verify the correctness of the toolchain. Also, the binaries don't necessarily match the source, so this gives us access to different versions.

### Build Root with .mud and .dat files
* habitat/Beta/Bak: 1987-05-11
* habitat/Beta/save.dat.files: .dat files only, different than all other versions, age judged from size
* habitat/Beta/Beta1.0: 1987-12-11, updated .mud
* sources/c64: 1987-12-11, updated .mud, more resources; same action.dat/sound.dat as previous version
* habitat/Beta: 1988-06-23, same .mud file, different logs; same .dat files as previous version

### Main sources:
* habitat/Beta/Beta1.0/Object
* habitat/Beta/Beta1.0/Source
* sources/c64/Main
All three sets are identical.

### Main binaries:
* habitat/Beta/Beta1.0/Object
* farmer/Habitat/Obj: almost identical, but "Lucasfilm's Habitat" replaced with "Q-Link's Club Caribe", as well as other string differences. farmer/Habitat/Obj/difflist looks like the diff that's responsible for these differences.

### Behaviors sources:
* habitat/Beta/Actions/Bak: old version
* habitat/Beta/Actions: current version
* habitat/Beta/Beta1.0/Source/Resources: current version
* sources/c64/Behaviors: current version

### Behaviors binaries:
* habitat/Beta/Actions/Bak: version 1
* habitat/Beta/Actions: version 2
* sources/c64/Behaviors: version 3
The version ordering was derived from the source version and the file sizes.

### Images sources:
* aric/mic/Gr
* sources/c64/Images
Both sets are the same.

### Images binaries:
* aric/mic/Gr: version 1, .bin files in Heads and Prop directories
* habitat/Beta/Images: version 2, all .bin files in one directory
The overlapping files are identical except for a few. habitat/Beta/Images contains lots of extra .bin files for which there are no sources and that are not referenced in the Makefile

### Sounds sources:
* habitat/Beta/Sounds
* habitat/Beta/Beta1.0/Source/Resources: Shares a directory with Behaviors
* sources/c64/Sounds
All three versions are the same.

### Sounds binaries:
* habitat/Beta/Sounds

## Misc

### Updating the image disk
When the client logs in, the server can update the image disk by sending blocks that are supposed to be written. When done, it’ll send a new T18/S0 with an updated version number. The tool “puddle” is used to create .dat files with minimal differences from an old and a new state.

### Fred/Griddle/Reno
Set of tools to generate/edit regions visually on a combination of Sun and C64. Reno only exists in binary form (~32 KB!).

### Dump Disk
If the game panics, it can save its state to a “dump disk”.

### loadrom
The tool “loadrom” is missing. It seems to read “macross -p” (position-independent code) output and create raw .bin files.

### mtobin
mtobin is another tool we don't have. It seems to be a script that compiles a macross .m file and creates a headerless .bin file. It's referenced from the Makefile in Images.

# Notes on the Server

TODO
