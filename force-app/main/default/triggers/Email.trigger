trigger Email on Contact (after insert,after update) {
if((trigger.isInsert||trigger.Isupdate) && trigger.isAfter)
{
    contact con =[select id, LeadSource, account.owner.email from contact where accountId!=null];
    EmailTemplate et = [Select id, name from EmailTemplate where Name = 'Reagarding Contact Creation' Limit 1];
   List<Messaging.SingleEmailMessage> mails =  new List<Messaging.SingleEmailMessage>();

    for(contact c:Trigger.new)
    {
        if(c.LeadSource=='Partnerreferal')
        {
            
        }
            
    }
}
}