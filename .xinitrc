#!/bin/sh

#Used to set the display for Dunst
systemctl --user import-environment DISPLAY

#Monitor Resolution and Position set
#xrandr --output DisplayPort-1 --auto --rate 143.92
#xrandr --output DisplayPort-2 --mode 2560x1440 --rate 165.00 --rotate left --left-of DisplayPort-1
wal -R


userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# set desktop background with custom effect
# betterlockscreen -w dim

# Alternative (set last used background)
source ~/.fehbg

xrandr --dpi 169
xsetroot -cursor_name left_ptr &

sxhkd &
exec bspwm
