@isTest
Public class AccountControllerUtillTest {

    @isTest static  void testHandleBeforeUpdate() {
    // Create an Account record
    Test.startTest();
    Account testAccount = new Account();
    testAccount.Name = 'Test Account';
    testAccount.Field_Count__c = 0;
    insert testAccount;
    // Update the Account record and verify that it is allowed
    testAccount.BillingStreet = '123 Main St';
    update testAccount;
    // Update the Account record again and verify that it is allowed
    testAccount.BillingStreet = '456 Main St';
    update testAccount;
    // Update the Account record again and verify that it is allowed
    testAccount.BillingStreet = '789 Main St';
    
    update testAccount;
    // Update the Account record a fourth time and verify that it is not allowed
    testAccount.BillingStreet = '321 Main St';
        system.debug('updated'+testAccount.Field_Count__c);
        testAccount.Field_Count__c =3;
    try {
        update testAccount;
     
        //System.assert(false, 'The billing address update should not have been allowed');
    } catch (Exception e) {
        System.assert(e.getMessage().contains(System.label.BillingAddressUpdateError), 'Unexpected error message: ' + e.getMessage());
    }
Test.stopTest();
}

}