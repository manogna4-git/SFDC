({  
    
    onInit : function( component, event, helper ) {    
        
        let action = component.get( "c.AccountController" );  
        action.setParams({  
            recId: component.get( "v.recordId" )
        });  
        action.setCallback(this, function(response) {  
            
            var state = response.getState();  
            if ( state === "SUCCESS" ) {  
                
                $A.get("e.force:closeQuickAction").fire();  
                $A.get('e.force:refreshView').fire();   
                
            }  
                
            
        });  
        $A.enqueueAction( action );         
        
    }
    
})