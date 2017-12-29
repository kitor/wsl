#!/bin/bash
# DESC:  Move Tilda window to primary screen after resolution change
#        Script needs to be called with proper parameteres from AHK
#        script on WM_DISPLAYCHANGE message
#
# USAGE: tilda.sh x y monitor_width monitor_height
#
# NOTE:  From my experience, both with Randr enabled and disabled in
#        vcXsrv, all monitors are detected on Linux side as a single
#        ig display (like +Xinerama). Thus 0,0 is coordinate of top-
#        -left corner of rectangle escibed on all monitors (not 0,0
#        of leftmost monitor, it can lay outside visible area!)
#        What's funny about Tilda is that it won't store width and
#        height in percent in config file, only pixel values. This
#        means that I had to store and count this in AHK (which is
#        aware of real display locations and resolutions).

# xdotool seems to list main tilda window as the last one, at least
# until settings window is open. But this situation (+res change)
# is too rare to care about.
WINDOW_ID=$(xdotool search --pid $(pgrep tilda) | tail -n 1)

# move window to correct position
xdotool windowmove $WINDOW_ID $1 $2
# resize it to fit the screen
xdotool windowsize $WINDOW_ID $3 $4
# update config file with new values
# TODO: put some sed's here
