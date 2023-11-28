trigger LeadTriggerCallout on Lead (after insert,after update, after Delete) {
    if(trigger.isAfter && trigger.isinsert){ 
    for (Lead objLead : Trigger.new) {
        //make webservice callout 
        LeadCreator.Rest();
    }
    }
}