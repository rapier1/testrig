<?php 
/*
 * Copyright (c) 2020 The Board of Trustees of Carnegie Mellon University.
 *
 *  Authors: Chris Rapier <rapier@psc.edu> 
 *           Nate Robinson <nate@psc.edu>
 *           Bryan Learn <blearn@psc.edu>
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
session_start();
include 'trfunctions.php';

//GLOBAL VARIABLE DECLARATIONS
$inputs = array(
    "trUsername" => "",
    "trPassword" => "");
$inputErrors = array(
    "trUsername" => "",
    "trPassword" => "");
$errFlag = 0;
$errMsg = "";
//END VARIABLE DECLARATIONS



//Has the user supplied their username and password?
if (!empty($_SESSION["username"]))
	{
		//print 'You are already logged in, ' . $_SESSION["username"];
		header("Location:https://". $_SERVER['SERVER_NAME'] ."/main.php");
	}
else if ($_SERVER["REQUEST_METHOD"] == "POST")
    {
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
                
                $pwdMatchFlag = logIn($inputs["trUsername"],$inputs["trPassword"]);
                if ($pwdMatchFlag == 1){
                    $inputErrors["trPassword"] = "Incorrect username/password combination";
                    $errFlag = 1;
                }
                
            }
        // implode error messages into one string
        $errMsg = implode("<br>", array_filter($inputErrors));
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
    <!-- Modals for warning and error messages -->
    <div id="successModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		    <h4 class="modal-title"><p class="text-success">Success!</p></h4>
                </div>
                <div class="modal-body">
                    <p id="successModalText" class="text-success">Something good happened.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <div id="warnModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		    <h4 class="modal-title">Oops..</h4>
                </div>
                <div class="modal-body">
                    <p id="warnModalText" class="text-warning">Giving you a warning.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <div id="errorModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		    <h4 class="modal-title">Oops..</h4>
                </div>
                <div class="modal-body">
                    <p id="errorModalText" class="text-danger">Oh no an error occurred.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <!-- MODALS END -->

    <!-- NAVIGATION BAR -->
    <nav class="navbar navbar-dark bg-dark fixed-top navbar-expand-md">
        <div class="navbar-brand">
            Testrig 2.0
        </div>
        <div class="container"> <!-- used for spacing the tab link towards the center -->
            <div id="navbar" class="collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li class="nav-item">
                        <a id="menu-home" class="nav-link"
			   href="https://<?php echo $_SERVER['SERVER_NAME']?>/index.php">About</a>
                    </li>
                    <li class="nav-item">
                        <a id="menu-faq" class="nav-link"
			   href="https://<?php echo $_SERVER['SERVER_NAME']?>/faq.php">FAQ</a>
                    </li>
                </ul>
            </div> <!-- end class container div -->
    </nav>
    <!-- END NAVIGATION BAR -->
    
    
    <!-- MAIN Container for Login Form -->
    <div name="container-main" class="container">
	<div class="row starter-template">
	    <h1 class="text-center"> Log In </h1>
	</div>
	<div class="row">
	    <div name="padding-left" id="padding-left" class="col-8"></div>
	    <div name="loginSection" id="loginSection" class="col-8 starter-template">
		<form id="loginForm" name="loginForm" class="form-horizontal col-8" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" method="post" role="form" class="form-horizontal">
		    <div class="form-group">
			<label for="trUsername">Username</label> 
			<input type="text" id="trUsername" name="trUsername" class="form-control">
		    </div>
		    <div class="form-group">
			<label for="trPassword">Password</label> 
			<input type="password" id="trPassword" name="trPassword" class="form-control">
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

<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script src="bootstrap/dist/js/bootstrap.min.js"></script>
<script src="trmodals.js"></script>
<script>
 <?php
 print "modalSetFormSrc(\"login\");";
 print "loginFormInfo(".$errFlag.", \"".$errMsg."\");";
 ?>   
</script>
</html>
