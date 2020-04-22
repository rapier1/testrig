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
if (empty($_SESSION["username"]))
{
    header("Location: https://". $_SERVER['SERVER_NAME']. "/login.php");
    die();
}

include 'trfunctions.php';

//create a table from previous ISO requests where columns are these fields
$isoRequestListFields = array("username", "useremail", "user_tt_id", "validtodate", "maxrun", "creation_timestamp", "requested_tests", "uuid");
$isoRequestHeaders = array("User Name", "Email", "Ticket", "Valid To", "Runs", "Timestamp", "Tests", "UUID");
$isoRequestCellWidth = array("10", "10", "5", "10", "5", "10", "25", "25");
$isoRequestListDiv = buildDiv("isoRequestListDiv", "testParameters", $isoRequestListFields, $isoRequestHeaders, $isoRequestCellWidth);

$isoFormResult = generateISORequestForm();
$isoForm = $isoFormResult[0];

$adminFormResult = generateAdminForm();
$adminForm = $adminFormResult[0];
?>

<!DOCTYPE html>
<html lang="en">
    <head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>TestRig 2.0 Main</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<style>
	 .container-main{ margin: 20px;}
	</style>
	<!-- Custom styles for this template -->
	<link href="trstylesheet.css" rel="stylesheet">
    </head>
    <body>
	<!-- MODALS for warning and error messages -->
        <div id="successModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
			<h4 class="modal-title"><p id="successModalTitle" class="text-success">Success!</p></h4>
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
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
			<h4 class="modal-title">Oops..</h4>
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
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
			<h4 class="modal-title">Oops..</h4>
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
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
	<!-- EMD MODALS -->
	
	<!-- NAVIGATION BAR -->
	<nav class="navbar navbar-dark bg-dark fixed-top navbar-expand-md">
	    <div class="navbar-brand">
		Testrig 2.0
	    </div>
	    <div class="container"> <!-- used for spacing the tab link towards the center -->
		<div id="navbar" class="collapse navbar-collapse">
		    <ul class="nav navbar-nav">
			<li class="nav-item">
			    <a href="#geniso" class="nav-link active" data-toggle="tab">Make ISO</a>
			</li>
			<li class="nav-item">
			    <a href="#isolist" class="nav-link" data-toggle="tab">List ISOs</a>
			</li>
			<li class="nav-item">
			    <a href="#admin" class="nav-link" data-toggle="tab">Account</a>
			</li>
			<li class="nav-item">
			    <a id="menu-faq" href="https://<?php echo $_SERVER['SERVER_NAME']?>/faq.php"
			       class="nav-link">FAQ</a>
			</li>
		    </ul>
		</div> <!-- end class container div -->
		<nav class="navbar-right navbar-btn ml-auto nav-item">
		    <button id="logout" onclick="window.location='https://<?php echo $_SERVER['SERVER_NAME']?>/logout.php'"
			    type="button" class="btn btn-sm btn-primary">Logout</button>
		</nav>
	</nav>
	<!-- END NAVIGATION BAR -->
	
	<!-- MAIN CONTAINER -->
	<div class="container-main">
	    <div class="tab-content">
		<div class="tab-pane fade show active" id="geniso">
		    <?php print $isoForm;?>
		</div>
		<div class="tab-pane fade" id="isolist">
		    <div id="isoListTitle">
			<h3 class="text-center">My ISOs</h3>
		    </div>
		    <?php print $isoRequestListDiv; ?>
		</div>
		
		<div class="tab-pane fade" id="admin">
		    <?php print $adminForm;?>
		</div>
	    </div>
	</div>
	<!-- END MAIN CONTAINER -->
	
	<!-- jquery stuff -->
	<script src="trjquery.js"></script>
	<script src="trmodals.js"></script>
	<!-- Error checking for last form submit  -->
	<script>
	 <?php
         print "modalSetFormSrc(\"".$_REQUEST['form_src']."\");";
         print "isoFormInfo(".$isoFormResult[1].", \"".$isoFormResult[2]."\");";
         print "adminFormInfo(".$adminFormResult[1].", \"".$adminFormResult[2]."\", $adminFormResult[3]);";
	 ?>
	</script>
	<!-- END jquery stuff -->
    </body>
</html>
