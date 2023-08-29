#!/bin/bash
export PIPESTATUS_PIPE="/tmp/swaybar_pipe"
export MODULE_PATH="/home/rohnch/apps/pipestatus/modules/"
MODULES="NET_SPEED TOP DATE LIGHT PLAYERCTL BAT PULSE"
export child_pids=""
trap finish SIGINT SIGTERM

killall -9 pipestatus
rm -rf "$PIPESTATUS_PIPE"
mkfifo "$PIPESTATUS_PIPE"

padding="                                               "
TEMPLATE="${TEMPLATE}<PLAYERCTL> "
TEMPLATE="${TEMPLATE} 🧠 <CPU> 💾 <MEM> <NET_SPEED> 💡 <LIGHT> <VOL_SYM> <VOL> <BAT>"
TEMPLATE="${TEMPLATE} 📅 <DATE>"

finish() {
  echo "BYE!!"
  for pid in ${child_pids}; do
    echo "KILLING: $pid"
    kill -9 $pid
  done
}

for module in $MODULES; do
  . "$MODULE_PATH/PIPESTATUS_$module"
  ps_$module > $PIPESTATUS_PIPE &
  child_pids="${child_pids} $!"
done

pipestatus -f "$PIPESTATUS_PIPE" -t "$TEMPLATE" \
  | while read -r bar_info; do
    echo "$padding$bar_info"
done

# wait for all child pids
for pid in ${child_pids}; do
    wait $pid
done
