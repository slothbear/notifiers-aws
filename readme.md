## notifiers-aws

Amazon Web Services provides a great and mostly free platform for deploying
notification utilities.

This is a collection of notifiers written over the years. Most of them follow
this pattern:

1. Get information from some web API.
1. Reformat information for brevity.
1. Send notification via SMS.

## rondiro

A base framework for making a YMCA pool reservation 3 days in the future.
*This technique was abandoned because of timing. The reservation had to be
made within 1 second of the top of the hour – and I couldn't find an event
with that precision.*

The production version ran on a local system. A cron job woke up one minute
before the hour, then waited until exactly the hour to execute.

**rondiro** means lap in Esperanto. Like swimming laps.

## atenduloj

In [RSW Game](http://rswgame.com/en/welcome), turns
run on a weekly schedule *or* when all players have submitted orders.
Especially early in the game, the turns run pretty often. I also don't like
being the last person to submit orders. In later stages of the game, it can
help with scheduleing to know how many people have not yet submitted — an
approximation of how soon the turn might run.

atenduloj queries the RSW Game server and sends me a message with the number
of players the game is waiting on. That number may or may not include me, but
I didn't add logic for that. I know.

**atendulo** means waiting people in Esperanto.


