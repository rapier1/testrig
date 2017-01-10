//Top Menu Bar Button Functions for Hiding/Showing active Div
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


