public class CustomerRegistration {
@auraEnabled
    public static void saveCustomerForm(List<Customer__c> Cust){
     Customer__c[] cust1 = [SELECT Id, Email__c FROM Customer__c WHERE Id =: Cust];
        
            insert Cust;
            system.debug('cust'+cust);
 
 
  contact ct = new contact();
    ct.LastName='test1';
    ct.Email='test1@gmail.com';
 insert ct;
    List<Messaging.SingleEmailMessage> mail = new List<Messaging.SingleEmailMessage>();
        for(Customer__c objcust : cust1){
            Messaging.SingleEmailMessage semail = new Messaging.SingleEmailMessage();
           semail.setTemplateId([select id from EmailTemplate where Name='Customer Registration'].Id);
            semail.setTargetObjectId(ct.Id);
            semail.setWhatId(objcust.Id);
            semail.setTreatTargetObjectAsRecipient(false);
            List<String> sendTo = new List<String>();
            sendTo.add(objcust.Email__c);
            semail.setToAddresses(sendTo);
            //semail.setPlainTextBody('Please find the attached student total marks details');
            
            mail.add(semail);
       }
        Messaging.sendEmail(mail);
           delete ct;
    }    
}