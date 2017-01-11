<!DOCTYPE html>
<html lang="en">
  <head>
			<meta charset="utf-8">
			<meta http-equiv="X-UA-Compatible" content="IE=edge">
			<meta name="viewport" content="width=device-width, initial-scale=1">
			<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
			   <meta name="description" content="TestRig 2">
			   <meta name="author" content="Pittsburgh Supercompuing Center">
			   <link rel="icon" href="../../favicon.ico">
	<title>TestRig 2</title>
			<!-- Bootstrap core CSS -->
			    <link href="bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
			<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
			    <link href="bootstrap/assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">
			<!-- Custom styles for this template -->
			    <link href="trstylesheet.css" rel="stylesheet">
			<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
			    <!--[if lt IE 9]>
				<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
				<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
			    <![endif]-->


	<?php
		session_start();
		if (empty($_SESSION["username"]))
		 {
			header("Location: http://". $_SERVER['SERVER_NAME']. "/login.php");
			die();
		 }
		include 'trfunctions.php';

		$isoRequestListFields = array("username", "useremail", "user_tt_id", "validtodate", "maxrun", "creation_timestamp", "requested_tests");
		$isoRequestListDiv = buildDiv("isoRequestListDiv", "testParameters", $isoRequestListFields);
		$welcomeDiv = generateUserInfo();
		$isoForm = generateISORequestForm();
		//$adminPanel = generateAdminPanel();
	?>
  </head>


<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
				  <span class="sr-only">Toggle navigation</span>
				  <span class="icon-bar"></span>
				  <span class="icon-bar"></span>
				  <span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Testrig 2.0</a>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
				  <ul class="nav navbar-nav">
				  <li><a id="menu-isolist" href="#isolist">ISO List</a></li>
				  <li><a id="menu-geniso" href="#geniso">Generate New ISO</a></li>
				  <li><a id="menu-admin" href="#admin">Administration</a></li>
				</ul>
				<p class="navbar-right navbar-btn"><button id="logout" onClick="window.location='http://<?php echo $_SERVER['SERVER_NAME']?>/logout.php'"  type="button" class="btn btn-sm btn-primary">Logout</button></p>
			</div><!--/.nav-collapse -->
		</div> <!-- END nav container -->
	</nav>

<div id="container-main" class="container">
	<div id="padding-left" class="col-4"></div>

	<div id="container-isolist" class="hidden isoList">
		<?php	print $isoRequestListDiv; ?>
	</div>

	<div id="container-isoform" class="">
		<?php	print $isoForm; ?>
	</div>

	<div id="container-admin" class=" hidden">
		<?php   //print $adminPanel; ?>
	</div>

	<div id="padding-right" class="col-4"></div>

</div> <!-- END Main Container -->


<!-- jquery stuff -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="trjquery.js"></script>

<!-- END jquery stuff -->


</body>

</html>
