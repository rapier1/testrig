<?php

if ($_SERVER["REQUEST_METHOD"] == "POST")
        {
		if (!empty($_REQUEST["psLocateIP"]))
	  	{
			$ip = gethostbyname($_REQUEST["psLocateIP"]);
			$args = " -i '".$ip."' -c 2 -f 'gui'";
    			$jsonResponse = shell_exec('ps_locate '.$args);
    			echo $jsonResponse;
	 	}
	}



?>
