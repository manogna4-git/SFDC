Public class CreateRecord{
public static void record(string name)
{
    Account acc = new Account();

    acc.name = name;
    acc.rating = 'Hot';
    acc.industry = 'Finance';
    acc.Annualrevenue = 4500000;
    acc.type = 'Prospect';
    acc.Phone = '9988009900';
    acc.fax = '8899887766';
    acc.active__C = 'Yes';
     insert acc;

    if(acc.id != null)
    {
        // Create the Associated contact Record..
       Contact con = new Contact();
          con.lastname = acc.name + 'Contact 1';
            con.title = 'Vice President';
            con.Phone = '8877665544';
            con.fax = '9988776655';
            con.mobilephone = '9900990000';
            con.email = 'contact@test.com';
            con.mailingcity = 'Hyderabad';
            con.accountid = acc.id;
        
        insert con;
        if(con.id != null)
        {
            system.debug('Contact Record Id is...: '+ con.id);
        }
    }
    
        // Create the associated opportunity..
        Opportunity oppty = new Opportunity();
            oppty.Name = acc.name;
            oppty.StageName = 'Needs Analysis';
            oppty.CloseDate = system.today().AddDays(2);
            oppty.Amount = 20000;
            oppty.accountid = acc.id;
        
        insert oppty;
        if(oppty.id != null)
        {
            system.debug('Opportunity id is...: '+ oppty.id);
        }
    }
    }