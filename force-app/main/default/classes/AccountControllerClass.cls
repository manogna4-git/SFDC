public class AccountControllerClass {
    
    @AuraEnabled
    public static List < Account > fetchAccts(Integer intLimit) {
        
        return [ SELECT Id, Name, Industry, Type FROM Account LIMIT : Integer.valueOf(intLimit) ];
        
    }
    
}