<html>

<head>
<title> ISO Request </title>
</head>

<body>
<?php

	session_start();
        if (empty($_SESSION["username"]))
         {
                header("Location: http://testrig.psc.edu/login.php");
                die();
         }

//////////////////////////////////////////////////////////////////////////////


	// hide notices
	@ini_set('error_reporting', E_ALL & ~ E_NOTICE);
	//init variables for form validation
	//required variables
	$inputs = array(
		'username' => "",
		'email' => "",
		'phoneNumber' => "",
		'affiliation' => "",
		'scpPubKey' => "",
		'troubleTicket' => "",
		'testTargetIP' => "",
		'testCSV' => "");

	$inputErrors = array(
		'username' => "",
		'email' => "",
		'phoneNumber' => "",
		'affiliation' => "",
		'scpPubKey' => "",
		'troubleTicket' => "",
		'testTargetIP' => "",
		'testCSV' => "");

	//	array of tests. We might be able to make this a little more
	//	readable once we get a list of available tests(?) maybe read from DB(??)
	$allTests = array("Iperf", "Owping", "Ping", "Tcpdump", "Tracepath", "Traceroute");
	$errFlag = 0;


	//input scrubber
	function scrubInput($data)
	{
    		$data = trim($data);
    		$data = stripslashes($data);
    		$data = htmlspecialchars($data);
    		return $data;
	}


    //function for inserting values into the database
    function insertNewISORequest($cleanedInputs)
     {
        //database-related variables
        $dbHost = "192.168.122.1"; //ionia's private IP
        $username = "testrig";
        $password = "tinycats";
        $dbname = "testrig";
	//actually attempt connecting to the database using PHP's PDO
        try
         {
        	$dbLink = new PDO("mysql:host=$dbHost;dbname=$dbname", $username, $password);
        	//error mode for PDO is exception
        	$dbLink->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        	$cmd = "INSERT INTO testParameters
                          (cid,username,useremail,user_tt_id,requested_tests)
                        VALUES (?, ?, ?, ?, ?)";
        	$statement = $dbLink->prepare($cmd);
		$CID = scrubInput($_SESSION["CID"]);
        	$statement->execute(array( $CID,
					   $cleanedInputs["username"],
               		                   $cleanedInputs["email"],
                       		           $cleanedInputs["troubleTicket"],
                     		           $cleanedInputs["testCSV"]));
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



  //are required variables empty?
    if ($_SERVER["REQUEST_METHOD"] == "POST")
     {
        if (empty($_REQUEST["testTargetIP"]))
            {
                $inputErrors["ipAddress"] = "You must provide an IP address";
                $errFlag = 1;
            }

        if (empty($_REQUEST["troubleTicket"]))
            {
                $inputErrors["troubleTicket"] = "You must provide a Trouble Ticket Number";
                $errFlag = 1;
            }

        if (empty($_REQUEST["username"]))
            {
                $inputErrors["username"] = "You must provide your username";
                $errFlag = 1;
            }

	if (empty($_REQUEST["email"]))
	   {
		$inputErrors["email"] = "You must provide an email address";
		$errFlag = 1;
	   }

	if (empty($_REQUEST["affiliation"]))
           {
                $inputErrors["affiliation"] = "You must list your affiliation";
                $errFlag = 1;
           }

	if (empty($_REQUEST["checkbox_list"]))
	  {
		$inputErrors["testCSV"] = "You must select at least 1 test";
		$errFlag = 1;
	  }

     }//END empty var check


      if (($errFlag != 1) && ($_SERVER["REQUEST_METHOD"] == "POST")) //Has everything been successfully submitted? 
                  {
			//have to assemble the tests in a csv
			$count = 0;
			$testString = "";
			$checkedTests = $_REQUEST["checkbox_list"];
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


			$inputs["username"] = scrubInput($_REQUEST["username"]);
			$inputs["email"] = scrubInput($_REQUEST["email"]);
                        $inputs["troubleTicket"] = scrubInput($_REQUEST["troubleTicket"]);
                        $inputs["testCSV"] = $testString;

			//everything is scrubbed and prepped for entry into the DB, so let's do this
			insertNewISORequest($inputs);


                  }//END successful submission if/then




?>

	<div id="inputSection" name="inputSection">

		<form id="isoRequest" name="isoRequest" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" method="post">
	    	<fieldset>
	    		<legend>ISO Request Form</legend>
	    		* required fields <br>
	    		IP Address to test*:	  <input type="text" name="testTargetIP" id="testTargetIP"> <?php echo $inputErrors["ipAddress"]; ?><br>
	    		Trouble Ticket No.*: 	  <input type="text" name="troubleTicket" id="troubleTicket"> <?php echo $inputErrors["troubleTicket"]; ?> <br>
	    		Username*: 		  <input type="text" name="username" id="username"> <?php echo $inputErrors["username"]; ?> <br>
	    		Email*: 		  <input type="text" name="email" id="email"> <?php echo $inputErrors["email"]; ?> <br>
	    		Affiliation*: 		  <input type="text" name="affiliation" id="affiliation"> <?php echo $inputErrors["affiliation"]; ?> <br>
			Tests to run*: <br>
			<ul title="Tests to Run">
				<?php //assemble the list of tests to choose from dynamically
				  $count = 1;
				  foreach ($allTests as $val)
					{
						print "<li> <input type='checkbox' name='checkbox_list[]' id='checkbox_list[]' value='$val'> $val </li>";
						$count++;
					} ?>
			</ul>
			<?php echo $inputErrors["testCSV"]; ?>
	    		<br> <input type="submit" value="Submit">
	    	</fieldset>
		</form>

	</div>



	<div id="outputSection" name="outputSection">

	</div>


</body>


</html>
