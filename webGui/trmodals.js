//hardcoded model IDs (not the best approach)
modalID = {'warn': "#warnModal", 'error': "#errorModal", 'success': "#successModal"};
modalText = {'warn': "#warnModalText", 'error': "#errorModalText", 'success': "#successModalText"};

var formSrc = "";

function modalSetFormSrc(value){
    console.log("Form is from: "+value);
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
            modalMessage('success', "ISO form submitted");
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
            modalMessage('success', "Admin form submitted");
        }
    }
    
}
