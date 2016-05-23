#!/usr/bin/perl
# Copyright (c) 2016 The Board of Trustees of Carnegie Mellon University.
#
#  Author: Chris Rapier <rapier@psc.edu>
#
# This code is free software; you can redistribute it and/or modify it
# under the terms of the MIT License.
#
# This software is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the MIT License for more details.
#
# You should have received a copy of the MIT License along with this library;
# if not, see http://opensource.org/licenses/MIT.


# Goal: An authentication manager to use with the TestRig 2.0 iso
# Method: Incoming auth request from iso includes the
#         UUID of the ISO and encrypted text. The UUID is used
#         to find the appropriate private key in a database
#         Thsi is used to decrypt the text. If it matches
#         the known text then a value is returned indicating that
#         then ISO's encfs partition should be mounted.
#         Also, this server can also return the public key
#         associated with the scp only account associated
#         with the NOC requesting this test run.

# Components: tcp server
#             ssl methods
#             db access
#             configuration file

# Scope change: We now want this server to handle all communications
# between the client and the database. We've also changed what we want
# the client to communicate
# A) Get ENCFS password
# B) Get public key for SCP transfer
# C) Give per unit test updates (which tests have completed for each run)
# D) Inform when the test suite has successfully ended

use strict;
use warnings;
use DBI;
use Config::Tiny;
use Getopt::Std;
use Sys::Syslog qw(:standard);
openlog("TR2Manager", "nowait,pid", "user");

my $config= Config::Tiny->new;
my $cfg_path = "/usr/local/etc/tr2authmanager.cfg";
my %options = ();

# read the configuration file and put everything into
# the global config data structure
sub readConfig {
    if (! -e $cfg_path) {
	print STDERR "Config file not found at $cfg_path. Exiting.\n";
	syslog ("crit", "Config file not found at $cfg_path. Exiting.");
	exit;
    } else {
	$config = Config::Tiny->read($cfg_path);
	my $error = $config->errstr();
	if ($error ne "") {
	    print STDERR "Error: $error. Exiting.\n";
	    syslog("crit", "Error: $error. Exiting.");
	    exit;
	}
    }
}

# we need to make sure that all of the configuration 
# variables exist and validates them as best we can.
sub validateConfig {
#check db data
    if (! defined $config->{db}->{host}) {
	print STDERR "Missing DB host infomation in config file. Exiting.\n";
	syslog ("crit", "Missing DB host infomation in config file. Exiting.");
	exit;
    }
    if (! defined $config->{db}->{password}) {
	print STDERR "Missing DB password infomation in config file. Exiting.\n";
	syslog ("crit", "Missing DB password infomation in config file. Exiting.");
	exit;
    }
    if (! defined $config->{db}->{user}) {
	print STDERR "Missing DB user infomation in config file. Exiting.\n";
	syslog ("crit", "Missing DB user infomation in config file. Exiting.");
	exit;
    }
}

getopts ("f:h", \%options);
if (defined $options{h}) {
    print "tr2manager usage\n";
    print "\ttr2manager.pl [-f] [-h]\n";
    print "\t-f path to configuration file. Defaults to /usr/local/etc/tr2manager.cfg\n";
    print "\t-h this help text\n";
    exit;
}

if (defined $options{f}) {
    if (-e $options{f}) {
	$cfg_path = $options{f};
    } else {
	printf STDERR "Configuration file not found at $options{f}. Exiting.\n";
	syslog ("crit", "Configuration file not found at $options{f}. Exiting.");
	exit;
    }
}

# get configuration from file
readConfig();
print "Read config\n";

validateConfig();
print "Config validated\n";

closelog();

package TRManagerServer;
use base qw(Net::Server::Fork);
use Crypt::PK::DSA;
use CryptX;
use Date::Calc;
use Sys::Syslog qw(:standard);
openlog("TR2Manager", "nowait,pid", "user");

syslog("info", "Starting TR2Manager");

TRManagerServer->run({log_level => 4});

# open the connection to syslog

# decrypt our cipher string with the private key
# the incoming cipher text is unpacked into hex
# we need to pack it back into bytes first
sub decryptKnownText {
    my $privkey = shift @_;
    my $text = shift @_;
    my $clear;
    if (length($text) != 512) {
	return "BADCHALLENGE";
    }
    $text = pack(qq{H*},qq{$text});
    #instantiate new PK object 
    my $dec = Crypt::PK::DSA->new();
    #import the private key
    $dec->import_key(\$privkey);
    # decrypt the cipher with SHA256
    $clear = $dec->decrypt($text, 'oaep', 'SHA256');
    return($clear);
}

# get db handle
# TODO use SSL for the connection. 
sub dbConnect {
    my $DBH;

    $DBH = DBI->connect($config->{db}->{host}, $config->{db}->{user},
			$config->{db}->{password});
    
    if (! defined $DBH) {
	return "NODBH";
    }
    return $DBH;
}

# if it's an auth request compare the encrypted text to the known text
# and if it matches return the encfs key
# if it's an scp request we need to have a valid encfs password
# if it matches whats in the db then we return the public key
sub authenticate {
    my $uuid = shift;
    my $challenge = shift;
    my $DBH = dbConnect();
    if ($DBH eq "NODBH") {
	return "NODBH";
    }
    
    # need a query that will fetch the appropriate priavte
    # key to decrypt the known text, the unencrypted known text,
    # and the encfs password
    my @data;
    my $query = "SELECT encfspass,
                            knowntext,
                            clientprivkey,
                            validtodate,
                            maxrun,
                            numruns
                      FROM   client
                     WHERE UUID=?";
    my $sth = $DBH->prepare($query);
    $sth->execute($uuid);
    if (($sth->rows == 0) || ($sth->rows > 1)) {
	#no results or too many results returned
	return "NOUUIDMATCH";
    }
    @data = $sth->fetchrow_array();
    $sth->finish;
    $DBH->disconnect();
    my $encfspass = $data[0];
    my $knowntext = $data[1];
    my $clientkey = $data[2];
    my $cutoffdate = $data[3];
    my $maxruns = $data[4];
    my $numruns = $data[5];
    if ($numruns >= $maxruns) {
	return "NOMORERUNS";
    }
    # the default (unset date) in the db is 0000-00-00 which is
    # always going to fail this the delta test so only check if
    # it has been explicitly set
    if ($cutoffdate ne "0000-00-00") {
	#get current date
	(my $sec, my $min, my $hour, my $curD,
	 my $curM, my $curY, my $wday, my $yday, my $isdst) =
	     localtime(time);
	$curM++; #convert to 1 - 12 format)
	$curY += 1900; #add to get 4 digit year
	#get date from db
	(my $cutoffY, my $cutoffM, my $cutoffD) = split(/-/, $cutoffdate);
	if (DeltaDays($curY, $curM, $curD, $cutoffY, $cutoffM, $cutoffD) < 0) {
	    return "EXPIREDISO";
	}
    }
    my $cleartext = decryptKnownText($clientkey, $challenge);
    if ($cleartext eq "BADCHALLENGE") {
	return $cleartext;
    } elsif ($cleartext eq $knowntext) {
	return $encfspass;
    } else {
	return "FAILAUTH";
    }
}

sub getSCPKey {
    my $uuid = shift;
    my $token = shift;
    my $DBH = dbConnect();
    
    # need a query that will fetch the public key for the 
    # scp transfer. We don't have as much checking here
    # because if they have the encfspassword they've already 
    # been authenticated.
    my @data;
    my $query = "SELECT userkey
                 FROM   client
                 WHERE  UUID=? 
                        AND
                        encfspass=?";
    my $sth = $DBH->prepare($query);
    $sth->execute($uuid, $token);
    if (($sth->rows == 0) || ($sth->rows > 1)) {
	#no results or too many results returned
	return "NOUUIDMATCH";
    }
    @data = $sth->fetchrow_array();
    $sth->finish;
    $DBH->disconnect();
    return ($data[0]); #this is the text of the public key
}    
# the client has indicated that the run was completed successfully
# so update the number of runs in the database
sub runSuccess {
    my $uuid = shift @_;
    my $token = shift @_; #token is the encfs password
    my $DBH = DbConnect();

    #need a query that will increment testrig.client.numruns
    my $query = "UPDATE client 
                 SET    numruns=numruns+1
                 WHERE UUID=?
                   AND encfspass=?";
    my $sth = $DBH->prepare($query);
    $sth->execute($uuid, $token);
    if (($sth->rows == 0) || ($sth->rows > 1)) {
	#no results or too many results returned
	return "NOUUIDMATCH";
    }
    $sth->finish();
    $DBH->disconnect();
    return("SUCCESS");
}

# take this incoming client request data and
# determine the type of request
sub parseResponse {
    my $clientdata = shift;

    my $response;
    
    # we won't always have enough fields to fill each
    # variable here. Only INCTEST will fill all of them
    (my $request, my $uuid, my $data, my $test) = split (':', $clientdata);
    if ($request eq "") {
	syslog ("info", "NOCLIENTDATA: Unknown client passed malformed request.");
	return "NOCLIENTDATA";
    }	
    # requesting authentication success returns encfpass
    if ($request =~ /^AUTH/i) {
	#this is an auth request
	$response = authenticate($uuid, $data);
    }
    # requesting scp key success returns public key
    elsif ($request =~ /^SCPKEY/i) {
	#this is an scp key request
	$response = getSCPKey($uuid, $data);
    }
    # run completed successfully. increment run counter by 1 
    elsif ($request =~ /^RUNSUCCESS/i) {
	$response = runSuccess ($uuid, $data)
	# we've decided that the run was successful according
	# to the client so increment testrig.client.numruns
    }
    # test completed successfully increment test counter by 1
    elsif ($request =~ /^INCTEST/i) {
	# a single test was successfully completed so
	# make a note of that in the accounting
	#TODO we aren't implementing this yet
	# we need a better idea of what the db structure is
	# going to look like first
    }
    # keep the connection alive
    elsif ($request =~ /^KEEPALIVE/i) {
	$response = "ALIVE";
    } else {
	$response = "UNKNOWN";
    }
    
    if ($response eq "FAILUTH") {
	#they failed authentication. Specifically - the presented
	# challenge text did not match the known text
	syslog ("info", "FAILUTH: Client $uuid failed authentication.");
    } elsif ($response eq "BADCHALLENGE") {
	#the challenge code presented didn't match our
	#expected byte length
	syslog ("info", "BADCHALLENGE: Client $uuid passed a malformed challenge.");
    } elsif ($response eq "NOUUIDMATCH") {
	#the UUID didn't match or returned too many matches
	syslog ("info", "NOUUIDMATCH: Client $uuid not found in DB."); 	
    } elsif ($response eq "EXPIREDISO") {
	# the ISO is older than the use by date
	syslog ("info", "EXPIREDISO: Client $uuid has expired.");
    } elsif ($response eq "NOMORERUNS") {
	# the iso has been run more times than allowed
	syslog ("info", "NOMORERUNS: Client $uuid has no more available runs.");
    } elsif ($response eq "NODBH") {
	# unable to get a database handle
	syslog("crit", "NODBH: Could not fetch database handle.");
    }
    return ($response);
}

sub process_request () {
    my $self = shift;
    eval {
	local $SIG{'ALRM'} = sub { die "Timed Out!\n" };
	my $timeout = 60; # timeout for client data
	
	my $previous_alarm = alarm($timeout);
	while (<STDIN>) {
	    s/\r?\n$//; # remove trailing characters
	    # handle the client close request here
	    if (/quit/i) {
		last;
	    }
	    my $response = parseResponse($_);
	    print $response  . "\n";
	    alarm($timeout);
	}
	alarm($previous_alarm);
	
    };
    
    if ($@ =~ /timed out/i) {
	print STDOUT "TIMEOUT\n";
	return;
    }
    
}

1;
