#!/bin/sh
#

cd $HOME
setxkbmap -option caps:super
#setxkbmap -layout us -variant intl
xrdb merge $HOME/.xresources
exec awesome
