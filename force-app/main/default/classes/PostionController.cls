public class PostionController {
    
        @AuraEnabled
    public static List <Position__c> getPositions() {
        
        return [ SELECT Id, Name, Company_Location__c, Company__c from Position__c Limit 8];
       
        
        
    }
        
            @AuraEnabled
    public static List<Position__c> findByName(String searchKey) {
        String name =  + searchKey + '%';
        return [SELECT id, Name, Company_Location__c FROM Position__c WHERE Name LIKE :Name];
    }
}