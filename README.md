# wxtj-server
Scripts and crontab for server recording WXTJ Student Radio, hosted on https://jacobysuh.com/wxtj

Server scripts are initialized usng crontab every 2 hours, between 8 am and 12 am. Recordings last 2 hours and are converted from .ogg to .mp3. Server is also updated using cron-apt every night at 4 am.

TODO:
- Add dist-update to nightly update cycle.
