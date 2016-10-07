<html>
<head>
<link href="trstylesheet.css" rel="stylesheet" type="text/css" />
<?php

	session_start();
	if (empty($_SESSION["username"]))
	 {
		header("Location: http://testrig.psc.edu/login.php");
		die();
	 }

	include 'trfunctions.php';


	$isoRequestListFields = array("username", "useremail", "user_tt_id", "validtodate", "maxrun", "requested_tests");
	$isoRequestListDiv = buildDiv("isoRequestListDiv", "testParameters", $isoRequestListFields);
	$welcomeDiv = generateUserInfo();

	$isoForm = generateISORequestForm();

?>
</head>


<body>

<?php
	print $welcomeDiv;
	print $isoRequestListDiv;
	print $isoForm;

?>
<div id="logoutDiv">
<input type="button" value="Logout" onClick="window.location='http://testrig.psc.edu/logout.php'">
</div>

</body>

</html>
