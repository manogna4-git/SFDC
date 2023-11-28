/*Author: Manogna Kovi
 * Created Date: 3-Jan-2023
 * Class Name: AccountControllerUtill
 * Method Name:handleUpdate
 * Description: The method has been invoked in apex trigger       
*/
public with sharing class AccountControllerUtill {
    //created method to pass list of new accounts and map of old accounts with id
    public static void handleUpdate(List<Account> newAccounts, Map<Id, Account> oldAccountMap) {
        //calling helper method
      checkLimit(newAccounts, oldAccountMap);
    }
    //created helper method
    public static void checkLimit(List<Account> newAccounts, Map<Id, Account> oldAccountMap) {
       string fieldsetname = system.label.AccountFieldSet;//custom Label
        //Checking null pointer
        if(fieldsetname!=null && fieldsetname != ''){
       Schema.FieldSet fieldSet = Schema.SObjectType.Account.FieldSets.getMap().get(fieldsetname); 
       //Iterating through new values
        for(Account acc : newAccounts){
            //getting all the fields from field set
            for (Schema.FieldSetMember f : fieldSet.getFields()) {
              //comparing old and new values
              if (acc.get(f.getFieldPath()) != oldAccountMap.get(acc.Id).get(f.getFieldPath())){
                  //it checks the "field count" field  has been updated more than the number specified in custom label
                 if(acc.Field_Count__c == integer.valueof(system.label.billingaddresscount)) {
                     // it will throw the error if specied limit crossed
                       acc.addError(system.label.BillingAddressUpdateError);
                    } 
                        else{
                            //otherwise the "field count" field is incremented by 1.
                         acc.Field_Count__c +=1;	
                        }
                }      
            }   
        }
    }
}
}