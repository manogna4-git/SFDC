trigger Country on Customer__c (before insert, before update) {
    if((trigger.isbefore)&&trigger.isInsert||trigger.isUpdate){
        
        for(Customer__c cust: Trigger.New){
            
            if(cust.Country__c != null && cust.Country__c !='')
            {
               cust.Country_Code__c = CountryPhoneCodes__c.GetValues(cust.Country__c).PhoneCode__c;
                cust.Country_Currency__c =DifferentCurrency__c.GetValues(cust.Country__c).Currency__c;
            }
            
        }
    }
}