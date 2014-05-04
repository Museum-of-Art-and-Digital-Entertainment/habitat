Explanation of the bug report form:

We'd like the players to fill out one or more of these every time they
playtest.  One form should be good for up to four bugs (you can just attach
more copies of the form for more bugs, of course).  The form should be
relatively self-explanatory.  The information at the top should be filled out
once per test session, and then the entries below used to describe bugs as
they are discovered.  "Region#" should be the number given by pointing at the
ground and pressing the HELP key.  The little box labelled "Repeatable?"
should be checked if the player is able to cause the problem to repeat at
will.

The section labelled "for official use only" will be used here to track the
bugs.

"Number" will simply be a serial number assigned to the bug, for future
reference.

"Type" is our categorization of the nature of the problem:
    repeat N -- repetition of bug #N
    user -- user error: the player simply made a mistake
    documentation -- the player made a mistake, but we should change the
	documentation to be more clear about what he should have done.
    design -- the player made a mistake, but what he did was reasonable and
	we should change the design or the user interface to match the
	players' expectations
    bug N -- bug, priority N.  Priorities range from 1 to 4:
	1 -- OH MY GHOD!  FIX IT NOW!!!
	2 -- Serious problem, fix ASAP
	3 -- Moderate problem, fix at first convenient opportunity
	4 -- Minor problem, fix when there's nothing more important to do

"Who" indicates who is responsible for taking care of this problem:
	a -- Aric
	c -- Chip
	j -- Janet
	r -- Randy
	? -- somebody else
If multiple people are listed, they should be in order of importance to the
task.

"Status" indicates the present status of the problem/fix:
	pend -- PENDing work
	work -- we're WORKing on it
	coded -- fix is CODED/written and ready to test
	test -- fix is installed on the TEST system and appears to be working
	release -- fix is RELEASEd on the production system for player testing
	done -- fix has passed user test on the production system.  It's DONE.
