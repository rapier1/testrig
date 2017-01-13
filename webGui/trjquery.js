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
		var bwctlTools = [];
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
					var targetHostname = ps[0].host['host-name'][1];
					//iterate through all of the services this node has available
					for (var i=0; i < ps[0].services.length; i++)
					 {
						 if('bwctl-tools' in ps[0].services[i]) //is bwctl-tools in there?
						 {
							//need to push all bwctl-tools tests onto array for checkbox creation
							for (var c=0; c < ps[0].services[i]['bwctl-tools'].length; c++)
							 {
								bwctlTools.push(ps[0].services[i]['bwctl-tools'][c]);
							 }
						 }
					 }//end iterate through services associated with that host

					//Now We have our list of bwctl-tools, make a checkbox list
					nodeList = createHostNode(bwctlTools,targetHostname);





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
	$('#psPickerDiv').parent().removeClass('hidden');
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
	var testList = '<input type="radio" class="icon-bar label-success" id="nodeSelect" checked><div id="psNode" class="form-group col-2"><span class="col-2 label-success">' + hostname;
		for (var i=0; i<rawList.length; i++)
		 {
			testList += '<div class="form-check"> <label class="form-check-label col-2 label-success" for="testCheckbox_list[]">';
			testList += '<input class="form-check-input" type="checkbox" value = "' + rawList[i] + '" id="testCheckbox_list[]" checked>' + rawList[i];
			testList += '</label></div>';
		 }

	testList += '</span></div>';
	return testList;
                        //<input type="email" class="form-control" name="isoEmail" id="isoEmail" placeholder="user@emailaddress" value ="' . $_REQUEST["isoEmail"] . '">' . $isoFormInputErrors["email"] . '</div>

	//testList += '<div class="checkbox"><label><input type="checkbox" name="testCheckbox_list[]" id="testCheckbox_list[]" value=' . $val . '>'. $val .'</label></div>';



}
