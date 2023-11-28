public class AccountManager {
    
    @AuraEnabled
    public static list<Account> fetchAccounts(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:SalesforceA/services/apexrest/AccountService');
        request.setMethod('GET');        
        HttpResponse response = http.send(request);
        if (response.getStatusCode() == 200) {
            list<Account> results = (list<Account>) JSON.deserialize(response.getBody(), list<Account>.class);
            return results;
        } else {
            System.debug('### ' +response.getBody());
        }
		return null;
    }
    @AuraEnabled
    
 public static string HTTPMethods(String endpointURL,String jsonBody,String mathodName ){
Http http = new Http();
HttpRequest request = new HttpRequest();
request.setEndpoint(endpointURL);
request.setMethod(mathodName);  
if(mathodName == 'POST'){
request.setHeader('Content-Type', 'application/json;charset=UTF-8');
request.setBody(jsonBody);
}
HttpResponse response = http.send(request);
   if(response.getStatusCode() == 200) {
return response.getBody();
}else{
return response.getBody();
}
    }
    }