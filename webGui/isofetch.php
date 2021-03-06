<?php 
/*
 * Copyright (c) 2017 The Board of Trustees of Carnegie Mellon University.
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
// the pass phase matches the proffered hash then
// the file corresponding to the UUID will be tendered
// for download

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
    $isoname = "TestRig2.0-" . $uuid . ".iso";
    $iso = $isopath . $isoname;

    // does the hashed offer match the known hash?
    // note the use of the special comparator here
    if ($known_hash === hash("sha256", $offer)) {
        // does the iso exist?
        if (is_file($iso)) {
            $size = filesize($iso);
            $file = @fopen($iso, "rb");
            if ($file) {
                header("Pragma: public");
                header("Expires: -1");
                header("Cache-Control: public, must-revalidate, post-check=0, pre-check=0");
                header("Content-Disposition: attachment; filename=\"$isoname\"");
                header("Content-Type: application/octect-stream");
                header("Refresh: 0; url='$PHP_SELF?complete=true&uuid=$uuid'");
                while(!feof($file)) {
                    print (@fread($file, 1024*8));
                    ob_flush();
                    flush();
                }
                fclose($file);
            } else {
                // file couldn't be opened
                printHeader ();
                print ("The TestRig2 ISO you are reqeusting has a problem and can not be sent ");
                print ("to you at this time. Please contact your network administrator and inform ");
                print ("them of this problem.");
                printFooter ();
                exit;
            }
        } else {
            // file doesn't exist
            printHeader ();
            print ("The TestRig2 ISO you are requesting no longer exists on this server.<br>");
            print ("TestRig2 ISOs are only valid for a set period of time and it is possible ");
            print ("that the requested ISO  has already expired. Please request a new one from your ");
            print ("network administrator</br>");
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
    print ("<title>TestRig 2.0 ISO Pickup</title>\n");
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
