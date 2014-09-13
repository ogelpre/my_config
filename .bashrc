# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
    # Shell is non-interactive.  Be done now!
    return
fi

if [ -n "${SSH_CONNECTION+xxx}" ]; then
    if [ "$TERM" != "screen" ] && [ -z "${TMUX+xxx}" ] && [ -x "/usr/bin/tmux" ]; then
        tmux a -t ssh || \
            if [ -r ~/.tmux/ssh ]; then
                /usr/bin/tmux new -s ssh \; source ~/.tmux/ssh
            else
                /usr/bin/tmux new -s ssh
            fi
    elif [ "$TERM" != "screen" ] && [ -z "${TMUX+xxx}" ] && [ -x "/usr/bin/screen" ]; then
        /usr/bin/screen -S ssh -x -R
    fi
fi

#Put your fun stuff here.

for file in ~/.bash/*.rc; do
    if [ -e "$file" ]; then
        source "$file"
    fi
done
