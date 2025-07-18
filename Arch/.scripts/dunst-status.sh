#!/bin/bash

if dunstctl is-paused | grep -q true; then
    echo '{"text": "🔕", "class": "paused"}'
else
    echo '{"text": "🔔", "class": "active"}'
fi
