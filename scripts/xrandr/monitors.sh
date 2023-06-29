#!/bin/bash

EXTERNAL="DP-3"
INTERNAL="eDP-1"

internal_monitor_only() {
  xrandr --output $EXTERNAL --off
}

extend_to_external_monitor() {
  xrandr --output $EXTERNAL --auto --above $INTERNAL
}

extend_to_external_monitor

