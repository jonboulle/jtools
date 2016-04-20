#!/bin/bash

# Set these to your outputs
INT=eDP1
#EXT=HDMI-0

XRANDR=$(xrandr)
if [[ -z $XRANDR ]]; then
    echo "Error; is \`xrandr' installed?"
    exit 1
fi

EXT=$(xrandr | awk '/ connected/ {print $1}' | fgrep -v "$INT")

# no external displays
if [[ -z "$EXT" ]]; then
    exit 1
fi

get_state() {
    local output=$1
    local state=$(echo "$XRANDR" | egrep ^$output)

    if [[ $state =~ [0-9]+x[0-9]+ ]]; then
        echo on
    else
        echo off
    fi
}

INT_STATE=$(get_state $INT)
EXT_STATE=$(get_state $EXT)

# Suspend i3 - see https://github.com/i3/i3/issues/926
killall -SIGSTOP i3

if [[ $INT_STATE = "on" && $EXT_STATE = "off" ]]; then
    # Switch to mirror
    xrandr --output $INT --auto --output $EXT --auto
elif [[ $INT_STATE = "on" && $EXT_STATE = "on" ]]; then
    # Switch to external only
    xrandr --output $INT --off --output $EXT --auto --primary

else 
    # Switch to internal only
    xrandr --output $INT --primary --auto --output $EXT --off
fi

# Resume i3
killall -SIGCONT i3

i3-msg restart
