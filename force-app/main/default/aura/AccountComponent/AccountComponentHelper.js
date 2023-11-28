({
    
 fetchAccounts : function(component, event, intLimit) {
  
        var action = component.get("c.fetchAccts");
        action.setParams({
            
            "intLimit" : intLimit
            
        });
        
        action.setCallback(this, function(response) {
            
            var state = response.getState();
            
            if (state === "SUCCESS") {
                
                var records = response.getReturnValue();
                records.forEach(function(record){
                    record.linkName = '/'+record.Id;
                });   
                
                component.set("v.acctList", records);
                
            }            
            
        });
        
        $A.enqueueAction(action);
        
 }
    
})