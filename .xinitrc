#exec ck-launch-session startlxde
. .bash/locale.rc
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
cd $HOME
exec dbus-launch --exit-with-session i3
