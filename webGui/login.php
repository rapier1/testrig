<?php
	session_start();
	include 'trfunctions.php';

	//GLOBAL VARIABLE DECLARATIONS
	$inputs = array(
		"trUsername" => "",
		"trPassword" => "");
	$inputErrors = array(
		"trUsername" => "",
		"trPassword" => "");
	//END VARIABLE DECLARATIONS



	//Has the user supplied their username and password?
	if (!empty($_SESSION["username"]))
	{
		print 'You are already logged in, ' . $_SESSION["username"];
	}
	else if ($_SERVER["REQUEST_METHOD"] == "POST")
    	 {
		$errFlag = 0;
		if (empty($_REQUEST["trUsername"]))
		 {
			$inputErrors["trUsername"] = "You must provide a username";
			$errFlag = 1;
	 	 }

		if (empty($_REQUEST["trPassword"]))
         	 {
                	$inputErrors["trPassword"] = "Please enter your password";
                	$errFlag = 1;
         	 }

		if ($errFlag != 1)
	 	 {
			$inputs["trUsername"] = scrubInput($_REQUEST["trUsername"]);
			$inputs["trPassword"] = scrubInput($_REQUEST["trPassword"]);

			logIn($inputs["trUsername"],$inputs["trPassword"]);

	 	 }

	 }//END AJAX processing


?>


<html>
<head>
<link href="trstylesheet.css" rel="stylesheet" type="text/css" />


</head>



<body>


	<div name="loginSection" id="loginSection">

		<form id="loginForm" name="loginForm" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" method="post">

			Username:<input type="text" id="trUsername" name="trUsername"> <?php print $inputErrors["trUsername"]; ?> <br>
			Password:<input type="password" id="trPassword" name="trPassword"> <?php print $inputErrors["trPassword"]; ?> <br>
			<input type="submit" value="Submit">

		</form>


	</div>

	<input type="button" value="Log Out" onclick="window.location.href = 'http://testrig.psc.edu/logout.php';">

</body>


</html>
