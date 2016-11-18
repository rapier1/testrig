#!/usr/bin/perl
# this is the test harness for the testrig 2.0 ISO.
# this will read the various configuration files
# assemble a series of tests, run them, store the
# information, package the results, and transfer
# the data back to the requested host.

use strict;
use warnings;
use Config::Tiny; # read config file
use File::Copy; # copy files
use Try::Tiny; #try and catch
use Capture::Tiny; #capture output from commands
use IO::Socket;
use File::Find;

# settings and defaults
my $cfg_path = "/usr/local/etc/testrig/tr2.cfg";
my $UUID_path = "/usr/local/etc/testrig/UUID";

# globals
my $config = Config::Tiny->new;

#---------Utility Functions---------#
# currently this just prints a message to the user.
# eventually it will send an error code to the database
sub logger {
    my $severity = shift @_;
    my $error = shift @_;
    print "$error\n";
    if ($severity eq "crit") {
	print "The TestRig sesssion cannot continue.\n";
	print "Please remove the bootable ISO and restart your host\n";
	print "To return to normal operation\n";
	while (1) {
	    sleep 10;
	}
    }
}


# if the UUID isn't in the cfg file for some reason
# look for it on the iso itself
sub fetchUUID {
    # $UUID_path is a global
    if (! -e $UUID_path) {
	logger ("crit", "Missing UUID file on this ISO");
    }
    open (my $FH, "<",  $UUID_path);
    # should only be one line
    my $uuid = <$FH>;
    close ($FH);
    return $_;
}

sub notice {
   print<<EOF;
The TestRi 2.0 automated network test suit will run a series of tests
against a host a remote host. The goal is to establish a baseline set of
metrics and collect data using an optimally configured client. This
data will then be sent to a newtork operations center where it will 
be analyzed by network engineers. *IMPORTANT* This test will use 
tcpdump to 'sniff' network traffic between this client and the remote
host. It will only collect data on this client and only network packets 
being sent to or received from the remote host. Also, this data may 
be used in non-identifiable ways in research projects. 
If you agree to this please type 'yes' at the prompt.
EOF
   print "Do you agree (yes/no)? ";
   my $response = <>;
   chomp $response;
   if ($response =~ m/yes/i) {
      return 1;
   } else {
      logger ("crit", "You have chosen to not continue the tests.");
   }
}

sub getIPs {
   my $interface;
   my %IPs;
 
   foreach ( qx{ (LC_ALL=C /sbin/ifconfig -a 2>&1) } ) {
      $interface = $1 if /^(\S+?):?\s/;
      next unless defined $interface;
      $IPs{$interface}->{STATE}=uc($1) if /\b(up|down)\b/i;
      $IPs{$interface}->{IP}=$1 if /inet\D+(\d+\.\d+\.\d+\.\d+)/i;
   }
   return $IPs{eth0}{IP};
}

# get the default interface for the enjoyment of tcpdump
sub getDefault {
   my $output = `route -n`;
   my @output = split "\n", $output;
   foreach my $line (@output) {
      if ($line =~ m\^0.0.0.0\) {
         my @ethline = split "_", $line;
         return $ethline[7];
      }
   }
   logger ("crit", "The default interface could not be determined.");
}

sub createDirectories {
    if (-e "/tmp/results") {
	runSystem ("/bin/rm -rf /tmp/results", 1);
    }
    find (\&deltgz, "/tmp/");
    runSystem ("/bin/mkdir /tmp/results", 1);
}

sub deltgz {
    if (-f and /\.tgz$/) {
	runSystem("/bin/rm $_", 1);
    }
}

# wrapper for system command that allows us to
# capture and squelch stdout/err from shell
# enable option v to see stdout
# if $uuid is defined then run the clean up process
# and exit. If null then we return -1;
sub runSystem {
    my $cmd = shift @_;
    my $response = shift @_;
    my $stdout;
    my $stderr;
    my $status;
    
    ($stdout, $stderr, $status) = 
	capture { system($cmd); };
    
    if ($status == -1) {
        logger ("crit", "System command $cmd failed to execute");
    } elsif ($status & 127) {
	logger ("crit", "System command $cmd died with signal %d");
    } else {
	# do we need to send the stdout data back?
	if ($response) {
	    return $stdout;
	}
	# no, then just confirm it ran
	return 1;
    }   
}

#------------Config Functions-----------#

# read the configuration file and put everything into
# the global config data structure
sub readConfig {
    # $cfg_path is a global
    if (! -e $cfg_path) {
	logger ("crit", "Config file not found at $cfg_path. Exiting.");
    } else {
	# $config is a global
	$config = Config::Tiny->read($cfg_path);
	my $error = $config->errstr();
	if ($error ne "") {
	    logger( "crit", "Error in configuration file: $error.");
	}
    }
}

sub validateConfig {
#check db data
    if (! defined $config->{customer}->{data_host}) {
	logger( "crit", "Missing data repository host information.");
    }
    if (! defined $config->{customer}->{data_uname}) {
	logger( "crit", "Missing data repository user information.");
    }
    if (! defined $config->{user}->{target}) {
	logger( "crit", "Missing test target host information.");
    }
    if (! defined $config->{user}->{tests}) {
	logger( "warn", "No tests were requested. Testrig will only collect local host information.");
    }
    if (! defined $config->{user}->{uuid}) {
	#the UUID isn't in the config data. See if you can get it from the
	#UUID file
	$config->{user}->{uuid} = fetchUUID();
	if (length($config->{user}->{uuid} < 35)) {
	    logger( "crit", "Missing UUID information.");
	}
    }
}

# authenticate with trmanager
sub trmanager_auth {
    # we need to open a connection to the trmanager
    # and pass them a specific string (AUTH:UUID:AUTHCODE)
    # the return value will be the passcode for the encrypted subdirectory
    # this qualifies as being autheticated and we can move on with the
    # process
    
    $challenge_path = "/usr/local/etc/testrig/challenge";
    # first get the challenge data that we will present to the server
    if (! -e $challenge_path) {
	logger ("crit", "Local authentication data file missing");
    }
    open (my $FH, "<", $challenge_path);
    my $challenge = <$FH>;
    close ($FH);
    if (length $challenge < 1025) {
	logger ("crit", "Local authication data file is corrupt.");
    }

    # now open the socket to the trmanager host: port 20203
    my $sock = new IO::Socket::INET (
	PeerAddr => 'testrig.psc.edu',
	PeerPort => '20203',
	Proto => 'tcp');
    if (! $sock) {
	logger ("crit", "Could not make connection to authentication server.");
    }
    print $sock "AUTH:" . $config->{user}->{uuid} . ":" . $challenge;

    # need some sort of timeout function here
    my $response = <$sock>;
    
}

&notice;
