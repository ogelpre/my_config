#! /bin/sh

# Simple autostart file for i3-wm, you can execute it from i3 config with
# exec $HOME/.i3/workspace-1.sh
#
# xdotool and xmessage must be installed

# Wait for program
wait_for_program () {
    n=0
    while true; do
	    # PID of last background command
	    if xdotool search --onlyvisible --pid $!; then
	        break
	    else
	        # 20 seconds timeout
	        if [ $n -eq 200 ]; then
		        xmessage "Error on executing"
		        break
	        else
		        n=`expr $n + 1`
		        sleep 0.1
	        fi
	    fi
    done
}

# Start some programs
#
#  _________________
# |        |        |
# |  term  |  term  |
# |        |        |
# |--------|--------|
# |        |        |
# | term   |  term  |
# |________|________|


i3-sensible-terminal &
wait_for_program

i3-msg split v

i3-sensible-terminal &
wait_for_program

i3-msg split h

i3-sensible-terminal &
wait_for_program

i3-msg focus up
i3-msg split h

i3-sensible-terminal &
wait_for_program

i3-msg focus left

exit 0
