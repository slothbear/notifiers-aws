## notifiers-aws

Amazon Web Services provides a great and mostly free platform for deploying
notification utilities.

This is a collection of notifiers written over the years. Most of them follow
this pattern:

1. Get information from some web API.
1. Reformat information for brevity.
1. Send notification via SMS.


## loligo

**STATUS**: operational, last tested 9-April-2022

In the game [Personal Space](https://www.pnparcade.com/products/personal-space),
a player may trade resources at the Squid Exchange on the Commerce Moon.

Normally players scan a QR code that takes them to a web page displaying today's
rates, for instance: https://personalspace.buttonshy.com/?m=a76qafcz2ypz&a=qr75p135izuf

The resources that can be traded and their prices change each day. 
Instead of manually scanning the QR code each day, this
notifier sends today's rates from the Personal Space server via SMS.

sample message: 1๐ชฑ 2๐ 1๐ ๐5 ๐9 
> on day 9, fruit can be traded for ยค2, limited to 5 items.

**loligo** is Esperanto for squid. Via loligo, a genus of squid.


## atenduloj

**STATUS**: operational, last tested 9-April-2022

In [RSW Game](http://rswgame.com/en/welcome), turns
run on a weekly schedule *or* when all players have submitted orders.
Especially early in the game, the turns run pretty often. I also don't like
being the last person to submit orders. In later stages of the game, it can
help with scheduleing to know how many people have not yet submitted โ an
approximation of how soon the turn might run.

atenduloj queries the RSW Game server and sends me a message with the number
of players the game is waiting on. That number may or may not include me, but
I didn't add logic for that. I know.

**atendulo** means waiting people in Esperanto.


## rondiro

**STATUS**: obsolete, reservation system deactivated

A base framework for making a YMCA pool reservation 3 days in the future.
*This technique was abandoned because of timing. The reservation had to be
made within 1 second of the top of the hour โ and I couldn't find an event
with that precision.*

The production version ran on a local system. A cron job woke up one minute
before the hour, then waited until exactly the hour to execute.

**rondiro** means lap in Esperanto. Like swimming laps.

