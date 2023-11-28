public class LeadTriggerHandler {
     
    @future (callout=true)
    public static void sendLeadInfo(string FirstName, string LastName, string Email, string company) {
        try{
            HttpRequest request = new HttpRequest();
            HttpResponse response = new HttpResponse();
            Http http = new Http();
             
            request.setEndpoint('callout:SalesforceA/services/apexrest/LeadService');
            request.setHeader('Content-Type','application/json'); 
            request.setMethod('POST');
            string str = '{"fname":"'+FirstName+'","lname":"'+LastName+'","email":"'+Email+'","company":"'+Company+'"}';
            request.setBody(str);            
            
          response = http.send(request);
            if (response.getStatusCode() == 200) {
                System.debug('Response-' + response);
            }
        }
        catch(System.CalloutException e){
            System.debug('Error-' + e.getMessage());   
        }
    }
     @future (callout=true)
    public static void updateLeadInfo(string Id, string FirstName, string LastName, string Email, string company) {
      
            HttpRequest request = new HttpRequest();
            HttpResponse response = new HttpResponse();
            Http http = new Http();
             
            request.setEndpoint('callout:SalesforceA/services/apexrest/LeadService/id');
            request.setHeader('Content-Type','application/json'); 
            request.setMethod('PUT');
            string str = '{"Id":"'+Id+',"fname":"'+FirstName+'","lname":"'+LastName+'","email":"'+Email+'","company":"'+Company+'"}';
            request.setBody(str);            
           
            response = http.send(request);
            if (response.getStatusCode() == 200) {
                System.debug('Response-' + response);
            }
        }
     @future (callout=true)
    public static void deleteLeadInfo() {
      
    Http h1=new Http();
HttpRequest request = new HttpRequest();
            
            Http http = new Http();
        request.setEndpoint('callout:SalesforceA/services/apexrest/LeadService/id');
            request.setHeader('Content-Type','application/json'); 
            request.setMethod('Delete');
        HttpResponse response = h1.send(request);
      system.debug('---'+response.getBody());
        
        
}
}