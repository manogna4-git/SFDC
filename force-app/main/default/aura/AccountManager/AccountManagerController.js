({
    getAccounts: function (component, event, helper) {
        helper.getAccountsHelper(component, event, helper);
    },
    
    
    
    postAccounts : function(component, event, helper) {
		var action = component.get("c.Accounts");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.data", response.getReturnValue());
                              alert('sucessfully created');
            }
            else {
                console.log("Failed with state: " + state);
            }
        });
        $A.enqueueAction(action);
    }
    
});