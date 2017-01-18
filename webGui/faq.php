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
			$url = "window.location='https://". $_SERVER['SERVER_NAME']. "/logout.php'";
			$navLoginLogoutButton = '<button id="logout" onClick="'. $url . '" type="button" class="btn btn-sm btn-primary">Logout</button>';

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
				  <li><a id="menu-home" href="https://<?php echo $_SERVER['SERVER_NAME']?>/main.php">Home</a></li>
				  <li><a id="menu-faq" href="https://<?php echo $_SERVER['SERVER_NAME']?>/faq.php">FAQ</a></li>
				</ul>

				<ul class="nav navbar-nav navbar-right">
                                    <li class="navbar-btn"><?php print $navLoginLogoutButton ?></li>
                                    <li class="navbar-btn"><button id="signup" onClick="window.location='https://<?php echo $_SERVER['SERVER_NAME']?>/signup.php'"  type="button" class="btn btn-sm btn-primary">Sign Up</button></li>
                                </ul>
			</div><!--/.nav-collapse -->
		</div> <!-- END nav container -->
	</nav>






<div id="container-main" class="container">
  <div class="main-panels">
  <div class="row">
    <h4 class="text-center">
    Frequently Asked Questions
    </h4>
  </div><!-- end row -->

  <div class="row">
    <div class="col-md-6">
      <br><h4>1. How do I sign up for the TestRig 2.0 service?</h4><p>
The first step is creating an account at testrig.psc.edu. Aside from a username, password, and contact information you’ll also need to provide us with the following:
<ol><li>The hostname or ip address of the host that will receive the test data. On this host you’ll need to create an account to receive the data through scp. This account should be configured so that it does not provide an interactive shell on login. This is most easily accomplished by using rssh which is available as a package via yum/dnf or apt on most linux distributions or from http://www.pizzashack.org/rssh/. TestRig 2.0 does not work with the scponly application.</li>
<li>The absolute path to where you would like the data to be stored on your system. For example: ‘/home/testrigdata/incoming’</li>
<li>Optionally if you are using a trouble ticket system, such as RT, TestRig can be integrated automatically by providing the appropriate email address. For example: ‘rt-support@example.com’</li></ol>


After you have created the account, the TestRig team will review and validate the account within one business day. You will also be mailed an OpenSSH public key. This key is generated by our services and used to authenticate the transfer of the test results back to your local host. You will need to make sure that the target account on the local host is properly configured to make sue of this public key. In order to do this enter the target account and create a ./ssh directory. In that directory copy the public key into a file named ‘authorized_keys’. You will be able to generate new public keys as necessary through the administrative interface of your account on testrig.psc.edu.
</p>
<br><h4>2. Do I need to install any specific software on my servers?</h4><p>

TestRig 2.0 is provided as a Software as a Service offering to the larger community. As such, aside from software used to lock down the incoming results account mentioned above, there is no need to install additional TestRig 2.0 software. All communications, management, and authentication take place through a central TestRig 2.0 management server located at the Pittsburgh Supercomputing Center (PSC). This server creates and manages accounts, handles requests for new ISOs, generates these ISOs, provides authentication for the ISOs, and tracks usage.
</p>
<br><h4>3. What is the projected workflow for making use of TestRig 2.0? </h4><p>

When developing TestRig 2.0 the team developed a workflow which we feel will work with the large majority of customers. While this may not suit every customer we believe that it provided the most straightforward method of providing this service. 
<ol>
<li>Organization or customer registers an account at testrig.psc.edu</li>
<li>Public key is sent to organization.</li>
<li>Information is reviewed by PSC and account approved.</li>
<li>Organization sets up incoming test results account on local resources. </li>
<li>Account is secured with rssh</li>
<li>Provided public key is added to ./ssh/authorized_keys file</li>
<li>Organization receives user report of poor network performance</li>
<li>Trouble ticket assigned</li>
<li>Organization logs into TestRig 2.0 account and requests an ISO specific to that user.</li>
<li>TestRig 2.0 server generates new ISO</li>
<li>Trouble ticket updated by TestRig 2.0 (if applicable)</li>
<li>User and Organization contacted when ISO is available</li>
<li>User retrieves ISO from testrig.psc.edu</li>
<li>Trouble ticket updated by TestRig 2.0 to indicate user has downloaded the ISO</li>
<li>User creates bootable media from ISO</li>
<li>User boots machine into TestRig 2.0 environment</li>
<li>Tests are automatically conducted by TestRig 2.0 ISO</li>
<li>Results are automatically returned to incoming test results account</li>
<li>Trouble ticket updated to reflect that tests have been completed</li>
<li>Organization contact also informed.</li>
<li>Organization reviews data, determines likely cause of performance problem, and submits suggested fix to user.</li>
</ol>
</p>
<br><h4>4. How do I request a TestRig 2.0 ISO? </h4><p>

After logging into your account click the “Generate New ISO” tab at the top of the browser window. You’ll then need provide the following information
<ol>
<li>The hostname/ip address of the end user’s machine.
  <ol>
  <li>This is used to automatically determine the most appropriate perfSONAR node to run the tests against. If you leave this field blank you will need to manually choose a perfSONAR node. </li>
  <li>The maximum number of runs. Default of 7. </li>
  <li>How long the ISO is valid for. Default of 7 days.</li>
  <li>The associated trouble ticket number corresponding to the end user’s initial problem report. This field may be left blank. </li>
  <li>The end user’s name. This field may be left blank. </li>
  <li>The end user’s email address. This is how we will let them know that their ISO is ready for pickup. This is required information. </li>
  <li>Their affiliation; the organization that the end user is associated with. This field may be left blank.</li>
  <li>The RT queue name. If your trouble ticket system uses queues please enter the queue name associated with the end user’s request here. This field may be left blank. </li>
  <li>The tests that you would like to run. Currently the following tests are available:
    <ol>
      <li>iperf</li>
      <li>iperf3</li>
      <li>nuttcp</li>
      <li>owping (one way ping measurement)</li>
      <li>ping</li>
      <li>tcpdump - a 30 second capture.</li>
      <li>tracepath</li>
      <li>traceroute (includes traceroute and paris-traceroute)</li>
      <li>UDP tests</li> 
    </ol>
  </li>
  </ol></li>
</ol>

Once you have submitted this information a new ISO will be automatically generated. After completion both the end user and account contact (you) will be informed that the ISO is ready for pickup. ISOs will remain available on the server for 4 days.
<br><br>
It’s important to note that TestRig 2.0 depends on DHCP for addressing and nameservice. The end user’s host must be in a network that can properly respond to DHCP requests.
</p>
    </div>
    <div class="col-md-6">
      <br><h4>5. My end user is on a machine with multiple interfaces. How can I tell TestRig which interface to use?</h4><p>

At this time this TestRig does not support multiple interfaces. The capability may be developed in the future. You may still use TestRig on multiply homed machines but only one interface will be tested. Which interface that is depends on how DHCP sets up default routes during boot.

</p>
      <br><h4>6. Can I request that TestRig incorporate a new test?</h4><p>

All requests for new tests and/or modifications to existing tests will be considered by the TestRig 2.0. We are always on the lookout for new ideas.
</p>
      <br><h4>7. How do I know the end user has gotten the ISO or has run TestRig?</h4><p>

The account contact and, if available, trouble ticket system will receive email once the user picks up the TestRig ISO and upon successfully completing the tests. You can then retrieve the data set from the data host defined during account setup.
</p>
      <br><h4>8. How can the end users make bootable media from the ISO? Will you provide support for this?</h4><p>

End users have two options for creating bootable media. The first is by burning a CD or DVD with the ISO image. Mac OS X and Windows both have built in utilities to burn a CD from an ISO. Mac OS X users can use Disk Utility while Windows users (starting with Windows 7) simply need to insert blank media into a drive, right click on the ISO, a select Burn Image. The second is by creating a bootable flash drive. For systems without optical drives this would be the only feasible option. This process tends to be more complicated and requires the use of a helper application such as unetbootin (http://unetbootin.github.io/). The TestRig 2.0 distribution will have more extensive documentation on both methods but we cannot provide direct end user support.
</p>
      <br><h4>9. Can my users run the ISO as many times as they want?</h4><p>

No. When you have a TestRig 2.0 ISO generated you can specify the number of times the ISO can be used, how many days it can be used, or both. The default settings are to allow an ISO to be used seven time over seven days. This is to prevent a user from using an ISO outside of the context of a reported problem. After the ISO has been run the maximum number of time or has expired the ISO will no longer be able to authenticate against our servers and will not conduct any tests.
</p>
      <br><h4>10. How is an ISO authenticated?</h4><p>

When a TestRig 2.0 ISO is generated we create a unique public/private key pair for it. This key pair is used to encrypt a short string of randomly generated text. When the ISO boots it presents the encrypted known text to our authentication server which uses the corresponding private key to decrypt it. If that decrypted known text matches the known text stored on our servers the ISO is authenticated and unlocked. Without authentication the ISO is essentially unusable. This is designed into the system on purpose and gives us the ability to restrict the use of ISOs if we discover security issues, upgrade the underlying software, and so forth allowing us to ensure the same baseline environment across all ISOs.
</p>
      <br><h4>11. I’m going to be introducing TestRig 2.0 into my environment. How do I know it is secure?</h4><p>

The TestRig team kept best security practices in mind during development. During normal operation the TestRig environment makes no changes to the host machine and no data is written to the host media. The environment, including the file system, runs entirely in memory. After booting the user is immediately placed into the network test control program. Standard methods of escaping an application (ctrl-c, ctrl-z, and ctrl-\) are disabled. However, it is possible that the control program may crash and put the user into an interactive shell. 
<br><br>
All network communications between the TestRig environment and the central TestRig management server take place over SSL. No private or public keys are stored on the TestRig ISO. Test results are only sent to the defined host account - no results or information are shared with PSC or stored on the central TestRig management server. Aside from necessary network test applications there are no servers found on the TestRig ISO; ssh, http, smtp, etc are not installed on the ISO. Likewise, ssh, scp, ftp, telnet, netcat, and the like are not installed on the ISO. Lastly, apt and dpkg are also not found on the ISO. While perl is, by necessity, on the ISO no other compiled or interpreted languages are present.
</p>
      <br><h4>12. Where are the results? How do I interpret them? Can you provide support for this?</h4><p>
After the completion of the tests the packaged results will be securely transferred to your designated host. The name structure of the results file is &ltUUID&gt-&ltN&gt.tgz where UUID is the unique universal identity string that corresponds to the ISO. You can match the UUID to the specific user and trouble ticket in the ISO list tab of your account on testrig.psc.edu. Untarring the package will create a ‘results’ directory. In that directory will be a number of files with that follow the &ltUUID&gt-&ltN&gt-&ltTest&gt pattern. For example:
<br>
<br>F1F1BD16-C3D3-11E6-86F7-2B8E7D7DE884-1-hardware
<br>F1F1BD16-C3D3-11E6-86F7-2B8E7D7DE884-1-tcpdump.gz
<br>F1F1BD16-C3D3-11E6-86F7-2B8E7D7DE884-1-tcptrace
<br>F1F1BD16-C3D3-11E6-86F7-2B8E7D7DE884-1-iperf
<br><br>

Each file contains the results of each test in ascii format. The exception to this is the tcpdump.tgz file which is in tcpdump format. Additionally, there will be a *-tcptrace file in the directory that contains a preliminary analysis of the tcpdump file using tcptrace. 
<br><br>
Interpretation of the results is dependent on the experience of the network engineer. Providing detailed guides to interpreting test results is outside of the scope of this document. The TestRig team is generally not available to help with the diagnostic interpretation of these results but exceptions will be made on a case by case basis.
   </p>

       <br><h4>13. What if my question wasn't answered here?</h4><p>

Email support at &#116;&#101;&#115;&#116;&#114;&#105;&#103;&#064;&#112;&#115;&#099;&#046;&#101;&#100;&#117;

    </p>
    </div>
  </div><!-- end row -->
  </div>


</div> <!-- END MAIN container -->


<!-- jquery stuff -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="trjquery.js"></script>
<!-- END jquery stuff -->



</body>

</html>
