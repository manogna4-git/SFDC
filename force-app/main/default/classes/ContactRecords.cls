public class ContactRecords {
@auraEnabled
   public static void createCon(string recId, string lastName)
   {
       Account a = [select Id, name, Qualification__c,(Select id from contacts) from Account where Id =:recId LIMIT 1];
       if(a.Qualification__c=='qualified')
           {
               Contact con = new contact(LastName=lastName + ' ' +a.Name, AccountId=recId);
               
               insert con;
           }
       }
   }