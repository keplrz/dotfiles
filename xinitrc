#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

export QT_IM_MODULE=fcitx
export GTK_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"

fcitx -d
[[ -f $HOME/.Xresources ]] && xrdb -merge $HOME/.Xresources
[[ -f $HOME/.fehbg ]] && sh $HOME/.fehbg
xset -b
syndaemon -t -k -i 2 -d &

exec dwm
