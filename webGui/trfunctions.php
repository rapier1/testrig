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
			   <table id='$htmlTableID' border='1'>
			   <tr>";
		//create column headers based on $fields
		for ($counter = 0; $counter < count($fields); $counter++) //assemble each column of the new row
            {
                $newDiv = $newDiv . "<td>$fields[$counter]</td>";
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
        'validToDate' => "");
    
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
        'validToDate' => "");
    
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
                } else {
                $format = "m/d/Y";
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
                            proc_close (proc_open ("/home/rapier/testrig/isobuilder/isobuilder.pl -f /home/rapier/testrig/isobuilder/isobuilder.cfg -c $_SESSION[CID] -u $_SESSION[UID] 2>&1 /dev/null &", Array (), $dummy_var));
                        }
                    } else {
                        echo "Failed to create new ISO!<p>";
                    }
                }//END successful submission if/then
            
        }//END request and empty var check
    
    $valid_date = date("m/d/Y", strtotime("+7 days"));     
    
    //$isoForm will hold the entire new <div> element
    $isoForm =	'<div id="isoRequestSection" name="isoRequestSection">
				<form id="isoRequest" name="isoRequest" action="' . htmlspecialchars($_SERVER[PHP_SELF]) . '" method="post">
						<fieldset>
								<legend>ISO Request Form</legend>
								* required fields <br>
								IP Address to test*:	  <input type="text" name="isoTestTargetIP" id="isoTestTargetIP">' . $isoFormInputErrors["testTargetIP"] . '<br>
                                Maximum # of Runs:        <input type="text" name="isoMaxRun" id="isoMaxRun" value="7">' . $isoFormInputErrors["maxRun"] . '<br> 
                                ISO Valid Until:          <input type="date" name="isoValidToDate" id="isoValidToDate" value="' . $valid_date . '">' . $isoFormInputErrors["validToDate"] . '<br>
								Trouble Ticket No.*:	  <input type="text" name="isoTroubleTicket" id="isoTroubleTicket">' . $isoFormInputErrors["troubleTicket"] . '<br>
								Name*:				      <input type="text" name="isoUsername" id="isoUsername">' . $isoFormInputErrors["username"] . '<br>
								Email*:					  <input type="text" name="isoEmail" id="isoEmail">' . $isoFormInputErrors["email"] . '<br>
								Affiliation*:			  <input type="text" name="isoAffiliation" id="isoAffiliation">' . $isoFormInputErrors["affiliation"] . '<br>
								Tests to run*: <br>';
    //break for assembling the checkbox list
    $testList = '<ul title="Tests to Run">';
    //assemble the list of tests to choose from dynamically
    foreach ($allTests as $val)
        {
            $testList = $testList . '<li> <input type="checkbox" name="testCheckbox_list[]" id="testCheckbox_list[]" value=' . $val . '>'. $val .'</li>';
        }
    $testList = $testList . '</ul>'; //Close the list of tests
    $isoForm = $isoForm . $testList; //add it to the form
    //finish the form
    $isoForm = $isoForm . $isoFormInputErrors["testCSV"] . '<br> <input type="submit" value="Submit"></fieldset></form></div>';
    
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
    session_unset();
    session_destroy();
    header("Location: http://". $_SERVER['SERVER_NAME']. "/login.php");
    die();
}//END logOut()
