#!/bin/bash
# Taken from:
#	https://raw.github.com/kaihendry/Kai-s--HOME/master/.xinitrc
#
# for terminus font in Archlinux :(
xset +fp /usr/share/fonts/TTF
xset +fp /usr/share/fonts/wenquanyi/wqy-microhei
xset fp rehash

xset -b # disable bell
eval `/usr/bin/ssh-agent`

if test -f /usr/lib/openssh/x11-ssh-askpass # Archlinux
then
	SSH_ASKPASS=/usr/lib/openssh/x11-ssh-askpass ssh-add < /dev/null
fi

if test -f /usr/lib/ssh/x11-ssh-askpass # Debian
then
	SSH_ASKPASS=/usr/lib/ssh/x11-ssh-askpass ssh-add < /dev/null
fi

# 1280x720 = 720p X220
hash fswebcam && fswebcam -q --no-banner -r 1280x720 ~/private/login-photos/$(date +%Y-%m-%dT%H).jpg &

xrdb -merge $HOME/.Xresources
xmodmap ~/.Xmodmap
#setxkbmap -layout gb -option ctrl:nocaps


# input
X_ENV="dwm"
export LANG=zh_CN.UTF-8
#export LC_ALL="zh_CN.UTF-8"
#export XIM=ibus
#export XIM_PROGRAM="ibus-daemon"
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx" 
#export XIM_ARGS="--daemonize --xim"
fcitx -r

# ibus
#export GTK_IM_MODULE=ibus
#export QT_IM_MODULE=ibus
#export XIM=fcitx
#export XIM_PROGRAM=fcitx
#export XMODIFIERS=@im=ibus
#ibus-daemon -x -d

#while true
#do
#	VOL=$(amixer get Master | tail -1 | sed 's/.*\[\([0-9]*%\)\].*/\1/')
#	LOCALTIME=$(date +%Z\=%Y-%m-%dT%H:%M)
#	IP=$(for i in `ip r`; do echo $i; done | grep -A 1 src | tail -n1) # can get confused if you use vmware
#	TEMP="$(($(cat /sys/class/thermal/thermal_zone0/temp) / 1000))C"
#
#	if acpi -a | grep off-line > /dev/null
#	then
#		BAT="Bat. $(acpi -b | awk '{ print $4 " " $5 }' | tr -d ',')"
#		xsetroot -name "$IP $BAT $VOL $TEMP $LOCALTIME"
#	else
#		xsetroot -name "$IP $VOL $TEMP $LOCALTIME"
#	fi
#	sleep 20s
#done &
while true
do
    LOCALTIME=$(date +%Z\=%m-%dT%H:%M)
    xsetroot -name "$LOCALTIME"
    sleep 20s
done &

conky | while read -r; do xsetroot -name "$REPLY"; done &
exec dwm
#exec awesome
