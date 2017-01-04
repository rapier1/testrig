TARGETS = mountkernfs.sh hostname.sh udev hwclock.sh mountdevsubfs.sh checkroot.sh networking urandom mountnfs.sh checkroot-bootclean.sh bootmisc.sh mountnfs-bootclean.sh kmod procps mountall.sh checkfs.sh udev-finish lvm2 mountall-bootclean.sh
INTERACTIVE = udev checkroot.sh checkfs.sh
udev: mountkernfs.sh
hwclock.sh: mountdevsubfs.sh
mountdevsubfs.sh: mountkernfs.sh udev
checkroot.sh: hwclock.sh mountdevsubfs.sh hostname.sh
networking: mountkernfs.sh urandom procps
urandom: hwclock.sh
mountnfs.sh: networking
checkroot-bootclean.sh: checkroot.sh
bootmisc.sh: checkroot-bootclean.sh udev mountnfs-bootclean.sh mountall-bootclean.sh
mountnfs-bootclean.sh: mountnfs.sh
kmod: checkroot.sh
procps: mountkernfs.sh udev
mountall.sh: checkfs.sh checkroot-bootclean.sh lvm2
checkfs.sh: checkroot.sh lvm2
udev-finish: udev
lvm2: mountdevsubfs.sh udev
mountall-bootclean.sh: mountall.sh
