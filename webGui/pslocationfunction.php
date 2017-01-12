<?php

if ($_SERVER["REQUEST_METHOD"] == "POST")
        {
		if (!empty($_REQUEST["psLocateIP"]))
	  	{
			$args = " -i '".$_REQUEST["psLocateIP"]."' -c 1";
			echo $args;
    			$jsonResponse = shell_exec('/usr/bin/whoami');
    			echo $jsonResponse;
	 	}
	}



?>
