#!/usr/bin/perl

=begin comment
  Copyright (c) 2017 The Board of Trustees of Carnegie Mellon University.
 
   Authors: Chris Rapier <rapier@psc.edu> 
           Nate Robinson <nate@psc.edu>
           Bryan Learn <blearn@psc.edu>
 
  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at
 
    http://www.apache.org/licenses/LICENSE-2.0
 
  Unless required by applicable law or agreed to in writing, software 
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License. *
=end comment
=cut 

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
use Sys::Syslog qw(:standard :macros);
use MIME::Lite;

my $config= Config::Tiny->new;
my $cfg_path = "/usr/local/etc/tr2authmanager.cfg";
my %options = ();

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
	printf "Configuration file not found at $options{f}. Exiting.\n";
	exit;
    }
}

# get configuration from file
readConfig();
print "Read config\n";

validateConfig();
print "Config validated\n";

package TRManagerServer;
#use ssl certs and only for ipv4
use IO::Socket::SSL qw(inet4);
use base qw(Net::Server::Fork);

TRManagerServer->run({
    log_level => 4,
    log_file => "Sys::Syslog",
    syslog_ident => "TR2manager",
    syslog_logopt => "pid,nowait",
    proto => "ssl",
    SSL_cert_file => "/home/rapier/testrig/trmanager/20180328.testrig.psc.edu.crt",
    SSL_key_file => "/home/rapier/testrig/trmanager/testrig.psc.edu.key"
});
use Crypt::PK::RSA;
use CryptX;
use Date::Calc qw(Delta_Days);
use Try::Tiny;

my $self;

# open the connection to $self->log
openlog("$$", "pid,nowait", "local0");

# decrypt our cipher string with the private key
# the incoming cipher text is unpacked into hex
# we need to pack it back into bytes first
sub decryptKnownText {
    my $privkey = shift @_;
    my $text = shift @_;
    my $clear;
    $text = pack(qq{H*},qq{$text});
    #instantiate new PK object 
    my $dec = Crypt::PK::RSA->new();
    #import the private key
    $dec->import_key(\$privkey);
    # decrypt the cipher with SHA256
    try {
	$clear = $dec->decrypt($text, 'oaep', 'SHA256');
    } catch {
	# this is triggered if the challenge is the wrong size, modified, etc
	$clear = "BADCHALLENGE";
    };
    return($clear);
}

# get db handle
# TODO use SSL for the connection. 
sub dbConnect {
    my $DBH;

    $DBH = DBI->connect($config->{db}->{host}, $config->{db}->{user},
			$config->{db}->{password}) or die $DBH::strerr;
    
    if (! defined $DBH) {
	$self->log("err", "Could not connect to database");
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
	if (Delta_Days($curY, $curM, $curD, $cutoffY, $cutoffM, $cutoffD) < 0) {
	    #return "EXPIREDISO";
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
    my $uuid = shift @_;
    my $token = shift @_;
    my $DBH = dbConnect();
    
    $self->log("info", "in getSCPKey");
    # need a query that will fetch the public key for the 
    # scp transfer. We don't have as much checking here
    # because if they have the encfspassword they've already 
    # been authenticated.
    my @data;
    my $key;
    my $query = "SELECT inst_priv_key
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
    chomp $data[0]; #remove any trailing newline to ensure correct format
    $key = $data[0] . "\nEOD\n"; #needs to be last line 
    $sth->finish;
    $DBH->disconnect();
    return ($key); #this is the text of the public key
}    
# the client has indicated that the run was completed successfully
# so update the number of runs in the database
sub runSuccess {
    my $uuid = shift @_;
    my $token = shift @_; #token is the encfs password
    my $DBH = dbConnect();

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
    return "SUCCESS";
}

# we need to let the person who requested the testrig iso
# know that it has completed and the data is available. 
sub notifyNOCMail {
    my $uuid = shift @_;
    my $queue_name = "";
    my $DBH = dbConnect();
    # the data we need is on two different tables so join
    my $query = "SELECT 
                    a.contact_email, a.tt_system,
                    a.inst_data_host, b.user_tt_id, 
                    b.username, b.queue_name
                 FROM customer a 
                 JOIN testParameters b 
                 ON a.cid = b.cid and b.uuid=?";
    my $sth = $DBH->prepare($query);
    $sth->execute($uuid);
    my $row = $sth->fetchrow_hashref();

    my $text ="The TestRig2.0 session for $row->{username} has completed.\n";
    if ($row->{user_tt_id} ne "") {
        $text .= "The associated trouble ticket is $row->{user_tt_id}\n";
        $queue_name = "[$row->{queue_name} #$row->{user_tt_id}] ";
    }
    $text .= "You may now retreive the dataset ($uuid) from \n";
    $text .= "the data host $row->{inst_data_host}";
    $text .= "\n\nThank you for using PSC's TestRig 2.0 service\n";

    my $msg = MIME::Lite->new (
        From => "testrig2\@psc.edu",
        To   => $row->{contact_email},
        CC   => $row->{tt_system},
        Subject => $queue_name . "TestRig 2.0 Test complete for $row->{username}",
        Data => $text,
        );
    try {
	$msg->send("sendmail", "/usr/sbin/sendmail -t -oi -oem");
    } catch {
	return "BADMAIL";
    };
    return "SUCCESS";
}

# set a time stamp for each test sucessfully completed.
sub runTestComplete {
    my $uuid = shift @_;
    my $timestamp = shift @_;
    my $test = shift @_;
    my $runnum = shift @_;
    my $insertflag = shift @_;
    my $DBH = dbConnect();
    my $query;
    my $sth;
    
    if ($insertflag) {
	$query = "INSERT INTO testResponses
                         (UUID, run,
                          $test)
                  VALUES
                         (?, ?,
                          ?)";
	my $sth = $DBH->prepare($query);
	$sth->execute($uuid, $runnum, $timestamp);
    } else {
	$query = "UPDATE testResponses
                  SET $test = ?
                  WHERE UUID = ?
                  AND run = ?";
	my $sth = $DBH->prepare($query);
	$sth->execute($timestamp, $uuid, $runnum);
    }
    
    if (($sth->rows == 0) || ($sth->rows > 1)) {
	#no results or too many results returned
	return "NOUUIDMATCH";
    }
    $sth->finish();
    $DBH->disconnect();
    return("SUCCESS");
}

#get the current number of runs for this UUID
sub getNumRuns {
    my $uuid = shift @_;
    my $token = shift @_;
    my $DBH = dbConnect();
    my $query = "SELECT numruns
                 FROM client
                 WHERE UUID=?
                 AND encfspass=?";
    my $sth = $DBH->prepare($query);
    $sth->execute($uuid, $token);
    if (($sth->rows == 0) || ($sth->rows > 1)) {
	#no results or too many results returned
	return "NOUUIDMATCH";
    }
    my @data = $sth->fetchrow_array();
    # make sure it's a number. Otherwise something is wrong.
    if ($data[0] =~ /^\d+$/) {
	return ($data[0] + 1); #add one otherwise we may have a run number of 0
    } else {
	# it's not an integer and that's really weird. 
	return "BADDATA";
    }
}
    
# take this incoming client request data and
# determine the type of request
sub parseResponse {
    my $clientdata = shift;
    my $response = "";
    
    # we won't always have enough fields to fill each
    # variable here. Only INCTEST will fill all of them
    (my $request, my $uuid, my $data) = split (':', $clientdata);
    if ($request eq "") {
	$self->log ("info", "NOCLIENTDATA: Unknown client passed malformed request.");
	return "NOCLIENTDATA";
    }	
    # requesting authentication success returns encfpass
    if ($request =~ /^AUTH/i) {
	#this is an auth request
	$self->log("info", "Received auth Request");
	$response = authenticate($uuid, $data);
    }
    # requesting scp key success returns public key
    elsif ($request =~ /^SCPKEY/i) {
	#this is an scp key request
	$self->log("info", "Received SCP key Request");
	$response = getSCPKey($uuid, $data);
    }
    # run completed successfully. increment run counter by 1 
    elsif ($request =~ /^RUNSUCCESS/i) {
	# we've decided that the run was successful according
	# to the client so increment testrig.client.numruns
	$self->log("info", "Received runsuccess Request");
	$response = runSuccess ($uuid, $data);
	$response = notifyNOCMail ($uuid);
    }
    # test completed successfully increment test counter by 1
    elsif ($request =~ /^INCTEST/i) {
	#because of the :'s in the timestamp we get from the client
	# we need to do extra fun here. The incupdate array
	# has the following format
	# [0] - request
	# [1] - uuid
	# [2] - date and hour
	# [3] - minutes
	# [4] - seconds
	# [5] - test
	# [6] - test run number
	# [7] - insert flag
	my @incupdate = split (':', $clientdata);
	$data = $incupdate[2] . ":" . $incupdate[3] . ":" . $incupdate[4];
	# these aren't strictly necessary but it's more readable
	my $test = $incupdate[5];
	my $run = $incupdate[6];
	my $insert = $incupdate[7];
	$self->log("info", "Received inctest Request");
	# a single test was successfully completed so
	# make a note of that in the accounting
	$response = runTestComplete($uuid, $data, $test, $run, $insert);
    }
    elsif ($request =~ /^NUMRUNS/i) {
	# we need to get the current run number in order to prevent the
	# resulting data sets from overwriting each other and keep them
	# in a more human readable order.
	$response = getNumRuns($uuid, $data);
	$self->log("info", "reponse is $response");
    }
    # keep the connection alive
    elsif ($request =~ /^KEEPALIVE/i) {
	$response = "ALIVE";
    } else {
	$response = "UNKNOWN";
    }
    
    if ($response eq "FAILUTH") {
	$self->log ("err", "FAILUTH: Client $uuid failed authentication.");
	#they failed authentication
    } elsif ($response eq "BADCHALLENGE") {
	$self->log ("err", "BADCHALLENGE: Client $uuid passed a malformed challenge.");
	#the challenge code presented didn't match our
	#expected byte length
    } elsif ($response eq "NOUUIDMATCH") {
	$self->log ("err", "NOUUIDMATCH: Client $uuid not found in DB."); 	
	#the UUID didn't match or returned too many matches
    } elsif ($response eq "EXPIREDISO") {
	$self->log ("err", "EXPIREDISO: Client $uuid has expired.");
    } elsif ($response eq "NOMORERUNS") {
	$self->log ("err", "NOMORERUNS: Client $uuid has no more available runs.");
    } elsif ($response eq "NODBH") {
	$self->log("err", "NODBH: Could not fetch database handle.");
    } elsif ($response eq "BADDATA") {
	$self->log("err", "BADDATA: Unexpected value in database field");
    } elsif ($response eq "BADMAIL") {
	$self->log("err", "BADMAIL: Failed to send mail to ISO requestor");
    }
    return ($response);
}

sub process_request () {
    $self = shift;
    $self->log("err", "TR2Manager started and accepting connections");
    eval {
	local $SIG{'ALRM'} = sub { die "Timed Out!\n" };
	my $timeout = 240; # timeout for client data
	
	my $previous_alarm = alarm($timeout);
	while (<STDIN>) {
	    s/\r?\n$//; # remove trailing characters
	    # handle the client close request here
	    if (/quit/i) {
		last;
	    }
	    $self->log("info", "incoming response is $_");
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
