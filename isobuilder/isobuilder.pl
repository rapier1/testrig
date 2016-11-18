#!/usr/bin/perl -w

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
use Digest::SHA qw(sha256_hex);
use Data::UUID;
use DBI;
use Getopt::Std;
use Bytes::Random::Secure::Tiny;
use File::Copy;
use File::Copy::Recursive qw(dircopy);
use File::Path qw(remove_tree make_path);
use Try::Tiny;
use Sys::Syslog qw(:standard);
use Capture::Tiny ':all';
use MIME::Lite;

#use Data::Dumper;

#globals
my $config = Config::Tiny->new;
my $config_out = Config::Tiny->new;
my $cfg_path = "/usr/local/etc/isobuilder.cfg";
my %options = ();
my $DBH;
$ENV{PATH} = "/bin:/usr/bin";

#initialize the logger
openlog("TR-isobuilder", "nowait, pid", "user");

#------------Config Functions-----------#

# read the configuration file and put everything into
# the global config data structure
sub readConfig {
    if (! -e $cfg_path) {
	logger ("crit", "Config file not found at $cfg_path. Exiting.");
	exit;
    } else {
	$config = Config::Tiny->read($cfg_path);
	my $error = $config->errstr();
	if ($error ne "") {
	    logger( "crit", "Error: $error. Exiting.");
	    exit;
	}
    }
}

# we need to make sure that all of the configuration 
# variables exist and validates them as best we can.
sub validateConfig {
#check db data
    if (! defined $config->{db}->{host}) {
	logger( "crit", "Missing DB host infomation in config file. Exiting.");
	exit;
    }
    if (! defined $config->{db}->{password}) {
	logger( "crit", "Missing DB password infomation in config file. Exiting.");
	exit;
    }
    if (! defined $config->{db}->{user}) {
	logger( "crit", "Missing DB user infomation in config file. Exiting.");
	exit;
    }
#check path information
    if (! defined $config->{paths}->{source}) {
	logger( "crit", "Missing path for TestRig source files in config file. Exiting.");
	exit;
    } else {
	if (! -r $config->{paths}->{source}) {
	    logger( "crit", "TestRig source files missing or unreadable. Exiting.");
	    exit;
	}
    }
    if (! defined $config->{paths}->{enc_destination}) {
	logger( "crit", "Missing path for TestRig destination in config file. Exiting.");
	exit;
    }
    if (! defined $config->{paths}->{pub_destination}) {
	logger( "crit", "Missing path for TestRig destination in config file. Exiting.");
	exit;
    }
    if (! defined $config->{paths}->{config_directory}) {
	logger( "crit", "Missing path for UUID destination in config file. Exiting.");
	exit;
    }
    if (! defined $config->{paths}->{master_chroot}) {
	logger( "crit", "Missing path to master chroot directory. Exiting");
	exit;
    } else { #make sure it exists
	if (! -e $config->{paths}->{master_chroot}) {
	    logger( "crit", "Master chroot directory not found at $config->{paths}->{master_chroot}");
	    exit;
	}
    }
    if (! defined $config->{paths}->{target_chroot}) {
	logger( "crit", "Missing path to target chroot directory. Exiting.");
	exit;
    } else { #make sure it exists
	if (! -e $config->{paths}->{target_chroot}) {
	    logger( "crit", "Target chroot directory not found at $config->{paths}->{target_chroot}.");
	    exit;
	}
    }
    if (! defined $config->{paths}->{encfs}) {
	logger( "crit", "Missing path to encfs binaries in config file. Exiting.");
	exit;
    } else { # make sure it's there
	if (! -e $config->{paths}->{encfs}) {
	    logger( "crit", "Absolute path to encfs binary is incorrect. Exiting.");
	    exit;
	}
    }
    if (! defined $config->{paths}->{fusermount}) {
	logger( "crit", "Missing path to fusermount binary in config file. Exiting.");
	exit;
    } else { # make sure we can find it
	if (! -e $config->{paths}->{fusermount}) {
	    logger( "crit", "Absolute path to fusermount binary is incorrect. Exiting.");
	    exit;
	}
    }
    if (! defined $config->{paths}->{iso_path}) 
    { #is the image path detailed in the config file?
        logger( "crit", "Missing path to iso image output direcdtory in config file. Exiting.");
	exit;
    }
    if (! defined $config->{paths}->{isolinux}) {
	logger( "crit", "Missing path to isolinux binary in config file. Exiting.");
	exit;
    } else { # make sure we can find it
	if (! -e $config->{paths}->{isolinux}) {
	    logger( "crit", "isolinux.bin not found at location specified in config. Exiting.");
	    exit;
	}
    }
    if (! defined $config->{paths}->{memtest}) {
	logger( "crit", "Missing path to memtest binary in config file. Exiting.");
	exit;
    } else { # make sure we can find it
	if (! -e $config->{paths}->{memtest}) {
	    logger( "crit", "memtest not found at location specified in config. Exiting.");
	    exit;
	}
    }
    if (! defined $config->{paths}->{manifest}) {
	logger( "crit", "Missing path to filesystem.manifest in config file. Exiting.");
	exit;
    } else { # make sure we can find it
	if (! -e $config->{paths}->{manifest}) {
	    logger( "crit", "filesystem.manifest not found at location specified in config. Exiting.");
	    exit;
	}
    }

    
}

#----------Crypto Functions--------------#

# create a new pem key set
# and return them as strings
sub generateKeys {
    my $pk = Crypt::PK::RSA->new();
    $pk->generate_key(512,65537);
    my $private_pem = $pk->export_key_pem('private');
    my $public_pem = $pk->export_key_pem('public');
    verbose ("Generated keys");
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
    
    verbose ("Generated random string.");
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
    verbose ("Generated UUID: $uuid");
    return ($uuid);
}

#--------- ENCFS Functions------------#

# all we are doing here is shelling out to encfs 
# we can use the password we have in the extpass option
# by using '-extpass="echo $password"'. 
sub mountENCFS {
    verbose ("Mounting ENCFS");
    my $password = shift @_;
    my $uuid = shift @_;
    my $encfs = $config->{paths}->{encfs};
    my $enc_dir = $config->{paths}->{target_chroot} . "/" . $config->{paths}->{enc_destination};
    my $pub_dir = $config->{paths}->{target_chroot} . "/" . $config->{paths}->{pub_destination};
    
    verbose ("Encrypted directory: $enc_dir");
    verbose ("Public directory: $pub_dir");
    # make the directories in advance so encfs doesn't ask for input
    # from the keyboard. Be sure to clear any existing directories. 
    # if the directory exists remove everything in it
    if (-e $enc_dir) {
	remove_tree ($enc_dir, {keep_root => 1});
    }
    if (! -w $enc_dir) {
	#it doesn't exist or is not writeable. same thing. So try to make it.
	if (! make_path($enc_dir)) {
	    logger("crit", "Failed to create encrypted encfs directory in target chroot. $! Exiting.");
	    return -1;
	}
    }	
    if (-e $pub_dir) {
	remove_tree ($pub_dir, {keep_root => 1});
    }
    if (! -w $pub_dir) {
	if (! make_path($pub_dir)) {
	    logger("crit", "Failed to create public encfs directory in target chroot. $! Exiting.");
	    return -1;
	}
    }	

    #This allows us to create an encfs mount without userinteraction
    my $cmd = "$encfs --standard --extpass=\"echo \'$password\'\" $enc_dir $pub_dir";
    if (runSystem($cmd, "") != 1) {
	return -1;
    }
      
    verbose ("Mounted ENCFS");
    return 1;
}

# unmount the encfs directory
sub unmountENCFS {
    my $pub_dir = $config->{paths}->{target_chroot} . "/" . $config->{paths}->{pub_destination};
    my $fuser = $config->{paths}->{fusermount};
    if (runSystem("$fuser -q -u $pub_dir", "") != 1) {
	return -1;
    }
    verbose ("ENCFS unmounted");
    return 1;
}

#----------File Copy/Write Functions--------------#

# copy the testrig operational files to the encrypted directory
sub copyFiles {
    my $source = $config->{paths}->{source};
    my $destination =  $config->{paths}->{target_chroot} . "/" . $config->{paths}->{pub_destination};
    verbose ("Copying from $source to $destination");
    return(dircopy($source, $destination));
}

#there are individual configuration files unique
# to each iso that have to be written to the Chroot target
sub writeConfigToChroot {
    my $uuid = shift @_;
    my $known_enc = shift @_;
    my $conf_dir = $config->{paths}->{target_chroot} . "/" .  $config->{paths}->{config_directory};
    my $FH; 

    if (-e $conf_dir) {
	remove_tree ($conf_dir, {keep_root => 1});
    }
    if (! -w $conf_dir) {
	if (! make_path($conf_dir)) {
	    logger("crit", "Failed to create configuration directory in target chroot. $! Exiting.");
	    return -1;
	}
    }
    verbose ("Configuration directory: $conf_dir");
    if (!open ($FH, ">", "$conf_dir/UUID")) {
	logger ("crit", "Cannot open $conf_dir/UUID for writing.");
	return -1;
    }
    print $FH "$uuid\n";
    close ($FH);
    if (!open ($FH, ">", "$conf_dir/challenge")){
	logger ("crit", "Cannot open $conf_dir/challenge for writing.");
	return -1;
    }
    print $FH "$known_enc\n";
    close ($FH);

    #write the configuration data
    if ( ! $config_out->write("$conf_dir/tr2.cfg")) {
	logger ("crit", "Could not write tr2 config file to $conf_dir");
	return -1;
    }
    return 1;
}

#copy the master chroot to the target chroot
sub copyMaster {
    verbose ("Copying master chroot to target");
    return(dircopy($config->{paths}->{master_chroot}, $config->{paths}->{target_chroot}));
}

#---------Database Functions------------#

# Get NOC configuaration options from the
# database and write them to the client table. This would include
# values for the maximum number of runs, valid to dates, and
# the public key to write the data back to the NOCs server.
# We assume that the values in the database have been validated. 
# note: config_out is instantiated as a global. 

sub readConfFromDB {
    my $uid = shift @_;
    my $cid = shift @_;
    my $result = 0;
    my $row;
    
    # get the customer data
    my $query = "SELECT inst_data_host, 
                        inst_host_uname,
                        tt_system,
                        contact_email
                 FROM customer
                 WHERE cid = ?";
    my $sth = $DBH->prepare($query);
    $result = $sth->execute($cid);
    try
    {
        $row = $sth->fetchrow_hashref();
    }
    catch
    {
	logger ("crit", "Recieved DBI error: $_");
	return -1;
    };
    $sth->finish;
    #did we get enough data? We should have 4 values. 
    if (!$row->{inst_data_host} 
	or !$row->{inst_host_uname}
	or !$row->{contact_email}) {
	logger ("crit", "Missing customer data! CID may not exist. Exiting.");
	return -1;
    }
    #add results to config out configuration struct
    $config_out->{customer}->{data_host} = $row->{inst_data_host};
    $config_out->{customer}->{data_uname} = $row->{inst_host_uname};
    $config_out->{customer}->{tt_system} = $row->{tt_system};
    $config_out->{customer}->{contact_email} = $row->{contact_email};
    
    # get the user information from the database
    $query = "SELECT username,
                     useremail,
                     user_tt_id,
                     validtodate,
                     maxrun,
                     requested_tests,
                     queue_name,
                     target
              FROM testParameters
              WHERE uid = ?";

    #get the user data
    $sth = $DBH->prepare($query);
    $result = $sth->execute($uid);
    try
    {
	$row = $sth->fetchrow_hashref();
    }
    catch
    {
	logger ("crit", "Recieved DBI error: $_");
	return -1;
    };
    $sth->finish;  

    
    # they may not have a trouble ticket system so don't check for those
    # we need specific checks for maxrun and validtodate.
    # as the default valuies in the db are 0. 
    if (!$row->{username} 
	or !$row->{useremail} 
	or !$row->{requested_tests}) {
        logger ("crit", "Missing user data! UID may not exist. Exiting.");
	return -1;
    }
    # add data to the config out configuration struct
    $config_out->{user}->{username} = $row->{username};
    $config_out->{user}->{email} = $row->{useremail};
    $config_out->{user}->{tt_id} = $row->{user_tt_id};
    $config_out->{user}->{validtodate} = $row->{validtodate};
    $config_out->{user}->{maxrun} = $row->{maxrun};
    $config_out->{user}->{tests} = $row->{requested_tests};
    $config_out->{user}->{queue_name} = $row->{queue_name};
    $config_out->{user}->{target} = $row->{target};
    # the uuuid is added to the config_out struct after it is generated
    # later on the config_out struct is written to the ISO as a Config::Tiny
    # format configuration file. 
    return 1;
}

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
                                 validtodate, cid, uid)
                          VALUES
                                (?, ?,
                                 0, ?,
                                 ?, 0,
                                 ?, ?,
                                 ?, ?, 
                                 ?);";
    my $sth = $DBH->prepare($query);
    try 
    {
	$result = $sth->execute($uuid,
				$config_out->{user}->{maxrun},
				$encfspassword, 
				$known_text_clear, 
				$public_key, 
				$private_key,
	                        $config_out->{user}->{validtodate},
	                        $options{c},
                                $options{u});
    }
    catch
    {
	logger ("crit", "Received DBI error: $_");
	return -1;
    };

    # update the testParameters table with the UUID.
    $query = "UPDATE testParameters SET uuid='$uuid' WHERE uid=?";
    $sth = $DBH->prepare($query);
    try 
    {
	$result = $sth->execute($options{u});
    } 
    catch 
    {
	logger ("crit", "Could not update UUID in testParameters: $_");
	return -1;
    };

    $sth->finish;
    return $result;
}

#--------------Mail Functions-----------#
# mail the end user the pickup URL.
# 
sub isoAvailableMail {
    my $uuid = shift @_;
    my $passphrase = generatePassword();
    my $hash = sha256_hex($passphrase);
    my $url = "http://testrig.psc.edu/isofetch.php?uuid=$uuid&known_hash=$hash";
    my $text = "$config_out->{user}->{username}.\n\n";
    $text .= "The Testrig 2.0 ISO that you have requested is now available for download.\n";
    $text .= "This ISO will only be available for 7 days from the following link.\n $url\n";
    $text .= "At the link please enter the folllowing code to start your download\n";
    $text .= "Claim code: $passphrase\n";
	
    my $msg = MIME::Lite->new (
	From => "testrig2\@psc.edu",
	To   => $config_out->{user}->{email},
	Subject => "Your Testrig ISO is ready",
	Data => $text,
	);
    try {
	$msg->send("sendmail", "/usr/sbin/sendmail -t -oi -oem");
    } catch {
	logger("crit", "Sending message to end user failed\n");
    }
}

#inform the NOC that th ISO has been generated and mail sent to user.
sub isoCompleteMail {
    my $queue_name = "";
    my $text ="The TestRig2.0 ISO for $config_out->{user}->{username} has been successfully generated.\n";
    if ($config_out->{user}->{tt_id} ne "") {
	$text .= "The associated trouble ticket is $config_out->{user}->{tt_id}\n";
	$queue_name = "[$config_out->{user}->{queue_name} #$config_out->{user}->{tt_id}] ";
    }
    $text .= "An email has been sent to the user at $config_out->{user}->{email}.\n";
    $text .= "\n\nThank you for using PSC's TestRig 2.0 service\n";

    my $msg = MIME::Lite->new (
	From => "testrig2\@psc.edu",
	To   => $config_out->{customer}->{contact_email},
        CC   => $config_out->{customer}->{tt_system},
	Subject => $queue_name . "TestRig ISO Generated for user $config_out->{user}->{username}",
	Data => $text,
	);
    try {
	$msg->send("sendmail", "/usr/sbin/sendmail -t -oi -oem");
    } catch {
	logger ("crit", "Sending message to requestor failed\n");
    }
}

#--------------ISO Functions------------#

sub generateISO {
    # we use the UUID to make sure that all directories are unique
    my $uuid = shift @_;

    #Path Variables
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
    runSystem($cmd, $uuid);
    $cmd="mkdir $imagePath/casper";
    runSystem($cmd, $uuid);
    $cmd="mkdir $imagePath/isolinux";
    runSystem($cmd, $uuid);
    $cmd="mkdir $imagePath/install";
    runSystem($cmd, $uuid);

    
    #copy Web10G Kernel from chroot 
    $cmd="cp $chrootPath/boot/vmlinuz-$kernel $imagePath/casper/vmlinuz";
    runSystem($cmd, $uuid);
    
    #copy Web10G initrd from chroot
    $cmd="cp $chrootPath/boot/initrd.img-$kernel $imagePath/casper/initrd.lz";
    runSystem($cmd, $uuid);
    
    #copy Isolinux from host machine
    if (! -e $isolinuxPath) #does it exist on this machine?
    {
	logger ("crit", "Unable to locate isolinux.bin at $isolinuxPath. Make sure it is installed. Exiting.");
	return -1;
    }else { 
	$cmd="cp $isolinuxPath $imagePath/isolinux/";
	runSystem($cmd, $uuid);
    }
    #copy Memtest from host machine
    if (! -e $memtestPath) #is memtest on this machine? 
    { logger("crit", "Unable to locate memtest86+.bin at $memtestPath. Make sure it is installed. Exiting.");
      return -1;
    } else { 
	$cmd="cp $memtestPath $imagePath/install/memtest";
	runSystem($cmd, $uuid);
    }
    #build manifest of packages installed
    #ww no just build a static filesystem.manifest and copy it over
    #that way we can get rid of using chroot and sudo entirely
#    $cmd="/home/rapier/testrig/isobuilder/modchroot $chrootPath dpkg-query -W --showformat='\${Package} \${Version}\n' | sudo tee $imagePath/casper/filesystem.manifest";
    $cmd = "cp $config->{paths}->{manifest} $imagePath/casper/filesystem.manifest";
    runSystem($cmd, $uuid);
    
    #make a copy of it, named for desktop OSes(?)
    $cmd="cp $imagePath/casper/filesystem.manifest $imagePath/casper/filesystem.manifest-desktop";
    runSystem($cmd, $uuid);
    
    # the following is no longer needed
    #list of packages not to include in manifest
    #my @removeFromManifest = qw(ubiquity ubiquity-frontend-gtk ubiquity-frontend-kde casper lupin-casper live-initramfs user-setup discover1 xresprobe os-prober libdebian-installer4);
    
    #remove the above list from the manifest
    #foreach my $i (@removeFromManifest) {
    # 	$cmd="sudo sed -i \"/$i/d\" $imagePath/casper/filesystem.manifest-desktop";
    #	runSystem($cmd, $uuid);
    #}
    
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
    runSystem($cmd, $uuid);

    #calc md5sum
    $cmd="cd $imagePath && find . -type f -print0 | xargs -0 md5sum | grep -v \"\./md5sum.txt\" > $imagePath/md5sum.txt";
    runSystem($cmd, $uuid);
    
    #generate iso image
    #
    # using two cmd variables because genisoimage does NOT
    # like absolute paths for -c and -b options
    $cmd="cd $imagePath && genisoimage -r -V \"TestRig2.0\" -cache-inodes -J -l -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -o $config->{paths}->{iso_path}/TestRig2.0-$uuid.iso .";
    runSystem($cmd, $uuid);
    
} #### END ISO Generation Subroutine ####

#------- Utility Functions ------------#

# logger function to write data to system log and/or stdout
sub logger {
    my $level = shift @_;
    my $message = shift @_;

    syslog($level, $message);
    if (!defined $options{q}) {
	print $message . "\n";
    }
    return;
}

# function to print out all status messages
sub verbose {
    my $message = shift @_;
    if (defined $options{v}) {
	print $message . "\n";
    }
}
    
# wrapper for system command that allows us to
# capture and squelch stdout/err from shell
# enable option v to see stdout
# if $uuid is defined then run the clean up process
# and exit. If null then we return -1;
sub runSystem {
    my $cmd = shift @_;
    my $uuid = shift @_;
    my $stdout;
    my $stderr;
    my $status;

    if ($options{v}) {
	system ($cmd);
	$status = $?;
    } else {
	($stdout, $stderr, $status) = capture {
	    system($cmd);
	};
    }
    if ($status == -1) {
	logger ("crit", "System command $cmd failed to execute");
	if (defined $uuid) {
	    cleanUp($uuid);
	    exit;
	}
	return -1;
    } elsif ($status & 127) {
	logger ("crit", "System command $cmd died with signal %d");
	if (defined $uuid) {
	    cleanUp($uuid);
	    exit;
	}
	return -1;
    } else {
	return 1;
    }	       
}

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

getopts ("qvu:c:f:h", \%options);
if (defined $options{h}) {
    print "encfbuilder usage\n";
    print "\tencfbuilder.pl -u -c [-f] [-h]\n";
    print "\t-f path to configuration file. Defaults to /usr/local/etc/encfsbuilder.cfg\n";
    print "\t-u user id (the recipient of the iso)\n";
    print "\t-c customer id (the requesting organization)\n";
    print "\t-h this help text\n";
    print "\t-v verbose progress messages\n";
    print "\t-q quiet all error messages. Messages still logged.\n";
    exit;
}

if (defined $options{f}) {
    if (-e $options{f}) {
	$cfg_path = $options{f};
    } else {
	logger ("crit", "Configuration file not found at $options{f}. Exiting.");
	exit;
    }
}

if (!defined $options{u}) {
    logger ("crit", "User id must be provided.");
    exit;
}

if (!defined $options{c}) {
    logger ("crit", "Customer id must be provided.");
    exit;
}

# get configuration from file
verbose ("Reading config.");
readConfig();

validateConfig();
verbose("Config validated.");

# get db handle
# TODO use SSL for the connection. 
$DBH = DBI->connect($config->{db}->{host}, 
		    $config->{db}->{user},
		    $config->{db}->{password}, 
		    {        
			PrintError => 0,
			PrintWarn  => 1,
			RaiseError => 1,
			AutoCommit => 1,
		    });

if (! defined $DBH) {
    logger ("crit", "Could not connect to TestRig management server. Exiting.");
    exit;
}

#generate the UUID

verbose ("Generating UUID.");

my $uuid = generateUUID();
# add the UUID to the config that will be written to the ISO
$config_out->{user}->{uuid} = $uuid;

$config->{paths}->{target_chroot} = "$config->{paths}->{target_chroot}/$uuid";

#create the target chroot directory which is the user defined path plus the uuid
if (! mkdir $config->{paths}->{target_chroot}) {
    logger ("crit", "TestRig destination directory could not be created at $config->{paths}->{target_chroot}");
    exit;
}


# generate public private key pairs. 

verbose("Generating Keys.");

my ($public_key, $private_key) = generateKeys();

# generate the encfs password
verbose("Generating password.");
my $encfs_password = generatePassword();

# get configuration data from database
verbose("Getting configuration data from database.");
if (readConfFromDB($options{u}, $options{c}) == -1) {
    logger ("crit", "Could not read configuration data from testrig database");
    cleanUp($uuid);
    exit;
}
verbose("Got configuration data.");

# generate some known text. This is the same routine as the password
# but we're using the resulting text differently

verbose("Generating known text.");

my $known_text_clear = generatePassword();

verbose ("Encrypting known text.");

my $known_text_enc = encryptKnownText($public_key, $known_text_clear);

# test code to see if the encrypt works
my $test_text = decryptKnownText($private_key, $known_text_enc);

if ($known_text_clear ne $test_text) {
    logger("crit", "Public key encryption failed.");
    cleanUp($uuid);
    exit;
}

# copy the master chroot directory to temporary chroot

if (! copyMaster()) {
    logger ("crit", "Failed to copy master chroot directory");
    cleanUp($uuid);
    exit;
}

# we now have all of the necessaries. 
# time to create the encfs directory space

if (mountENCFS($encfs_password, $uuid) != 1) {
    logger ("crit", "Failed to create and/or mount encfs filespace. Exiting.");
    cleanUp($uuid);
    exit;
}

# we're going to copy everything from a target directory that holds
# the testrig tree to the chroot. We also drop in the uuid and
# a known text string encrypted with our public key

if (! copyFiles()) {
    logger("crit", "File copy failed! Exiting.");
    cleanUp($uuid);
    exit;
}

# unmount the encfs directory as we no longer need it to be open.
if (unmountENCFS() != 1) {
    logger("crit", "Could not unmount encfs directories. Exiting.");
    cleanUp($uuid);
    exit;
}


# we need to write the UUID and the known_text_enc to 
# known location in the chroot. It can be anywhere
# but I suggest /usr/local/etc/testrig
if (writeConfigToChroot($uuid, $known_text_enc, ) != 1) {
    logger("crit", "Problem writing configuration information to target chroot. Exiting.");
    cleanUp($uuid);
    exit;
}

# now we have to write everything to the correct table in the database

verbose ("Writing TestRig data to database.");
if (writeToDB($uuid, $public_key, $private_key, $encfs_password, $known_text_clear) <= 0) {
    logger ("crit", "Failed to write data to database. Exiting.\n");
    cleanUp($uuid);
    exit;
}

#generate the iso
if (generateISO($uuid) == -1) {
    logger ("crit", "Problem generating ISO.");
}

#clean up the tempory directories
cleanUp($uuid);

verbose ("TestRig target ISO generation process completed.");

verbose ("Sending completeion mail to requestor.");
isoCompleteMail();
verbose ("Sending notification mail to end user.");
isoAvailableMail($uuid);
