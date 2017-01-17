//hardcoded modal IDs (not the best approach)
modalID = {'warn': "#warnModal", 'error': "#errorModal", 'success': "#successModal"};
modalText = {'warn': "#warnModalText", 'error': "#errorModalText", 'success': "#successModalText"};

var formSrc = "";

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

function adminFormInfo(flag, msg){
    if( formSrc == "admin" ){ //if data sent from this form
        if(flag == 1){
            modalMessage('error', msg);
        }
        else if(flag == 0){
            modalMessage('success', "Admin form submitted.");
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
