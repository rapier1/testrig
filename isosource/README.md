# TestRig

Some basic tips/breadcrumbs for working with the chroot.

STEPS BEFORE YOU ENTER CHROOT:

Make sure to bind your /dev directory to chroot/dev:
mount --bind /dev /TestRig/chroot/dev (or wherever you have your chroot)


ONCE INSIDE:

There is a script under /root named "prepchroot" which will perform steps as described by

https://help.ubuntu.com/community/LiveCDCustomizationFromScratch


ONCE YOUR WORK IS COMPLETED WITHIN THE CHROOT

If you forget to unmount /proc, /sys/, or /dev/pts and you leave the chroot, you will have three
lovely mount points that are in your chroot that CANNOT be unmounted. So don't do that.

There is a script you can run to do all of the cleanup for you and save your fingers some time

/root/cleanchroot

This will unmount everything that prepchroot mounted. Just be sure to check and make sure that 
everything you mounted is unmounted before you exit (binding /dev is fine since it's done outside the context
of the chroot)


