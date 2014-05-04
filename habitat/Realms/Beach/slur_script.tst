echo 0a
/u0/chip/microcosm/slur/slur regdir/0a.reg \
	-o rdldir/0a.rdl \
	-d FACE_WEST \
	-r 0a \
	-s 0f \
	-n 0b \
	-e 1a









echo 0b
/u0/chip/microcosm/slur/slur regdir/0b.reg \
	-o rdldir/0b.rdl \
	-d FACE_WEST \
	-r capt_flag \
	-s cave0 \
	-n bar_int

echo 0c
/u0/chip/microcosm/slur/slur regdir/0c.reg \
	-o rdldir/0c.rdl \
	-d FACE_WEST \
	-r cave0 \
	-s checkers \
	-n capt_flag

echo 0d
/u0/chip/microcosm/slur/slur regdir/0d.reg \
	-o rdldir/0d.rdl \
	-d FACE_WEST \
	-r checkers \
	-s dead_forest0 \
	-n cave0

echo 0e
/u0/chip/microcosm/slur/slur regdir/0e.reg \
	-o rdldir/0e.rdl \
	-d FACE_WEST \
	-r dead_forest0 \
	-s desert \
	-n checkers

echo 0f
/u0/chip/microcosm/slur/slur regdir/0f.reg \
	-o rdldir/0f.rdl \
	-d FACE_WEST \
	-r desert \
	-s forest0 \
	-n dead_forest0

echo 1a
/u0/chip/microcosm/slur/slur regdir/1a.reg \
	-o rdldir/1a.rdl \
	-d FACE_WEST \
	-r forest0 \
	-s gammon0 \
	-n desert

echo 1b
/u0/chip/microcosm/slur/slur regdir/1b.reg \
	-o rdldir/1b.rdl \
	-d FACE_WEST \
	-r gammon0 \
	-s hottub00 \
	-n forest0

echo 1c
/u0/chip/microcosm/slur/slur regdir/1c.reg \
	-o rdldir/1c.rdl \
	-d FACE_WEST \
	-r hottub00 \
	-s jacks \
	-n gammon0

echo 1d
/u0/chip/microcosm/slur/slur regdir/1d.reg \
	-o rdldir/1d.rdl \
	-d FACE_WEST \
	-r jacks \
	-n hottub00

echo 1e
/u0/chip/microcosm/slur/slur regdir/1e.reg \
	-o rdldir/1e.rdl \
	-d FACE_WEST \
	-r dnalsi_02 \
	-e dnalsi_12 \
	-n dnalsi_03

echo 1f
/u0/chip/microcosm/slur/slur regdir/1f.reg \
	-o rdldir/1f.rdl \
	-d FACE_WEST \
	-r dnalsi_03 \
	-s dnalsi_02 \
	-n dnalsi_04

echo 1g
/u0/chip/microcosm/slur/slur regdir/1g.reg \
	-o rdldir/1g.rdl \
	-d FACE_WEST \
	-r dnalsi_04 \
	-s dnalsi_03 \
	-n dnalsi_05

echo 2a
/u0/chip/microcosm/slur/slur regdir/2a.reg \
	-o rdldir/2a.rdl \
	-d FACE_WEST \
	-r dnalsi_05 \
	-e dnalsi_15 \
	-s dnalsi_04

echo 2b
/u0/chip/microcosm/slur/slur regdir/2b.reg \
	-o rdldir/2b.rdl \
	-d FACE_WEST \
	-r dnalsi_08 \
	-e dnalsi_18 \
	-n dnalsi_09

echo 2c
/u0/chip/microcosm/slur/slur regdir/2c.reg \
	-o rdldir/2c.rdl \
	-d FACE_WEST \
	-r dnalsi_09 \
	-s dnalsi_08 \
	-n dnalsi_0a

echo 2d
/u0/chip/microcosm/slur/slur regdir/2d.reg \
	-o rdldir/2d.rdl \
	-d FACE_WEST \
	-r dnalsi_0a \
	-e dnalsi_1a \
	-s dnalsi_09

echo 2e
/u0/chip/microcosm/slur/slur regdir/2e.reg \
	-o rdldir/2e.rdl \
	-d FACE_SOUTH \
	-r dnalsi_11 \
	-e dnalsi_21 \
	-n dnalsi_12

echo 2f
/u0/chip/microcosm/slur/slur regdir/2f.reg \
	-o rdldir/2f.rdl \
	-d FACE_SOUTH \
	-r dnalsi_12 \
	-w dnalsi_02 \
	-s dnalsi_11

