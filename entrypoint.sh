#!/bin/bash

has_vglrun=0
for a in "$@"; do
	[ "$a" == "vglrun" ] && has_vglrun=1 && break
done
if [ $has_vglrun -eq 1 ]; then
	# start Xorg server in background
	echo "Starting X server ..."
	Xorg vt10 :0 > /dev/null 2> /dev/null &
	echo "X server log: /var/log/Xorg.0.log"
	echo
else
	echo "Enter 'startx' to run X server"
	echo
fi

export DISPLAY="${DISPLAY:-:0}"

echo DISPLAY=$DISPLAY
echo

"$@"
