trigger LeadTrigger on Lead (after insert,after update, after Delete) {
    if(trigger.isAfter && trigger.isinsert){ 
    for (Lead objLead : Trigger.new) {
        //make webservice callout 
        LeadTriggerHandler.sendLeadInfo(objLead.FirstName,objLead.LastName,objLead.Email,objLead.Company);
    }
    }
        if(trigger.isAfter && trigger.isupdate){ 
    for (Lead objLead : Trigger.new) {
        //make webservice callout 
        LeadTriggerHandler.updateLeadInfo(objLead.Id,objLead.FirstName,objLead.LastName,objLead.Email,objLead.Company);
    }
        }
         if(trigger.isAfter && trigger.isDelete){ 
             Lead obj =[select id, FirstName from Lead where id in: Trigger.old];
        LeadTriggerHandler.deleteLeadInfo();
    }
        
    
}