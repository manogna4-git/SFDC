({
createRecord : function (component, event, helper) {
    var navEvt = $A.get("e.force:navigateToSObject");
    navEvt.setParams({
      "recordId": "00QB0000000ybNX",
      "slideDevName": "related"
    });
    navEvt.fire();
}
})