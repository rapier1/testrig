TARGETS = mountkernfs.sh hostname.sh udev hwclock.sh mountdevsubfs.sh checkroot.sh urandom networking mountnfs-bootclean.sh mountnfs.sh bootmisc.sh udev-finish mountall-bootclean.sh mountall.sh checkfs.sh procps kmod checkroot-bootclean.sh lvm2
INTERACTIVE = udev checkroot.sh checkfs.sh
udev: mountkernfs.sh
hwclock.sh: mountdevsubfs.sh
mountdevsubfs.sh: mountkernfs.sh udev
checkroot.sh: hwclock.sh mountdevsubfs.sh hostname.sh
urandom: hwclock.sh
networking: mountkernfs.sh urandom procps
mountnfs-bootclean.sh: mountnfs.sh
mountnfs.sh: networking
bootmisc.sh: mountnfs-bootclean.sh udev mountall-bootclean.sh checkroot-bootclean.sh
udev-finish: udev
mountall-bootclean.sh: mountall.sh
mountall.sh: checkfs.sh checkroot-bootclean.sh lvm2
checkfs.sh: checkroot.sh lvm2
procps: mountkernfs.sh udev
kmod: checkroot.sh
checkroot-bootclean.sh: checkroot.sh
lvm2: mountdevsubfs.sh udev
