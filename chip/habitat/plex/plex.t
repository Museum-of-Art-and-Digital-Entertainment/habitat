			A Whirlwind Plex Tutorial

Plex is a utility for layout of Habitat realms.  It allows you to specify the
pattern of groups of regions using a sort of two-dimensional programming
language.  The input to Plex is a specification in the Plex language.  The
output is a Griddle indirect-mode control file from which Griddle can compose
a multi-region data file suitable for transmission to the host and input to
the database using Ghu's 'cook' command.

The Plex command takes the form

	plex inputfile > indirfile

There are no command line options other than a number of debugging hooks which
are not relevent to regular use.

Plex input consists of BNF-like "productions".  Each production is a little
map, drawn with ASCII characters.  The map consists of regions, represented by
symbolic identifiers, and the connections between them, represented by "-" and
"|" characters used to draw lines.  Each production has a label that is used
to refer to it in other productions.  Use of Plex is perhaps best illustrated
by example.  We will start with a simple example and introduce the various
features of Plex by successive embellishments to it.  Consider the following
Plex input:

street:
	 house house house
	   |     |     |
	-road--road--road-end

neighborhood:
	  |
	hiway-street
	  |
	hiway-street
	  |
	hiway-street
	  |

village:
	end
	 |
	neighborhood
	 |
	end

This example defines a (probably unrealistic) design for a small village.  The
entire village is represented by the 'village' production.  'village' consists
of a 'neighborhood' connected up and down to 'end' regions.  A 'neighborhood'
in turn consists of connected line of 'hiway' regions, each of which adjoins a
'street'.  A 'street' is a line of 'road' regions, each of which is connected
to a 'house' region, with an 'end' region on the end.

From this the basic form of Plex input is fairly clear: you have a bunch of
things, represented by symbolic names, connected by lines drawn with "-" and
"|" characters.  "Unconnected" lines ("-" or "|" characters without symbolic
names at both ends) represent external "connection points" for the production.

The names represent either regions or clumps of regions.  The basic rule is
that a name is assumed to be a region name if it is not one of the production
labels in the input file.  If it is one of the production labels, the name is,
in effect, "expanded" to the collection of regions represented by the named
production.

Region names are used in generating the output.  The regions in the output
file are tagged with these names, which are converted (by Griddle) into
Griddle region file names by appending ".gri" to the name given.

The mechanism so far described is not quite adequate to the job of allowing
you to specify arbitrary collections of regions as conveniently as might be
desired, so there are a number of additional features that add to the power
but also the complexity of the system.

A region or production name, when used, may be followed by one or more
operator symbols which modify the way the region or production is interpreted.
The simplest of these are the "rotation operators".  Following a region or
production name by one of the rotation operators causes the orientation of the
region or collection of regions to be rotated with respect to that of the
production from which it is used.  The nature of the rotation depends on which
of the three operators is used:

	<	90-degrees counter-clockwise
	!	180-degrees
	>	90-degrees clockwise

These are postfix operators -- they follow the name that they modify.  For
example, our definition of a street, above, is not quite right, since the
interiors of houses typically have an orientation that is opposite that of the
street out front.  Here is a slightly improved version:

street:
	 house! house! house!
	   |      |      |
	-road---road---road--end

Here, the 'house' regions are rotated 180-degrees with respect to the 'road'
regions.  Now let's try a slightly fancier case.  Let's say you want to have a
residential area with streets that "fan out" in a tree-like pattern, like
this:

neighborhood:
		           house
			     |
		    house-culdesac-house
			     |
	       house	     |	     house
		 |	     |	       |
	house-culdesac-intersection-culdesac-house
		 |	     |	       |
	       house	     |	     house

but the orientations aren't quite right, because you'd like each house to face
onto its adjoining culdesac, and each culdesac to face onto the intersection
in the same way.  Adding rotation operators can accomplish this:

neighborhood:
		            house!
			      |
		    house<-culdesac-house>
			      |
	        house!	      |	     house!
		  |	      |	        |
	house>-culdesac<-intersection-culdesac>-house<
		  |	      |	        |
	        house	      |	      house

this, however, is still a little awkward, since the rotations are not entirely
obvious, being idiosyncratic for each cluster of houses.  The following is
much cleaner:

cluster:
		house!
		  |
	house<-culdesac-house>
		  |

neighborhood:
		   cluster
		      |
	cluster<-intersection-cluster>
		      |

we could then define a (rather different) 'village' as simply:

village:
	neighborhood
	     |
	neighborhood!

Another problem that crops up in the layout of towns and such is that you
often have a very regular structure but want the components of the structure
to vary somewhat.  Plex provides a number of means of accomplishing this.  The
first we will explain is "set selection".  The idea is that you can have a
collection of regions all of a given type and then select among them, either
systematically or randomly, using operators.  Let's say, for example, that you
had a variety of different house designs.  You could define a set of houses
with a "set production" of the form:

house: (house0, house1, house2, house3, house4, house5,
	house6, house7, house8, house9, house10, house11)

This says that 'house', instead of referring to a single region definition,
refers to the collection of 12 different house regions named.  When you refer
to 'house', you follow it with one of the "set selection operators":

	?	- for random selection
	*	- for periodic selection

Here, then, is a somewhat fancier definition of 'street':

street:
	 house?! house?! house?!
	   |       |       |
	-road----road----road---end

As Plex is processing this, each time it sees 'house' it substitutes a random
element from the 'house' set defined above.  This way, even though each
reference to 'street' results in a street of the same form, the houses on each
street vary.  If instead of the '?' random selection operator we had used the
'*' periodic selection operator, references to 'house' would have been
replaced in sequence with 'house0', 'house1', 'house2' and so on (after
'house11' it starts over again with 'house0').

The final and most complicated embellishment to Plex is called "parameter
substitution".  Parameter substitution is designed to handle modifications and
customizations that need to be reflected in the content of the regions
themselves.

For example, let's say you want to have each house to have a unique street
number on a sign out front.  It's easy enough to design the 'road' region to
have a street-number sign in it, but how do you get a different number onto
the sign in each invocation of 'road'?  Here is how we do this.  Consider the
following further elaboration of 'street':

street:
	 house?!    house?!    house?!
	    |          |          |
	-road(1)----road(2)----road(3)---end

the number in parentheses after each reference to 'road' is a "parameter".  It
is placed on the output file line corresponding to that use of the 'road'
region.  Griddle, when it processes the Plex output file, will substitute this
parameter for the string "`1" in the 'road.gri' file when it reads it.  It is
possible to have more than one parameter, e.g.:

street:
	     house?!          house?!          house?!
	        |                |                |
	-road(1,"Fred")----road(2,"Bob")----road(3,"Joe")---end

here we add a name to go with the street number.  This second parameter will
be substituted for "`2".  Successive parameters will be substituted for "`3",
"`4", and so on.  (By the way, note how the "|" lines connect in this example:
any part of the region name reference, including trailing operators and
parameters, may be connected to.)  Parameters may be placed on any region
name.  The only restriction is that they must come AFTER any operators.
Parameters may be either integer numbers or strings.

This example, however, makes the 'street' production no longer suitable for
general use, since the street numbers are "hardwired" into the design.
Fortunately, you can use parameter substitution on productions as well as on
regions.  Here is a more general street numbering example:


street:
	  house?!       house?!       house?!
	     |             |             |
	-road($1+1)----road($1+2)----road($1+3)---end

this example introduces two new complications: parameter references and
expressions.  Here the street number is expressed as the sum of an integer and
the mysterious term "$1".  "$1" refers to the first parameter to 'street',
just as "`1" will refer to the first parameter to 'road' in the 'road.gri'
file.  Similarly, "$2" would refer to the second parameter, "$3" to the third,
and so on.  'street' would be used in production like this:

neighborhood:
	  |
	hiway-street(0)
	  |
	hiway-street(3)
	  |
	hiway-street(6)
	  |

the first reference to 'street' would result in 'road's with numbers 1, 2, and
3, the second would number the 'road's 4, 5, and 6, and so on.

The arithmetic we perform on the parameters is quite general.  You can use
addition ("+"), subtraction ("-"), multiplication ("*") and division ("/").
During expression evaluation, multiplication and division take precedence over
addition and subtraction, just as they should, but you can override the order
of evaluation with parentheses.

Let's go back to our previous example that had names in addition to street
numbers.  How can we handle this case in a general fashion?  We use another
Plex construct!  Plex allows you to declare "arrays" of values, much as you
declare sets.  For example:

names: [ "Fred", "Bob", "Joe", "Sid", "Bud", "Bert", "Jack", "Chuck", ... ]

declares an array called 'names' containing the strings listed.  Note that
array declarations are similar to set declarations, except that arrays delimit
the elements with "[" and "]", while sets use "(" and ")".  The elements of
arrays may be numbers, strings or expressions.  The elements are indexed as in
many programming languages, by and expression of the form

	arrayname[index]

where 'arrayname' is the name of the array and 'index' is an integer
expression that selects the element of interest.  By the way, Plex arrays are
zero-based.  Given the above declaration of 'names', we can add names to our
'street' with:

street:
	      house?!              house?!                house?!
	         |                    |                      |
       -road($1+1,names[$1])-road($1+2,names[$1+1])-road($1+3,names[$1]+2)-end

Note that productions can get rather hairy and complicated quite easily.  This
is one of the acknowledged weaknesses of Plex.

Here are a few more details:

You can select a random element of an array by using the '?' operator on the
array name, e.g.:

	road($1+1,names?)

However, since such random selection is not guarenteed not to repeat, Plex
also allows you to shuffle the elements of the array before accessing them
by indexing.  You do this by placing the statement

	shuffle arrayname

in a "production preamble".  A production preamble is a series of optional
statements contained inside braces ("{" and "}") that is inserted between the
production label and the production itself.  For example:

neighborhood:
{ shuffle names }
	  |
	hiway-street(0)
	  |
	hiway-street(3)
	  |
	hiway-street(6)
	  |

Right now the only statement allowed in the preamble is a 'shuffle' statement,
but the hooks are there so we can add additional statement types should they
be needed.

You can define symbolic constants using a "name statement".  A name statement
has the form:

	name = expression

for example

	foobar = 47

would define the name 'foobar' to be the value 47.  Such a name can be used
anywhere in an expression that a literal string or integer would be used.

You can include additional files (containing, for example, standard array, set
and name declarations) using the "include statement":

	include "filename"

for example

	include "mydefs.plx"

would read the file "mydefs.plx".

With each production is associated a counter.  This counter starts out at zero
and is incremented each time the production is called.  You can reference a
production's counter value in a parameter expression using the special symbol
"."  This is a sometimes useful global indicator that keeps you from having to
know too much about the details of a production.  For example, our street
might better be defined as:

street:
	  house?!     house?!     house?!
	     |           |           |
       -road(.*3+1)-road(.*3+2)-road(.*3+3)-end

Each time 'street' is used, "." is set to the value of 'street's use counter.
This way, productions which refer to 'street' do not need to know that it
contains 3 houses, as the 'neighborhood' example above assumed.  We are then
free to change 'street', say to have 4 houses, without worrying about having
to change the parameters wherever it is called.

We noted previously that the operators and parameters associated with a region
or production name are part of the "body" that the line characters "-" and "|"
may connect to.  Sometimes this is not enough, however.  For example,
consider:

plaza:
	    |       |       |
	-plazaNW-plazaNN-plazaNE-
	    |       |       |
	-plazaWW-plazaCC-plazaEE-
	    |       |       |
	-plazaSW-plazaSS-plazaSE-
	    |       |       |

How would you indicate the east-west connections when you use this production,
since it has three connections on each side but a name is only 1 character
high?  The answer is that Plex allows you to surround a name with the filler
character "#" to expand it to whatever size, both vertically and horizontally,
is needed.  Thus you might use 'plaza' like this:

	     shop shop shop
	      |    |    |
	shop-##############-shop
	     ##############
	shop-####plaza#####-shop
	     ##############
	shop-##############-shop
	      |    |    |
	     shop shop shop

That's everything in Plex.  Of course, this description doesn't tell you all
the practical things that you only learn by doing.  To supplement this
document, you should also examine the various real Plex files we have created,
in order to see how it is actually used.
