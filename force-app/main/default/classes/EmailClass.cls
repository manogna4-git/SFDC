public class EmailClass {
   Public static void sendmail(List<contact> oldcontacts,List<contact> newContacts ){
       contact[] con =  [select id, name, accountId, account.owner.email, Leadsource from contact where id IN:newContacts];
         OrgWideEmailAddress[] org = [select Id from OrgWideEmailAddress where Address = 'nooreply43@gmail.com'];
      List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
       for(contact c:con)
       {
           if(c.LeadSource=='Partner Referral')
           {   List<String> recipients = new List<String>();
                recipients.add(c.account.owner.email);
               Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
               system.debug('sent'+recipients);
               mail.setOrgWideEmailAddressId(org.get(0).Id);
               mail.setTemplateId([select id from EmailTemplate where Name='Reagarding Contact Creation'].Id);
               mail.setTargetObjectId(c.Id);
                mail.setTreatTargetObjectAsRecipient(false);
                mail.setToAddresses(recipients);
               mail.setSaveAsActivity(false);
               mails.add(mail);
           }
       }
       Messaging.SendEmail(mails);
   }
}