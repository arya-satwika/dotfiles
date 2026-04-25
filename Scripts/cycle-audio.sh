#!/usr/bin/env bash

ALL_SINKS=$(pactl list short sinks | cut -f 2)
FIRST=""
NEXT=0
NEW_SINK=""
CUR_SINK=$(pactl info | grep 'Default Sink' | cut -d: -f2 | xargs)

for SINK in $ALL_SINKS; do
    [[ "$SINK" == *_aloop* ]] && continue

    [ -z "$FIRST" ] && FIRST="$SINK"
    if [ "$SINK" = "$CUR_SINK" ]; then
        NEXT=1
    elif [ "$NEXT" = "1" ]; then
        NEW_SINK="$SINK"
        break
    fi
done

[ -z "$NEW_SINK" ] && NEW_SINK="$FIRST"

pactl set-default-sink "$NEW_SINK"

for INPUT in $(pactl list sink-inputs short | cut -f 1); do
    pactl move-sink-input "$INPUT" "$NEW_SINK"
done

# Get the human-readable description
DESCRIPTION=$(pactl list sinks | awk "/Name: $NEW_SINK/{found=1} found && /Description:/{print; exit}" | cut -d: -f2- | xargs)

# notify-send -i audio-headphones-symbolic "Audio Output" "$DESCRIPTION"
qs -c noctalia-shell ipc call toast send "{\"title\": \"Audio Output\", \"body\": \"$DESCRIPTION\", \"icon\": \"headphones\", \"duration\": \"800\"}"