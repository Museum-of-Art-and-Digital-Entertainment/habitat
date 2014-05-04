			Description of width.incl.pl1

The include file 'width.incl.pl1' defines certain attributes of the Habitat
object imagery that is used to resolve collision detection and adjacency.
These attributes are represented by a series of constant (%replace)
declarations and array initilizations.  This file is generated automagically by
the 'muddle' utility when it creates the '.dat' files that go on the Commodore
64 disk.

It defines two constants:

MAX_CLASS_NUMBER is the highest class number present in the system.  This is so
that when we have arrays that are indexed by class number, we don't have to use
a full 256 element array, but can trim the size down a bit.  This is simply a
space optimization.

NUMBER_OF_IMAGES is the number of images stored on the C64 object disk, not
taking into account resource sharing between objects.  I.e., it is the sum of
the image count for each individual class.

The file then declares several initialized arrays.

There are several arrays with dimension (0:NUMBER_OF_IMAGES).  Each of these
arrays describes one attribute of the image of some style of some object.  To
compute the index into this array for a particular object, you use the
'image_base' array, which is dimensioned (0:MAX_CLASS_NUMBER):

declare image_base(0:MAX_CLASS_NUMBER) external static binary(15) init(...);

The values in this array are the offsets into the various attribute data arrays
for the various classes.  Adding the style of the object in question to this
offset provides the precise index into the attribute data array, i.e.,

	image_attribute_array(image_base(object.class) + object.style)

Note that for objects with no imagery, image_base(object.class) is zero.


There are six attribute arrays that we provide:

image_width

This is the width of the object, for purposes of collision detection.  Some
objects have a width of zero, even though they do have a visible width on the
screen.  A width of zero effectively means that these objects to not
participate in collision detection (they are typically small objects which we
presume Avatars to be able to step over).


image_flipOffset

This is the amount that the image moves to the right or left when it is mirror
reversed by having its orientation bit flipped.


image_x_left

This is the offset from the object's X position to the left edge of the object
(i.e., the location at which the avatar will stand if it walks to the object
from the left).


image_x_right

This is the offset from the object's X position to the right edge of the object
(i.e., the location at which the avatar will stand if it walks to the object
from the right).

Note that when and object's orientation is flipped, in addition to having the
image position offset by image_flipOffset the roles of image_x_left and
image_x_right are swapped.


image_y

This is the offset from the object's Y position to the bottom edge of the
object (i.e., the location at which the avatar will stand if it walks to the
object).  Note that the Y offset is the same for both right and left X
positions.


image_celWidth

This is the width of the image's graphic as displayed on the screen.


Several of these values interact with each other in complex ways.  Consult the
listing of the routines in 'width.pl1' for specific implementation details.
However, the following points are noteworthy:

For purposes of collision detection, an object is presumed to occupy an
infinitesimally thin plane located at its Y coordinate and spanning an X
coordinate range extending from the left side at

	object_left = object.x

if the object is not flipped in its orientation, or

	object_left = object.x + image_flipOffset(base)

if it is; and to the right side at

	object_right = object_left + image_width(base)

Unless, as we mentioned, image_width(base) is zero, in which case no collision
detection is performed on the object at all.  Note that when we perform
collision detection, the width of the Avatar is also taken into account.


Adjacency is computed using the cel width of the object.  Two adjacent
positions are computed, one on the right and one on the left.  In the case of
an object with normal orientation, they are:

	object_right = object.x + image_x_right(base)
	object_left = object.x + image_x_left(base)

If the orientation is flipped, they are:

	object_right = object.x - image_x_right(base) - image_celWidth(base)
	object_left = object.x - image_x_left(base) - image_celWidth(base)


One may wonder why adjancency is computed using different numbers from the
collision path.  The reason has to do with visual aesthetics.  Adjacency is
figured on the basis of what looks like the right place for the Avatar to stand
when standing next to the object.  Collisions are figured on the basis of what
looks bad when the Avatar walks *through* an object.
