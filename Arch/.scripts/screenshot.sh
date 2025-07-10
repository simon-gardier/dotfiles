#!/bin/bash

# Checking and installing dependencies
dependencies=("hyprshot" "swappy")
for dep in "${dependencies[@]}"; do
    command -v "$dep" &> /dev/null || { echo "$dep not found, please install it."; exit 1; }
done

# Capture screenshot
screenshot="$(hyprshot -m region --clipboard-only)"

# Paste to clipboard and use swappy for further processing
wl-paste | swappy -f -
