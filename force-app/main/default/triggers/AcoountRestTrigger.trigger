trigger AcoountRestTrigger on Account (After insert,After Update, after delete) {
    if(trigger.isInsert){
for (Account cc : Trigger.new) {
   
       AccountRest.Integrationccupdate(cc.Name);
       System.debug('cc.Name');
}
    }
        if(trigger.isupdate){
            List<String> recordId = new List<String>();

        // create new Account to pull the Account ID
        for (Account cc : Trigger.new) {

            // new instance of the account is set to a
            Account a = new Account();

            // set the Id to the Id of the new Account
            a.Id = cc.Id;

            // add the Account ID to the recordId List
            recordId.add(a.Id);

            // call the processRecords method and pass the recordId List
            AccountRest.integrationput(cc.Name); 

        }
   }
    if(trigger.isDelete){
for (Account cc : Trigger.old) {
   
       AccountRest.deleteintegration();
     
}
    }
}