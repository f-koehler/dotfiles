#!/bin/bash
set -euf -o pipefail

case "$(hostname)" in
    "zoq45")
        xrandr --output VIRTUAL1 --off --output DP3 --off --output DP2 --mode 1920x1200 --pos 3120x0 --rotate left --output DP1 --mode 1920x1200 --pos 0x0 --rotate left --output HDMI3 --off --output HDMI2 --off --output HDMI1 --primary --mode 1920x1200 --pos 1200x536 --rotate normal
        ;;
    *)
        echo "No screen configuration for host \"$(hostname)\"."
        xrandr --auto
        ;;
esac
