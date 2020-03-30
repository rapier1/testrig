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
    $dbh = getDatabaseHandle();

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

    //now that we have a string of fields, assemble the query 
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
    $dbh = getDatabaseHandle();
    $errString = "Incorrect username/password combination";

    $stmnt = $dbh->prepare('SELECT tr_username, tr_password, cid, inst_name, approved 
					FROM customer 
					WHERE tr_username = :username');
    $stmnt->bindParam(':username', $username, PDO::PARAM_STR);
    $stmnt->execute();
    $queryResult = $stmnt->fetch(PDO::FETCH_ASSOC); //returns FALSE if empty result
    if (!$queryResult) //Did we find a match to the submitted username?
        {
			return 1;
        }
    else //found a username match, time to see if the password is correct
        {
			if (!password_verify($password, $queryResult["tr_password"]) || ($queryResult["approved"] == 0)) //fail
                {
                    return 1; //return 1 to notify password match failed
                }
			else //pass!
                {
                    //load relevant user info into the current session
                    $_SESSION["inst_name"] = $queryResult["inst_name"];
                    $_SESSION["username"] = $queryResult["tr_username"];
                    $_SESSION["CID"] = $queryResult["cid"];
                    header("Location:https://". $_SERVER['SERVER_NAME'] ."/main.php");
                    //die();
                    return 0; //return 0 to notify password match success
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
	'queueName' => "",
	'psNodeTarget' => "");

    //array of tests. We might be able to make this a little more
    //readable once we get a list of available tests(?) maybe read from DB(??)
    $allTests = array("Iperf", "Owping", "Ping", "Tcpdump", "Tracepath", "Traceroute");
    $errFlag = 0;

    //has there been a request sent to the server?
    //are the variables empty?
    if ($_SERVER["REQUEST_METHOD"] == "POST")
        {
            if (empty($_REQUEST["isoTestTargetIP"]))
                {
                    $isoFormInputErrors["ipAddress"] = "You must provide an IP address";

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
                $date = date_create($_REQUEST[isoValidToDate]);
                if ($date == false) {
                    $isoFormInputErrors["validToDate"] = "You did not enter a valid date";
                    $errFlag = 1;
                } else {
                    $err = $date->getLastErrors();
                    if ($err['warning_count'] != 0 || $err['error_count'] != 0) {
                        $isoFormInputErrors["validToDate"] = "You entered an invalid date format";
                        $errFlag = 1;
                    } else {
                        $_REQUEST["isoValidDate"] = $date->format('Y-m-d');
                    }
                }
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
            if (empty($_REQUEST["psNode"]))
		{
		    $isoFormInputErrors["psNodeCustomTarget"] = "You must specify a PerfSONAR Node to test against";
		    $errFlag = 1;
		}
            if (($_REQUEST["psNode"] == "psNodeCustom") && (empty($_REQUEST["psNodeCustomTarget"])))
                {
                    $isoFormInputErrors["psNodeTarget"] = "You must specify your custom PerfSONAR Node's IP address or Hostname";
                    $errFlag = 1;
                }

            if (empty($_REQUEST["isoAffiliation"]))
                {
                    $isoFormInputErrors["affiliation"] = "You must list your affiliation";
                    $errFlag = 1;
                }


            if (empty($_REQUEST["testCheckbox_list"]))
                {
                    if(empty($_REQUEST["testCheckbox_listCustom"])) //are checkboxes filled in on either node selection?
                        {
                                   $isoFormInputErrors["testCSV"] = "You must select at least 1 test";
                                   $errFlag = 1;
                        }
                }
           
            $errMsg = implode("<br>", array_filter($isoFormInputErrors));

            /////////////////////// CAN WE GENERATE THE ISO THEY JUST CONFIGURED? //////////////////////////////////////////////
            #print ("<pre>");
            #print_r($_REQUEST);
            #print ("</pre>");
            if ($errFlag != 1) //Has everything been successfully submitted?
 
                {
                    if ($_REQUEST["psNode"] == "psNode1") //they picked the automatically selected one
                        {
                            $checkedTests = $_REQUEST["testCheckbox_list"];
                            $inputs["target"] = scrubInput($_REQUEST["hiddenTestTarget"]);
                        }
                    else
                        {
                            $checkedTests = $_REQUEST["testCheckbox_listCustom"];
                            $inputs["target"] = scrubInput($_REQUEST["psNodeCustomTarget"]);
                        }

                    //have to assemble the tests in a csv
                    $count = 0;
                    $testString = "";
                    //$checkedTests = $_REQUEST["testCheckbox_list"];
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

                    //Sanitize ISO Request Inputs
                    $inputs["username"] = scrubInput($_REQUEST["isoUsername"]);
                    $inputs["email"] = scrubInput($_REQUEST["isoEmail"]);
                    $inputs["troubleTicket"] = scrubInput($_REQUEST["isoTroubleTicket"]);
                            //$inputs["target"] = scrubInput($_REQUEST["hiddenTestTarget"]);
                    $inputs["maxRun"] = scrubInput($_REQUEST["isoMaxRun"]);
                    $date = scrubInput($_REQUEST["isoValidToDate"]);
                    $inputs["validToDate"] = date("Y-m-d", strtotime($date));
                    $inputs["testCSV"] = $testString;
                    
            ////////////////////// SECTION FOR DETERMINING WTF WE ARE SENDING TO THE SERVER FROM THE FORM //////////////////////////
                    
                    /*
                    $alert = "";
                    $alert = '<script type="text/javascript">';
                    $submissions = "";
                    $submissions .= 'Username: ' . $inputs["username"] . '\n';
                    $submissions .= 'Email: ' . $inputs["email"] . '\n';
                    $submissions .= 'TroubleTicket: ' . $inputs["troubleTicket"] . '\n';
                    $submissions .= 'Target: ' . $inputs["isoTestTargetIP"] . '\n';
                    $submissions .= 'Max Runs: ' . $inputs["maxRun"] . '\n';
                    $submissions .= 'Valid to date: ' . $inputs["validToDate"] . '\n';
                    $submissions .= 'CSV of Tests: ' . $inputs["testCSV"] . '\n';
                    $alert .= 'window.alert(' . $sumbissions . ');</script>';
                    print $alert; */
            /////////////////////////////////////////// END WTF SECTION /////////////////////////////////

            #print ("<pre>");
            #print_r($inputs);
            #print_r($_SESSION);
            #print ("</pre>");
            

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
    
    $valid_date = date("Y-m-d", strtotime("+7 days"));     

    //$isoForm will hold the entire new <div> element
    //we have to do this in a few steps due to the need for PHP_SELF to be in quotes for the redirection to work correctly
	$serverURL = htmlspecialchars($_SERVER["PHP_SELF"]);

	$isoForm =	'<div id="isoRequestTitle"><h1 class="text-center">Generate New ISO Image</h1></div><form role="form" id="isoRequest" class="form-horizontal" name="isoRequest" action="' . $serverURL;
	$isoForm = $isoForm . '" method="post">
			<small>* required fields </small>
            <input type="hidden" name="form_src" value="isoForm" />
			<div class="form-group">  <label for="isoTestTargetIP"> IP Address to test*:  </label>
			<input type="text" class="form-control" name="isoTestTargetIP" id="isoTestTargetIP" placeholder="Target IP address" value="'. $_REQUEST["isoTestTargetIP"] . '" >' . $isoFormInputErrors["testTargetIP"] . '
			<button type="button" class="btn btn-primary" id="hostSearchButton">Host Search</button></div>

			<div class="form-group hidden"> PerfSONAR nodes near you

			<div id="psPickerContainer" class="container"><div id="psPickerDiv" class="row"></div></div>

			</div>

			<div class="form-group"> <label for="isoMaxRun">Maximum # of Runs:</label>
			<input type="text" class="form-control" name="isoMaxRun" id="isoMaxRun" value="7">' . $isoFormInputErrors["maxRun"] . '</div>

			<div class="form-group"> <label for="isoValidToDate">ISO Valid Until:</label>
			<input type="date" class="form-control" name="isoValidToDate" id="isoValidToDate" value="' . $valid_date . '" >' . $isoFormInputErrors["validToDate"] . '</div>

			<div class="form-group"> <label for="isoTroubleTicket">Trouble Ticket No.:</label>
			<input type="text" class="form-control" name="isoTroubleTicket" id="isoTroubleTicket" placeholder="RT Ticket #" value="' . $_REQUEST["isoTroubleTicket"] . '">' . $isoFormInputErrors["troubleTicket"] . '</div>

			<div class="form-group"> <label for="isoUsername">User\'s Name*:</label>
			<input type="text" class="form-control" name="isoUsername" id="isoUsername" placeholder="username" value="' . $_REQUEST["isoUsername"] . '">' . $isoFormInputErrors["username"] . '</div>

			<div class="form-group"> <label for="isoEmail">User\'s Email*:</label>
			<input type="email" class="form-control" name="isoEmail" id="isoEmail" placeholder="user@emailaddress" value ="' . $_REQUEST["isoEmail"] . '">' . $isoFormInputErrors["email"] . '</div>

			<div class="form-group"> <label for="isoAffiliation">User\'s Affiliation*:</label>
			<input type="text" class="form-control" name="isoAffiliation" id="isoAffiliation" placeholder="Organization Name" value="' . $_REQUEST["isoAffiliation"] . '">' . $isoFormInputErrors["affiliation"] . '</div>

			<div class="form-group"> <label for="queueName">RT Queue Name:</label>

			<input type="text" class="form-control" name="queueName" id="queueName" placeholder="Name of RT Queue" value ="' . $_REQUEST["queueName"] . '"> <?php echo $inputErrors["queueName"]; ?> </div>';
    //finish the form
    $isoForm = $isoForm . '<button type="submit" class="btn btn-primary">Generate New ISO</button></div></form>';
 
    return [$isoForm, $errFlag, $errMsg];
    
}///////////////////////////  END generateISORequestForm()    /////////////////////////////////////////////////////////////////////////////////

function insertNewISORequest($cleanedInputs)
{
    //this function will insert parameters for an ISO into the test_parameters table

	//generate a timestamp for the ISO's creation date
	date_default_timezone_set('UTC');
	$creationTimestamp = date('YmdHs');

    #print ("<pre>");
    #print_r($cleanedInputs);
    #print ("</pre>");
    
	//actually attempt connecting to the database using PHP's PDO
    try
        {
            $dbLink = getDatabaseHandle();
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
    $dbh = getDatabaseHandle();
    
    $sqlStmnt = $dbh->prepare('SELECT uid FROM testParameters 
						 WHERE cid = :cid 
						 AND username = :username 
						 AND useremail = :email 
						 AND creation_timestamp = :timestamp'); 
    $sqlStmnt->bindParam(':cid', $_SESSION["CID"], PDO::PARAM_STR);
    $sqlStmnt->bindParam(':username', $cleanedInputs["username"], PDO::PARAM_STR);
    $sqlStmnt->bindParam(':email', $cleanedInputs["email"], PDO::PARAM_STR);
    $sqlStmnt->bindParam(':timestamp', $creationTimestamp);
    
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
    header("Location: https://". $_SERVER['SERVER_NAME']. "/index.php");
    die();
}//END logOut()

function getDatabaseHandle () {
    //Create our Database Handler, $dbh
    include "./config.php";
    $dbh = new PDO("mysql:host=$DB_HOST;dbname=$DB_NAME", $DB_USERNAME, $DB_PASSWORD);
    return $dbh;
}

function confirmPass($password) {
    $dbh = getDatabaseHandle();
    $stmnt = $dbh->prepare("SELECT tr_password
                            FROM customer
                            WHERE cid = :CID");
    $stmnt->bindParam(":CID", $_SESSION["CID"], PDO::PARAM_STR);
    $stmnt->execute();
    $result = $stmnt->fetch(PDO::FETCH_ASSOC);
    return (password_verify($password, $result["tr_password"]));
}

function generateAdminForm()
{
	//This panel is where the user can update their info that is saved into the database. They will need
	// to provide their password in order for any changes to take effect

	//Admin Panel variables
    $AdminInputs = array(
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
        'rtEmailAddress' => "",
        'scpHostPath' => "",
        'scpPrivKey' => "");
    
    $AdminInputErrors = array(
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
        'rtEmailAddress' => "",
        'scpHostPath' => "",
        'scpPrivKey' => "",
        'admin-testRigPassword' => "");
    
    $url = htmlspecialchars($_SERVER["PHP_SELF"]);
    $errFlag = 0;
    $errMsg = "";
    $type = 0;
    
    $dbh = getDatabaseHandle();
    
    //let's see if the user wants to update their shit
    
    if ($_REQUEST["a"] == "ud") { //did they submit something?
        $type = 1;
        // scrub our inputs
        foreach ($_REQUEST as $key => $value) {
            if (preg_match ("/admin/", $key)) {
                $_REQUEST[$key] = scrubInput($value);
            }
        }
        
        $stmnt = $dbh->prepare("UPDATE customer 
                                    SET inst_name = :iname,
                                    contact_fname = :fname,
                                    contact_lname = :lname, 
                                    contact_phone = :phone,
                                    contact_email = :email, 
                                    inst_data_host = :host,
                                    inst_host_uname = :uname, 
                                    inst_host_path = :path,
                                    tt_system = :tt 
                                    WHERE cid = :CID");
        $stmnt->bindParam(':iname', $_REQUEST['admin-instName'], PDO::PARAM_STR); 
        $stmnt->bindParam(':fname', $_REQUEST['admin-fName'], PDO::PARAM_STR); 
        $stmnt->bindParam(':lname', $_REQUEST['admin-lName'], PDO::PARAM_STR); 
        $stmnt->bindParam(':phone', $_REQUEST['admin-phoneNumber'], PDO::PARAM_STR); 
        $stmnt->bindParam(':email', $_REQUEST['admin-email'], PDO::PARAM_STR); 
        $stmnt->bindParam(':host',  $_REQUEST['admin-scpDstIp'], PDO::PARAM_STR); 
        $stmnt->bindParam(':uname', $_REQUEST['admin-scpUsername'], PDO::PARAM_STR); 
        $stmnt->bindParam(':path',  $_REQUEST['admin-scpHostPath'], PDO::PARAM_STR); 
        $stmnt->bindParam(':tt',    $_REQUEST['admin-rtEmailAddress'], PDO::PARAM_STR); 
        $stmnt->bindParam(':CID',   $_SESSION['CID'], PDO::PARAM_STR);
        $stmnt->execute();
    }
    // Do they want to change their password?
    if ($_REQUEST["a"] == "np") { //did they submit something?
        $type = 2;
        if (confirmPass($_REQUEST["cpass"])) {
            if ($_REQUEST["npass1"] == $_REQUEST["npass2"]) {
                $hash = password_hash($_REQUEST["npass1"], PASSWORD_BCRYPT);
                $stmnt = $dbh->prepare("UPDATE customer
                                        SET tr_password = :hash
                                        WHERE cid = :CID");
                $stmnt->bindParam(':hash', $hash, PDO::PARAM_STR); 
                $stmnt->bindParam(':CID',  $_SESSION["CID"], PDO::PARAM_STR);
                $stmnt->execute();
            } else {
                //passwords do not match
            $errFlag = 1;
            $errMsg = "Your new passwords do not match. Please try again.";
            }
        } else {
            // bad current password
            $errFlag = 1;
            $errMsg = "The password supplied does not match our records";
        }
    }
            
    // Do they want a new SCP key?
    if ($_REQUEST["a"] == "nk") { //did they submit something?
        $type = 3;
        if (confirmPass($_REQUEST["cpass"])) {
             // get the users email address so we can mail them the new public key
            $stmnt = $dbh->prepare("SELECT contact_email 
                                    FROM customer 
                                    WHERE cid = :CID");
            $stmnt->bindParam(':CID',  $_SESSION["CID"], PDO::PARAM_STR);
            $stmnt->execute();
            $queryResult = $stmnt->fetch(PDO::FETCH_ASSOC); //returns FALSE if empty result
            if (!$queryResult) {
                print "NO RESPONSE!";
                // insert error here because we didn't get a result;
            }
            // generate the keys
            list ($scpPrivKey, $scpPubKey) = generateSSHKeys();

             // insert the new keys
            $stmnt = $dbh->prepare("UPDATE customer
                                    SET inst_pub_key = :pub,
                                        inst_priv_key = :priv
                                    WHERE cid = :CID");
            $stmnt->bindParam(':pub',  $scpPubKey, PDO::PARAM_STR);
            $stmnt->bindParam(':priv', $scpPrivKey, PDO::PARAM_STR);
            $stmnt->bindParam(':CID',  $_SESSION["CID"], PDO::PARAM_STR);
            $stmnt->execute();
            // email the new public key
            emailPubKey($scpPubKey, $queryResult["contact_email"]);
        } else {
            // bad current password
            $errFlag = 1;
            $errMsg = "The password supplied does not match our records";
        }
    }
    
    // lets get the initial values for this form. This has to be done
    // after any changes ot the DB or they won't be reflected. 
    $stmnt = $dbh->prepare("SELECT inst_name, contact_fname,
                                   contact_lname, contact_phone,
                                   contact_email, inst_data_host,
                                   inst_host_uname, inst_host_path,
                                   tt_system 
                                   FROM customer WHERE cid = :CID");
    $stmnt->bindParam(':CID', $_SESSION["CID"], PDO::PARAM_STR);
    $stmnt->execute();
    $queryResult = $stmnt->fetch(PDO::FETCH_ASSOC); //returns FALSE if empty result
    if (!$queryResult) {
        // insert error here because we didn't get a result;
    }
     
    //We have to assemble to form in a funky way because php does NOT like dealing with the 'for' HTML attribute. Escape the quotes!
    $adminForm = "<a href='#' onclick='toggle_vis(\"ud\");'>Change Account Information</a></p>";
    $adminForm .= "<div id='ud' style='display: none;'>";
    $adminForm .= "<form id='updateContactInformation' role='form' class='form-horizontal col-8' action='$url?a=ud' method='post'>\n";
    $adminForm .= "<input type='hidden' name='form_src' value='admin' />\n";
    $adminForm .= "<div class='form-group'><label for='admin-fName'> First Name:</label><input type='text' name='admin-fName' class='form-control' value='$queryResult[contact_fname]' required></div>\n";
    $adminForm .= "<div class='form-group'><label for='admin-lName'> Last Name:</label><input type='text' name='admin-lName' class='form-control' value='$queryResult[contact_lname]' required ></div>\n";
    $adminForm .= "<div class='form-group'><label for='admin-email'> Email Address:</label><input type='email' name='admin-email' class='form-control' value='$queryResult[contact_email]' required></div>\n";
    $adminForm .= "<div class='form-group'><label for='admin-phoneNumber'>Phone Number:</label><input type='text' name='admin-phoneNumber' class='form-control'  value='$queryResult[contact_phone]' required></div>\n";
    $adminForm .= "<div class='form-group'><label for='admin-instName'>Institution Name:</label><input type='text' name='admin-instName' class='form-control' value='$queryResult[inst_name]' required ></div>\n";
    $adminForm .= "<div class='form-group'><label for='admin-rtEmailAddress'>RT Email Address:</label><input type='text' name='admin-rtEmailAddress' id='admin-rtEmailAddress' class='form-control' value='$queryResult[tt_system]'></div>";
    $adminForm .= "<div class='form-group'><label for='admin-scpUsername'>SCP Username:</label><input type='text' name='admin-scpUsername' id='admin-scpUsername' class='form-control' value='$queryResult[inst_host_uname]' required></div>";
    $adminForm .= "<div class='form-group'><label for='admin-scpDstIp'>SCP Host:</label><input type='text' name='admin-scpDstIp' id='admin-scpDstIp' class='form-control' value='$queryResult[inst_data_host]' required></div>";
    $adminForm .= "<div class='form-group'><label for='admin-scpHostPath'>SCP Destination (Absolute Path):</label><input type='textarea' name='admin-scpHostPath' id='admin-scpHostPath' class='form-control' value='$queryResult[inst_host_path]' required></div>";
    $adminForm .= "<button type='submit' class='btn btn-lg btn-success'>Update Account</button></form>";
    $adminForm .= "</div>";
    
    $adminForm .= "<a href='#' onclick='toggle_vis(\"np\");'>Change Password</a></p>";
    $adminForm .= "<div id='np' style='display: none;'>";
    $adminForm .= "<form id='updatePassword' role='form' class='form-horizontal col-8' action='$url?a=np' method='post'>\n";
    $adminForm .= "<input type='hidden' name='form_src' value='admin' />\n";
    $adminForm .= "<div class='form-group'><label for='cpass'> Current Password:</label><input type='password' name='cpass' class='form-control' value='' required></div>\n";
    $adminForm .= "<div class='form-group'><label for='npass1'> New Password:</label><input type='password' name='npass1' class='form-control' value='' required></div>\n";
    $adminForm .= "<div class='form-group'><label for='npass2'> Confirm Password:</label><input type='password' name='npass2' class='form-control' value='' required></div>\n";
    $adminForm .= "<button type='submit' class='btn btn-lg btn-success'>Update Password</button></form>";
    $adminForm .= "</div>";
   
    $adminForm .= "<a href='#' onclick='toggle_vis(\"nk\");'>Generate New Keys</a>";
    $adminForm .= "<div id='nk' style='display: none;'>";
    $adminForm .= "<form id='updateKey' role='form' class='form-horizontal col-8' action='$url?a=nk' method='post'>\n";
    $adminForm .= "<input type='hidden' name='form_src' value='admin' />\n";
    $adminForm .= "<div class='form-group'><label for='cpass'> Password:</label><input type='password' name='cpass' class='form-control' value='' required></div>\n";
    $adminForm .= "<button type='submit' class='btn btn-lg btn-success'>Request New SCP key</button></form>";
    $adminForm .= "</div>";

    #$errMsg = implode("<br>", array_filter($AdminInputErrors));
    return [$adminForm, $errFlag, $errMsg, $type];
}


function runPSLocateJson($ip, $count) // ip: IP address to lookup, count: number of test hosts to return.
{
    $args = " -i '".$ip."' -c '".$count."'";
    $jsonResponse = shell_exec('ps_locate '.$args);
    return $jsonResponse;
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