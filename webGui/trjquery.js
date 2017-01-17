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



$( "td" ).click(
    function()
    {
	alert(this.innerHTML);
    });

//function to call psLocate() and build a small div containing the results. It will take in the value of 
$( "#hostSearchButton" ).click(
    
    function()
    {
	var nodeList = [];
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
                    // for each PS Host
                    for (var h=0; h<ps.length; h++){
	                var bwctlTools = [];
		        var targetHostname = ps[h].host['host-name'][1];
		        //iterate through all of the services this node has available
		        for (var i=0; i < ps[h].services.length; i++)
		        {
		            if('bwctl-tools' in ps[h].services[i]) //is bwctl-tools in there?
		            {
		                //need to push all bwctl-tools tests onto array for checkbox creation
		                for (var c=0; c < ps[h].services[i]['bwctl-tools'].length; c++)
		                {
		            	bwctlTools.push(ps[h].services[i]['bwctl-tools'][c]);
		                }
		            }
		        }//end iterate through services associated with that host
		        
		        //Now We have our list of bwctl-tools, make a checkbox list
		        nodeList.push(createHostNode(bwctlTools,targetHostname));
		    }//end for each host
		    nodeList.push(createCustomHostNode());
		}//end if valid json
		
		// if output is valid then use output data to populate #psPickerDiv
		populatePsPickerForm(nodeList);
	    }
      	});
	
    }
);//end 

function populatePsPickerForm(json){
    // setup fields
    
    // populate fields
    $('#psPickerDiv').html(json)
    
    // make div visible
    $('#psPickerDiv').parent().parent().removeClass('hidden');
}

function isJsonString(str) {
    try {
        JSON.parse(str);
    } catch (e) {
        return false;
    }
    return true;
}


function createHostNode(rawList,hostname)
{
    var testsWeSupport = [ "iperf", "iperf3", "nuttcp", "ping", "owamp", "tcpdump", "udp" ];
    //we need to always include tcpdump because it's not part of bwctl-tools, so push it onto the list of tests
    rawList.push("tcpdump");
    rawList.push("udp");
    var nodeList = '<div id="psNode" style="display: inline-flex" name="psNode" class="form-group col-md-3"><input type="radio" name="psNode" value="psNode1" checked><span class="col-2 label-success">' + hostname;
    nodeList += '<ul title="Available Tests:">'
    for (var i=0; i<rawList.length; i++)
    {
	nodeList += '<div class="form-check"> <label class="form-check-label label-success" for="testCheckbox_list[]">';
	nodeList += '<li class="label-success"><input class="form-check-input list-group-item" data-style="button" type="checkbox" value = "' + rawList[i] + '" name="testCheckbox_list[]" checked>' + rawList[i] + '</li>';
	nodeList += '</label></div>';
    }
    nodeList += '<div class="hidden form-check"> <label class="form-check-label label-success" for="hiddenTestTarget"><li class="label-success"><input class="form-check-input list-group-item" data-style="button" type="checkbox" value="'+ hostname +'" name="hiddenTestTarget" checked>' + hostname  + '</li></label</div>';
    nodeList += '</ul></span></div>';
 
    return nodeList;
    
}

function createCustomHostNode(){
    //CUSTOM "PICK YOUR OWN TEST NODE" SECTION //////////////////////////////
    var testsWeSupport = [ "iperf", "iperf3", "nuttcp", "ping", "owamp", "tcpdump", "udp" ];
    var nodeList ='<div id="psNodeCustom" style="display: inline-flex" name="psNodeCustom" class="form-group col-md-3"><input type="radio" name="psNode" value="psNodeCustom"><span class="col-2 label-success">';
    nodeList += '<input type="text" name="psNodeCustomTarget" id="psNodeCustomTarget" placeholder="perfSonar Node">';
    nodeList += '<ul title="Available Tests:">'
    for (var i=0; i<testsWeSupport.length; i++)
    {
	nodeList += '<div class="form-check"> <label class="form-check-label label-success" for="testCheckbox_listCustom[]">';
	nodeList += '<li class="label-success"><input class="form-check-input list-group-item" data-style="button" type="checkbox" value = "' + testsWeSupport[i] + '" name="testCheckbox_listCustom[]" checked>' + testsWeSupport[i] + '</li>';
	nodeList += '</label></div>';
    }
    nodeList += '</ul></span></div>'; //NOTE: No need for hidden field, as the hostname is given to us by the user and can be passed along

    
    return nodeList;
}
