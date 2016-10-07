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
				header("Location:http://testrig.psc.edu/main.php");
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
                	'testCSV' => "");

	        $isoFormInputErrors = array(
        	        'username' => "",
        	        'email' => "",
        	        'phoneNumber' => "",
        	        'affiliation' => "",
        	        'scpPubKey' => "",
        	        'troubleTicket' => "",
        	        'testTargetIP' => "",
        	        'testCSV' => "");

        	//array of tests. We might be able to make this a little more
        	//readable once we get a list of available tests(?) maybe read from DB(??)
        	$allTests = array("Iperf", "Owping", "Ping", "Tcpdump", "Tracepath", "Traceroute");
        	$isoFormInputErrFlag = 0;



		//are required variables empty?
    		if ($_SERVER["REQUEST_METHOD"] == "POST")
     		 {
        		if (empty($_REQUEST["isoTestTargetIP"]))
            		 {
                		$isoFormInputErrors["ipAddress"] = "You must provide an IP address";
                		$errFlag = 1;
			 }

			if (empty($_REQUEST["isoTroubleTicket"]))
			 {
                		$isoFormInputErrors["troubleTicket"] = "You must provide a Trouble Ticket Number";
                		$errFlag = 1;
           		 }

		        if (empty($_REQUEST["isoUsername"]))
            		 {
                		$isoFormInputErrors["username"] = "You must provide your username";
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

     		 }//END empty var check
		//$isoForm will hold the entire new <div> element
		$isoForm = 	'<div id="isoRequestSection" name="isoRequestSection">
				<form id="isoRequest" name="isoRequest" action="<?php echo htmlspecialchars($_SERVER[PHP_SELF]);?>" method="post">
                		<fieldset>
                        		<legend>ISO Request Form</legend>
                        		* required fields <br>
                        		IP Address to test*:      <input type="text" name="isoTestTargetIP" id="isoTestTargetIP">' . $isoFormInputErrors["ipAddress"] . '<br>
                        		Trouble Ticket No.*:      <input type="text" name="isoTroubleTicket" id="isoTroubleTicket">' . $isoFormInputErrors["troubleTicket"] . '<br>
                        		Username*:                <input type="text" name="isoUsername" id="isoUsername">' . $isoFormInputErrors["username"] . '<br>
                        		Email*:                   <input type="text" name="isoEmail" id="isoEmail">' . $isoFormInputErrors["email"] . '<br>
                        		Affiliation*:             <input type="text" name="isoAffiliation" id="isoAffiliation">' . $isoFormInputErrors["affiliation"] . '<br>
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
                $isoForm = $isoForm . $inputErrors["testCSV"] . '<br> <input type="submit" value="Submit"></fieldset></form></div>';

		return $isoForm;

	}//END generateISORequestForm()
