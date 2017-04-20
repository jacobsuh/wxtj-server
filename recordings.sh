#!/bin/bash

NOW=$(date +"%b%e-%Y")

timeout -s SIGINT 122m /usr/bin/mplayer "http://streams.wtju.net:8000/wtjx-opus-256.ogg" -dumpstream -dumpfile "/var/www/html/wxtj-recordings/${1}/${2}/${NOW}RECORDINGLIVE.ogg" &
sleep 123m
/var/www/html/wxtj-recordings/scripts/ogg2mp3.sh "/var/www/html/wxtj-recordings/${1}/${2}/${NOW}RECORDINGLIVE.ogg" "/var/www/html/wxtj-recordings/${1}/${2}/${NOW}.mp3"
rm "/var/www/html/wxtj-recordings/${1}/${2}/${NOW}RECORDINGLIVE.ogg"
