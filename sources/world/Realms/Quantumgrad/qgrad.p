include "equates.p"
bnames:["            Habitat Arms",
	"            Quantum Leap",
	"          Hot l Quantumgrad",
	"         Birds of a Feather",
	"            Room & Bored",
	"           Porter's Haven",
	"            Turfs Galore",
	"          This isn't Kansas",
	"          The No-Tell Hotel"]

afront:	(afront1, afront2, afront3, afront4)
a:(apt1, apt2, apt3, apt4, apt4, apt6, apt7, apt8, apt9, apt10)

h:(hall1, hall2, hall3, hall4, hall4, hall6, hall7, hall8,
   hall9, hall10)

e:(elevator1, elevator2, elevator3, elevator4)

include	"apartments.p"

include	"stores.p"

stores:	(
	bar1, bar2, bar3, hottub2, arcade,
	cityhall, library, newstand, stockmarket, meetinghall,

	hallofrecs, theatre, gameshow, generalstore2, magicshop,
	emporium, newyou, bodypaint, knickknacks, court,

	church1, church2, empty1, empty2
	)

s:
	stores*($1,$2)

bk:
	bank*($1,$2)

sn:["A St", "B St", "C St", "D St", "E St", "F St", "G St"]

mall:
	 |
	-intersect(bnames[$1],bnames[$1+1],bnames[$1+2],"Downtown")-
	 |

complex:
	aptbuilding($1)
	  |
	-mall($1)-aptbuilding>($1+1)
	  |
	aptbuilding!($1+2)

plaza:
	 |       |       |
	-plzSW---plzW----plzNW-
	 |       |       |
	-plzS---ORACL---plzN-
	 |       |       |
	-plzSE---plzE----plzNE-
	 |       |       |

sgrup:
	 |         |         |
	-s(R_L,c?)-s(R_L,c?)-s(R_L,c?)-
	 |         |         |

sentr:
	           |
	-s(R_L,c?)-t($1,c?,$2)-s(R_L,c?)-
	           |

dntn:
	                       |
	 s(D_R,c?)-s(R_L,c?)-sent(T_U,sn[6])-bk(T_D,c?)-s(E_L,c?)
	 |                                   |
	 t(U_R,c?,sn[5])-bk(T_D,c?)-sgrup-x(T_U,c?)-s(D_L,c?)
	                  |         |||             |
	 s(D_R,c?)-------x(T_U,c?)-#####-s(R_L,c?)-t(U_L,c?,sn[4])
	 |                         #####
	-t(U_R,c?,sn[3])-s(R_L,c?)-plaza-s(R_L,c?)-s(D_L,c?)-
	                           #####                 |
	 s(D_R,c?)-s(R_L,c?)-------#####-bk(T_D,c?)-t(U_L,c?,sn[2])
	 |                                     |
	 t(U_R,c?,sn[1])-bk(T_D,c?)-sgrup-x(T_U,c?)-s(D_L,c?)
	                 |                             |
	 s(E_R,c?)-x(T_U,c?)-sent(T_D,sn[0])-s(R_L,c?)-t(U_L,c?,sn[0])
	                       |

Quantumgrad:
	            complex<(3)
	               |
	complex!(6)-dntn-complex(0)
	               |
	            -hiway-

start Quantumgrad
