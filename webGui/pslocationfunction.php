<?php

if ($_SERVER["REQUEST_METHOD"] == "POST")
        {
		if (!empty($_REQUEST["psLocateIP"]))
	  	{
			$args = " -i '".$_REQUEST["psLocateIP"]."' -c 1";
			echo "Arg string: '".$args."'\n";
    			$jsonResponse = shell_exec('ps_locate '.$args);
    			echo "Response: '".$jsonResponse."'\n";
	 	}
	}



?>
