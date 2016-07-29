#!/bin/bash

TOKEN=o9ZYMuoqJ6j1ajMTQTZKG1xo3bMppa

TITLE=$1
MESSAGE=$2
GROUP=g73bxd5djzepntr99bdzjrsqmiep7o

curl -s \
	--form-string "token=$TOKEN" \
	--form-string "user=$GROUP" \
	--form-string "message=$MESSAGE" \
	--form-string "title=$TITLE" \
	https://api.pushover.net/1/messages.json
