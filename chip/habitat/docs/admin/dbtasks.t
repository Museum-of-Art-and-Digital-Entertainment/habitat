As we discussed, here is a list of the pending database tasks yet to be done
for MicroCosm:

1) Modify object creation routine so that caller supplies object number,
rather than having the routine generate it itself.

2) Modify class disk load routine so that images are loaded separately, on
demand according to graphic style, rather than being loaded automatically with
the rest of the class information.

3) Modify disk load routines to load several classes at once in order to
optimize disk head movement.

4) Add run-time memory free-space compaction (garbage collection of unused
objects).

5) Add hooks for multiple class/image/action/sound files based on region
terrain type.

6) Add capability for disk update (to install new or revised classes, imagery,
and so on) and disk space compaction.

#1, #2 and #3 are essential for the April 15 delivery.  The rest will be
needed by Beta test time (possibly #6 can wait until final release, but update
capability during Beta test would be desirable).

I spoke with Ron, and he said #1, #2 and #3 are (all together) only a couple
of days' work, so he is going to polish them off first thing next week in
order to get them out of the way.  The remainder we will have to work out
accomodations for depending on his workload on Maniac Mansion.
