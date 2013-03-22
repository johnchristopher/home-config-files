#!/bin/sh
#/etc/acpi/hibernate.sh

echo "hibernation initiated"
/usr/sbin/pm-hibernate
#DISPLAY=:0.0 su -c - username /usr/bin/slimlock
