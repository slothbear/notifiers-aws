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

**rondiro**: Esperanto for lap. Like swimming laps.

