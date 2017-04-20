#!/bin/sh
ffmpeg -i "${1}" -codec:a libmp3lame -qscale:a 0 "${2}"