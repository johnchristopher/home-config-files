#!/bin/sh
#

cd $HOME
setxkbmap -option caps:super
xrdb merge $HOME/.xresources
exec awesome
