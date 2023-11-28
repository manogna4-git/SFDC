({
	getAccountsHelper : function(component, event, helper) {
		var action = component.get("c.fetchAccounts");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                
                // Set the columns for Datatable
                component.set('v.columns', [
                    {label: 'Name', fieldName: 'Name', type: 'texts'},
                    {label: 'Account Number', fieldName: 'AccountNumber', type: 'text'},
                    {label: 'Phone', fieldName: 'Phone__c', type: 'phone', 
                        cellAttributes: { iconName: 'utility:phone_portrait' }},
                    {label: 'Website', fieldName: 'Website', type: 'url'}
                ]);
                
                component.set("v.data", response.getReturnValue());
            }
            else {
                console.log("Failed with state: " + state);
            }
        });
        $A.enqueueAction(action);
	}

   

    
})