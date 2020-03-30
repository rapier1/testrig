#!/bin/sh
echo "Mounting dev"
mount --bind /dev ./chroot/dev
echo "Mounting run"
mount --bind /run ./chroot/run
echo "Starting chroot"
chroot ./chroot

