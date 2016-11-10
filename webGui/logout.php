<?php
	session_start();
	unset($_SESSION["username"]);
	unset($_SESSION["CID"]);
	unset($_SESSION["UID"]);
	session_unset();
	session_destroy();
	header("Location: login.php");
	die();
?>
