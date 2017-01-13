#!/usr/bin/perl
# this is the test harness for the testrig 2.0 ISO.
# this will read the various configuration files
# assemble a series of tests, run them, store the
# information, package the results, and transfer
# the data back to the requested host.

#prevent the user from exiting the application
#off for development
#$SIG{INT} = sub { print "You are not allowed to stop the TestRig 2.0 application.\n";};
#$SIG{TSTP} = sub { print "You are not allowed to stop the TestRig 2.0 application.\n";};
#$SIG{QUIT} = sub { print "You are not allowed to stop the TestRig 2.0 application.\n";};

use strict;
use warnings;
use Config::Tiny; # read config file
use File::Copy; # copy files
use Try::Tiny; #try and catch
use Capture::Tiny qw(capture); #capture output from commands
use Crypt::PK::RSA;
use IO::Socket::SSL;
use File::Find;
use Switch;
use Net::SSH2;
use POSIX qw(strftime);

# settings and defaults
my $cfg_path = "/usr/local/etc/testrig/tr2.cfg";
my $UUID_path = "/usr/local/etc/testrig/UUID";

# globals
my $config = Config::Tiny->new;
my $firstFlag = 1;
my $currentRunNum;

#---------Utility Functions---------#
# currently this just prints a message to the user.
# eventually it will send an error code to the database
sub logger {
    my $severity = shift @_;
    my $error = shift @_;
    print "$error\n";
    if ($severity eq "crit") {
	&unmountEncfs;
	print "The TestRig sesssion cannot continue.\n";
	print "Please remove the bootable ISO and restart your host\n";
	print "to return to normal operation\n";
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
    my $cmd = "/usr/bin/clear";
    runSystem ($cmd, 0, 0);
    print<<EOF;
The TestRig 2.0 automated network test suit will run a series of tests
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
 
   foreach ( qx{ (LC_ALL=C /opt/bin/ifconfig -a 2>&1) } ) {
      $interface = $1 if /^(\S+?):?\s/;
      next unless defined $interface;
      $IPs{$interface}->{STATE}=uc($1) if /\b(up|down)\b/i;
      $IPs{$interface}->{IP}=$1 if /inet\D+(\d+\.\d+\.\d+\.\d+)/i;
   }
   return $IPs{eth0}{IP};
}

# get the default interface for the enjoyment of tcpdump
sub getDefault {
    my $command = "/sbin/route -n";
    my $output = runSystem($command, 1);
    my @output = split "\n", $output;
    foreach my $line (@output) {
	if ($line =~ m\^0.0.0.0\) {
	    my @ethline = split " ", $line;
	    return $ethline[7];
	}
    }
    logger ("crit", "The default interface could not be determined.");
}

sub createDirectories {
    if (-e "/tmp/results") {
	runSystem ("/bin/rm -rf /tmp/results");
    }
    find (\&deltgz, "/tmp/");
    runSystem ("/bin/mkdir /tmp/results");
}

sub deltgz {
    if (-f and /\.tgz$/) {
	runSystem("/bin/rm $_");
    }
}

# wrapper for system command that allows us to
# capture and squelch stdout/err from shell
# enable option v to see stdout
# if $uuid is defined then run the clean up process
# and exit. If null then we return -1;
# arg[0] = command
# arg[1] = return output
# arg[2] = run elevated
sub runSystem {
    my $cmd = shift @_;
    my $response = shift @_;
    my $elevation = shift @_;
    my $stdout;
    my $stderr;
    my $status;


    if (defined $elevation) {
	if ($elevation > 0) {
	    $cmd = "/usr/bin/sudo -i " . $cmd;
	}
    }
    
    ($stdout, $stderr, $status) = 
	capture { system($cmd);};

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
    my $filepath = $path . "/" . $uuid . "-" . $currentRunNum . "-" . $filename;
    my $FH;
    
    open ($FH, ">", $filepath);
    print $FH $data;
    close $FH;
}

sub updateResultsDB {
    my $test = shift @_;
    my $pass = shift @_;
    my $sock = getSock();
    if ($pass != -1) {
	$pass = strftime("%Y-%m-%d %H:%M:%S", localtime(time));
    } else {
	# this will indicate a failed test
	$pass = "1001-01-01 00:00:00";
    }
    #currentRunNum and firstFlag are globals
    print $sock "INCTEST:" . $config->{user}->{uuid}. ":" 
	. $pass . ":" . $test . ":" . $currentRunNum 
	. ":" . $firstFlag . "\n";

    #if firstFlag is true it indicates to the trmanager that it needs
    # to create a row in testParameters rather than updating an existing one
    $firstFlag = 0;

    # we could wait for a response but a failure to update the database
    # only hampers us in terms of tracking results. so in the event
    # of a failure we should just ignore it.
    close $sock;
}

sub runComplete {
    my $password = shift @_;
    my $sock = getSock();
    print $sock "RUNSUCCESS:" . $config->{user}->{uuid}. ":" . $password . "\n";
    # again, no point in waiting for a response if there is a db failure
    # the user has completed their tests and should get hung up here
    close $sock;
}

sub getCurrentRunNum {
    my $password = shift @_;
    my $sock = getSock();

    print $sock "NUMRUNS:" . $config->{user}->{uuid} . ":" . $password . "\n";
    my $response = <$sock>;
    close $sock;
    chomp $response;
    # note: we check for the validity of the value at the manager side of
    # things. However, if the response is empty or otherwise weird 
    # then we just need to soldier on and make up a number
    if ($response =~ /^\d+$/) {
	return $response;
    } else {
	# hopefully this will never actually be an issue
	return int(rand(1000));
    }
}

# now with SSL goodness!
sub getSock {
    my $sock = new IO::Socket::SSL (
	PeerAddr => 'testrig.psc.edu',
	PeerPort => '20203',
	Proto => 'tcp',
	Timeout => '5',
	SSL_ca_file => '/usr/local/share/ca-certificates/2016.InCommon.interm.crt');
    if (! $sock) {
	logger ("crit", "Could not make connection to authentication server.");
    }
    return $sock;
}

#------------Config & Auth Functions-----------#

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
    if (! defined $config->{customer}->{inst_host_path}) {
	logger( "crit", "Missing data repository path information.");
    }
    if (! defined $config->{customer}->{inst_pub_key}) {
	logger( "crit", "Missing data repository key information.");
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

    # now open the socket to the trmanager host: port 20203
    my $sock = getSock();

    print $sock "AUTH:" . $config->{user}->{uuid} . ":" . $challenge;

    # need some sort of timeout function here
    my $response = <$sock>;
    close $sock;
    chomp $response;
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
    my $command = "/usr/bin/encfs --public --extpass=\"echo \'$password\'\" $enc_dir $target_dir";
    # the encfs command may hang if something goes wacky. Give it a max of 5 seconds
    eval {
	local $sig{ALRM} = sub {};
	alarm 5;
	runSystem($command,0,1);
	alarm 0;
    };
    # if $@ exists it means that the command timed out
    if ($@) {
	logger ("crit", "There was a problem mounting the file system. The command timed out.");
    }
}

sub unmountEncfs {
    my $command = "/bin/fuser -q -u /opt";
    runSystem($command, 0, 1);
}

# we need to make sure the clock is synched via ntpd
# or the tests via bwctl will fail
sub syncClock {
    logger("warn", "Synching local clock\n");
    my $command = "/usr/sbin/ntpd";
    runSystem($command, 0, 1);
    #give it a moment to sync
    sleep 2;
}

sub runTcptrace {
    my $command = "/opt/bin/tcptrace -lWr /tmp/results/" . $config->{user}->{uuid} . "-tcpdump.gz";
    my $output = runSystem ($command, 1);
    storeOutput($output, "tcptrace");
}

#----------Data Transfer------------#

sub buildPackage {
    my $uuid = $config->{user}->{uuid};
    my $command = "cd /tmp; tar -zcf /tmp/$uuid.tgz results/*";
    runSystem($command);
}

# the password is the result of the authentication process and
# also used to mount the encfs directory
sub getPrivateKey {
    my $password = shift @_;
    my $response;
    
    # now open the socket to the trmanager host: port 20203
    my $sock = getSock();

    if (! $sock) {
	logger ("crit", "Could not make connection to authentication server.");
    }

    print $sock "SCPKEY:" . $config->{user}->{uuid} . ":" . $password . "\n";
    while (<$sock>) {
	if ($_ =~ /EOD/) {
	    close $sock;
	    last;
	}
	if ($_ =~ /NOUUIDMATCH/) {
	    close $sock;
	    logger ("crit", "Unable to get the tokens required to transfer results.");
	}
	$response .= $_;
    }
    $response .= "-----END RSA PRIVATE KEY-----";
    chomp $response;
    return $response;
}

# we pass in the text of the private key and use that to create
# an ssh connection back to the results repository
sub connectSCP {
    my $private = shift @_;
    my $password = shift @_;
    my $public = $config->{customer}->{inst_pub_key};
    my $host = $config->{customer}->{data_host};
    my $user = $config->{customer}->{data_uname};
    my $filepath = "/tmp/" . $config->{user}->{uuid} . ".tgz";
    #currentRunNum is a global
    my $destpath = $config->{customer}->{inst_host_path} . "/" . 
	$config->{user}->{uuid} . "-" . $currentRunNum . ".tgz";
    my $ssh2 = Net::SSH2->new(timeout => 5000); # create a new ssh2 handle with a 5 second timeout

    if (! $ssh2->connect($host)) { #connect to the host
	logger ("crit", "Could not connect to remote server needed to tranfer test results.");
    }
    $ssh2->check_hostkey("LIBSSH2_HOSTKEY_POLICY_ADVISORY"); #always accept but don't store
    $ssh2->auth_publickey_frommemory($user, $public, $private); #authenticate
    if (! $ssh2->auth_ok) {
	logger ("crit", "Could not authenticate with remote server needed to transfer test results.");
    }
    if (! $ssh2->scp_put($filepath, $destpath)) { #put the file
	logger ("crit", "File transfer to remote server failed.");
    }
    $ssh2->disconnect();
}

#----------Test Routines------------#

#get system information
#interfaces, etc.
sub getHostData {
    logger ("warn", "Gathering host information");
    my $command = "/opt/bin/ifconfig -a";
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
	return 1;
    }
}    

# This determines the tests to run and calls the appropriate
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
    logger("warn", "\nStarting network tests. Each test may take several minutes to complete.");
    logger("warn", "Please be patient and wait for all tests to finish.\n");
    foreach $test (@tests) {
	# test may have leading or tailing whitespace
	$test =~ s/^\s+//;
	$test =~ s/\s+$//;
	# make sure whatever we have is in lowercase
	$test = lc($test);
	switch($test) {
	    case "traceroute" {
		testTR();
	    }
	    case "iperf" {
		testIperf();
	    }
	    case "iperf3" {
		testIperf(1);
	    }
	    case "ping" {
		testPing();
	    }
	    case "owamp" {
		testOwamp();
	    }
	    case "tcpdump" {
		testTcpdump();
	    }
	    case "udp" {
		testUDP();
	    }
	    case "nuttcp" {
		testNuttcp ();
	    }
	}
    }
}

sub testTR {
    # we are actually going to run a numebr of different network
    # mapping tools here
    my $target = $config->{user}->{target};
    my $command = "/opt/bin/bwtraceroute -a -c $target";
    my $output = runSystem($command, 1, 1);
    my $pass = 0;

    logger ("warn", "Running traceroute to $target");
    storeOutput($output, "traceroute");
    logger ("warn", "Running tracepath to $target");
    $command = "/opt/bin/bwtraceroute -a -T tracepath -c $target";
    $output = runSystem($command, 1, 1);
    storeOutput($output, "tracepath");
    if (length($output) <= 0) {
	$pass = -1;
    }
    updateResultsDB("traceroute", $pass);
}

sub testNuttcp {
    my $target = $config->{user}->{target};
    my $uuid = $config->{user}->{uuid};
    my $pass = 0;

    # start the web10g-logger
    my $command = "/opt/bin/web10g-logger > /tmp/results/$uuid-web10g_stats-nuttcp &";
    runSystem($command);
 
    $command = "/opt/bin/bwctl -T nuttcp -f m -i 1 -t 30 -c $target";
    my $output = runSystem($command, 1);
    storeOutput($output, "nuttcp");
    if (length($output) <= 0) {
	$pass = -1;
    }

    #kill the web10g logger 
    $command = "/usr/bin/killall web10g-logger";
    runSystem($command);
    updateResultsDB("nuttcp", $pass)    
}

sub testIperf {
    my $run_iperf3 = shift @_;
    my $iperf_type;
    if ($run_iperf3 == 1) {
	$iperf_type = "iperf3";
    } else {
	$iperf_type = "iperf"
    }
    my $target = $config->{user}->{target};
    my $uuid = $config->{user}->{uuid};
    my $pass = 0;
    if ($run_iperf3) {
	logger ("warn", "Running 30 second Iperf3 test to $target");
    } else {
	logger ("warn", "Running 30 second Iperf test to $target");
    }
    
    # start the web10g-logger
    my $command = "/opt/bin/web10g-logger > /tmp/results/$uuid-web10g_stats-$iperf_type &";
    runSystem ($command);
    $command = "/opt/bin/bwctl -T $iperf_type -a -c $target -t 30 -f m -i 1";
    my $output = runSystem($command, 1);
    storeOutput($output, $iperf_type);
    if (length($output) <= 0) {
	$pass = -1;
    }
    
    #kill the web10g logger 
    $command = "/usr/bin/killall web10g-logger";
    runSystem($command);
    updateResultsDB($iperf_type, $pass)
}


sub testPing {
    my $target = $config->{user}->{target};
    my $command = "/opt/bin/bwping -a -N 20 -c $target";
    my $output = runSystem ($command, 1, 1);
    my $pass = 0;
    logger ("warn", "Running ping test to $target");
    storeOutput($output, "ping");
    if (length($output) <= 0) {
	$pass = -1;
    }
    updateResultsDB("ping", $pass);
}

sub testOwamp {
    my $target = $config->{user}->{target};
    my $command = "/opt/bin/bwping -a -N 20 -T owamp -c $target";
    my $output = runSystem($command, 1, 1);
    my $pass = 0;
    logger ("warn", "Running owamp ping test to $target");    
    storeOutput($output, "owping");
    if (length($output) <= 0) {
	$pass = -1;
    }
    updateResultsDB("owamp", $pass);
}

sub testTcpdump {
    my $target = $config->{user}->{target};
    my $iface = &getDefault();
    my $uuid = $config->{user}->{uuid};
    my $pass = 0;

    #set up tcpdump to capture the data
    logger ("warn", "Starting 30 second tcpdump capture");
    my $command = "/opt/sbin/tcpdump -i $iface -s 100 -w - host $target and portrange 5001-5300 2>/dev/null | /bin/gzip > /tmp/results/$uuid-tcpdump.gz &";
    my $output = runSystem($command, 0, 1); 

    #make sure that the tcpdump worked
    if (grep /no\ suitable/, $output) {
	logger ("crit", "tcpdump command failed. Possible sudo falure. Please contact your NOC");
    }
    sleep 2;

    # discard the outut from this iperf. we do not care about it.
    $command = "bwctl -a -c $target -t 30";
    $output = runSystem($command, 1);

    #shutdown tcpdump
    $command = "/usr/bin/killall tcpdump";
    runSystem ($command, 0, 1);

    #run tcptrace
    &runTcptrace();
    
    # it's tough to determine if tcpdump actually captured packets so
    # we check to see if bwctl ran properly
    if (length($output) <= 0) {
	$pass = -1;
    }
    updateResultsDB("tcpdump", $pass);
}

sub testUDP {
    my $target = $config->{user}->{target};
    my $command; 
    my $output;
    my $pass;
    my @speeds = ("100", "450", "900");
    foreach my $speed (@speeds) {
	$pass = 0;
	logger ("warn", "Running UDP test to $target at $speed Mbps");
	$command = "bwctl -a -c $target -i1 -u -b ". $speed . "M";
	$output = runSystem($command, 1);
	storeOutput ($output, "UDP-$speed");
	if (length($output) <= 0) {
	    $pass = -1;
	}
	updateResultsDB("udp$speed", $pass);
    }
}



#-------------MAIN------------------#
&notice;
&readConfig;
&validateConfig;
&createDirectories;

my $password = trmanagerAuth();
mountEncfs($password);

#encfs is mounted we can start running tests
if (confirmPath($config->{user}->{target}) == -1) {
    logger ("crit", "We have no path the test target.");
}

$currentRunNum = getCurrentRunNum($password);

# get hardware data
getHostData();

#make sure ntpd is up to date
syncClock();


# run the tests
# all error checking is done in the context of the tests
runTests();

#build the tar package
buildPackage();

#get the private key
my $pkey = getPrivateKey($password);

#transfer the data
connectSCP($pkey, $password);

#increment the number of successful runs in the database
runComplete($password);
#clean up will go here if necessary

#finish
&unmountEncfs;
print "The Testrig 2.0 tests have completed successfully\n";
print "and the results have been sent to the network engineers\n";
print "helping you.\n";
print "Please remove the bootable media you used to start\n";
print "TestRig 2.0 and reboot to return to your system to\n";
print "normal operation.\n";
while (1) {
    sleep 10;
}
