#/usr/bin/perl -w

# we need an automated way to generate a password,
# instantiate an encfs directory, load the encfs directory, 
# create a UUID, write the UUID to the chroot, generate
# a public private key pair, write the public key to the 
# chroot and then copy the UUID, password, private key, and 
# so forth to a database. 

# good times.

# application flow
# enable connection to database
# if no connection die
# generate public/private key
# generate password
# generate UUID
# instantiate encfs directory with password
# mount directory
# copy over pertinant files
# unmount directory
# copy everything to database

# don't write anything to the DB until everything else
# has completed

# external config options
# db location, username, password
# source location for files to load into encfs
# destination location for encfs files
# destination/filepath for UUID code
# filepath to encfs
# filepath to fusermount

# command line options
# target chroot/iso source 

#dependencies
use strict;
use warnings;
use Config::Tiny;
use Crypt::PK::RSA;
use CryptX;
use Data::UUID;
use DBI;
use Getopt::Std;
use Bytes::Random::Secure::Tiny;
use File::Copy;
use File::Copy::Recursive qw(dircopy);
use File::Path qw(remove_tree make_path);

#globals
my $config = Config::Tiny->new;
my $cfg_path = "/usr/local/etc/encfsbuilder.cfg";
my %options = ();
my $DBH;

# read the configuration file and put everything into
# the global config data structure
sub readConfig {
    if (! -e $cfg_path) {
	print "Config file not found at $cfg_path. Exiting.\n";
	exit;
    } else {
	$config = Config::Tiny->read($cfg_path);
	my $error = $config->errstr();
	if ($error ne "") {
	    print "Error: $error. Exiting.\n";
	    exit;
	}
    }
}

# we need to make sure that all of the configuration 
# variables exist and validates them as best we can.
sub validateConfig {
#check db data
    if (! defined $config->{db}->{host}) {
	print "Missing DB host infomation in config file. Exiting\n";
	exit;
    }
    if (! defined $config->{db}->{password}) {
	print "Missing DB password infomation in config file. Exiting\n";
	exit;
    }
    if (! defined $config->{db}->{user}) {
	print "Missing DB user infomation in config file. Exiting\n";
	exit;
    }
#check path information
    if (! defined $config->{paths}->{source}) {
	print "Missing path for TestRig source files in config file. Exiting.\n";
	exit;
    } else {
	if (! -r $config->{paths}->{source}) {
	    print "TestRig source files missing or unreadable. Exiting.\n";
	    exit;
	}
    }
    if (! defined $config->{paths}->{enc_destination}) {
	print "Missing path for TestRig destination in config file. Exiting.\n";
	exit;
    }
    if (! defined $config->{paths}->{pub_destination}) {
	print "Missing path for TestRig destination in config file. Exiting.\n";
	exit;
    }
    if (! defined $config->{paths}->{config_directory}) {
	print "Missing path for UUID destination in config file. Exiting.\n";
	exit;
    }
    if (! defined $config->{paths}->{master_chroot}) {
	print "Missing path to master chroot directory. Exiting\n";
	exit;
    } else { #make sure it exists
	if (! -e $config->{paths}->{master_chroot}) {
	    print "Master chroot directory not found at $config->{paths}->{master_chroot}\n";
	    exit;
	}
    }
    if (! defined $config->{paths}->{target_chroot}) {
	print "Missing path to target chroot directory. Exiting\n";
	exit;
    } else { #make sure it exists
	if (! -e $config->{paths}->{target_chroot}) {
	    print "Target chroot directory not found at $config->{paths}->{target_chroot}\n";
	    exit;
	}
    }
    if (! defined $config->{paths}->{encfs}) {
	print "Missing path to encfs binaries in config file. Exiting.\n";
	exit;
    } else { # make sure it's there
	if (! -e $config->{paths}->{encfs}) {
	    print "Absolute path to encfs binary is incorrect. Exiting.\n";
	    exit;
	}
    }
    if (! defined $config->{paths}->{fusermount}) {
	print "Missing path to fusermount binary in config file. Exiting.\n";
	exit;
    } else { # make sure we can find it
	if (! -e $config->{paths}->{fusermount}) {
	    print "Absolute path to fusermount binary is incorrect. Exiting.\n";
	    exit;
	}
    }
    if (! defined $config->{paths}->{iso_path}) 
    { #is the image path detailed in the config file?
        print "Missing path to iso image output direcdtory in config file. Exiting.\n";
	exit;
    }
    if (! defined $config->{paths}->{isolinux}) {
	print "Missing path to isolinux binary in config file. Exiting.\n";
	exit;
    } else { # make sure we can find it
	if (! -e $config->{paths}->{isolinux}) {
	    print "isolinux.bin not found at location specified in config. Exiting.\n";
	    exit;
	}
    }
    if (! defined $config->{paths}->{memtest}) {
	print "Missing path to memtest binary in config file. Exiting.\n";
	exit;
    } else { # make sure we can find it
	if (! -e $config->{paths}->{memtest}) {
	    print "memtest not found at location specified in config. Exiting.\n";
	    exit;
	}
    }

    
}

# create a new pem key set
# and return them as strings
sub generateKeys {
    my $pk = Crypt::PK::RSA->new();
    $pk->generate_key(512,65537);
    my $private_pem = $pk->export_key_pem('private');
    my $public_pem = $pk->export_key_pem('public');
    print "Generated keys\n";
    return ($public_pem, $private_pem);
}

#generate a random password/string of text/whatever
# that is 25 characters long
sub generatePassword {
    # instantiate a new random number generator
    my $rng = Bytes::Random::Secure::Tiny->new;
    my $validChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890";
 
    #randomly picks 25 chacaters from the validChars string
    my $string = $rng->string_from($validChars, 25);
    
    print "Generated random string\n";
    return $string;
}

#encrypt our known text with our public key
sub encryptKnownText {
    my $pubkey = shift @_;
    my $text = shift @_;
    # instantiate a new PK object
    my $enc = Crypt::PK::RSA->new();
    # import our public key into it
    $enc->import_key(\$pubkey);
    # encrypt out text with sha256
    $text = $enc->encrypt($text, 'oaep', 'SHA256');
    $text = unpack("H*", $text);
    return($text);
}

#decrypt our cipher string with the private key
#not really used in this code was included for error checking
sub decryptKnownText {
    my $privkey = shift @_;
    my $text = shift @_;
    $text = pack(qq{H*},qq{$text});
    #instantiate new PK object
    my $dec = Crypt::PK::RSA->new();
    #import the private key
    $dec->import_key(\$privkey);
    # decrypt the cipher
    $text = $dec->decrypt($text, 'oaep', 'SHA256');
    return($text);
}

#generate a new UUID
#UUIDs of this type are not gauranteed to be unique
#but the likelihood of their being a collision is incredibly small
sub generateUUID {
    #instantiate the UUID object
    my $uuid_obj = Data::UUID->new;
    #generate a UUID string
    my $uuid = $uuid_obj->create_str();
    print "Generated UUID\n";
    return ($uuid);
}

# all we are doing here is shelling out to encfs 
# we can use the password we have in the extpass option
# by using '-extpass="echo $password"'. 
sub mountENCFS {
    print "Mounting ENCFS\n";
    my $password = shift @_;
    my $encfs = $config->{paths}->{encfs};
    my $enc_dir = $config->{paths}->{target_chroot} . "/" . $config->{paths}->{enc_destination};
    my $pub_dir = $config->{paths}->{target_chroot} . "/" . $config->{paths}->{pub_destination};

    print "Encrypted directory: $enc_dir\n";
    print "Public directory: $pub_dir\n";
    # make the directories in advance so encfs doesn't ask for input
    # from the keyboard. Be sure to clear any existing directories. 
    # if the directory exists remove everything in it
    if (-e $enc_dir) {
	remove_tree ($enc_dir, {keep_root => 1});
    }
    if (! -w $enc_dir) {
	#it doesn't exist or is not writeable. same thing. So try to make it.
	if (! make_path($enc_dir)) {
	    print "Failed to create encrypted encfs directory in target chroot. $! Exiting.\n";
	    exit;
	}
    }	
    if (-e $pub_dir) {
	remove_tree ($pub_dir, {keep_root => 1});
    }
    if (! -w $pub_dir) {
	if (! make_path($pub_dir)) {
	    print "Failed to create public encfs directory in target chroot. $! Exiting.\n";
	    exit;
	}
    }	

    #This allows us to create an encfs mount without userinteraction
    system ("$encfs --standard --extpass=\"echo \'$password\'\" $enc_dir $pub_dir");

    if ($? == -1) {
	return -1;
    }
      
    print "Mounted ENCFS\n";
    return 1;
}

# copy the testrig operational files to the encyrpted directory
sub copyFiles {
    my $source = $config->{paths}->{source};
    my $destination =  $config->{paths}->{target_chroot} . "/" . $config->{paths}->{pub_destination};
    print "copying from $source to $destination\n";
    return(dircopy($source, $destination));
}

# unmount the encfs directory
sub unmountENCFS {
    my $pub_dir = $config->{paths}->{target_chroot} . "/" . $config->{paths}->{pub_destination};
    my $fuser = $config->{paths}->{fusermount};
    system ("$fuser -q -u $pub_dir");
    if ($? == -1) {
	return -1;
    }
    print "ENCFS unmounted\n";
    return 1;
}

#there are individual configuration files unique
# to each iso that have to be written to the Chroot target
sub writeConfigToChroot {
    my $uuid = shift @_;
    my $known_enc = shift @_;
    my $conf_dir = $config->{paths}->{target_chroot} . "/" .  $config->{paths}->{config_directory};
    if (-e $conf_dir) {
	remove_tree ($conf_dir, {keep_root => 1});
    }
    if (! -w $conf_dir) {
	if (! make_path($conf_dir)) {
	    print "Failed to create configuration directory in target chroot. $! Exiting.\n";
	    exit;
	}
    }
    print "Configuration directory: $conf_dir\n";
    open (my $FH, ">", "$conf_dir/UUID") or die 
	"Cannot open $conf_dir/UUID for writing.\n";
    print $FH "$uuid\n";
    close ($FH);
    open ($FH, ">", "$conf_dir/challenge") or die
	"Cannot open $conf_dir/challenge for writing.\n";
    print $FH "$known_enc\n";
    close ($FH);
    if (! -e "$conf_dir/UUID" ) {
	return -1;
    }
    if (! -e "$conf_dir/challenge" ) {
	return -1;
    }
    return 1;
    # still need to hgave it write the NOC public key
    # NOC host, NOC user, test configuration and so forth
}

#copy the master chroot to the target chroot
sub copyMaster {
    print "Copying master chroot to target\n";
    return(dircopy($config->{paths}->{master_chroot}, $config->{paths}->{target_chroot}));
}

#TODO: Need to get NOC configuaration options from the
# database and write them to the client table. This would include
# values for the maximum number of runs, valid to dates, and
# the public key to write the data back to the NOCs server

#write the results to the database
sub writeToDB {
    my $uuid = shift @_;
    my $public_key = shift @_;
    my $private_key = shift@_;
    my $encfspassword = shift @_;
    my $known_text_clear = shift @_;
    my $result = 0;
    my $query = "INSERT INTO client 
                                (UUID, maxrun, 
                                 numruns, encfspass,
                                 knowntext, authfailures,
                                 clientpubkey, clientprivkey,
                                 validtodate, userkey)
                          VALUES
                                (?, 0,
                                 0, ?,
                                 ?, 0,
                                 ?, ?,
                                 0, 0);";
    my $sth = $DBH->prepare($query);
    $result = $sth->execute($uuid, $encfspassword, $known_text_clear, $public_key, $private_key);
    $sth->finish;
    return $result;
}


sub generateISO {
    # we use the UUID to make sure that all directories are unique
    my $uuid = shift @_;

    ##Path Variables
    my $workingChrootPath = $config->{paths}->{target_chroot}; #NEED TO MAKE THIS A PARAM
    my $chrootPath = $workingChrootPath; #path to working chroot
    my $imagePath = $config->{paths}->{iso_path} . "/" . $uuid;
    my $isolinuxPath = $config->{paths}->{isolinux}; #we need isolinux.bin
    my $memtestPath = $config->{paths}->{memtest};
    
    #var for holding string of commands to pass to system
    my $cmd;
    
    #easier to use var for the kernel version
    my $kernel = $config->{kernel}->{kernel_version};
    
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

    
    #copy Web10G Kernel from chroot 
    $cmd="cp $chrootPath/boot/vmlinuz-$kernel $imagePath/casper/vmlinuz";
    system($cmd);
    
    #copy Web10G initrd from chroot
    $cmd="cp $chrootPath/boot/initrd.img-$kernel $imagePath/casper/initrd.lz";
    system($cmd);
    
    #copy Isolinux from host machine
    if (! -e $isolinuxPath) #does it exist on this machine?
    {
	print "Unable to locate isolinux.bin at $isolinuxPath. Make sure it is installed. Exiting.\n";
	exit;
    }else { 
	$cmd="cp $isolinuxPath $imagePath/isolinux/";
	system($cmd);
    }
    #copy Memtest from host machine
    if (! -e $memtestPath) #is memtest on this machine? 
    { print "Unable to locate memtest86+.bin at $memtestPath. Make sure it is installed. Exiting.\n";
      exit;
    } else { 
	$cmd="cp $memtestPath $imagePath/install/memtest";
	system($cmd);
    }
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
    my $cmd2="genisoimage -r -V \"TestRig2.0\" -cache-inodes -J -l -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -o $config->{paths}->{iso_path}/TestRig2.0-$uuid.iso .";
    system("$cmd;$cmd2");
    
} #### END ISO Generation Subroutine ####

#remove the temporary directories
sub cleanUp {
    my $uuid = shift @_;
    my $temp_image = $config->{paths}->{iso_path} . "/" . $uuid;
    remove_tree($temp_image);
    remove_tree($config->{paths}->{target_chroot});
}

############
#   MAIN   #
############

# process command line options

getopts ("f:h", \%options);
if (defined $options{h}) {
    print "encfbuilder usage\n";
    print "\tencfbuilder.pl [-f] [-h]\n";
    print "\t-f path to configuration file. Defaults to /usr/local/etc/encfsbuilder.cfg\n";
    print "\t-h this help text\n";
    exit;
}

if (defined $options{f}) {
    if (-e $options{f}) {
	$cfg_path = $options{f};
    } else {
	printf "Configuration file not found at $options{f}. Exiting.\n";
	exit;
    }
}

# get configuration from file
readConfig();
print "Read config\n";

validateConfig();
print "Config validated\n";


# get db handle
# TODO use SSL for the connection. 
$DBH = DBI->connect($config->{db}->{host}, $config->{db}->{user},
		       $config->{db}->{password});

print "$config->{db}->{host}, $config->{db}->{user}, $config->{db}->{password}\n";

if (! defined $DBH) {
    print "Could not connect to TestRig management server. Exiting.\n";
    exit;
}

#generate the UUID

print "Generating UUID\n";

my $uuid = generateUUID();

print "UUID: $uuid\n";
$config->{paths}->{target_chroot} = "$config->{paths}->{target_chroot}/$uuid";

#create the target chroot directory which is the user defined path plus the uuid
if (! mkdir $config->{paths}->{target_chroot}) {
    print "TestRig destination directory could not be created at $config->{paths}->{target_chroot} \n";
    exit;
}


# generate public private key pairs. 

print "Generating Keys\n";

my ($public_key, $private_key) = generateKeys();

# generate the encfs password
print "Generating password\n";
my $encfs_password = generatePassword();


# generate some known text. This is the same routine as the password
# but we're using the resulting text differently

print "Generating known text\n";

my $known_text_clear = generatePassword();

print "Encrypting known text\n";

my $known_text_enc = encryptKnownText($public_key, $known_text_clear);

# test code to see if the encrypt works
my $test_text = decryptKnownText($private_key, $known_text_enc);

if ($known_text_clear ne $test_text) {
    print "Public key encryption failed!\n";
    exit;
}

# copy the master chroot directory to temporary chroot

if (! copyMaster()) {
    printf "Failed to copy master chroot directory\n";
    exit;
}


# we now have all of the necessaries. 
# time to create the encfs directory space

if (mountENCFS($encfs_password) != 1) {
    print "Failed to create and/or mount encfs filespace. Exiting.\n";
    exit;
}

# we're going to copy everything from a target directory that holds
# the testrig tree to the chroot. We also drop in the uuid and
# a known text string encrypted with our public key

if (! copyFiles()) {
    print "File copy failed! Exiting.\n";
    exit;
}

# unmount the encfs directory as we no longer need it to be open.
if (unmountENCFS() != 1) {
    print "Could not unmount encfs directories. Exiting.\n";
    exit;
}

# we need to write the UUID and the known_text_enc to 
# known location in the chroot. It can be anywhere
# but I suggest /usr/local/etc/testrig
if (writeConfigToChroot($uuid, $known_text_enc, ) != 1) {
    print "Problem writing configuration information to target chroot. Exiting.\n";
    exit;
}

# now we have to write everything to the correct table in the database

print "Writing TestRig data to database.\n";
if (writeToDB($uuid, $public_key, $private_key, $encfs_password, $known_text_clear) == 0) {
    print "Failed to write data to database. Exiting.\n";
    exit;
}

#generate the iso
generateISO($uuid);

#clean up the tempory directories
cleanUp($uuid);

print "TestRig target ISO generation process completed.\n";

