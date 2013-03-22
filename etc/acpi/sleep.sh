#!/bin/sh
#/etc/acpi/close_lid.sh

#su -c slock username &
/usr/sbin/pm-suspend &
#DISPLAY=:0.0 su -c - username /usr/bin/slock
