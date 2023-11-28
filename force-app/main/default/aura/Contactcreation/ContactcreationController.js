({
	save : function(component, event, helper) {
        console.log("Last Name:");
        var action = component.get("c.createCon");
        action.setParams({
            recId: component.get("v.recordId"),
            lastName: component.get("v.lastname")
             });
        action.setCallback(this,function(response){
          var state = response.getState();
            if (state === "SUCCESS") {
                alert( response.getReturnValue() );
                $A.get("e.force:closeQuickAction").fire();
                $A.get("e.force:refreshView").fire();
            }
        });
        $A.enqueueAction(action);
         
		
	}
    
})