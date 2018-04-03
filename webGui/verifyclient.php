<?php
/*
 * Copyright (c) 2018 The Board of Trustees of Carnegie Mellon University.
 *
 *  Authors: Chris Rapier <rapier@psc.edu> 
 *          Nate Robinson <nate@psc.edu>
 *          Bryan Learn <blearn@psc.edu>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software 
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License. *
 */
?>
<html lang="en">
    <head>
                            <meta charset="utf-8">
                            <meta http-equiv="X-UA-Compatible" content="IE=edge">
                            <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
                                   <meta name="description" content="TestRig 2">
                                                                                             <meta name="author" content="Pittsburgh Supercompuing Center">
                                                                                             <link rel="icon" href="../../favicon.ico">
                                                                          <title>TestRig 2</title>
                                                                                          <!-- Bootstrap core CSS -->
                                                                                              <link href="bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
                                                                                          <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
                                                                                              <link href="bootstrap/assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">
                                                                                          <!-- Custom styles for this template -->
                                                                                              <link href="trstylesheet.css" rel="stylesheet">
                                                                                          <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
                                                                                              <!--[if lt IE 9]>
                                                                                                  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
                                                                                                  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
                                                                                              <![endif]-->
    </head>

<?php

// The user will be sent a link containing
// the hashed passphrase and the UUID of the
// ISO. The user will then enter the passphrase
// (in the email) and submit that. If the hash of
// the pass phase matches the proffered hash
// the download page will be displayed where the
// user can pick the format of TestRig that they
// are interested in 

// we get three variables from the submission page
// known_hash
// offer
// UUID

// Hash the offer and if it matches known_hash then
// up the file indicated by the UUID
// format: testrig2-UUID.iso


// hide notices
@ini_set('error_reporting', E_ALL & ~ E_NOTICE);

//- turn off compression on the server
//@apache_setenv('no-gzip', 1);
@ini_set('zlib.output_compression', 'Off');

function verify () {
    // make sure we have the necessary incoming data
    if(!isset($_REQUEST['known_hash']) || empty($_REQUEST['known_hash'])) {
        header("HTTP/1.0 400 Bad Request");
        exit;
    }

    if(!isset($_REQUEST['offer']) || empty($_REQUEST['offer'])) {
        header("HTTP/1.0 400 Bad Request");
        exit;
    }

    if(!isset($_REQUEST['uuid']) || empty($_REQUEST['uuid'])) {
        header("HTTP/1.0 400 Bad Request");
        exit;
    }

    $uuid = $_REQUEST['uuid'];
    $known_hash = $_REQUEST['known_hash'];
    $offer = $_REQUEST['offer'];
    $isopath = "/var/testrig/isos/";
    $isodir = $isopath . $uuid;
    $isoname = "TestRig2.0-" . $uuid . ".iso";
    $iso = $isopath . $isoname;

    // does the hashed offer match the known hash?
    // note the use of the special comparator here
    if ($known_hash === hash("sha256", $offer)) {
        // does the iso exist?
        if (is_dir($isodir)) {
            // the iso seems to exist so load the download links
            loadDownloads($uuid);
        } else {
            // file doesn't exist
            printHeader ();
            print ("The TestRig2 ISO you are requesting no longer exists on this server.<br>");
            print ("TestRig2 ISOs are only valid for a set period of time and it is possible<br>");
            print ("that the requested ISO has already expired. Please request a new one from your<br>");
            print ("network administrator<p>");
            printFooter ();
            exit;
        }
    } else {
        printHeader();
        print ("The claim code you entered does not match our records. Please double ");
        print ("check the claim code in the email you received.");
        printFooter ();
        exit;
    }
}

// This function takes the UUID and generates the various download links for the user
function loadDownloads($uuid) {
    $isopath = "./isos/$uuid";
    $iso = "$isopath/TestRig2.0-$uuid.iso";
    $osx = "$isopath/TestRig2.0-osx-installer-$uuid";
    $windows = "$isopath/TestRig2.0-windows-installer-$uuid.exe";
    $linux = "$isopath/TestRig2.0-linux-installer-$uuid";

    printHeader();
    print ("<H2>TestRig2.0 Software Download</H2>");
    print ("<a href='$iso'><img width='120' src ='./images/icon-raw-iso.jpg'>Raw ISO</a><br>");
    print ("<a href='$windows'><img width='120' src ='./images/windows-installer.jpg'>Windows Installer</a><br>");
    print ("<a href='$iso'><img width='120' src ='./images/osx-installer.jpg'>OS X Installer</a><br>");
    print ("<a href='$iso'><img width='120' src ='./images/linux-installer.jpg'>Linux Installer</a><br>");
    print ("<B>Which one should I download?</B><br>
You should choose the version that corresponds to the type of computer you'll be using to create the flash drive. This doesn't have to tbe the same 
as the system or host you'll be testing. For example, if you have a Windows laptop you'll want to use the Windows Installer. However, you can use that 
flash drive to test any system that can boot from a flash drive. If you want the ISO only (no installer) choose the 'Raw ISO' option and then use your 
preferred ISO to flash drive installation software or burn it directly to a CD or DVD.<P>
<B>I downloaded the installer. Now what do I do?</B><BR>
Insert a flash drive into the USB port of your computer and double click (or otherwise run) the installer you downloaded. Make sure there isn't anything 
importabt on this flash drive as it may be erased by the installer. After the installer starts click on 'OK' to start the process of installing the TestRig2.0 
software to the flashdrive. This may take a couple of minutes so please be patient.<P>
<B>I have TestRig 2.0 installed on the flash drive. What's my next step?</B><BR>
Insert the flash drive into the system you need to test and then restart the system. Many computers are already configured to boot off of a flash drive if it
available. If not you'll need to contact someone to determine how to make that happen. After the system boots off of the flash drive you should see a screen of text.
Please read the text and if you agree to the conditions laid out there please enter 'yes' at the prompt. TestRig 2.0 will then start conducting tests for 10 to 20 minutes.
After the tests have completed remove the flash drive and reboot your system to return to normal operation.<P>
<B>I didn't use a flash drive, I made a CD/DVD.</B><BR>
In that case insert the CD/DVD into the computer's optical drive and reboot the system. After the system boots to the text screen please enter 'yes' at the promp to begin testing.<P>
<B>I can't get this thing to work! Can you help me?</B><BR>
The staff at PSC can't directly provide you with help. However, the IT staff you are working with should be able to help you with this process.<P>
<B>Can I just run the ISO as a virtual machine on the system I want to test?</B><BR>
Yes. This should work but we don't recommend it. This is because any problems with the network stack on the host operating system will impact the test environment. Since the goal of 
TestRig2.0 is to run these tests from a 'known good' and clean environment this can mask the results we are looking for.<P> 
");
    printFooter();
}       


// we need to work on some database access in order to get the necessary information
// to inform the requestor that the ISO has been picked up by the user
// or if there were any problems. We have the UUID so we can use that to get the necessary
// contact data

function notifyPickup () {
    $uuid = $_REQUEST['uuid'];
    $DB_HOST = "192.168.122.1"; //ionia's private IP
    $DB_USERNAME = "testrig";
    $DB_PASSWORD = "tinycats";
    $DB_NAME = "testrig";
    try {
        $dbh = new PDO("mysql:host=$DB_HOST;dbname=$DB_NAME", $DB_USERNAME, $DB_PASSWORD);
    } catch (PDOException $e) {
        $myerror = $e->getMessage();
        syslog (LOG_CRIT, "isofetch.php could not contact database: $myerror");
        return;
    }

    // we have the uuid so first get the cid and other data from testParameters
    $query = "SELECT queue_name, cid, user_tt_id FROM testParameters WHERE uuid= :uuid";
    try {
        $statement = $dbh->prepare($query);
        $statement->bindParam(':uuid', $uuid, PDO::PARAM_STR);
        $statement->execute();
        $result = $statement->fetch(PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        $myerror = $e->getMessage();
        syslog (LOG_CRIT, "isofetch.pl could not fetch data from testParameters table: $myerror");
        return;
    }
    $queue = $result['queue_name'];
    $cid = $result['cid'];
    $tt_id = $result['user_tt_id'];
    $statement = null;

    // now use the cid to get contact information from the customer table
    $query = "SELECT contact_email, tt_system FROM customer WHERE cid=:cid";
    try {
        $statement = $dbh->prepare($query);
        $statement->bindParam(':cid', $cid, PDO::PARAM_STR);
        $statement->execute();
        $result = $statement->fetch(PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        $myerror = $e->getMessage();
        syslog (LOG_CRIT, "isofetch.pl could not fetch data from customer table: $myerror");
        return;
    }
    $contact_email = $result['contact_email'];
    $tt_system = $result['tt_system'];
    $statement = null;

    // we have all to the necessary data to send email
    // if we have a queue name and tt then use it in the subject
    if (($queue != "") && ($tt_id != "")) {
        $tt_prefix = "[" . $queue . " #" . $tt_id . "] ";
    }
    // if we only have a TT number use it in the subject
    if (($tt_id != "") && ($queue == "")) {
        $tt_prefix = "#" . $tt_id . " ";
    }
    $to = $contact_email;
    // if there is a tt system then append that to the To: header
    if ($tt_system != "") {
        $to .= ", " . $tt_system;
    }
    $subject = $tt_prefix . "User has retreived TestRig ISO";
    $headers = "From: testrig2@psc.edu";
    $body = "The TestRig ISO [$uuid] has been downloaded from the server";

    mail ($to, $subject, $body, $headers);

    //lastly update the client table with when the ISO was (most recently) picked up
    date_default_timezone_set('UTC');
    $pickuptime = date('c'); // RFC compliant date string
    $query = "UPDATE client SET iso_retreived= :date WHERE UUID= :uuid";
    try {
        $statement = $dbh->prepare($query);
        $statement->bindParam(':date', $pickuptime, PDO::PARAM_STR);
        $statement->bindParam(':uuid', $uuid, PDO::PARAM_STR);
        $statement->execute();
    } catch (PDOException $e) {
        $myerror = $e->getMessage();
        syslog (LOG_CRIT, "isofetch.pl could not update iso_retreived time in client table: $myerror");
        return;
    }
    $statement = null;
    $dbh = null;
    return;
}

function loadPage () {
    printHeader();
    // make sure we have the necessary incoming data
    if(!isset($_REQUEST['known_hash']) || empty($_REQUEST['known_hash'])) {
        missing_data();
    }
    $known_hash = $_REQUEST['known_hash'];

    if(!isset($_REQUEST['uuid']) || empty($_REQUEST['uuid'])) {
        missing_data();
    }
    $uuid = $_REQUEST['uuid'];

    print ("<form method='post' action='$PHP_SELF'>\n");
    print ("Claim code from e-mail:");
    print ("<input type='text' size='25' maxlength='25' name='offer'>\n<br>\n");
    print ("<input type='hidden' name='uuid' value='$uuid'>\n");
    print ("<input type='hidden' name='known_hash' value='$known_hash'>\n");
    print ("<input type='hidden' name='verify' value='true'>\n");
    print ("<input type='submit'>\n");
    printFooter();
}

function missing_data () {
    print ("There seems to be a problem with the link you tried to use!");
    printFooter();
    exit;
}

function printHeader () {
    print ("<html>\n");
    print ("<head>\n");
    print ("<title>TestRig 2.0 Downloads</title>\n");
    print ("</head>\n");
    print ("<body>\n");
}

function printFooter () {
    print ("</body>\n");
    print ("</html>\n");
}

function complete () {
    printHeader();
    print ("Your download should be starting now. If not please wait a few moments. ");
    print ("Once your have downloaded the TestRig 2.0 please go to the following link ");
    print ("for instructions on creating the bootable CD/DVD or flash drive.<br>");
    notifyPickup();
    printFooter();
}

if ($_REQUEST['verify'] === "true") {
    verify();
} else if ($_REQUEST['complete'] === "true") {
    complete();
} else {
    loadPage();
}

?>