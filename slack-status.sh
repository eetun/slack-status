#!/bin/bash

slack_name=$1
api_key=$2
network_name=$(iwgetid -r)

case $network_name in
    "Network")
        text="At the office"
        emoji="factory"
        ;;
    "Another network")
        text="At the another office"
        emoji="love_hotel"
        ;;
    *)
        text="Working remotely"
        emoji="house_with_garden"
        ;;
esac

curl -X POST \
    https://$slack_name.slack.com/api/users.profile.set \
    -H "Authorization: Bearer $api_key" \
    -H 'Content-Type: application/json;  charset=utf-8' \
    -d '{
        "profile": {
            "status_text": "'"$text"'",
            "status_emoji": ":'$emoji':",
            "status_expiration": 0
        }
}'
