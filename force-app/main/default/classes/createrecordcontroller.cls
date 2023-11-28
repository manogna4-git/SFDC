public class createrecordcontroller {

    

@AuraEnabled

 public static Account saveAccount(String name, String accountType, Decimal revenue)

    {
        Account acc = new Account();
        acc.Name = name;
        acc.Type = accountType;
        acc.AnnualRevenue = revenue;
        insert acc;
        return acc;
    }
}