<?php

/* Classes used to represent PerfSONAR records  */
class PerfSonarHost {
    public $name;	// Host name/IP; Array of Strs
    public $interfaces;	// Array of PerfSonarInterfaces
    public $services;	// Array of PerfSonarServices
    public $distance;	// Approximate distance from search point (user-provided IP)
}

class PerfSonarInterface {
    public $address;	// IP Address of iface; Array of Strs
    public $capacity;	// Capacity of iface; Array of Ints
    public $mtu;	// Mtu of iface; Array of Ints
}

class PerfSonarService {
    public $name;	// Description name for the service
}

/* Functions for getting and using data returned from ps_locate.py  */

// Returns the output of running 'python ./ps_locate.py -i "$ip" -c $count' on the local system. Either returns array of records or an integer indicating error.
function runPSLocateJson($ip, $count) // ip: IP address to lookup, count: number of test hosts to return.
{
    $args = " -i '".$ip."' -c '".$count."'";
    $jsonResponse = shell_exec('ps_locate '.$args);   
    return $jsonResponse;
}

// Returns the output of running 'python ./ps_locate.py -i "$ip" -c $count' on the local system. Either returns array of records or an integer indicating error.
function runPSLocate($ip, $count) // ip: IP address to lookup, count: number of test hosts to return.
{
    $args = " -i '".$ip."' -c '".$count."'";
    $jsonResponse = shell_exec('ps_locate '.$args);   
    $records = json_decode($jsonResponse);
    if($records === null) {
        //die("ps_locate returned invalid json - likely an error response.\nOutput:".$hostRecord."\n");
        return -1;
    }
    return $records;
}

// Returns entire Host record from full record
function getHostFromRecord($record)
{
    return json_encode($record->host);
}

// Returns all Interface records from full record
function getInterfacesFromRecord($record)
{
    return json_encode($record->interfaces);
}

// Returns all Services records from full record
function getServicesFromRecord($record)
{
    return json_encode($record->services);
}

// Returns most common fields used by the web gui
function getWebFieldsFromRecord($record)
{
    $hostCnt = count($record);
    //echo "Hosts: $hostCnt\n";
    $hosts = array();
    for($h=0; $h<$hostCnt; $h++){	// foreach host
       $hosts[$h] = new PerfSonarHost();
       $hosts[$h]->name = $record[$h]->host->{"host-name"}; // copy value from record

       $intCnt = count($record[$h]->interfaces);
       //echo "Interfaces: $intCnt\n";
       $ints = array();
       for($i=0; $i<$intCnt; $i++){	// foreach interface
          $ints[$i] = new PerfSonarInterface();
          $ints[$i]->address = $record[$h]->interfaces[$i]->{"interface-addresses"}; // copy values from record
          $ints[$i]->capacity = $record[$h]->interfaces[$i]->{"interface-capacity"};
          $ints[$i]->mtu = $record[$h]->interfaces[$i]->{"interface-mtu"};
       }
       $hosts[$h]->interfaces = $ints; // add interfaces to host object

       $srvCnt = count($record[$h]->services);
       //echo "Services: $srvCnt\n";
       $srvs = array();
       for($s=0; $s<$srvCnt; $s++){	// foreach service
          $srvs[$s] = new PerfSonarService();
          $srvs[$s]->name = $record[$h]->services[$s]->{"service-name"}; // copy value from record
       }
       $hosts[$h]->services = $srvs; // add services to host object
    }

    return $hosts;
}

/* Example usage of the above functions and classes */

$result = runPSLocate("128.182.1.60", 3);	// Execute ps_locate with parameters: ip="128.182.1.60" and count=3
if($result !== -1){	// Result will be -1 if an error occurs, otherwise result will be an array of records
    $myHosts = getWebFieldsFromRecord($result);	// Return an array of PerfSonarHost objects
    //echo json_encode($myHosts);	// print to screen

    // Stepping through array of PerfSonarHost objects, printing the value of each property
    $hostCnt = count($myHosts);
    echo "Hosts [$hostCnt]:\n";
    for($h=0; $h<$hostCnt; $h++){	// foreach host
        echo "\thost ($h/$hostCnt)\n";
        echo "\tHost name: " . json_encode($myHosts[$h]->name) . "\n"; // $myHosts[$h]->name is an Array of Strings
        echo "\tDistance: " . $myHosts[$h]->distance . "\n";

        $srvCnt = count($myHosts[$h]->services);
        echo "\tServices [$srvCnt]: \n";
        for($s=0; $s<$srvCnt; $s++){	// foreach service
            echo "\t\tservice ($s/$srvCnt)\n";
            echo "\t\t\tname: " . json_encode($myHosts[$h]->services[$s]->name) . "\n"; // $myHosts[$h]->services[$s]->name is an Array of Strings
        }

        $intCnt = count($myHosts[$h]->interfaces);
        echo "\tInterfaces [$intCnt]: \n";
        for($i=0; $i<$intCnt; $i++){	// foreach service
            echo "\t\tinterface ($i/$intCnt)\n";
            echo "\t\t\taddress: " . json_encode($myHosts[$h]->interfaces[$i]->address) . "\n"; // ->address is an Array of Strings
            echo "\t\t\tcapacity: " . json_encode($myHosts[$h]->interfaces[$i]->capacity) . "\n"; // ->interfaces is an Array of Strings
            echo "\t\t\tmtu: " . json_encode($myHosts[$h]->interfaces[$i]->mtu) . "\n"; // ->mtu is an Array of Ints
        }
    }
}
?>
