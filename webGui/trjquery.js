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

//Top Menu Bar Button Functions for Hiding/Showing active Div on main.php
$( "#menu-isolist" ).click(
    function()
    {
	$("#container-isolist").removeClass('hidden');
	$("#container-isoform").addClass('hidden');
	$("#container-admin").addClass('hidden');
    });

$( "#menu-geniso" ).click(
    function()
    {
        $("#container-isolist").addClass('hidden');
        $("#container-isoform").removeClass('hidden');
        $("#container-admin").addClass('hidden');
    });

$( "#menu-admin" ).click(
    function()
    {
        $("#container-isolist").addClass('hidden');
        $("#container-isoform").addClass('hidden');
        $("#container-admin").removeClass('hidden');
    });
//END Menu Bar Button Functions


//style the iso list once the body loads
$( document ).ready(
    function()
    {
	$( "#isoRequestListDivTable" ).addClass('table-striped table-hover table-responsive');
    });


// bring up information about that particular run
$( "td" ).click(
    function()
    {
	var id = this.id;
	if (id == "uuid") {
	    var uuid = this.innerHTML;
	    $.ajax({
		type: "POST",
		url: "isoInformation.php",
		data: {id:uuid},
		success: function(buildPopUp) {
		    $(successModalTitle).html('Tests Run');
		    $(successModalText).html(buildPopUp);
		    $(successModal).modal('show');
		}
	    });
	}
    });


//function to call psLocate() and build a small div containing the results. It will take in the value of
$( "#hostSearchButton" ).click(
    function()
    {
	var MAXHOSTS = 3;
	$.ajax({
	    type: "POST",
	    url: 'pslocationfunction.php',
	    data:{psLocateIP:$( "#isoTestTargetIP").val()},
	    success:function(outputJson)
	    {
		// check output: Is it valid json? Is it an error?
		if (isJsonString(outputJson) == true) //valid
		{
	       	    var ps = JSON.parse(outputJson);
		    var flag = 0;
		    var count =0;
		    var nodeList = [];
		    for (var k = 0; k < ps.length; k++) {
			// stop after the first one that gives us a list of tools
    			if (flag == MAXHOSTS) {break;}

			// get the hostname
    			var targetHostname = ps[k].host['host-name'][1];
    			if (typeof targetHostname === 'undefined') {
			    targetHostname = ps[k].host['host-name'][0];
   			}
			
			//iterate through all of the services this node has available
    			for (var i=0; i < ps[k].services.length; i++)
    			{
			    if (flag == MAXHOSTS) {break;}
			    if('pscheduler-tools' in ps[k].services[i]) //is pscheduler-tools in there?
			    {
				var bwctlTools = [];
	    			if (flag == MAXHOSTS) {break;}
	    			flag++;
				count++;
	    			//need to push all pscheduler-tools tests onto array for checkbox creation
	    			for (var c=0; c < ps[k].services[i]['pscheduler-tools'].length; c++)
	    			{
				    var tool =  ps[k].services[i]['pscheduler-tools'][c];
				    tool = tool.replace("bwctl", "");
				    tool = tool.replace("iperf2", "iperf"); 
				    bwctlTools.push(tool);
	    			}
				nodeList += createHostNode(bwctlTools,targetHostname, count);
				while (bwctlTools.length > 0) { // empty the tools array explictly. 
				    bwctlTools.pop();
				}
			    }

    			}
		    }//end iterate through services associated with that host
		    //Now We have our list of bwctl-tools, make a checkbox list
		    
		}//end if valid json
		// add custom node
		nodeList += customNode(count);
		// if output is valid then use output data to populate #psPickerDiv
		populatePsPickerForm(nodeList);
	    }
      	});
    }
);//end

function populatePsPickerForm(json){
    // setup fields
    // populate fields
    $('#psPickerNoticeDiv').html('Nearby perfSonar nodes &nbsp;&nbsp;<I>Not all nodes will be accessible to the end user.</I></br>');
    $('#psPickerDiv').html(json);
    // make div visible
    //$('#psPickerDiv').parent().parent().removeClass('hidden');
}

function isJsonString(str) {
    try {
        JSON.parse(str);
    } catch (e) {
        return false;
    }
    return true;
}

function createHostNode(rawList,hostname, nodeCount)
{
    var testsWeSupport = [ "iperf", "iperf-recv", "iperf3", "iperf3-recv", "nuttcp", "ping", "owping", "tcpdump", "udp", "tracepath", "traceroute", "dublin-traceroute" ];
    //we need to always include tcpdump because it's not part of bwctl-tools, so push it onto the list of tests
    rawList.push("tcpdump");
    rawList.push("udp");
    rawList.push("dublin-traceroute");
    for (var i = 0; i<rawList.length; i++) {
	if (rawList[i] == "iperf") {
	    rawList.push("iperf-recv");
	}
	if (rawList[i] == "iperf3") {
	    rawList.push("iperf3-recv");
	}
    }
    // find intersection between tools supported by the ps node and the ones we support
    var hostToolSet = new Set(rawList);
    var supportedToolSet = new Set(testsWeSupport);
    var hostTools = [...hostToolSet].filter(x => supportedToolSet.has(x));

    // sort the lists for easier reading
    hostTools.sort();
    testsWeSupport.sort();

    // build the selection box for the psnode
    var node;
    node = '<div id="psNode' + nodeCount + '" style="display: inline;" name="psNode' + nodeCount + '" class="form-group col-md-3">';
    node += '<input type="radio" name="psNode" value="' + nodeCount + '">';
    node += '<span class="col-2 label-success">' + hostname;
    
    node += '<ul style="padding-left: 10px" title="Available Tests: ">';
    for (var i=0; i<hostTools.length; i++)
    {
	node += '<div class="form-check">'; 
	node += '<label class="form-check-label label-success" for="testCheckbox_list_' + nodeCount + '[]">';
	node += '<input data-style="button" type="checkbox" value = "' + hostTools[i] + '" name="testCheckbox_list_' + nodeCount + '[]" checked>' + hostTools[i] + '</br>';
	node += '</label>';
	node += '</div>';
	
    }
    node +='</ul>';
    node += '<input type=hidden name="hiddenTestTarget_' + nodeCount + '" value="' + hostname + '">';
    node += '</span></div>';

    return node;
}
    
//CUSTOM "PICK YOUR OWN TEST NODE" SECTION //////////////////////////////
function customNode (nodeCount)
{
    var testsWeSupport = [ "iperf", "iperf-recv", "iperf3", "iperf3-recv", "nuttcp", "ping", "owping", "tcpdump", "udp", "tracepath", "traceroute", "dublin-traceroute" ];
    testsWeSupport.sort();
    var cnode ='<div id="psNodeCustom" style="display: inline" name="psNodeCustom" class="form-group col-md-3"><input type="radio" name="psNode" value="psNodeCustom"><span class="col-2 label-success">';
    cnode += '<input type="text" name="psNodeCustomTarget" id="psNodeCustomTarget" placeholder="perfSonar Node">';
    cnode += '<ul style="padding-left: 10px" title="Available Tests:">'
    for (var i=0; i<testsWeSupport.length; i++)
    {
	cnode += '<div class="form-check"> <label class="form-check-label label-success" for="testCheckbox_listCustom[]">';
	cnode += '<input data-style="button" type="checkbox" value = "' + testsWeSupport[i] + '" name="testCheckbox_listCustom[]" checked>' + testsWeSupport[i] + '</br>';
	cnode += '</label></div>';
    }
    cnode += '</ul></span></div>'; //NOTE: No need for hidden field, as the hostname is given to us by the user and can be passed along
    cnode += '<input type=hidden name="nodeCount" value="' + nodeCount + '">'; // total number of nodes we are sending not including this one
    return cnode;
    
}
