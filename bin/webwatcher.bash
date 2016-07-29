#!/bin/bash
URL='http://www.nanamipaper.com/products/copy-of-seven-seas-writer-a5-journal-3rd-edition-1.html'
MATCH='CurrentlySoldOut'

curl -A "Script (lolindrath.com)" -s -o /tmp/webwatcher.tmp $URL
echo curl status: $?
grep -q "$MATCH" /tmp/webwatcher.tmp

if [ $? -ne 0 ]
then
  #echo sending message
  APP_TOKEN=o9ZYMuoqJ6j1ajMTQTZKG1xo3bMppa
  USER_KEY=uNVbPPjotVzhtSW4nPtPWWBr1qrCwy
  curl -s \
    --form "token=$APP_TOKEN" \
    --form "user=$USER_KEY" \
    --form "message=Seven Seas Writers are back in stock!!" \
    https://api.pushover.net/1/messages.json
else
  #echo no news
fi
