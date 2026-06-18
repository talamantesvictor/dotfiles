#!/bin/bash
DIR="$HOME/Pictures/Screenshots"
mkdir -p "$DIR"
FILE="$DIR/$(date +%Y-%m-%d_%H-%M-%S).png"
grim "$FILE" && wl-copy < "$FILE" && notify-send -a "Screenshot" -i "$FILE" "Screenshot saved" "$FILE"
