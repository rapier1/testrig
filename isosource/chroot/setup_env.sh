#!/bin/sh
echo "Mounting proc"
mount none -t proc /proc
echo "Mounting sys"
mount none -t sysfs /sys
echo "Mounting dev/pts"
mount none -t devpts /dev/pts
export HOME=/root
export LC_ALL=C
echo "Setting up divert"
dbus-uuidgen > /etc/machine-id
ln -fs /etc/machine-id /var/lib/dbus/machine-id
dpkg-divert --local --rename --add /sbin/initctl
ln -s /bin/true /sbin/initctl
