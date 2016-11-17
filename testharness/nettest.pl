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



