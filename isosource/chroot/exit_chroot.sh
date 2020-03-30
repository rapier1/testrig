#!/bin/sh
echo "Removing divert"
truncate -s 0 /etc/machine-id
rm /sbin/initctl
dpkg-divert --rename --remove /sbin/initctl
echo "Cleaning apt"
apt-get clean
rm -rf /tmp/* ~/.bash_history
echo "Unmounting proc"
umount /proc
echo "Unmounting sys"
umount /sys
echo "Unmounting dev/pts"
umount /dev/pts
echo "Exiting"
export HISTSIZE=0
exit
