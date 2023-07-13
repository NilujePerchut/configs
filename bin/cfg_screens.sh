#!/usr/bin/env bash
if [ "$HOSTNAME" == osdemammouth ]; then
	# Set refresh rate at 144 hertz
	xrandr --output DisplayPort-0 --primary --mode 1920x1080 --pos 1920x0 --rotate normal --rate 144.00 --output DisplayPort-1 --off --output DisplayPort-2 --mode 1920x1080 --pos 0x0 --rotate normal --rate 144.00 --output HDMI-A-0 --off
fi
