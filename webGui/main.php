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

		//create a table from previous ISO requests where columns are these fields
		$isoRequestListFields = array("username", "useremail", "user_tt_id", "validtodate", "maxrun", "creation_timestamp", "requested_tests");
		$isoRequestListDiv = buildDiv("isoRequestListDiv", "testParameters", $isoRequestListFields);

		//$welcomeDiv = generateUserInfo();
                $isoFormResult = generateISORequestForm();
                $isoForm = $isoFormResult[0];

		//$adminForm = generateAdminForm();
		$adminFormResult = generateAdminForm();
		$adminForm = $adminFormResult[0];
	?>
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
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
				  <span class="sr-only">Toggle navigation</span>
				  <span class="icon-bar"></span>
				  <span class="icon-bar"></span>
				  <span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="http://<?php echo $_SERVER['SERVER_NAME']?>/index.php">Testrig 2.0</a>
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
<div class="row">
	<div id="padding-left" class="col-4"></div>

	<div id="container-isolist" class="hidden isoList">
	<div id="isoListTitle"><h1 class="text-center">My Generated ISOs</h1></div>
		<?php	print $isoRequestListDiv; ?>
	</div>

	<div id="container-isoform" class="main-panels">
		<?php	print $isoForm;?>
	</div>

	<div id="container-admin" class="hidden main-panels">
		<div id="adminFormTitle"><h1 class="text-center">Account Settings</h1></div>
		<?php   print $adminForm; ?>
	</div>

	<div id="padding-right" class="col-4">
	</div>
</div>
</div> <!-- END Main Container -->


<!-- jquery stuff -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="bootstrap/dist/js/bootstrap.min.js"></script>
<script src="trjquery.js"></script>
<script src="trmodals.js"></script>
<!-- Error checking for last form submit  -->
<script>
    <?php
        print "modalSetFormSrc(\"".$_REQUEST['form_src']."\");";
        print "isoFormInfo(".$isoFormResult[1].", \"".$isoFormResult[2]."\");";
        //print "isoListInfo(".$isoFormResult[1].",".$isoFormResult[2].");";
        print "adminFormInfo(".$adminFormResult[1].", \"".$adminFormResult[2]."\");";
    ?>
</script>
<!-- END jquery stuff -->


</body>

</html>
