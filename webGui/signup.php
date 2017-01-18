<!DOCTYPE html>
<html lang="en">
  <head>
                        <meta charset="utf-8">
                        <meta http-equiv="X-UA-Compatible" content="IE=edge">
                        <meta name="viewport" content="width=device-width, initial-scale=1">
                        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
                           <meta name="description" content="TestRig 2">
                           <meta name="author" content="Pittsburgh Supercompuing Center">
                           <link rel="icon" href="../../favicon.ico">
        <title>TestRig 2 - Sign Up Today!</title>
                        <!-- Bootstrap core CSS -->
                            <link href="bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
                        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
                            <link href="bootstrap/assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">
                        <!-- Custom styles for TestRig 2.0 template -->
                            <link href="trstylesheet.css" rel="stylesheet">
                        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
                            <!--[if lt IE 9]>
                                <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
                                <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
                            <![endif]-->


</head>

<body>
<?php

//is the user currently signed in?
if (!empty($_SESSION["username"]))
        {
                header("Location:http://". $_SERVER['SERVER_NAME'] ."/main.php");
		
        }

// hide notices
@ini_set('error_reporting', E_ALL & ~ E_NOTICE);
//init variables for form validation
//required variables
$inputs = array(
	'fName' => "",
	'lName' => "",
	'email' => "",
	'testRigUsername' => "",
	'testRigPassword' => "",
	'phoneNumber' => "",
	'instName' => "",
	'scpPubKey' => "",
	'scpPrivKey' => "",
	'scpDstIp' => "",
	'scpHostPath' => "",
	'scpUsername' => "",
	'rtEmailAddress' => "");

// initialize variables
$inputErrors = array(
	'fName' => "",
	'lName' => "",
	'email' => "",
	'testRigUsername' => "",
	'testRigPassword' => "",
	'phoneNumber' => "",
	'instName' => "",
	'scpPubKey' => "",
	'scpPrivKey' => "",
	'scpDstIp' => "",
	'scpHostPath' => "",
	'scpUsername' => "",
	'rtEmailAddress' => "");

$errFlag = -1; //init as -1 to indicate page being loaded prior to form submission. (do not validate fields yet because they are all empty)
$errMsg = "";

//database-related variables
$dbHost = "192.168.122.1"; //ionia's private IP
$username = "testrig";
$password = "tinycats";
$dbname = "testrig";

//input scrubber
function scrubInput($data)
{
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}

//function to verify validity of ssh public key
function verifyKey($key) {
     // we are going to shell out to ssh-keygen and use that to
    // verify the validity of the key.
    // first we need to sanitize the key input string since slashes are
    // part of the normal key format we can't use that. We really only need to
    // look for single and double quotes. If they exist then it's not a valud key
    // but someone trying to be funny because they are trying to
    // close the quotes on the echo statement
    if (strpos($key, "'") !== false) {
        return 0;
    }
    if (strpos($key, "\"") != false) {
        return 0;
    }
    $cmd = "echo \"$key\" | /usr/bin/ssh-keygen -lf - 2>&1";
 
    $needle = "public";
    // note even if someone tries ot sneak in a command into the
    // key variable it's quoted and in an echo
    $output = exec($cmd);
    // if the word public is found in the output string then
    // the ssh key provided is not valid
    if (strpos($output, "public") !== false) {
         return 0;
    }
    return 1;
}

//function for inserting values into the database
function insertIntoDB($cleanedInputs)
{
	//database-related variables
	$dbHost = "192.168.122.1"; //ionia's private IP
	$username = "testrig";
	$password = "tinycats";
	$dbname = "testrig";
    //this function is basically a giant try/catch
    try {
	   	$dbLink = new PDO("mysql:host=$dbHost;dbname=$dbname", $username, $password);
	   	//error mode for PDO is exception
	   	$dbLink->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $cmd = "INSERT INTO customer
                          (inst_name, contact_fname,
                           contact_lname, contact_phone,
                           contact_email, tr_username,
                           tr_password, inst_pub_key, inst_priv_key,
                           inst_data_host, inst_host_uname, inst_host_path,
                           tt_system, approved)
		       VALUES (?, ?,
        	               ?, ?,
                	       ?, ?,
                	       ?, ?,
                	       ?, ?,
			       ?, ?,
                	       ?, 0)";
        $statement = $dbLink->prepare($cmd);
		$statement->execute(array($cleanedInputs["instName"], $cleanedInputs["fName"],
                                  $cleanedInputs["lName"], $cleanedInputs["phoneNumber"],
                                  $cleanedInputs["email"],$cleanedInputs["testRigUsername"],
                                  $cleanedInputs["testRigPassword"], $cleanedInputs["scpPubKey"], $cleanedInputs["scpPrivKey"],
                                  $cleanedInputs["scpDstIp"], $cleanedInputs["scpUsername"], $cleanedInputs["scpHostPath"],
                                  $cleanedInputs["rtEmailAddress"]));
    }
    catch(PDOException $e) {
        
	   	echo "<h1> Oops! Something went wrong while interacting with the database:</h1> <br>"
            . $e->getMessage();
        return 0;
    }
    $dbLink = null;
    return 1;
}

// we need to contact the TestRig admins that a new user has requested access
// easiest to use the mail function but that requires a local instance of sendmail
function triggerNotification ($input) {
    $to = "rapier@psc.edu, nate@psc.edu, blearn@psc.edu";
    $subject = "New Testrig User Request Received";
    $message = "We have recived a new user request the Testrig Service.\n";
    $message .= "Requestor information follows.\n\n";
    $message .= "User: $input[fName] $input[lName]\n";
    $message .= "Email: $input[email]\n";
    $message .= "Username: $input[testRigUsername]\n";
    $message .= "Institution: $input[instName]\n";
    $message .= "Phone: $input[phoneNumber]\n";
    $message .= "SCP host: $input[scpDstIp]\n";
    $message .= "SCP path: $input[scpHostPath]\n";
    $message .= "SCP user: $input[scpUsername]\n";
    $message .= "RT address: $input[rtEmailAddress]\n";
    $headers = 'From: testrig@psc.edu' . "\r\n" .
    'Reply-To: rapier@psc.edu' . "\r\n" .
    'X-Mailer: PHP/' . phpversion();
    mail($to, $subject, $message, $headers);
    return 1;
}

// generate the public and private keys for use with the ISO
function generateSSHKeys() {
// generate private key
    $privKey = openssl_pkey_new(array(
        'private_key_bits' => 2048,
        'private_key_type' => OPENSSL_KEYTYPE_RSA
    ));
    openssl_pkey_export($privKey, $pem); // convert to pem encoding
    $pubKey = sshEncodePublicKey($privKey);
    return array($pem, $pubKey);
}

// convert the private key into a openssh format publickey
function sshEncodePublicKey($privKey)
{
    $keyInfo = openssl_pkey_get_details($privKey);

    $buffer  = pack("N", 7) . "ssh-rsa" . 
               sshEncodeBuffer($keyInfo['rsa']['e']) . 
               sshEncodeBuffer($keyInfo['rsa']['n']);

    return "ssh-rsa " . base64_encode($buffer); 
}

function sshEncodeBuffer($buffer)
{
    $len = strlen($buffer);
    if (ord($buffer[0]) & 0x80) {
        $len++;
        $buffer = "\x00" . $buffer;
    }

    return pack("Na*", $len, $buffer);
}

function emailPubKey($pubKey, $email) {
    $message = "Hello TestRig 2.0 Customer!\r\n\r\n";
    $message .= "At the end of this message you will find a public openssh format key.\r\n";
    $message .= "You will need to copy this key into a file named authorized_keys and place it\r\n";
    $message .= "a directory named .ssh in the top level directory of the account\r\n";
    $message .= "that will recieve the completed TestRig 2.0 diagnostic datasets.\r\n";
    $message .= "\r\n\r\nOpenSSH Public Key:\r\n";
    $message .= "$pubKey";
    $subject = "TestRig 2.0 Public Key Enclosed";
    $headers = 'From: testrig@psc.edu' . "\r\n" .
    'Reply-To: testrig@psc.edu' . "\r\n" .
    'X-Mailer: PHP/' . phpversion();

    mail($email, $subject, $message, $headers);
}

//check if required variables are empty. Empty? Alert user. Provided? Pass to input scrubber
if ($_SERVER["REQUEST_METHOD"] == "POST")
    {
        $errFlag = 0; //assume success until error found.
        if (empty($_REQUEST["fName"]))
            {
                $inputErrors["fName"] = "You must provide your first name";
                $errFlag = 1;
            }
        
        if (empty($_REQUEST["lName"]))
            {
                $inputErrors["lName"] = "You must provide your last name";
                $errFlag = 1;
            }
        
        if (empty($_REQUEST["email"]))
            {
                $inputErrors["email"] = "You must provide your email address";
                $errFlag = 1;
            }
        
        if (empty($_REQUEST["phoneNumber"]))
            {
                $inputErrors["phoneNumber"] = "You must provide a phone number";
                $errFlag = 1;
            }
        
        if (empty($_REQUEST["instName"]))
            {
                $inputErrors["instName"] = "You must provide your institution's name";
                $errFlag = 1;
            }
        
        if (empty($_REQUEST["scpUsername"]))
            {
                $inputErrors["scpUsername"] = "You must provide an SCP-only account username";
                $errFlag = 1;
            }
        
        if (empty($_REQUEST["scpDstIp"]))
            {
                $inputErrors["scpDstIp"] = "You must provide the IP of transfer host";
                $errFlag = 1;
            }
        
//        if (empty($_REQUEST["scpPubKey"])){
//            $scpPubKeyError = "You must provide a public SCP key";
//            $errFlag = 1;
//        } elseif (verifyKey($_REQUEST["scpPubKey"]) != 1) {
//            $scpPubKeyError = "The SCP public key you provided is not valid.";
//            $errFlag = 1;
//        }
        
        if (empty($_REQUEST["testRigUsername"]))
            {
                $inputErrors["testRigUsername"] = "You must choose a username";
                $errFlag = 1;
            }
        
        if (empty($_REQUEST["testRigPassword"]))
            {
                $inputErrors["testRigPassword"] = "You must provide a password";
                $errFlag = 1;
            }
        
        if ($_REQUEST["testRigPassword"] != $_REQUEST["testRigPasswordConfirm"])
            {
                $inputErrors["testRigPassword"] = "Passwords do not match";
                $errFlag = 1;
            }


	if (empty($_REQUEST["scpHostPath"]))
            {
                $inputErrors["scpHostPath"] = "You must provide a path for SCP data";
                $errFlag = 1;
            }

//        if (empty($_REQUEST["scpPrivKey"]))
//           {
//                $scpPrivKeyError = "You must provide a private key";
//                $errFlag = 1;
//            }
            // implode error messages into one string
            $errMsg = implode("<br>", array_filter($inputErrors));
        if ($errFlag == 0)
            {
                // All the inputs have been validated so generate the ssh keys
                list ($inputs["scpPrivKey"], $inputs["scpPubKey"]) = generateSSHKeys();
                $inputs["fName"] = scrubInput($_REQUEST["fName"]);
                $inputs["lName"] = scrubInput($_REQUEST["lName"]);
                $inputs["email"] = scrubInput($_REQUEST["email"]);
                $inputs["testRigUsername"] = scrubInput($_REQUEST["testRigUsername"]);
                $inputs["phoneNumber"] = scrubInput($_REQUEST["phoneNumber"]);
                $inputs["instName"] = scrubInput($_REQUEST["instName"]);
                $inputs["scpUsername"] = scrubInput($_REQUEST["scpUsername"]);
                $inputs["scpDstIp"] = scrubInput($_REQUEST["scpDstIp"]);
                //$inputs["scpPubKey"] = scrubInput($_REQUEST["scpPubKey"]);
                $inputs["rtEmailAddress"] = scrubInput($_REQUEST["rtEmailAddress"]);
                //$inputs["scpPrivKey"] = scrubInput($_REQUEST["scpPrivKey"]);
                $inputs["scpHostPath"] = scrubInput($_REQUEST["scpHostPath"]);
                //hash the password
                $inputs["testRigPassword"] =  password_hash($_REQUEST["testRigPassword"], PASSWORD_BCRYPT);
                //echo "You entered:<hr>First Name:  ".$inputs["fName"]. "<br>Last Name:  " . $inputs["lName"]. "<br>Email:  " . $inputs["email"] . "<br>Phone:  " . $inputs["phoneNumber"] . "<br>Institution:  " . $inputs["instName"] . "<br>SCP Username:  " .$inputs["scpUsername"]. "<br>Dst IP:  " .$inputs["scpDstIp"]. "<br>Key:  " . $inputs["scpPubKey"] . "<br>" . "Password: " . $inputs["testRigPassword"] . "<br>" . $inputs["scpPrivKey"] . "<br>" . $inputs["scpHostPath"]. "<br>";


                //insert this shit into the DB
                if (insertIntoDB($inputs)) {
                    if (triggerNotification($inputs)) {
                        echo "Your subscription request to TestRig2.0 has been received. Please allow 1 ";
                        echo "business day to process the request and receive approval notification.";
                        echo "Your SSH public key will be mailed to the supplied contact address shortly.";
                        emailPubKey($inputs["scpPubKey"], $inputs["email"]);
                    } else {
                        echo "The attempt to send notification of your request failed.";
                    }
                } else {
                    echo "There was a problem processing your request.";
                }
            }
    }
//end PHP input validation
?>

    <!-- Modals for warning and error messages -->
    <div id="successModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title"><p class="text-success">Success!</p></h4>
                </div>
                <div class="modal-body">
                    <p id="successModalText" class="text-success">Something good happened.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <div id="warnModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">Oops..</h4>
                </div>
                <div class="modal-body">
                    <p id="warnModalText" class="text-warning">Giving you a warning.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <div id="errorModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">Oops..</h4>
                </div>
                <div class="modal-body">
                    <p id="errorModalText" class="text-danger">Oh no an error occurred.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

<nav class="navbar navbar-inverse navbar-fixed-top">
                <div class="container">
                        <div class="navbar-header">
                                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                                  <span class="sr-only">Toggle navigation</span>
                                  <span class="icon-bar"></span>
                                  <span class="icon-bar"></span>
                                  <span class="icon-bar"></span>
                                </button>
                                <a class="navbar-brand" href="http://<?php echo $_SERVER['SERVER_NAME']?>/index.php">Testrig 2.0</a>
                        </div>
                        <div id="navbar" class="collapse navbar-collapse">
                                  <ul class="nav navbar-nav">
                                  <li><a id="menu-home" href="http://<?php echo $_SERVER['SERVER_NAME']?>/index.php">About</a></li>
                                </ul>
				<p class="navbar-right navbar-btn"><button id="logout" onClick="window.location='http://<?php echo $_SERVER['SERVER_NAME']?>/login.php'"  type="button" class="btn btn-sm btn-primary">Log In</button></p>
                        </div><!--/.nav-collapse -->
                </div> <!-- END nav container -->
        </nav>





<div id="customer-signup-div" class = "container">
	<h1 class="text-center starter-template">Register New Account</h1>
<div id="padding-left" class="col-md-2">
</div>
<form id="contactInformation" role="form" class="form-horizontal col-md-8" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" method="post">
    * required fields <br>
	<div class="form-group"> <label for="fName"> First Name*:</label>
	<input type="text" name="fName" id="fName" class="form-control" value="<?php echo $_REQUEST['fName']?>"> </div>

        <div class="form-group"> <label for="lName">Last Name*:</label>
	<input type="text" name="lName" id="lName" class="form-control" value="<?php echo $_REQUEST['lName']?>"> </div>

        <div class="form-group"> <label for="email">Email*:</label>
	<input type="email" name="email" id="email" class="form-control" value="<?php echo $_REQUEST['email']?>">  </div>

        <div class="form-group"> <label for="testRigUsername">TestRig Username*:</label>
	<input type="text" name="testRigUsername" id="testRigUsername" class="form-control" value="<?php echo $_REQUEST['testRigUsername']?>"> </div>

        <div class="form-group"> <label for="testRigPassword">TestRig Password*:</label>
	<input type="password" name="testRigPassword" id="testRigPassword" class="form-control"> </div>

        <div class="form-group"> <label for="testRigPasswordConfirm">repeat password:<label>
	<input type="password" name="testRigPasswordConfirm" id="testRigPasswordConfirm" class="form-control"></div>

        <div class="form-group"> <label for="phoneNumber">Phone Number*:</label>
	<input type="text" name="phoneNumber" id="phoneNumber" class="form-control"  value="<?php echo $_REQUEST['phoneNumber']?>"></div>

        <div class="form-group"> <label for="instName">Institution Name*:</label>
	<input type="text" name="instName" id="instName" class="form-control" value="<?php echo $_REQUEST['instName']?>"> </div>

        <div class="form-group"> <label for="rtEmailAddress">RT Email Address:</label>
	<input type="text" name="rtEmailAddress" id="rtEmailAddress" class="form-control" value="<?php echo $_REQUEST['rtEmailAddress']?>"> </div>

        <div class="form-group"> <label for="scpUsername">SCP Username*:</label>
	<input type="text" name="scpUsername" id="scpUsername" class="form-control" value="<?php echo $_REQUEST['scpUsername']?>"></div>

        <div class="form-group"> <label for="scpDstIp">SCP Dst IP*:</label>
	<input type="text" name="scpDstIp" id="scpDstIp" class="form-control" value="<?php echo $_REQUEST['scpDstIp']?>"> </div>

<!--        <div class="form-group"> <label for="scpPubKey">SCP Public Key*:</label>
	<input type="textarea" name="scpPubKey" id="scpPubKey" class="form-control">  </div>

        <div class="form-group"> <label for="scpPrivKey">SCP Private Key*:</label>
        <input type="textarea" name="scpPrivKey" id="scpPrivKey" class="form-control">  </div>
-->
        <div class="form-group"> <label for="scpHostPath">SCP Destination Absolute Path*:</label>
        <input type="textarea" name="scpHostPath" id="scpHostPath" class="form-control"></div>



    <br> <button type="submit" class="btn btn-lg btn-success">Create Account</button>
</form>
</div>
<div id="keepformCenter" class="col-md-2">
</div>
</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="bootstrap/dist/js/bootstrap.min.js"></script>
<script src="trmodals.js"></script>
<script>
     <?php
        print "modalSetFormSrc(\"signUp\");";
        print "signUpFormInfo(".$errFlag.", \"".$errMsg."\");";
        print "console.log(\"".$_SERVER["REQUEST_METHOD"]."\");";
    ?>   
</script>
</html>
    
