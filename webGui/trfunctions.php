<?php

//Server input scrubber
function scrubInput($data)
{
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}//END scrubInput


function buildDiv($divID, $dbTableName, $fields)
{
    //this function will arbitraily build div elements from passed-in arguments
    //	$divID will be the ID of the div created
    //	$divID+"Table" will the be ID of the table within the new div element
    //	$dbTableName is the MySQL table you are selecting from
    //	$fields is an array of fields that you want to select from the DB
    // *RETURN VALUE*: string of HTML which contains a div element and a table composed of
    //		 returned values from the given query

    //need an ID that isn't the same as the div for the table element
    $htmlTableID = $divID . "Table";

    //Create our Database Handler, $dbh
    $DB_HOST = "192.168.122.1"; //ionia's private IP
    $DB_USERNAME = "testrig";
    $DB_PASSWORD = "tinycats";
    $DB_NAME = "testrig";
    $dbh = new PDO("mysql:host=$DB_HOST;dbname=$DB_NAME", $DB_USERNAME, $DB_PASSWORD);

    $fieldString = "";
    //Assemble list of fields to retrieve in our select statement (last field can't have a comma!)
    for ($count=0; $count < count($fields); $count++)
        {
			//is this the last element? NO COMMA!
			if ($count == (count($fields) - 1))
                {
                    $fieldString = $fieldString . $fields[$count];
                }
			else //slap a comma on that shit
                {
                    $fieldString = $fieldString . $fields[$count] . ", ";
                }
        }//END field assembly

    //now that we have a string of fields, assemble the query ******CID 5 IS A DUMMY VALUE FOR TESTING - CHANGE IT*****
    $stmnt = "SELECT " . $fieldString . " FROM " . $dbTableName . " WHERE cid = " . $_SESSION["CID"];
    $results = $dbh->query($stmnt);
    //create a div and html table with our query results
    $newDiv = "<div id='$divID' >
			   <table id='$htmlTableID' class='table'>
			   <tr>";
		//create column headers based on $fields
		for ($counter = 0; $counter < count($fields); $counter++) //assemble each column of the new row
            {
                $newDiv = $newDiv . "<th>$fields[$counter]</th>";
            }

		$newDiv = $newDiv . "</tr>";
		//fill in the table with the results from the query
		foreach ($results as $row) //go row-by-row through returned query
            {
                $newRow = "<tr>";
                for ($counter = 0; $counter < count($fields); $counter++) //assemble each column of the new row
                    {
                        $newRow = $newRow . "<td>$row[$counter]</td>";
                    }
                $newDiv = $newDiv . $newRow . "</tr>";
            }
		//close the table and div tags!
        $newDiv = $newDiv . "</table></div>";

		return $newDiv;
}//END buildDiv



function logIn($username, $password)
{
    //Create our Database Handler, $dbh
    $DB_HOST = "192.168.122.1"; //ionia's private IP
    $DB_USERNAME = "testrig";
    $DB_PASSWORD = "tinycats";
    $DB_NAME = "testrig";
    $dbh = new PDO("mysql:host=$DB_HOST;dbname=$DB_NAME", $DB_USERNAME, $DB_PASSWORD);
    $errString = "Incorrect username/password combination";

    $stmnt = $dbh->prepare('SELECT tr_username, tr_password, cid, inst_name 
					FROM customer 
					WHERE tr_username = :username');
    $stmnt->bindParam(':username', $username, PDO::PARAM_STR);
    $stmnt->execute();
    $queryResult = $stmnt->fetch(PDO::FETCH_ASSOC); //returns FALSE if empty result
    if (!$queryResult) //Did we find a match to the submitted username?
        {
			print $errString;
        }
    else //found a username match, time to see if the password is correct
        {
			if (!password_verify($password, $queryResult["tr_password"])) //fail
                {
                    print $errString;
                }
			else //pass!
                {
                    //load relevant user info into the current session
                    $_SESSION["inst_name"] = $queryResult["inst_name"];
                    $_SESSION["username"] = $queryResult["tr_username"];
                    $_SESSION["CID"] = $queryResult["cid"];
                    header("Location:http://". $_SERVER['SERVER_NAME'] ."/main.php");
                    die();
                }
        }
}//END logIn

function generateUserInfo() 
{ 
    //we could populate this more. With what, idk yet -N
    $welcomeMessage = "Greetings, ". $_SESSION["username"]."!";
    $assocStr = $_SESSION["inst_name"] . " Test Rig";
    $welcomeDiv = '<div id="welcomeDiv">'. $welcomeMessage . '<br>'
        . $assocStr . '</div>';
    
    return $welcomeDiv;
    
}//END generateUserInfo()


function generateISORequestForm()
{
    //required variables
    $isoFormInputs = array(
        'username' => "",
        'email' => "",
        'phoneNumber' => "",
        'affiliation' => "",
        'scpPubKey' => "",
        'troubleTicket' => "",
        'testTargetIP' => "",
        'testCSV' => "",
        'maxRun' => "",
        'validToDate' => "",
	'queueName' => "");

    $isoFormInputErrors = array(
        'username' => "",
        'email' => "",
        'phoneNumber' => "",
        'affiliation' => "",
        'scpPubKey' => "",
        'troubleTicket' => "",
        'testTargetIP' => "",
        'testCSV' => "",
        'maxRun' => "",
        'validToDate' => "",
	'queueName' => "");

    //array of tests. We might be able to make this a little more
    //readable once we get a list of available tests(?) maybe read from DB(??)
    $allTests = array("Iperf", "Owping", "Ping", "Tcpdump", "Tracepath", "Traceroute");
    $isoFormInputErrFlag = 0;

    //has there been a request sent to the server?
    //are the variables empty?
    if ($_SERVER["REQUEST_METHOD"] == "POST")
        {
            if (empty($_REQUEST["isoTestTargetIP"]))
                {
                    $isoFormInputErrors["ipAddress"] = "You must provide an IP address";
                    $errFlag = 1;
                }

            if (empty($_REQUEST["isoMaxRun"]))
                {
                    $isoFormInputErrors["maxRun"] = "You must enter a maximum number of runs";
                    $errFlag = 1;
                }

            if ($_REQUEST["isoMaxRun"] < 1)
                {
                    $isoFormInputErrors["maxRun"] = "The maximum number of runs must be at least 1";
                    $errFlag = 1;
                }

            if ($_REQUEST["isoMaxRun"] > 25)
                {
                    $isoFormInputErrors["maxRun"] = "The maximum number of runs must be 25 or less";
                    $errFlag = 1;
                }

            if (empty($_REQUEST["isoValidToDate"]))
                {
                    $isoFormInputErrors["validToDate"] = "You must enter an expiration date for the ISO";
                    $errFlag = 1;
                }
		else {
                $format ="Y-m-d";
		$date = trim($_REQUEST["isoValidToDate"]);
                $time = strtotime($date);

                if (date($format, $time) != $date) {
                    $isoFormInputErrors["validToDate"] = "You entered and invalid date or date format.";
                    $errFlag = 1;
                }
            }
            
            if (empty($_REQUEST["isoTroubleTicket"]))
                {
                    $isoFormInputErrors["troubleTicket"] = "You must provide a Trouble Ticket Number";
                    $errFlag = 1;
                }
            
            if (empty($_REQUEST["isoUsername"]))
                {
                    $isoFormInputErrors["username"] = "You must provide the recipient's name";
                    $errFlag = 1;
                }
            
            if (empty($_REQUEST["isoEmail"]))
                {
                    $isoFormInputErrors["email"] = "You must provide an email address";
                    $errFlag = 1;
                }
            
            if (empty($_REQUEST["isoAffiliation"]))
                {
                    $isoFormInputErrors["affiliation"] = "You must list your affiliation";
                    $errFlag = 1;
                }

            if (empty($_REQUEST["testCheckbox_list"]))
                {
                    $isoFormInputErrors["testCSV"] = "You must select at least 1 test";
                    $errFlag = 1;
                }
            if (empty($_REQUEST["queueName"]))
         	{
                    $inputErrors["queueName"] = "Specify an RT Queue for RT integration";
         	}


            /////////////////////// CAN WE GENERATE THE ISO THEY JUST CONFIGURED? //////////////////////////////////////////////
            if ($errFlag != 1) //Has everything been successfully submitted?
                {
                    //have to assemble the tests in a csv
                    $count = 0;
                    $testString = "";
                    $checkedTests = $_REQUEST["testCheckbox_list"];
                    foreach ($checkedTests as $val)
                        {
                            $val = scrubInput($val); //just in case someone does something funky to the form
							if ($count == (count($checkedTests) - 1))
                                {
									$testString = $testString . $val;
                                }
							else //slap a comma on that shit
                                {
									$testString = $testString . $val . ", ";
                                }
                            $count++;
                        }//END foreach checkedTests

                    $inputs["username"] = scrubInput($_REQUEST["isoUsername"]);
                    $inputs["email"] = scrubInput($_REQUEST["isoEmail"]);
                    $inputs["troubleTicket"] = scrubInput($_REQUEST["isoTroubleTicket"]);
                    $inputs["target"] = scrubInput($_REQUEST["isoTestTargetIP"]);
                    $inputs["maxRun"] = scrubInput($_REQUEST["isoMaxRun"]);
                    $date = scrubInput($_REQUEST["isoValidToDate"]);
                    $inputs["validToDate"] = date("Y-m-d", strtotime($date));
                    $inputs["testCSV"] = $testString;

                    //everything is scrubbed and prepped for entry into the DB, so let's do this
                    if (insertNewISORequest($inputs)) {
                        if (!$_SESSION[CID] or !$_SESSION[UID]) {
                            echo "Missing necessary information (UID or CID) to build ISO.<p>";
                        } else {
                            // It turns out that exec has an issue with some versions of bash which prevents it
                            // from properly redirecting STDIN and STDERR to a file. This prevents exec from going into
                            // the background. Turns out this proc_close(proc_open()) trick does work. 
                            proc_close (proc_open ("/usr/bin/sudo /home/rapier/testrig/isobuilder/isobuilder.pl -f /home/rapier/testrig/isobuilder/isobuilder.cfg -c $_SESSION[CID] -u $_SESSION[UID] 2>&1 /dev/null &", Array (), $dummy_var));
                        }
                    } else {
                        echo "Failed to create new ISO!<p>";
                    }
                }//END successful submission if/then
            
        }//END request and empty var check
    
    $valid_date = date("m/d/Y", strtotime("+7 days"));     

    //$isoForm will hold the entire new <div> element
    //we have to do this in a few steps due to the need for PHP_SELF to be in quotes for the redirection to work correctly
	$serverURL = htmlspecialchars($_SERVER["PHP_SELF"]);

	$isoForm =	'<form role="form" id="isoRequest" class="form-horizontal" name="isoRequest" action="' . $serverURL;
	$isoForm = $isoForm . '" method="post">
			<legend>ISO Request Form </legend><small>* required fields </small>
			<div class="form-group">  <label for="isoTestTargetIP"> IP Address to test*:  </label>
			<input type="text" class="form-control" name="isoTestTargetIP" id="isoTestTargetIP" placeholder="Target IP address">' . $isoFormInputErrors["testTargetIP"] . '</div>

			<div class="form-group"> <label for="isoMaxRun">Maximum # of Runs:</label>
			<input type="text" class="form-control" name="isoMaxRun" id="isoMaxRun" value="7">' . $isoFormInputErrors["maxRun"] . '</div>

			<div class="form-group"> <label for="isoValidToDate">ISO Valid Until:</label>
			<input type="date" class="form-control" name="isoValidToDate" id="isoValidToDate" value="' . $valid_date . '" >' . $isoFormInputErrors["validToDate"] . '</div>

			<div class="form-group"> <label for="isoTroubleTicket">Trouble Ticket No.*:</label>
			<input type="text" class="form-control" name="isoTroubleTicket" id="isoTroubleTicket" placeholder="RT Ticket #">' . $isoFormInputErrors["troubleTicket"] . '</div>

			<div class="form-group"> <label for="isoUsername">Name*:</label>
			<input type="text" class="form-control" name="isoUsername" id="isoUsername" placeholder="username">' . $isoFormInputErrors["username"] . '</div>

			<div class="form-group"> <label for="isoEmail">Email*:</label>
			<input type="email" class="form-control" name="isoEmail" id="isoEmail" placeholder="user@emailaddress">' . $isoFormInputErrors["email"] . '</div>

			<div class="form-group"> <label for="isoAffiliation">Affiliation*:</label>
			<input type="text" class="form-control" name="isoAffiliation" id="isoAffiliation" placeholder="Organization Name">' . $isoFormInputErrors["affiliation"] . '</div>

			<div class="form-group"> <label for="queueName">RT Queue Name:</label>
			<input type="text" class="form-control" name="queueName" id="queueName" placeholder="Name of RT Queue"> <?php echo $inputErrors["queueName"]; ?> </div>
			Tests to run*: <br>';
    //break for assembling the checkbox list
	$testlist = "";
    //assemble the list of tests to choose from dynamically
    foreach ($allTests as $val)
        {
            $testList = $testList . '<div class="checkbox"><label><input type="checkbox" name="testCheckbox_list[]" id="testCheckbox_list[]" value=' . $val . '>'. $val .'</label>';
        }
    //$testList = $testList . '</ul>'; //Close the list of tests
    $isoForm = $isoForm . $testList; //add it to the form
    //finish the form
    $isoForm = $isoForm . '<br>' . $isoFormInputErrors["testCSV"] . '</div> <button type="submit" class="btn btn-primary">Generate New ISO</button></div></form>';
    
    return $isoForm;
    
}//END generateISORequestForm()    

function insertNewISORequest($cleanedInputs)
{
    //this function will insert parameters for an ISO into the test_parameters table
    //database-related variables
    $dbHost = "192.168.122.1"; //ionia's private IP
    $username = "testrig";
    $password = "tinycats";
    $dbname = "testrig";
    
	//generate a timestamp for the ISO's creation date
	date_default_timezone_set('UTC');
	$creationTimestamp = date('YmdHs');
    
    
	//actually attempt connecting to the database using PHP's PDO
    try
        {
			$dbLink = new PDO("mysql:host=$dbHost;dbname=$dbname", $username, $password);
			//error mode for PDO is exception
			$dbLink->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
			$cmd = "INSERT INTO testParameters
				  (cid, username,
                                   useremail, user_tt_id,
                                   requested_tests, creation_timestamp, 
                                   queue_name, target,
                                   maxrun, validtodate) 
				VALUES (?, ?, 
                                   ?, ?, 
                                   ?, ?, 
                                   ?, ?,
                                   ?, ?)";
			$statement = $dbLink->prepare($cmd);
            $CID = scrubInput($_SESSION["CID"]);
			$statement->execute(array( $CID,
                                $cleanedInputs["username"],
                                $cleanedInputs["email"],
                                $cleanedInputs["troubleTicket"],
                                $cleanedInputs["testCSV"],
                                $creationTimestamp,
                                $cleanedInputs["queueName"],
                                $cleanedInputs["target"],
                                $cleanedInputs["maxRun"],
                                $cleanedInputs["validToDate"]));
        }//END try
    catch(PDOException $e)
        {
			echo "<h1> Oops! Something went wrong while interacting with the database:</h1> <br>"
                . $e->getMessage();
			return 0;
        }
    $dbLink = null;
	//we need to add the UID of the recently created ISO to the session for the ISO creation to take place
    //since we have all of the other params for this iso, we can query for the combination of them and then get the UID
    //do we need a new db handle? -> yup, it wouldn't work unless I made a new one
    $dbh = new PDO("mysql:host=$dbHost;dbname=$dbname", $username, $password);
    
    $sqlStmnt = $dbh->prepare('SELECT uid FROM testParameters 
						 WHERE cid = :cid 
						 AND username = :username 
						 AND useremail = :email 
						 AND user_tt_id = :troubleTicket 
						 AND requested_tests = :testCSV');
    $sqlStmnt->bindParam(':cid', $_SESSION["CID"], PDO::PARAM_STR);
    $sqlStmnt->bindParam(':username', $cleanedInputs["username"], PDO::PARAM_STR);
    $sqlStmnt->bindParam(':email', $cleanedInputs["email"], PDO::PARAM_STR);
    $sqlStmnt->bindParam(':troubleTicket', $cleanedInputs["troubleTicket"], PDO::PARAM_STR);
    $sqlStmnt->bindParam(':testCSV', $cleanedInputs["testCSV"], PDO::PARAM_STR);
    
    $sqlStmnt->execute();
    $uidQueryResult = $sqlStmnt->fetch(PDO::FETCH_ASSOC); //returns FALSE if empty result
    if (!$uidQueryResult)
        {
            print "an error occurred interacting with the database!";
        }
    else
        {
            $_SESSION["UID"] = $uidQueryResult["uid"];
        }
    
    
    
    return 1;
}//END insertNewISORequest();

function logOut()
{

	unset($_SESSION["username"]);
	unset($_SESSION["CID"]);
	unset($_SESSION["UID"]);
    session_unset();
    session_destroy();
    header("Location: http://". $_SERVER['SERVER_NAME']. "/login.php");
    die();
}//END logOut()


/*function generateAdminPanel()
{
	//This panel is where the user can update their info that is saved into the database. They will need
	// to provide their password in order for any changes to take effect
	$url = htmlspecialchars($_SERVER["PHP_SELF"]);


	$adminPanel = '<form id="updateContactInformation" role="form" class="form-horizontal col-md-8" action="'. $url . '" method="post">

		<div class="form-group"> 
			<label for="fName"> First Name*:</label>
			<input type="text" name="fName" id="fName" class="form-control" value="<?php echo $_REQUEST['fName']?>"> <?php echo $fNameError ?>
		</div>

        	<div class="form-group">
			<label for="lName">Last Name*:</label>
			<input type="text" name="lName" id="lName" class="form-control" value="<?php echo $_REQUEST['lName']?>"> <?php echo $lNameError ?><
		/div>

        	<div class="form-group"> 
			<label for="email">Email*:</label>
			<input type="email" name="email" id="email" class="form-control" value="<?php echo $_REQUEST['email']?>"> <?php echo $emailError ?> 
		</div>

        	<div class="form-group"> 
			<label for="testRigUsername">TestRig Username*:</label>
			<input type="text" name="testRigUsername" id="testRigUsername" class="form-control" value="<?php echo $_REQUEST['testRigUsername']?>"> <?php echo $testRigUsernameError ?>
		</div>

        	<div class="form-group"> 
			<label for="testRigPassword">TestRig Password*:</label>
			<input type="password" name="testRigPassword" id="testRigPassword" class="form-control"> <?php echo $testRigPasswordError ?>
		</div>

        	<div class="form-group"> 
			<label for="testRigPasswordConfirm">repeat password:<label>
			<input type="password" name="testRigPasswordConfirm" id="testRigPasswordConfirm" class="form-control"> <?php echo $testRigPasswordConfirmError ?>
		</div>

	        <div class="form-group"> 
			<label for="phoneNumber">Phone Number*:</label>
			<input type="text" name="phoneNumber" id="phoneNumber" class="form-control"  value="<?php echo $_REQUEST['phoneNumber']?>"> <?php echo $phoneNumberError ?>
		</div>

        	<div class="form-group"> 
			<label for="instName">Institution Name*:</label>
			<input type="text" name="instName" id="instName" class="form-control" value="<?php echo $_REQUEST['instName']?>"> <?php echo $instNameError ?>
		</div>

        	<div class="form-group"> 
			<label for="rtEmailAddress">RT Email Address:</label>
			<input type="text" name="rtEmailAddress" id="rtEmailAddress" class="form-control" value="<?php echo $_REQUEST['rtEmailAddress']?>"> 
		</div>

        	<div class="form-group"> 
			<label for="scpUsername">SCP Username:</label>
			<input type="text" name="scpUsername" id="scpUsername" class="form-control" value="<?php echo $_REQUEST['scpUsername']?>"> <?php echo $scpUsernameError ?>
		</div>

        	<div class="form-group"> 
			<label for="scpDstIp">SCP Dst IP:</label>
			<input type="text" name="scpDstIp" id="scpDstIp" class="form-control" value="<?php echo $_REQUEST['scpDstIp']?>"> <?php echo $scpDstIpError ?>
		</div>

        	<div class="form-group"> 
			<label for="scpPubKey">SCP Public Key*:</label>
			<input type="textarea" name="scpPubKey" id="scpPubKey" class="form-control"> <?php echo $scpPubKeyError ?>
		</div>

        	<div class="form-group"> 
			<label for="scpPrivKey">SCP Private Key*:</label>
        		<input type="textarea" name="scpPrivKey" id="scpPrivKey" class="form-control"> <?php echo $scpPrivKeyError ?>
		</div>

        	<div class="form-group"> 
			 <label for="scpHostPath">SCP Destination Absolute Path*:</label>
       			 <input type="textarea" name="scpHostPath" id="scpHostPath" class="form-control"> <?php echo $hostPathError ?>
		</div>

	    	<button type="submit" class="btn btn-lg btn-success">Update  Account</button>

	</form>';



return $adminpanel;

}*/

