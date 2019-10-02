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
    $osx = "$isopath/TestRig2.0-osx-installer-$uuid.dmg";
    $windows = "$isopath/TestRig2.0-windows-installer-$uuid.exe";
    $linux = "$isopath/TestRig2.0-linux-installer-$uuid.bin";

    printHeader();
    print ("<div id='container-main' class='container'>\n");
    print ("<div class='jumobtron'>\n");
    print ("<div class='row'>\n");
    print ("<H2 class='text-center'>TestRig2.0 Software Download</H2>\n");
    print ("<table width=75% align=center><tr>\n");
    print ("<td align=center><a href='$iso'><img width='120' src ='./images/icon-raw-iso.jpg'><br>Raw ISO</a></td>\n");
    print ("<td align=center><a href='$windows'><img width='120' src ='./images/windows-installer.jpg'><br>Windows Installer</a></td>\n");
    print ("<td align=center><a href='$osx'><img width='120' src ='./images/osx-installer.jpg'><br>OS X Installer</a></td>\n");
    print ("<td align=center><a href='$linux'><img width='100' src ='./images/linux-installer.jpg'><br>Linux Installer</a></td>\n");
    print ("</tr>\n</table>\n</div>\n</div>\n<P>\n");
    print ("<div class='main-panels'>\n
<B>Which one should I download?</B><br>\n
You should choose the version that corresponds to the type of computer you'll be using to create the flash drive. 
This doesn't have to tbe the same as the system or host you'll be testing. For example, if you have a Windows 
laptop you'll want to use the Windows Installer. However, you can use that flash drive to test any system that can 
boot from a flash drive. If you want the ISO only (no installer) choose the 'Raw ISO' option and then use your 
preferred ISO to flash drive installation software or burn it directly to a CD or DVD.<P><P>\n

<B>I downloaded the installer. Now what do I do?</B><BR>\n
Insert a flash drive into the USB port of your computer and double click (or otherwise run) the installer you downloaded. 
Make sure there isn't anything important on this flash drive as it may be erased by the installer. After the 
installer starts click on 'OK' to start the process of installing the TestRig2.0 software to the flash drive. This may 
take a couple of minutes so please be patient.<br>
<B><I>Mac Users</I></B>: If you are using the OS X installer it is possible that a window will pop up that says TestRig2.0 
\"can't be opened because it is from an unidentified developer\". In this case open System Preferences and 
then Security & Privacy. Then click the button that says \"Open Anyway\".<br> 
<B><I>Linux users:</I></B> After downloading the installer open a terminal window and change directories to 
where the installer is located. Then enter <TT>'sh TestRig2.0-linux-installer-$uuid.bin'</TT> to start the application.<P>\n

<B>I have TestRig 2.0 installed on the flash drive. What's my next step?</B><BR>\n
Insert the flash drive into the system you need to test and then restart the system. Many computers are 
already configured to boot off of a flash drive if it available. If not you'll need to contact someone 
to determine how to make that happen. After the system boots off of the flash drive you should see a screen of text.
Please read the text and if you agree to the conditions laid out there please enter 'yes' at the prompt. 
TestRig 2.0 will then start and run various tests for 10 to 20 minutes. After the tests have completed remove the 
flash drive and reboot your system to return to normal operation.<P>\n

<B>I didn't use a flash drive, I made a CD/DVD.</B><BR>\n
In that case insert the CD/DVD into the computer's optical drive and reboot the system. 
After the system boots to the text screen please enter 'yes' at the promp to begin testing.<P>\n

<B>I can't get this thing to work! Can you help me?</B><BR>\n
The staff at PSC can't directly provide you with help. However, the IT staff you are working 
with should be able to help you with this process.<P>\n

<B>Can I just run the ISO as a virtual machine on the system I want to test?</B><BR>\n
Yes. This should work but we don't recommend it. This is because any problems with the network stack 
on the host operating system will impact the test environment. Since the goal of TestRig2.0 is to run 
these tests from a 'known good' and clean environment this can mask the results we are looking for.<P>\n
</div>\n
</div>\n
");
    printFooter();
}       


// we need to work on some database access in order to get the necessary information
// to inform the requestor that the ISO has been picked up by the user
// or if there were any problems. We have the UUID so we can use that to get the necessary
// contact data

function notifyPickup () {
    include "./config.php";
    $uuid = $_REQUEST['uuid'];
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

    print ("<div id='container-main' class='container'>\n");
    print ("<div class='jumobtron'>\n");
    print ("<div class='row'>\n");
    print ("<H2 class='text-center'>Download the TestRig 2.0 Installer</H2>\n");
    print ("</div><P>\n");
    print ("<form method='post' action='$PHP_SELF'>\n");
    print ("Please enter the claim code from the email:\n");
    print ("<input type='text' size='25' maxlength='25' name='offer'>\n<br>\n");
    print ("<input type='hidden' name='uuid' value='$uuid'>\n");
    print ("<input type='hidden' name='known_hash' value='$known_hash'>\n");
    print ("<input type='hidden' name='verify' value='true'>\n");
    print ("<input type='submit' value='Submit Code'>\n");
    print ("</div>\n");
    printFooter();
}

function missing_data () {
    print ("There seems to be a problem with the link you tried to use!");
    printFooter();
    exit;
}

function printHeader () {
    print("
    <html lang='en'>
    <head>
         <meta charset='utf-8'>
         <meta http-equiv='X-UA-Compatible' content='IE=edge'>
         <meta name='viewport' content='width=device-width, initial-scale=1'>
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
         <meta name='description' content='TestRig 2'>
         <meta name='author' content='Pittsburgh Supercompuing Center'>
         <link rel='icon' href='../../favicon.ico'>
         <title>TestRig 2.0 Download</title>
         <!-- Bootstrap core CSS -->
         <link href='bootstrap/dist/css/bootstrap.min.css' rel='stylesheet'>
         <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
         <link href='bootstrap/assets/css/ie10-viewport-bug-workaround.css' rel='stylesheet'>
         <!-- Custom styles for this template -->
         <link href='trstylesheet.css' rel='stylesheet'>
         <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
         <!--[if lt IE 9]>
         <script src='https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js'></script>
         <script src='https://oss.maxcdn.com/respond/1.4.2/respond.min.js'></script>
         <![endif]-->
    </head>");
    print ("<body>\n");
}

function printFooter () {
    print ("</body>\n");
    print ("</html>\n");
}

if ($_REQUEST['verify'] === "true") {
    verify();
} else {
    loadPage();
}

?>
