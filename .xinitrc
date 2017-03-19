#exec ck-launch-session startlxde
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
cd $HOME
exec ck-launch-session i3
