public class ContactTriggerHandler {
    public static void updateandCheck(List<Contact> listOfContact,Map<Id,Contact> oldMap){
        Set<Id> allupdatedconAccId = new Set<Id>();
        for(Contact con : listOfContact){
            if( con.LeadSource=='Partner Referral'){
                allupdatedconAccId.add(con.AccountId);
            }
        }
        List<Account> accontDetails=new List<Account>();
   accontDetails=[select id,OwnerId, owner.email from Account where Id=:allupdatedconAccId];
      Set<Id> accownerId=new Set<Id>();
        for(Account acc:accontDetails){
            accownerId.add(acc.OwnerId);
        }
        List<User> accownerDetails=new List<User>();
        if(!accownerId.isEmpty() && accownerId.size()>0 ){
            accownerDetails=[select id,email from user where Id=:accownerId];
        }
        System.debug('accownerDetails:::'+accownerDetails);
        if(accownerDetails.size()>0 && accownerDetails!=null){
            //call Apex Mail Method
            sendEmialAccountOwner(accownerDetails);
        }
    }
    
    //Send Email method
    public static void sendEmialAccountOwner(List<User> ulist){
        
        List<String> sendTo = new List<String>();
        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();  
        OrgWideEmailAddress org = [select Id from OrgWideEmailAddress where Address = 'nooreply43@gmail.com'];
        EmailTemplate et =[select id, name, Subject, Body from EmailTemplate where Name='Reagarding Contact Creation'];
        Messaging.SingleEmailMessage mail =  new Messaging.SingleEmailMessage();
        
        for(user u:ulist){
            sendTo.add(u.email);
        }  
        mail.setToAddresses(sendTo);
        
        mail.setReplyTo('nooreply43@gmail.com');
mail.setOrgWideEmailAddressId(org.Id);            
mail.SetSubject(et.subject);
mail.setPlainTextBody(et.Body);
mail.setTemplateId(et.id);
mail.setTargetObjectId(userinfo.getUserId());    
mail.setSaveAsActivity(false);
        
        System.debug('List of mails:::'+mails);
        
        if(mails.size()>0 && mails!=null){
            Messaging.sendEmail(mails);
        }
        
    }
    
    
}