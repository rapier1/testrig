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
		//print 'You are already logged in, ' . $_SESSION["username"];
		header("Location:http://". $_SERVER['SERVER_NAME'] ."/main.php");
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
                                <a class="navbar-brand" href="http://<?php echo $_SERVER['SERVER_NAME']?>/index.php'">Testrig 2.0</a>
                        </div>
                        <div id="navbar" class="collapse navbar-collapse">
                                  <ul class="nav navbar-nav">
                                  <li><a id="menu-home" href="#home">Home</a></li>
                                  <li><a id="menu-about" href="#about">About</a></li>
                                </ul>
<p class="navbar-right navbar-btn"><button id="logout" onClick="window.location='http://<?php echo $_SERVER['SERVER_NAME']?>/signup.php'"  type="button" class="btn btn-sm btn-primary">Sign Up</button></p>
                        </div><!--/.nav-collapse -->
                </div> <!-- END nav container -->
        </nav>



	<!-- MAIN Container for Login Form -->
	<div name="container-main" class="container">
	<div class="row starter-template">
		<h1 class="text-center"> Log In </h1>
	</div>
	<div class="row">
		<div name="padding-left" id="padding-left" class="col-8"></div>

		<div name="loginSection" id="loginSection" class="col-2 starter-template">

			<form id="loginForm" name="loginForm" class="form-horizontal col-6" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" method="post" role="form" class="form-horizontal">

				<div class="form-group">
					<label for="trUsername">Username</label> 
					<input type="text" id="trUsername" name="trUsername" class="form-control"> <?php print $inputErrors["trUsername"]; ?>
				</div>

				<div class="form-group">
					<label for="trPassword">Password</label> 
					<input type="password" id="trPassword" name="trPassword" class="form-control"> <?php print $inputErrors["trPassword"]; ?>
				</div>
				<div class="form-group">
					<input type="submit" value="Log In" class="btn btn-primary">
				</div>
			</form>

			<p class="text-center">Need an Account? <a href="signup.php">Sign up today</a></p>
		</div>

		<div name="padding-right" id="padding-right" class="col-5"></div>
	</div>
	</div> <!-- END main container -->

</body>


</html>