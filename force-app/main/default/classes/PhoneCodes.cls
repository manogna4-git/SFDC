public class PhoneCodes {
    public List<CountryPhoneCodes__c> getData{get;set;}
    public PhoneCodes(){
        List<CountryPhoneCodes__c> phncodes = CountryPhoneCodes__c.getAll().values();
        getData=phncodes;
    }
        
    
}