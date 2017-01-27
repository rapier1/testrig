//hardcoded modal IDs (not the best approach)
modalID = {'warn': "#warnModal", 'error': "#errorModal", 'success': "#successModal"};
modalText = {'warn': "#warnModalText", 'error': "#errorModalText", 'success': "#successModalText"};

var formSrc = "";

$("form").submit(function(e) {
    var ref = $(this).find("[monkey]");
    $(ref).each(function(){
        if ( $(this).val() == '' )
        {
            alert("Please enter information for all required fields.");
            $(this).focus();
            e.preventDefault();
            return false;
        }
    });  return true;
});

function toggle_vis(id) {
    var e = document.getElementById(id);
    if (e.style.display == 'block')
	e.style.display = 'none';
    else
	e.style.display = 'block';
}

function modalSetFormSrc(value){
    formSrc = value;
}

function modalMessage(type, messageBody){
    $(modalText[type]).html(messageBody);
    $(modalID[type]).modal('show');
}

function isoFormInfo(flag, msg){
    if( formSrc == "isoForm" ){ //if data sent from this form
        if(flag == 1){
            modalMessage('error', msg);
        }
        else if(flag == 0){
            modalMessage('success', "ISO generation form submitted.");
        }
    }
}

function isoListInfo(flag, msg){
    if( formSrc == "isoList" ){ //if data sent from this form
        if(flag == 1){
            modalMessage('error', msg);
        }
        else if(flag == 0){
            modalMessage('success', "");
        }
    }   
}

function adminFormInfo(flag, msg, type){
    if( formSrc == "admin" ){ //if data sent from this form
        if(flag == 1){
            modalMessage('error', msg);
	    if (type == 1)
		toggle_vis('ud');
	    if (type == 2)
		toggle_vis('np');
	    if (type == 3)
		toggle_vis('nk');
        }
        else if(flag == 0){
	    if (type == 1)
		modalMessage('success', "Admin form submitted.");
	    if (type == 2)
		modalMessage('success', "Password successfully changed.");
	    if (type == 3)
		modalMessage('success', "New SCP generated and emailed to contact.");        
	}
    }
}

function loginFormInfo(flag, msg){
    if( formSrc == "login" ){ //if data sent from this form
        if(flag == 1){
            modalMessage('error', msg);
        }
        // no success message on login, just log user in.
    }
    
}

function signUpFormInfo(flag, msg){
    if( formSrc == "signUp" ){ //if data sent from this form
        if(flag == 1){
            modalMessage('error', msg);
        }
        else if(flag == 0){
            var notifyStr = "Your subscription request to TestRig2.0 has been received. Please allow 1 ";
            notifyStr += "business day to process the request and receive approval notification.";
            notifyStr += "Your SSH public key will be mailed to the supplied contact address shortly.";
            modalMessage('success', notifyStr);
        }
    }
    
}
