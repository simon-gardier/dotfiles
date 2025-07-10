#!/bin/bash

PROFILES=("default" "balanced-battery" "laptop-ac-powersave" "accelerator-performance")

CURRENT_PROFILE=$(tuned-adm active | awk -F': ' '{print $2}')

for i in "${!PROFILES[@]}"; do
    if [[ "${PROFILES[$i]}" == "$CURRENT_PROFILE" ]]; then
        CURRENT_INDEX=$i
        break
    fi
done

NEXT_INDEX=$(( (CURRENT_INDEX + 1) % ${#PROFILES[@]} ))
NEXT_PROFILE="${PROFILES[$NEXT_INDEX]}"

sudo tuned-adm profile "$NEXT_PROFILE"
