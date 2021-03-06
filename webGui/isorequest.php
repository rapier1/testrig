<?php 
/*
 * Copyright (c) 2019 The Board of Trustees of Carnegie Mellon University.
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
<html>

<head>
<title> ISO Request </title>
</head>

<body>
<?php
    include 'trfunctions.php';
    session_start();
        if (empty($_SESSION["username"]))
         {
                header("Location: https://testrig.psc.edu/login.php");
                die();
         }

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
		'testCSV' => "",
		'queueName' => "");

	$inputErrors = array(
		'username' => "",
		'email' => "",
		'phoneNumber' => "",
		'affiliation' => "",
		'scpPubKey' => "",
		'troubleTicket' => "",
		'testTargetIP' => "",
		'testCSV' => "",
		'queueName' => "");

//	array of tests. We might be able to make this a little more
//	readable once we get a list of available tests(?) maybe read from DB(??)
$allTests = array("Iperf", "Owping", "Ping", "Tcpdump", "Tracepath", "Traceroute");
$errFlag = 0;

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
	if (empty($_REQUEST["queueName"]))
	 {
		$inputErrors["queueName"] = "Specify an RT Queue for RT integration";
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
			$inputs["queueName"] = scrubInput($_REQUEST["queueName"]);

			//everything is scrubbed and prepped for entry into the DB, so let's do this
			insertNewISORequest($inputs);
            // It turns out that exec has an issue with some versions of bash which prevents it
            // from properly redirecting STDIN and STDERR to a file. This prevents exec from going into
            // the background. Turns out this proc_close(proc_open()) trick does work. 
            proc_close (proc_open ("/home/rapier/testrig/isobuilder/isobuilder.pl -f /home/rapier/testrig/isobuilder/isobuilder.cfg -c $_SESSION[CID] -u $_SESSION[UID] 2>&1 /dev/null &", Array (), $dummy_var));
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
			RT Queue Name:		  <input type="text" name="queueName" id="queueName"> <?php echo $inputErrors["queueName"]; ?> <br>
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
