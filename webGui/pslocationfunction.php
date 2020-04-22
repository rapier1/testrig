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
<?php

if ($_SERVER["REQUEST_METHOD"] == "POST")
        {
		if (!empty($_REQUEST["psLocateIP"]))
	  	{
			$ip = gethostbyname($_REQUEST["psLocateIP"]);
			$args = " -i '".$ip."' -c 3";
    			$jsonResponse = shell_exec('ps_locate '.$args);
    			echo $jsonResponse;
	 	}
	}



?>
