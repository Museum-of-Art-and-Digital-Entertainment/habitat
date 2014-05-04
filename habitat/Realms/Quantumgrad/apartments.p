/*
	The Vanilla Habitat Apt Building

extn defined:	bnames[] (building names)
		afront() (apartment front regions)
		a()	 (apartments interiors)
		h()	 (3 door hallway segments)
		e()	 (elevators)
		elby	 (the generic near elevator lobby)
		bboard	 (a residents bulliten board)
*/

hlseg:			/* in $1= base room #, $2 = color $3=name */
	  a?!($3,$1) a?!($3,$1+1) a?!($3,$1+2)
	  |          |            |
	-###h*($1+0,$1+1,$1+2,c[$2],$3,$4)-

hl:				/* in $1= base room #, $2 = color $3=name */
	-hlseg($1,$2,$3,$4)-hlseg($1+3,$2,$3,$4)-hlseg($1+6,$2,$3,$4)-hlseg($1+9,$2,$3,$4)-

elby135:			/* in $1 floor number (color) $2-name */
	   |
	-elby($1*100,$1*100+11,$1*100+12,$1*100+23,$1*100+24,$1*100+35,c[$1-1],$2)-
	   |

elby3671:
	   |
	-elby($1*100+36,$1*100+47,$1*100+48,$1*100+59,$1*100+60,$1*100+71,c[$1-1],$2)-
	   |

f:			/* $1=name */
	             hl<(.*100+124,.,$1,la) -stairs(.+1,c[.],$1,la)- hl>(.*100+136,.,$1,ra)
	                       |                |                      |
	hl(.*100+112,.,$1,ra)-elby135<(.+1,$1)-e?(.+1,c[.],$1,ua)-elby3671>(.+1,$1)-hl(.*100+148,.,$1,la)
	                       |                                       |
	             hl<(.*100+100,.,$1,ra)                   hl>(.*100+160,.,$1,la)


apartments:			/* $1=name */
	-f($1)-f($1)-f($1)-f($1)-f($1)-f($1)-f($1)-f($1)-f($1)-f($1)-f($1)-

lobby:			/* $1=name */
	-stairs("Lobby",c[.],$1,da)-
	  |
	#e?("Lobby",c[.],$1,da)-bboard(bnames[$1])
	  |

aptbuilding:
	basement-lobby(bnames[$1])-apartments(bnames[$1])-roof
	             |
	         afront?(bnames[$1])
