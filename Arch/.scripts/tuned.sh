#!/bin/bash

PROFILE=$(tuned-adm active | awk -F': ' '{print $2}')
# Map profiles to icons
case "$PROFILE" in
    default)
        ICON="⚡"  # generic power
        ;;
    balanced-battery)
        ICON="🔋"  # battery
        ;;
    laptop-ac-powersave)
        ICON="💧"  # leaf / eco
        ;;
    accelerator-performance)
        ICON=""  # speedometer
        ;;
    *)
        ICON="?"  # unknown profile
        ;;
esac

echo "{\"text\": \"<span color='#5b84d1'>PROF</span> $ICON\", \"tooltip\": \"Profile: $PROFILE\"}"

