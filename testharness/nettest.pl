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
use Switch;

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
    my $FH;
    if (! -e $UUID_path) {
	logger ("crit", "Missing UUID file on this ISO");
    }
    open ($FH, "<",  $UUID_path);
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

sub storeOutput {
    my $data = shift @_;
    my $filename = shift @_;
    my $path = "/tmp/results";
    my $uuid = $config->{user}->{uuid};
    my $filepath = $path . "/" . $uuid . "-" . $filename;
    my $FH;
    
    open ($FH, ">", $filepath);
    print $FH $data;
    close $FH;
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
sub trmanagerAuth {
    # we need to open a connection to the trmanager
    # and pass them a specific string (AUTH:UUID:AUTHCODE)
    # the return value will be the passcode for the encrypted subdirectory
    # this qualifies as being autheticated and we can move on with the
    # process
    use Switch;
    
    my $challenge_path = "/usr/local/etc/testrig/challenge";
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
	Proto => 'tcp',
	Timeout => '5');
    if (! $sock) {
	logger ("crit", "Could not make connection to authentication server.");
    }
    print $sock "AUTH:" . $config->{user}->{uuid} . ":" . $challenge;

    # need some sort of timeout function here
    my $response = <$sock>;
    switch($response) {
	case "NODBH" {
	    logger ("crit", "The authentication manager could not connect to the database.");
	} 
	case "NOUUIDMATCH" {
	    logger ("crit", "The serial number of this ISO coul not be found in the database.");
	}
	case "NOMORERUNS" {
	    logger ("crit", "This ISO has been used the maximum number of times.");
	}
	case "EXPIREDISO" {
	    logger ("crit", "This ISO is too old and has expired.");
	}
	case "BADCHALLENGE" {
	    logger ("crit", "The authentication challenge was reject by the authentication manager.");
	}
	case "FAILAUTH" {
	    logger ("crit", "The ISO has encountered a general authentication failure.");
	}
	case "TIMEOUT" {
	    logger ("crit", "The authentication manager timed out.");
	}
	else {
	    logger ("warn", "ISO authenticated.");
	    return $response;
	}
    }
}

# mount the ENCFS directory. 
sub mountEncfs {
    my $password = shift @_;
    my $enc_dir = "/var/local/.testrig";
    my $target_dir = "/opt";
    my %sig;
    #we need to make sure the directories exist or encfs might hang waiting
    #for user input
    if ((! -e $enc_dir) || (! -e $target_dir)) {
	logger ("crit", "The necessary directories to mount the file system do not exist.");
    }
    my $command = "/usr/bin/encfs --extpass=\"echo \'$password\'\" /var/local/.testrig /opt";
    # the encfs command may hang if something goes wacky. Give it a max of 5 seconds
    eval {
	local $sig{ALRM} = sub {die "Timeout\n"};
	alarm 5;
	runSystem($command);
	alarm 0;
    };
    # if $@ exists it means that the command timed out
    if ($@) {
	logger ("crit", "There was a problem mounting the file system. The command timed out.");
    }
}

#----------Test Routines------------#

#get system information
#interfaces, etc.
sub getHostData {
    my $command = "/opt/sbin/ifconfig -a";
    my $output = runSystem($command, 1);
    storeOutput ($output, "ifconfig");
    $command = "/opt/bin/lshw -sanitize";
    $output = runSystem($command, 1);
    storeOutput ($output, "hardware");
}

# we need to make sure that the client can reach the target
# server. This is not guaranteed so fallbacks are required. 
# I think it would be safest to try to connect to a known
# server running on the target. If it connects then we have access.
# if not then try a different target. The default port for BWCTL is TCP:4823
sub confirmPath {
    my $target = shift @_;
    my $sock = new IO::Socket::INET (
	PeerAddr => $target,
	PeerPort => '4823',
	Proto => 'tcp',
	Timeout => '5');
    if (! $sock) {
	logger ("warn", "Could not connect to $target.");
	return -1;
    } else {
	close ($sock);
	return $target;
    }
}    

# This determins the tests to run and calls the appropriate
# routines
sub runTests {
    use Switch;
    # config->{user}->{tests} holds a CSV of the
    # various tests we've been asked to run.
    # so we turn that into an array and step through it
    # in a switch statement
    # as a note all of the necessary target information is in the
    # config struct.
    my $test;
    my @tests = split (/,/, $config->{user}->{tests});
    foreach $test (@tests) {
	switch($test) {
	    case "Traceroute" {
		testTR();
	    }
	    case "Iperf" {
		testIperf();
	    }
	    case "Ping" {
		testPing();
	    }
	    case "Owping" {
		testOwamp();
	    }
	    case "Tcpdump" {
		testTcpdump();
	    }
	    case "UDP" {
		testUDP();
	    }
	}
    }
}

sub testTR {
    # we are actually going to run a numebr of different network
    # mapping tools here
    my $target = $config->{user}->{target};
    logger ("warn", "Running traceroute to $target");
    my $command = "bwtraceroute -c $target";
    my $output = ($command, 1);
    storeOutput($output, "traceroute");
    logger ("warn", "RUnning tracepath to $target");
    $command = "bwtraceroute -T tracepath -c $target";
    $output = ($command, 1);
    storeOutput($output, "tracepath");
}

sub testIperf {
    my $target = $config->{user}->{target};
    my $command = "bwctl -c $target -t 30 -f m -i 1";
    logger ("warn", "Running 30 second Iperf test to $target");
    my $output = runSystem($command, 1);
    storeOutput($output, "iperf")
}

sub testPing {
    my $target = $config->{user}->{target};
    my $command = "bwping -N 20 -c $target";
    my $output = runSystem ($command, 1);
    storeOutput($output, "ping");
}

sub testOwamp {
    my $target = $config->{user}->{target};
    my $command = "bwping -N 20 -T owamp -c $target";
    my $output = runSystem($command, 1);
    storeOutput($output, "owamp");
}

sub testTcpdump {
    my $target = $config->{user}->{target};
    my $iface = &getDefault();
    my $uuid = $config->{user}->{uuid};

    #set up tcpdump to capture the data
    logger ("warn", "Starting 30 second tcpdump capture");
    my $command = "/opt/sbin/tcpdump -i $iface -s 100 -w - host $target 2>1 | /bin/gzip > /tmp/results/$uuid-tcpdump.gz &";
    my $output = runSystem($command, 1); 

    #make sure that the tcpdump worked
    if (grep /no\ suitable/, $output) {
	logger ("crit", "tcpdump command failed. Possible sudo falure. Please contact your NOC");
    }
    sleep 2;

    # discard the outut from this iperf. we do not care about it.
    $command = "bwctl -c $target -t 30";
    runSystem($command);

    #shutdown tcpdump
    $command = "/usr/bin/sudo killall tcpdump";
    runSystem ($command);
}

sub testUDP {
    my $target = $config->{user}->{target};
    my $command; 
    my $output;
    my @speeds = ("100", "500", "1000");
    foreach my $speed (@speeds) {
	logger ("warn", "Running UDP test to $target at $speed Mbps");
	$command = "bwctl -c $target -i1 -u -b ". $speed . "M";
	$output = runsystem($command, 1);
	storeOutput ($output, "UDP-$speed");
    }
}



#-------------MAIN------------------#
&notice;
&readConfig;
&validateConfig;
my $password = trmanagerAuth();
mountEncfs($password);
