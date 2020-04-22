<?php
// The idea is to get any information about completed tests,
// status of the ISO, etc, and present it to the user
// in the context of a modal. We will be passed the UUID
// and we can grab any necessary data from that
if ($_SERVER["REQUEST_METHOD"] == "POST")
{
    if (!empty($_REQUEST["id"]))
    {
        include "./trfunctions.php";
        $uuid = $_REQUEST["id"];
        $dbh = getDatabaseHandle();
        $query = $dbh->prepare("SELECT iso_retreived FROM client WHERE UUID=:uuid");
        $query->bindParam(':uuid', $uuid, PDO::PARAM_STR);
        $query->execute();
        $result = $query->fetch(PDO::FETCH_ASSOC);
        $retreived = $result['iso_retreived']; // date ISO was picked up
	if ($retreived == NULL) {
	    echo "No results found for this UUID";
	    exit;
	}
	$query = $dbh->prepare("SELECT * FROM testResponses WHERE UUID=:uuid");
	$query->bindParam(':uuid', $uuid, PDO::PARAM_STR);
        $query->execute();
	$result = $query->fetchall(PDO::FETCH_ASSOC);
	$response = "ISO retreived: $retreived\n";
	$node = "";
	foreach ($result as $tests) {
	    $times = array();
	    $run = $tests['run'];

	    // remove unneeded keys
	    unset($tests['run']);
	    unset($tests['UUID']);
	    unset($tests['runindex']);

	    //get start and end times
	    foreach ($tests as $test => $date) {
		if ($date) {
		    array_push($times, $date);
		}
	    }
	    asort($times);
	    $start = current($times);
	    $end = end($times);
	    
	    // sort the results by name
	    ksort($tests);
	    $node .= "<div id='testResults_$run' style='display: inline;' name='testResults_$run' class='col-md-3'>";
	    
	    $node .= "<span class='col-2 label-success'> Run # $run $start -> $end (UTC)\n";
	    $node .= "<ul style='padding-left: 10px' title='Tests: '>";
	    foreach ($tests as $test => $date) {
		$node .= "<li>$test: ";
		if ($date) {
		    $node .= "&#10004;";
		} else {
		    $node .= "&#10060;";
		}
		$node .= "</li>";
	    }
	    $node .="</ul>";
	    $node .= "</span></div>";
	}
	print $node;
    } else {
	echo "No UUID was found";
    }
    
} else {
    echo "Bad POST request";
}
?>
