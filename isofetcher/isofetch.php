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
//@ini_set('zlib.output_compression', 'Off');

$isopath = "/var/testrig/isos/";

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
    $isoname = "testrig2-" . $uuid . ".iso";
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
                while(!feof($file)) {
                    print (@fread($file, 1024*8));
                    ob_flush();
                    flush();
                }
            } else {
                // file couldn't be opened
                header("HTTP/1.0 500 Internal Server Error");
                exit;
            }
        } else {
            // file doesn't exist
            header("HTTP/1.0 404 Internal Server Error");
            exit;
        }
    } else {
        print "Passphase mismatch!";
        exit;
    }
}

function loadPage () {
    printHeader();
    // make sure we have the necessary incoming data
    if(!isset($_REQUEST['known_hash']) || empty($_REQUEST['cc'])) {
        //missing_data();
    }
    $known_hash = $_REQUEST['known_hash'];
    
    if(!isset($_REQUEST['uuid']) || empty($_REQUEST['uuid'])) {
        //missing_data();
    }
    $uuid = $_REQUEST['uuid'];
    
    print ("<form method='post' action='$PHP_SELF'>\n");
    print ("Passphrase from e-mail:");
    print ("<input type='text' size='24' maxlength='24' name='offer'>\n<br>\n");
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

if ($_REQUEST[verify]) {
    verify();
} else {
    loadPage();
}

?>
