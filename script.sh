#!/bin/bash

DIR="./$(dirname -- "$0")/out"

OLD="${DIR}/old"
NEW="${DIR}/new"

mkdir -p $DIR;

curl -sNb "session=${SESSION}" \
    https://adventofcode.com/2023/leaderboard/private/view/${LEADERBOARD}.json | \
    jq -r '.members[] | "\(.local_score) \(.name) (\(.stars)⭐)"' | sort -rn > $NEW

[ ! -f "$OLD" ] && touch "$OLD"

DIFF=$(diff $OLD $NEW)
if [ "$DIFF" != "" ]
then
    printf "Leaderboard updated:\n\n" | \
    cat - $NEW | \
    signal-cli send --message-from-stdin -g $RECIPIENT --text-style "0:20:BOLD"
else
    echo "Nothing changed"
fi

mv $NEW $OLD
