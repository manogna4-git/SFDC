({      
    getPositionList: function(component) {
        var action = component.get('c.getPositions');
        var self = this;
        action.setCallback(this, function(actionResult) {
            component.set('v.posList', actionResult.getReturnValue());
        });
        $A.enqueueAction(action);
    }
})