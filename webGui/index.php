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
        <title>TestRig 2 - Sign Up Today!</title>
                        <!-- Bootstrap core CSS -->
                            <link href="bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
                        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
                            <link href="bootstrap/assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">
                        <!-- Custom styles for TestRig 2.0 template -->
                            <link href="trstylesheet.css" rel="stylesheet">
                        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
                            <!--[if lt IE 9]>
                                <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
                                <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
                            <![endif]-->

<?php
		session_start();
		$navLoginLogoutButton = "";
		if (!empty($_SESSION["username"]))
		 {
			//Session is Set, LOG OUT should be visible option
			$url = "window.location='http://". $_SERVER['SERVER_NAME']. "/logout.php'";
			$navLoginLogoutButton = '<button id="logout" onClick="'. $url . '" type="button" class="btn btn-sm btn-primary">Logout</button>';

		 }
		else
		 {
			//Session is NOT set, LOG IN should be visible option
			$url = "window.location='http://". $_SERVER['SERVER_NAME']. "/login.php'";
                        $navLoginLogoutButton = '<button id="logout" onClick="'. $url . '" type="button" class="btn btn-sm btn-primary">Log In</button>';
		 }
		include 'trfunctions.php';
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
				<a class="navbar-brand" href="index.php">Testrig 2.0</a>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
				  <li><a id="menu-home" href="http://<?php echo $_SERVER['SERVER_NAME']?>/main.php">Home</a></li>
				</ul>

				<ul class="nav navbar-nav navbar-right">
                                    <li class="navbar-btn"><?php print $navLoginLogoutButton ?></li>
                                    <li class="navbar-btn"><button id="signup" onClick="window.location='http://<?php echo $_SERVER['SERVER_NAME']?>/signup.php'"  type="button" class="btn btn-sm btn-primary">Sign Up</button></li>
                                </ul>
			</div><!--/.nav-collapse -->
		</div> <!-- END nav container -->
	</nav>






<div id="container-main" class="main-panels">
<h4 class="text-center">
Welcome to TestRig 2.0 - a software as a service offering provided by the Pittsburgh Supercomputing Center made possible by a grant from the National Science Foundation. TestRig 2.0 is designed to be a straightforward way to collect valuable network diagnostic information using dynamically generated bootable live ISOs.
</h4>


</div> <!-- END MAIN container -->


<!-- jquery stuff -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="trjquery.js"></script>
<!-- END jquery stuff -->



</body>

</html>
