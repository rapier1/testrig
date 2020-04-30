<?php 
/*
 * Copyright (c) 2017 The Board of Trustees of Carnegie Mellon University.
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
		 {   //Session is set, redirect to main page
                     header("Location: https://". $_SERVER['SERVER_NAME']. "/main.php");
                     die();
			//Session is Set, LOG OUT should be visible option
			//$url = "window.location='https://". $_SERVER['SERVER_NAME']. "/logout.php'";
			//$navLoginLogoutButton = '<button id="logout" onClick="'. $url . '" type="button" class="btn btn-sm btn-primary">Logout</button>';

		 }
		else
		 {
			//Session is NOT set, LOG IN should be visible option
			$url = "window.location='https://". $_SERVER['SERVER_NAME']. "/login.php'";
                        $navLoginLogoutButton = '<button id="logout" onClick="'. $url . '" type="button" class="btn btn-sm btn-primary">Log In</button>';
		 }
		include 'trfunctions.php';
?>



</head>
<body>
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
			   href="https://<?php echo $_SERVER['SERVER_NAME']?>/faq.php">FAQ</a>
		    </li>
		    <li class="nav-item">
			<a id="menu-faq" class="nav-link"
			   href="https://<?php echo $_SERVER['SERVER_NAME']?>/login.php">Login</a>
		    </li>
                </ul>
	    </div> <!-- end class container div -->
    </nav>
    <!-- END NAVIGATION BAR -->

    <div id="container-main" class="container">
	<div class="container">
	    <div class="row">
		<p class="lead" align="center">
		<br><b>Welcome to TestRig 2.0</b> - a software as a service offering provided by the Pittsburgh Supercomputing Center made possible by a grant from the National Science Foundation. TestRig 2.0 is designed to be a straightforward way to collect valuable network diagnostic information using dynamically generated bootable live ISOs. These can easily be burned to a CD or the user may download a self extracting application to create a bootable thumb drive. 
		</p>
	    </div><!-- end row -->
	</div>
	<div class="main-panels">
	    <div class="row">
		<div class="col-md-6">
		    <class="text-left"><I>Why TestRig 2.0?</I><br>
			
			Providing support to end users experiencing network performance issues is often a time consuming and involved process. From the initial problem report to resolution it can take days, if not weeks, to gather the necessary diagnostic information, implement suggested fixes, and then re-evaluate performance. Much of this time is spent in the data gathering phase, being that the necessary data is often difficult for end users to collect.<br><br>
			
			To address the difficulty of gathering data the Pittsburgh Supercomputing Center's Network Research Team has developed TestRig 2.0; a dynamically generated, customizable, ISO that boots the end user’s machine into a known good environment to run a variety of tests against the perfSONAR network measurement infrastructure. These tests are run automatically and require no special knowledge on the part of the user. The results, which include iperf, tcpdump, traceroute, Web10G data, host information, and more are automatically packaged and returned to the network engineer. Valuable network diagnostic data, which used to require days to gather, can now be had within an hour.
		    </p>
		</div>
		<div class="col-md-6">
		    <p class="text-left"><I>How does TestRig 2.0 work?</I><br>
			
			Once your organization signs up for the TestRig 2.0 service you’ll be able to request dynamically generated ISOs. Each ISO is specifically tailored for the user you are providing support for. After entering basic information such as the user’s name, contact information, trouble ticket number, and the name of the host that you want to test you’ll be presented with a set of tests to run against the closest available perfSONAR node. The custom ISO will then be dynamically generated and a download link sent to the end user. Once the user creates bootable media with the ISO, the user will then boot their machine directly into the TestRig 2.0 environment. After agreeing to run the tests, a number of tests will be automatically run and the results stored locally. These results will then be packaged and transferred back to your organization for analysis by network engineers. 
			
			<br><br><I>Who is TestRig 2.0 for?</I><br>
			
			TestRig 2.0 is aimed at any size institution that needs to provide support to end users that may have difficulties running a full range of network diagnostics on their hosts. Currently the service is provided free for members of the research and education community.
		    </p>
		</div>
	    </div><!-- end row -->
	</div>
    </div> <!-- END MAIN container -->
    <!-- jquery stuff -->
    <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
    <script src="trjquery.js"></script>
    <!-- END jquery stuff -->
</body>
</html>
