#!/usr/bin/env bash

WRITEABLE=true
VIEWONLY=false
for option in "$@"; do
    if [ ! -e $option ] || [  -w $option ]; then
        continue
    elif [ "$option" = "-v" ]; then
        VIEWONLY=true
    else
        WRITEABLE=false
	fi
done

if [ "false" == "$WRITEABLE" ] && [ "false" == "$VIEWONLY" ]; then
	echo -n "File not writeable. Please enter sudo "
	sudo nano $@
else
    nano $@
fi
