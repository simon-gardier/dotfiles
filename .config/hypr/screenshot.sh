#!/bin/bash

# Take a screenshot of a selected region
grim -g "$(slurp)" /tmp/screenshot.png

# Open the screenshot in swappy for editing
swappy -f /tmp/screenshot.png
