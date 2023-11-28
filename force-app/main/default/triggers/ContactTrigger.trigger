trigger ContactTrigger on Contact (after insert, after update) {
    
    ContactTriggerHandler.updateandCheck(Trigger.New,Trigger.oldMap);

}