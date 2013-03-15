# /etc/skel/.bash_logout

# This file is sourced when a login shell terminates.

for file in ~/.bash/*.logout; do
    if [ -e "$file" ]; then
        source "$file";
    fi
done

# Clear the screen for security's sake.
if [ "$SHLVL" = 1 ]; then
    clear
    #special debian tool to clear buffers
    [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
fi
