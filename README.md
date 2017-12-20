# WXTJ Server
Scripts and crontab for the server recording shows from [WXTJ Student Radio](https://www.facebook.com/WXTJRADIO/), currently hosted on my [personal website](https://jacobysuh.com/wxtj).

Server scripts are initialized usng crontab every 2 hours, between 8 am and 12 am. Recordings last 2 hours and are converted from .ogg to .mp3. Server is also updated using cron-apt every night at 4 am.

## Crontab
All the crontasks are listed within cron-backup.txt. The syntax for each line provides two parameters and is expressed as such:
```
[minute] [hour] [day of the month] [month] [day of week] [script to be executed] [parameter 1] [parameter 2]
```
Currently, each cron task is set to start 1 second before each 2 hour slot. The [day of the month] and [month] parameters are asterisks, so that they are run no matter the value. The [day of week] parameter is set so that these scripts run for their proper day. The [script] being called is recordings.sh and is followed by two additional parameters, the day of the week and the time slot, e.g. Sunday "AM 00" which corresponds to the Sunday 12 AM slot (which could be seen as the Saturday late night slot). 

## The Scripts
### recordings.sh

This is the main script responsible for recording each slot. Using mplayer, the script records the provided stream (.ogg stream in this case) for 122 minutes and dumps it into the corresponding folder referenced by the 2 parameters in the crontab. They are seen as such, where ${1} references the first parameter given (Name of the day of the week folder) and ${2} references the second parameter (Name of the time slot folder):
```
/var/www/html/wxtj-recordings/${1}/${2}/${NOW}RECORDINGLIVE.ogg
```
NOTE: All the folder names MUST be created prior to running the scripts. Each day and all the time slot folders within each day folders should be available so that recordings.sh can find it. It will not create it's own directories if it is not there and will error out.

The NOW variable is simply the date and time of the recording. While a show is being recorded, "RECORDINGLIVE" is appended to the filename to hopefully prevent people from trying to download it.

The next script, ogg2mp3.sh, is called 123 minutes after the first script is called. The converted file is just named the NOW variable. After the recording is converted, the .ogg file is then deleted.

### ogg2mp3.sh
Pretty straightforward. It uses ffmpeg to convert the .ogg files to a more easily readable .mp3 file.

## TODO:
- Add dist-update to nightly update cycle.
