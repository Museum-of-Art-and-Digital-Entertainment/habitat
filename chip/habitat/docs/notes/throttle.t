		What's this "throttle" thing?

The throttle is a mechanism to limit the amount of message traffic that each
Commodore is receiving from the host.  The idea is that a user's Commodore can
get swamped by the messages from the other players in his region if there is
simultaneously 1) any event that requires large amounts of message
retransmission (notably line noise and region transitions, but also includes
extraction of items from containers) and 2) a lot of activity going on in the
region.  Ideally, we would like the host to know to stop sending things when
the Commodore isn't ready, but there currently is no way to do this.  Instead,
we limit the number of requests that users can send to the host in the first
place.  We do this by making the C64 command interface require a minimum delay
of D jiffies between commands.

The tricky part is figuring out what the delay should be.  The simplest thing
would be to simply pick an arbitrary constant, say 10 seconds.  There are two
problems with this: first, in most circumstances this is too long a time and
simply results in irritation to the user; second, in some circumstances it
isn't long enough and thus doesn't fix the problem that it was put in to
solve.  What we want to do is compute D on the basis of the amount of message
traffic that we expect to be receiving during the next few seconds.  There is
no way to predict this, of course, but we can still build an adaptive feedback
system that balances itself according to the load.

The general mechanism for the throttle:

We maintain both long-term and short-term floating averages of the message
volume received.  If the short-term average is larger than the long-term
average, we conclude that message traffic is increasing and increase the delay
time D.  If the opposite is the case, we reduce D (down to a minimum of 0, of
course!).  This system has negative feedback in that a large delay will
substantially reduce the number of requests going to the host and eventually
reduce the volume of traffic being received by the Commodores.  Similarly, a
sudden increase in activity by the players will result in more messages to
the, and therefore more messages to the Commodores and therefore increase the
delay time.

An important point to note is that the delay is counted from the time a
command is issued and includes any host response time within it.  Since heavy
load means a longer host response time anyway, the action of the throttle
mechanism is masked most of the time.  When the system is lightly loaded or if
you are the only player in a region, the delay will tend to hover around 0 and
will not be apparent.

The specific details of our implementation of this mechanism:

We keep 32 counts, one for each of the past 32 seconds, of the number of
message bytes received from the host.  Each second, the average of the 32
1-second samples is compared to the average of the most recent 4 1-second
samples.  If the 4-second average is greater than the 32-second average, the
delay is increased by 1/2 second (30 jiffies); if it is less, the delay is
correspondingly decreased.

We can therefore tune the mechanism by adjusting these parameters:
   sample duration -- currently 1 second (60 jiffies)
   long-term sample count -- currently 32 (we will probably change this to 64)
   short-term sample count -- currently 4
   delay increment -- currently 1/2 second (30 jiffies)
   delay decrement -- currently 1/2 second (30 jiffies)

Note that the delay increment and decrement values are separate, so we can
make the delay grow faster than it shrinks (or vice-versa).  With these
parameters, the maximum throttle delay is 16 seconds.
