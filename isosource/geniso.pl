#!/usr/bin/perl

#
# Perl-ified version of GenerateIso script for TestRig 2.0
#

use warnings;
use strict;
use Fcntl;
use Getopt::Std;


##Path Variables
my $masterPath="/mnt"; #NEED TO MAKE THIS A PARAM
my $chrootPath="$masterPath/chroot";
my $imagePath="$masterPath/image";
my $isolinuxPath="/usr/lib/syslinux";

#var for holding string of commands to pass to system
my $cmd;


#Boring, big static text prompts needed for 
#buliding the ISO
my $bootPrompt = <<'END_PROMPT';
********************************

Welcome to TestRig 2.0!

Type 'live' to begin

********************************
END_PROMPT

my $isolinuxCfg = <<'END_SYSPROMPT';
LABEL live
  menu label ^Start or install TestRig
  kernel /casper/vmlinuz
  append  file=/cdrom/preseed/ubuntu.seed boot=casper initrd=/casper/initrd.lz quiet splash --
LABEL check
  menu label ^Check CD for defects
  kernel /casper/vmlinuz
  append  boot=casper integrity-check initrd=/casper/initrd.lz quiet splash --
LABEL memtest
  menu label ^Memory test
  kernel /install/memtest
  append -
LABEL hd
  menu label ^Boot from first hard disk
  localboot 0x80
  append -
DISPLAY isolinux.txt
TIMEOUT 300
PROMPT 1
END_SYSPROMPT

my $diskDefines = <<'END_DISKDEFINES';
#define DISKNAME TestRig2.0
#define TYPE  binary
#define TYPEbinary  1
#define ARCH  i386
#define ARCHi386  1
#define DISKNUM  1
#define DISKNUM1  1
#define TOTALNUM  0
#define TOTALNUM0  1
END_DISKDEFINES




#create directories for liveCD creation
# mkdir -p don't work here, durrrrrr
$cmd="mkdir $imagePath";
system($cmd);
$cmd="mkdir $imagePath/casper";
system($cmd);
$cmd="mkdir $imagePath/isolinux";
system($cmd);
$cmd="mkdir $imagePath/install";
system($cmd);


#copy Web10G Kernel
$cmd="cp $chrootPath/boot/vmlinuz-4.1.0.web10g+ $imagePath/casper/vmlinuz";
system($cmd);

#copy Web10G initrd
$cmd="cp $chrootPath/boot/initrd.img-4.1.0.web10g+ $imagePath/casper/initrd.lz";
system($cmd);

#copy Isolinux
$cmd="cp $isolinuxPath/isolinux.bin $imagePath/isolinux/";
system($cmd);

#copy Memtest
$cmd="cp /boot/memtest86+.bin $imagePath/install/memtest";
system($cmd);

#build manifest of packages installed
$cmd="chroot $chrootPath dpkg-query -W --showformat='\${Package} \${Version}\n' | sudo tee $imagePath/casper/filesystem.manifest";
system($cmd);

#make a copy of it, named for desktop OSes(?)
$cmd="cp -v $imagePath/casper/filesystem.manifest $imagePath/casper/filesystem.manifest-desktop";
system($cmd);

#list of packages not to include in manifest
my @removeFromManifest = qw(ubiquity ubiquity-frontend-gtk ubiquity-frontend-kde casper lupin-casper live-initramfs user-setup discover1 xresprobe os-prober libdebian-installer4);

#remove the above list from the manifest
foreach my $i (@removeFromManifest) {
    $cmd="sudo sed -i \"/$i/d\" $imagePath/casper/filesystem.manifest-desktop";
    system($cmd);
   }

#put isolinux config in place
my $isolinuxFile = "$imagePath/isolinux/isolinux.cfg";
open (FILE, ">", "$isolinuxFile") or die $!;
print FILE $isolinuxCfg;
close (FILE);


#put diskdefines in place
my $diskDefinesFile = "$imagePath/README.diskdefines";
open (FILE, ">", "$diskDefinesFile") or die $!;
print FILE $diskDefines;
close (FILE);

#put boot prompt in place
my $bootPromptFile = "$imagePath/isolinux/isolinux.txt";
open (FILE, ">", "$bootPromptFile") or die $!;
print FILE $bootPrompt;
close (FILE);

#create the squashfs file
$cmd="mksquashfs $chrootPath $imagePath/casper/filesystem.squashfs -e boot";
system($cmd);

#calc md5sum
$cmd="cd $imagePath && find . -type f -print0 | xargs -0 md5sum | grep -v \"\./md5sum.txt\" > $imagePath/md5sum.txt";
system($cmd);

#generate iso image
#
# using two cmd variables because genisoimage does NOT
# like absolute paths for -c and -b options
$cmd="cd $imagePath";
my $cmd2="genisoimage -r -V \"TestRig2.0\" -cache-inodes -J -l -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -o $masterPath/TestRig2.0.iso .";
system("$cmd;$cmd2");


