#!/bin/bash

source $HOME/.pushoverrc

TITLE=$1
MESSAGE=$2
GROUP=g73bxd5djzepntr99bdzjrsqmiep7o

curl -s \
	--form-string "token=$PUSHOVER_API_TOKEN" \
	--form-string "user=$GROUP" \
	--form-string "message=$MESSAGE" \
	--form-string "title=$TITLE" \
	https://api.pushover.net/1/messages.json
