({
    doInit: function(component, event, helper) {
        helper.getPositionList(component);
    },
    searchKeyChange: function(component, event) {
        var searchKey = component.find("searchKey").get("v.value");
        console.log('searchKey:::::'+searchKey);
        var action = component.get("c.findByName");
        action.setParams({
            "searchKey": searchKey
        });
        action.setCallback(this, function(a) {
            component.set("v.posList", a.getReturnValue());
        });
        $A.enqueueAction(action);
    },  
    
    handleClick :function(component, event) {
         // document.getElementById("focus").focus();
        //alert( event.target.id);
        var id = event.target.id;
        // alert(event.target.dataset.id);
        var showpage = component.get("v.showInfoPage");
        console.log("id____",id);
        console.log("showInfo____", component.get("v.showInfo"));
        console.log("showpage____",showpage);
        if(showpage  &&  id  ===  component.get("v.showInfo")){
            component.set("v.showInfoPage",false);
        }else{
            component.set("v.title",event.target.dataset.id);
            component.set("v.showInfoPage",true);
           
            component.set("v.sldsClass","slds-size_4-of-12" );
            component.set("v.showInfo",id);
            
        }
    },
    
    /*navigate : function(component, event, helper) {

    //Find the text value of the component with aura:id set to "address"
    var address = component.find("Location__c").get("v.value");
console.log("address",address);
    var urlEvent = $A.get("e.force:navigateToURL");
    urlEvent.setParams({
      "url": 'https://www.google.com/maps/place/' + address
    });
    urlEvent.fire();

},*/
    applyJob:function(component, event) {
        $A.createComponent(
            "c:Job_application",{
                "recordId": component.get("v.showInfo"),
                "showmodal":true
            },
            function(modalComponent, status, errorMessage){
                //Add the new button to the body 
               
                if (status === "SUCCESS") {
                    var body = component.find('showChildModal').get("v.body"); 
                    body.push(modalComponent);
                   component.find('showChildModal').set("v.body", body);
                }
                else if (status === "INCOMPLETE") {
                    console.log("No response from server or client is offline.")
                    // Show offline error
                }
                else if (status === "ERROR") {
                    console.log("Error: " + errorMessage);
                    // Show error message
                }
            }
        );
    }
})