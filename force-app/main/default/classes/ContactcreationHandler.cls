public class ContactcreationHandler {
    public static void CreateContact(List<Account> acclist)
    {
        List<Contact> c1 = new List<contact>();
     
        for(Account acc:acclist)
        {
            if(acc.Qualification__c == 'qualified')
            {
                contact c = new contact(LastName = acc.name, 
                        AccountId = acc.id,
                        Fax= acc.Fax,
                        Phone=acc.phone);
                      
 c1.add(c);
 }
 insert c1; 
 }
        }
}