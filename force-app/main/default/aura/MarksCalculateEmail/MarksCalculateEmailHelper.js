({          
    handleSendMailtoFather : function(component,event,helper){  
        
        var action = component.get("c.sendMailWithPDF");
        action.setParams({
             'recordId' : component.get('v.recordId')
        });
        action.setCallback(this,function(a){
            var state = a.getState();
            if(state === "SUCCESS"){
                alert('Email Sent Successfully');
               $A.get("e.force:closeQuickAction").fire();
               
            } else if(state === "ERROR"){
                var errors = action.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        alert(errors[0].message);
                    }
                }
            } 
        });       
        $A.enqueueAction(action);
    }
})