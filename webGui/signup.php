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
$fNameError =
    $lNameError =
    $emailError =
    $phoneNumberError =
    $instNameError =
    $scpPubKeyError =
    $scpDstIpError =
    $scpUsernameError =
    $rtEmailAddress =
    $testRigUsernameError =
    $testRigPasswordError =
    $scpHostPathError =
    $scpPrivKeyError =
    $testRigPasswordConfirmError = "";

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
    $message .=  "Requestor information follows:\n";
    $message .= print_r($input, true);
    $headers = 'From: testrig@psc.edu' . "\r\n" .
    'Reply-To: rapier@psc.edu' . "\r\n" .
    'X-Mailer: PHP/' . phpversion();
    mail($to, $subject, $message, $headers);
    return 1;
}

//check if required variables are empty. Empty? Alert user. Provided? Pass to input scrubber

$errFlag = 0;
if ($_SERVER["REQUEST_METHOD"] == "POST")
    {
        if (empty($_REQUEST["fName"]))
            {
                $fNameError = "You must provide your first name";
                $errFlag = 1;
            }
        
        if (empty($_REQUEST["lName"]))
            {
                $lNameError = "You must provide your last name";
                $errFlag = 1;
            }
        
        if (empty($_REQUEST["email"]))
            {
                $emailError = "You must provide your email address";
                $errFlag = 1;
            }
        
        if (empty($_REQUEST["phoneNumber"]))
            {
                $phoneNumberError = "You must provide a phone number";
                $errFlag = 1;
            }
        
        if (empty($_REQUEST["instName"]))
            {
                $instNameError = "You must provide your institution's name";
                $errFlag = 1;
            }
        
        if (empty($_REQUEST["scpUsername"]))
            {
                $scpUsernameError = "You must provide an SCP-only account username";
                $errFlag = 1;
            }
        
        if (empty($_REQUEST["scpDstIp"]))
            {
                $scpDstIpError = "You must provide the IP of transfer host";
                $errFlag = 1;
            }
        
        if (empty($_REQUEST["scpPubKey"])){
            $scpPubKeyError = "You must provide a public SCP key";
            $errFlag = 1;
        } elseif (verifyKey($_REQUEST["scpPubKey"]) != 1) {
            $scpPubKeyError = "The SCP public key you provided is not valid.";
            $errFlag = 1;
        }
        
        if (empty($_REQUEST["testRigUsername"]))
            {
                $testRigUsernameError = "You must choose a username";
                $errFlag = 1;
            }
        
        if (empty($_REQUEST["testRigPassword"]))
            {
                $testRigPasswordError = "You must provide a password";
                $errFlag = 1;
            }
        
        if ($_REQUEST["testRigPassword"] != $_REQUEST["testRigPasswordConfirm"])
            {
                $testRigPasswordConfirmError = "passwords do not match";
                $errFlag = 1;
            }


	if (empty($_REQUEST["scpHostPath"]))
            {
                $scpHostPathError = "You must provide a path for SCP data";
                $errFlag = 1;
            }

        if (empty($_REQUEST["scpPrivKey"]))
            {
                $scpPrivKeyError = "You must provide a private key";
                $errFlag = 1;
            }

        if ($errFlag != 1)
            {
                $inputs["fName"] = scrubInput($_REQUEST["fName"]);
                $inputs["lName"] = scrubInput($_REQUEST["lName"]);
                $inputs["email"] = scrubInput($_REQUEST["email"]);
                $inputs["testRigUsername"] = scrubInput($_REQUEST["testRigUsername"]);
                $inputs["phoneNumber"] = scrubInput($_REQUEST["phoneNumber"]);
                $inputs["instName"] = scrubInput($_REQUEST["instName"]);
                $inputs["scpUsername"] = scrubInput($_REQUEST["scpUsername"]);
                $inputs["scpDstIp"] = scrubInput($_REQUEST["scpDstIp"]);
                $inputs["scpPubKey"] = scrubInput($_REQUEST["scpPubKey"]);
                $inputs["rtEmailAddress"] = scrubInput($_REQUEST["rtEmailAddress"]);
		$inputs["scpPrivKey"] = scrubInput($_REQUEST["scpPrivKey"]);
		$inputs["scpHostPath"] = scrubInput($_REQUEST["scpHostPath"]);
                //hash the password
                $inputs["testRigPassword"] =  password_hash($_REQUEST["testRigPassword"], PASSWORD_BCRYPT);
                //echo "You entered:<hr>First Name:  ".$inputs["fName"]. "<br>Last Name:  " . $inputs["lName"]. "<br>Email:  " . $inputs["email"] . "<br>Phone:  " . $inputs["phoneNumber"] . "<br>Institution:  " . $inputs["instName"] . "<br>SCP Username:  " .$inputs["scpUsername"]. "<br>Dst IP:  " .$inputs["scpDstIp"]. "<br>Key:  " . $inputs["scpPubKey"] . "<br>" . "Password: " . $inputs["testRigPassword"] . "<br>" . $inputs["scpPrivKey"] . "<br>" . $inputs["scpHostPath"]. "<br>";


                //insert this shit into the DB
                if (insertIntoDB($inputs)) {
                    if (triggerNotification($inputs)) {
                        echo "Your subscription request to TestRig2.0 has been received. Please allow 1 ";
                        echo "business day to process the request and receive approval notification.";
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

<nav class="navbar navbar-inverse navbar-fixed-top">
                <div class="container">
                        <div class="navbar-header">
                                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                                  <span class="sr-only">Toggle navigation</span>
                                  <span class="icon-bar"></span>
                                  <span class="icon-bar"></span>
                                  <span class="icon-bar"></span>
                                </button>
                                <a class="navbar-brand" href="#">Testrig 2.0</a>
                        </div>
                        <div id="navbar" class="collapse navbar-collapse">
                                  <ul class="nav navbar-nav">
                                  <li><a id="menu-home" href="#home">Home</a></li>
                                  <li><a id="menu-about" href="#about">About</a></li>
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
	<input type="text" name="fName" id="fName" class="form-control" value="<?php echo $_REQUEST['fName']?>"> <?php echo $fNameError ?></div>

        <div class="form-group"> <label for="lName">Last Name*:</label>
	<input type="text" name="lName" id="lName" class="form-control" value="<?php echo $_REQUEST['lName']?>"> <?php echo $lNameError ?></div>

        <div class="form-group"> <label for="email">Email*:</label>
	<input type="email" name="email" id="email" class="form-control" value="<?php echo $_REQUEST['email']?>"> <?php echo $emailError ?> </div>

        <div class="form-group"> <label for="testRigUsername">TestRig Username*:</label>
	<input type="text" name="testRigUsername" id="testRigUsername" class="form-control" value="<?php echo $_REQUEST['testRigUsername']?>"> <?php echo $testRigUsernameError ?></div>

        <div class="form-group"> <label for="testRigPassword">TestRig Password*:</label>
	<input type="password" name="testRigPassword" id="testRigPassword" class="form-control"> <?php echo $testRigPasswordError ?></div>

        <div class="form-group"> <label for="testRigPasswordConfirm">repeat password:<label>
	<input type="password" name="testRigPasswordConfirm" id="testRigPasswordConfirm" class="form-control"> <?php echo $testRigPasswordConfirmError ?></div>

        <div class="form-group"> <label for="phoneNumber">Phone Number*:</label>
	<input type="text" name="phoneNumber" id="phoneNumber" class="form-control"  value="<?php echo $_REQUEST['phoneNumber']?>"> <?php echo $phoneNumberError ?> </div>

        <div class="form-group"> <label for="instName">Institution Name*:</label>
	<input type="text" name="instName" id="instName" class="form-control" value="<?php echo $_REQUEST['instName']?>"> <?php echo $instNameError ?></div>

        <div class="form-group"> <label for="rtEmailAddress">RT Email Address:</label>
	<input type="text" name="rtEmailAddress" id="rtEmailAddress" class="form-control" value="<?php echo $_REQUEST['rtEmailAddress']?>"> </div>

        <div class="form-group"> <label for="scpUsername">SCP Username:</label>
	<input type="text" name="scpUsername" id="scpUsername" class="form-control" value="<?php echo $_REQUEST['scpUsername']?>"> <?php echo $scpUsernameError ?></div>

        <div class="form-group"> <label for="scpDstIp">SCP Dst IP:</label>
	<input type="text" name="scpDstIp" id="scpDstIp" class="form-control" value="<?php echo $_REQUEST['scpDstIp']?>"> <?php echo $scpDstIpError ?></div>

        <div class="form-group"> <label for="scpPubKey">SCP Public Key*:</label>
	<input type="textarea" name="scpPubKey" id="scpPubKey" class="form-control"> <?php echo $scpPubKeyError ?> </div>

        <div class="form-group"> <label for="scpPrivKey">SCP Private Key*:</label>
        <input type="textarea" name="scpPrivKey" id="scpPrivKey" class="form-control"> <?php echo $scpPrivKeyError ?> </div>

        <div class="form-group"> <label for="scpHostPath">SCP Destination Absolute Path*:</label>
        <input type="textarea" name="scpHostPath" id="scpHostPath" class="form-control"> <?php echo $hostPathError ?> </div>



    <br> <button type="submit" class="btn btn-lg btn-success">Create Account</button>
</form>
</div>
<div id="keepformCenter" class="col-md-2">
</div>
</body>


</html>
    
