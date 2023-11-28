({
navigate : function(component, event, helper) {

    //Find the text value of the component with aura:id set to "address"
    var address = component.find("address").get("v.value");

    var urlEvent = $A.get("e.force:navigateToURL");
    urlEvent.setParams({
      "url": 'https://www.linkedin.com/jobs/search/?currentJobId=2637019805&pivotType=jymbii' + address
    });
    urlEvent.fire();
}
    })