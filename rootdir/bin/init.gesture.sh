#!/vendor/bin/sh

# Enable DT2W
while [[ -z $(getprop sys.boot_completed) ]]; do sleep 5; done

while true; do
   dt2w_state=$(getprop persist.sys.MT6789.dt2w)
   if [ "$dt2w_state" == "0" ]; then
      echo cc2 > /proc/gesture_function
   elif [ "$dt2w_state" == "1" ]; then
      echo cc1 > /proc/gesture_function
   fi
   sleep 1
done
