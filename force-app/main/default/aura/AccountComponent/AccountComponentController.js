({
    
    init : function(component, event, helper) {
        
        component.set('v.mycolumns', [
              {label: 'Account Name', fieldName: 'linkName', type: 'url', 
            typeAttributes: {label: { fieldName: 'Name' }, target: '_blank'}},
            {label: 'Industry', fieldName: 'Industry', type: 'text'},
            {label: 'Type', fieldName: 'Type', type: 'Text'},
            {label: 'AnnualRevenue', fieldName: 'AnnualRevenue', type: 'Currency',typeAttributes: { currencyCode: 'USD' }},
            
        ]);
        
        helper.fetchAccounts(component, event, 3);
        
    },
    loadAll : function(component, event, helper) {
        
        component.set("v.viewAll", false);
        helper.fetchAccounts(component, event, 100);
        
    }

})