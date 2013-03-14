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

if [ -z "${TMUX+xxx}" ] && [ -n "${SSH_CONNECTION+xxx}" ]; then
    tmux a -t ssh || \
        if [ -r ~/.tmux/ssh ]; then
            tmux new -s ssh \; source ~/.tmux/ssh
        else
            tmux new -s ssh
        fi
fi

#Put your fun stuff here.

if [ -d ~/.bash ]; then
    for file in ~/.bash/*.rc; do
        source $file;
    done
fi
