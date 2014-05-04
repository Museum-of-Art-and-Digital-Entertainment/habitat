sheriff:
	sheriff_int
	    |
	sheriff_front
	    |

rant:
	rant_int
	   |
	-rant_front-
	   |

rents: (rent_front2,rent_front3)

rent:
	rent_int
	  |
	-rents*-
	  |

holy_walnut:
	holy_walnut_int
	    |
	-holy_walnut_front-
	    |


newstreet:
	sheriff
	  |
	rent>
	  |
	rent>
	  |
	rant>
	  |
	holy_walnut!

start newstreet
