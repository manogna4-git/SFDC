({
    doInit: function(component, event, helper) {
        // getNewRecord loads a new record template that performs an insert when data is saved.
        component.find("creatingCustomerRecord").getNewRecord(
            "Customer__c", // Specify Object (entityAPIName)
            null,      // recordTypeId
            false,     // skip cache?
            $A.getCallback(function() {
                var cusRec = component.get("v.newCustomerRecord");
                var error = component.get("v.recordError");
                if(error || (cusRec === null)) {
                    alert("Error in initializing template");
                }
                else {
                    alert("Template initialize succesfully");
                }
            })
        );
    },
    
 
createCustomer: function(component, event, helper) {
        
         component.find("creatingCustomerRecord").saveRecord(function(saveResult) {
         
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

    },
  
    
})