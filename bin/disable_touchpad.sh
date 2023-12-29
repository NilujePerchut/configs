#!/usr/bin/env bash

HYPRLAND_DEVICE="synps/2-synaptics-touchpad"
hyprctl keyword "device:${HYPRLAND_DEVICE}:enabled" false
