/*
	stores.p the businesses used in habitat cities

	std arguments:
		$1 = road state
		$2 = wildcard color/pattern
*/

abank:	/* bobs u bank master */
	   |
	-bobsbank($1,$2,"All\00Night\00ATM")-
	   |

bbank:	/* bobs u bank master */
	   |
	-bobsbank($1,$2,"Bob's\00U\00Bank")-
	   |

cbank:	/* broadway bank master */
	   |
	-bwaybank($1,$2,"Corner","\00B\00a\00n\00k")-
	   |

tbank:	/* broadway bank master */
	   |
	-bwaybank($1,$2,"Tarken's","T\00o\00k\00e\00\00)-
	   |

bank:(cbank,bbank,tbank,abank)

bar1:	/* tivillois */

	tivollis_interior($2)
	   |
	-tivollis($1,$2,"Tivolli's Garden")-
	   |

bar2:	/* Kellys */

	kellys_interior($2)-kellys_backroom($2)
	   |
	-kellys($1,$2,"Kellys Bar & Grill")-
	   |

bar3:	/* Hamlets */

	hamlets_interior($2)
	   |
	-hamlets($1,$2,"\00Hamlets\00Place")-
	   |

nightclub: /* Costellos */

	costellos_interior($2)
	   |
	-costellos($1,$2)-
	   |

bar4: /* Maryannes */

	tivollis_interior($2)
	   |
	-tivollis($1,$2,"\00MaryAnne's Place")-
	   |

bar5: /*The Hangout*/

	hamlets_interior($2)
	   |
	-hamlets($1,$2,"The\00Hangout")-
	   |

bar6: /*The 8 ball*/

	kellys_interior($2)-kellys_backroom($2)
	   |
	-kellys($1,$2,"The /00 8/00 Ball")-
	   |


bar: (bar1,bar2,bar3,nightclub,bar4,bar5,bar6)

hottub1:

	tub_left($2)-tub_lobby($2)-tub_right($2)
	                   |
	      -suzys($1,$2,"Suzy's Hot Tubs")-
	                   |

hottub2:

	tub_left($2)-tub_lobby($2)-tub_right($2)
	                   |
	      -suzys($1,$2,"The Big SPLASH!")-
	                   |

hottub: (hottub1, hottub2)

chess:
	chess_board chess_board chess_board chess_board chess_board
	     |           |           |           |           |
	-five_doors($1,"/00#1  #2  #3  #4  #5",$2)##############-
	 |

checkers:
	check_board check_board check_board check_board check_board
	     |           |           |           |           |
	-five_doors($1,"/00#1  #2  #3  #4  #5",$2)##############-
	 |

backgammon:
	backg_board backg_board backg_board backg_board backg_board
	     |           |           |           |           |
	-five_doors($1,"/00#1  #2  #3  #4  #5",$2)##############-
	 |

arcade:
	                     checkers($2,"EXIT V")
	                          |
	chess($2,"EXIT ->")-arcade_lobby($2)-backgammon($2,"<- EXIT")
	                          |
	                    -arcade_front($1,$2)-
	                          |


cityhall:

	cityhall_interior($2)
	   |
	-cityhall_front($1,$2)-
	   |

meetinghall:

	meetinghall_interior($2)
	   |
	-meetinghall_front($1,$2)-
	   |

hallofrecs:

	hallofrecs_interior($2)
	   |
	-hallofrecs_front($1,$2)-
	   |

library:

	library_interior($2)
	   |
	-library_front($1,$2)-
	   |

stockmarket:

	stockmarket_interior($2)
	   |
	-stockmarket_front($1,$2)-
	   |

gameshow:

	gameshow_interior($2)
	   |
	-gameshow_front($1,$2)-
	   |

theatre:

	talk_show($2)-theatre_lobby($2)-stage($2)
	                     |
	             -theatre_front($1,$2)-
	                     |


gstore_interior: (usefull,funny,custom,adventure,grabbag)

generalstore1:

	gstore_interior?($2)
	   |
	-generalstore_front($1,$2,"\00General")-
	   |

generalstore2:

	gstore_interior?($2)
	   |
	-generalstore_front($1,$2,"\00 5 & 10")-
	   |

generalstore: (generalstore1,generalstore2)

magic_shop:

	 machutas_interior($2)
	   |
	-machutas($1,$2)-
	   |

emporium:

	ymporuim_interior($2)
	   |
	-ymporium_front($1,$2)-
	   |

newyou:

	newyou_interior($2)-newyou_backroom($2)
	   |
	-newyou_front($1,$2)-
	   |

bodypaint:

	bodypaint_interior($2)
	   |
	-bodypaint_front($1,$2)-
	   |

knicknacks:
	kerris_interior($2)
	   |
	-kerris_front($1,$2)-
	   |

court:

	courtroom($2)
	   |
	court_lobby
	   |
	-hallofjustice($1,$2)-
	   |

church1:

	church_interior($2)
	   |
	-church_front($1,$2,"The Living Oracle")-
	   |

church2:

	church_interior($2)
	   |
	-church_front($1,$2,"The Living God")-
	   |

church: (church1, church2)

empty1:
	empty_interior($2)
	   |
	-forrent1($1,$2)-
	   |

empty2:

	empty_interior($2)
	   |
	-forrent2($1,$2)-
	   |

empty3:

	empty_interior($2)
	   |
	-forrent3($1,$2)-
	   |

empty4:

	empty_interior($2)
	   |
	-forrent4($1,$2)-
	   |

empty5:

	empty_interior($2)
	   |
	-forrent5($1,$2)-
	   |

empty: (empty1,empty2,empty3,empty4,empty5)
