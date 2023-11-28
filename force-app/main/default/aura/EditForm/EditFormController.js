({
    doInit: function(component, event, helper) {
        // getNewRecord loads a new record template that performs an insert when data is saved.
        component.find("creatingContactRecord").getNewRecord(
            "Contact", // Specify Object (entityAPIName)
            null,      // recordTypeId
            false,     // skip cache?
            $A.getCallback(function() {
                var conRec = component.get("v.newContactRecord");
                var error = component.get("v.recordError");
                if(error || (conRec === null)) {
                    alert("Error in initializing template");
                }
                else {
                    alert("Template initialize succesfully");
                }
            })
        );
    },
 
createContact: function(component, event, helper) {
        
         component.find("creatingContactRecord").saveRecord(function(saveResult) {
         
           // Handling state of response(SUCCESS,INCOMPLETE,ERROR)
         
             if (saveResult.state === "SUCCESS" || saveResult.state === "DRAFT") {
                alert("Changes saved successfully.");
               
                 
            }
            else if (saveResult.state === "INCOMPLETE" ) {
                alert("Error in saving record");
            }
            else if (saveResult.state === "ERROR") {
               alert("Problem saving record, error:" +
                           JSON.stringify(saveResult.error));
            }
            else
            {
                 alert('Unknown problem, state: ' + saveResult.state + ', error: ' + JSON.stringify(saveResult.error));
            }
         
         });

    }

})