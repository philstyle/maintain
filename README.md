# maintain
you gotta maintain

## Now for tracking food!

Since this is a generic task-tracking app that very rube-goldbergily tracks things that are listed in a folder, I figured why not use it to track the foods I eat.


## Installation
Will work most trivially on a Synology NAS
Toss the repo into /volume1/web and make sure your repo is set up to allow pushes from the user running nginx or whatever webserver you've got.
Navigate to your Synology IP/host and then /maintain to view the base folder of stuff. You'll want to clear out the files since I'm using them and you'll end up starting wherever I've left off.

**THIS SHOULD NOT BE ON THE OPEN INTERNET UNLESS YOU KNOW WHAT YOU ARE DOING**


### Notes

Base has common things
Folders have user-specific things

Viewing should be from a folder and should show all the things in the folder and NOT any parent folders

Common things have an extra column of 'who' based on options presented at submit-time

First row of each file defines frequency (#/week/month/year)
subsequent rows are 
seconds_since_epoch	(person)





date -r${TIME} "+%Y-%m-%d %H:%M:%S" #-> nice looking
