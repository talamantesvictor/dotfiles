#!/bin/bash
GEOM=$(slurp -d) && grim -g "$GEOM" - | wl-copy && notify-send -a "Screenshot" "Screenshot" "Copied to clipboard"
