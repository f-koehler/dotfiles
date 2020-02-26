#!/bin/bash

case "$(hostname)" in
    "zoq45")
        nice -n 19 polybar -r zoq45-left &
        nice -n 19 polybar -r zoq45-center &
        nice -n 19 polybar -r zoq45-right &
        ;;
    "landau")
        nice -n 19 polybar -r landau-primary &
        nice -n 19 polybar -r landau-secondary &
        ;;
    *)
        echo "No screen configuration for host \"$(hostname)\"."
        xrandr --auto
        ;;
esac
