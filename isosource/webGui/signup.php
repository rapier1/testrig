<html>

<head>
<title> PHP Form Process </title>
</head>

<body>
<?php
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
	'scpDstIp' => "",
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
                           tr_password, inst_pub_key,
                           inst_data_host, inst_host_uname,
                           tt_system, approved)
		       VALUES (?, ?,
                       ?, ?,
                       ?, ?,
                       ?, ?,
                       ?, ?,
                       ?, 0)";
        $statement = $dbLink->prepare($cmd);
		$statement->execute(array($cleanedInputs["instName"], $cleanedInputs["fName"],
                                  $cleanedInputs["lName"], $cleanedInputs["phoneNumber"],
                                  $cleanedInputs["email"],$cleanedInputs["testRigUsername"],
                                  $cleanedInputs["testRigPassword"], $cleanedInputs["scpPubKey"],
                                  $cleanedInputs["scpDstIp"], $cleanedInputs["scpUsername"],
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
    $to = "rapier@psc.edu, nate@psc.edu";
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
                //hash the password
                $inputs["testRigPassword"] =  password_hash($_REQUEST["testRigPassword"], PASSWORD_BCRYPT);
                //echo "You entered:<hr>First Name:  ".$inputs["fName"]. "<br>Last Name:  " . $inputs["lName"]. "<br>Email:  " . $inputs["email"] . "<br>Phone:  " . $inputs["phoneNumber"] . "<br>Institution:  " . $inputs["instName"] . "<br>SCP Username:  " .$inputs["scpUsername"]. "<br>Dst IP:  " .$inputs["scpDstIp"]. "<br>Key:  " . $inputs["scpPubKey"] . "<br>" . "Password: " . $inputs["testRigPassword"] . "<br>";
                
                
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


<div id="inputSection" name="inputSection">
<form id="contactInformation" name="contactInformation" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" method="post">
    <fieldset>
    <legend>Contact Information</legend>
    * required fields <br>
    First Name*: <input type="text" name="fName" id="fName" value="<?php echo $_REQUEST['fName']?>"> <?php echo $fNameError ?><br>
    Last Name*: <input type="text" name="lName" id="lName" value="<?php echo $_REQUEST['lName']?>"> <?php echo $lNameError ?><br>
    Email*: <input type="text" name="email" value="<?php echo $_REQUEST['email']?>"> <?php echo $emailError ?> <br>
    TestRig Username: <input type="text" name="testRigUsername" id="testRigUsername" value="<?php echo $_REQUEST['testRigUsername']?>"> <?php echo $testRigUsernameError ?><br>
    TestRig Password: <input type="password" name="testRigPassword" id="testRigPassword"> <?php echo $testRigPasswordError ?><br>
    repeat password:  <input type="password" name="testRigPasswordConfirm" id="testRigPasswordConfirm"> <?php echo $testRigPasswordConfirmError ?><br>
    Phone Number*: <input type="text" name="phoneNumber" id="phoneNumber" value="<?php echo $_REQUEST['phoneNumber']?>"> <?php echo $phoneNumberError ?> <br>
    Institution Name*: <input type="text" name="instName" id="instName" value="<?php echo $_REQUEST['instName']?>"> <?php echo $instNameError ?><br>
    RT Email Address: <input type="text" name="rtEmailAddress" id="rtEmailAddress" value="<?php echo $_REQUEST['rtEmailAddress']?>"> <br>
    SCP Username: <input type="text" name="scpUsername" id="scpUsername" value="<?php echo $_REQUEST['scpUsername']?>"> <?php echo $scpUsernameError ?><br>
    SCP Dst IP: <input type="text" name="scpDstIp" id="scpDstIp" value="<?php echo $_REQUEST['scpDstIp']?>"> <?php echo $scpDstIpError ?><br>
    SCP Public Key*: <input type="textarea" name="scpPubKey" id="scpPubKey"> <?php echo $scpPubKeyError ?> <br>
    <br> <input type="submit" value="Submit">
    </fieldset>
</form>
</div>
<div id="outputSection" name="outputSection">

</div>
</body>


</html>
    