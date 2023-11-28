trigger OpprtunityRestHandler on Opportunity (after insert) {
    if(trigger.isAfter && trigger.isinsert){ 
        for(Opportunity opp: Trigger.New){
            OpportunityRestCallout.RestCallout();
        }
         }
}