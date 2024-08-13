# Enable DT2W
while [[ -z $(getprop sys.boot_completed) ]]; do sleep 5; done

while true; do
   dt2wstate=$(settings get secure double_tap_to_wake)
   if [ "$dt2wstate" == "0" ]; then
      echo cc2 > /proc/gesture_function
   elif [ "$dt2wstate" == "1" ]; then
      echo cc1 > /proc/gesture_function
   fi
   sleep 1
done
