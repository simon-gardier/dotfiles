#!/bin/bash

# Get the default sink
default_sink=$(pactl get-default-sink)

# List sinks and highlight the default one
case "$1" in
    "next")
        # Get list of sinks
        sinks=($(pactl list short sinks | awk '{print $2}'))
        current_index=$(printf "%s\n" "${sinks[@]}" | grep -nx "$default_sink" | cut -d: -f1)
        next_index=$(( (current_index % ${#sinks[@]}) ))
        pactl set-default-sink "${sinks[$next_index]}"
        ;;
    *)
        # Show default sink name for Waybar
        description=$(pactl list sinks | grep -A20 "Name: $default_sink" | grep "Description:" | sed 's/.*Description: //')
        echo "<span color='#5b84d1'>ON</span> $description"
        ;;
esac
