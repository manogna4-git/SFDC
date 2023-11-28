({
    handleSubmit : function(component, event, helper) {
           
  
    var action = component.get("c.saveCustomerForm");
        console.log('Cust',component.get('v.fields'));
        action.setParams({
             'Cust' : component.get('v.fields')
        });
        action.setCallback(this,function(a){
            var state = a.getState();
            if(state === "SUCCESS"){
                alert('Email Sent Successfully');
              
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
        //location.reload();
    }


    
     })