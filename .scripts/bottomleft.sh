#!/bin/bash

# This script move the selected window to the bottom left of the screen.

current=$(xdotool getwindowfocus)

# The window will take up no more than a third of
# the width or height of the screen.
newwidth=$(($(xdotool getdisplaygeometry | awk '{print $2}') / 3))
newheight=$(($(xdotool getdisplaygeometry | awk '{print $1}') / 3))

xdotool windowsize $(xdotool getwindowfocus) $newheight $newwidth

newsize=$(xdotool getwindowgeometry $(xdotool getwindowfocus) | grep Geometry | sed -e 's/x/ /g' | awk '{print $3}')

height=$(($(xdotool getdisplaygeometry | awk '{print $2}') - newsize))
xdotool windowmove $current 0 $height