public class AccountClass {
    
    public static void fetchAccounts(){
         string resturL = 'callout:SalesforceA/services/data/v52.0/sobjects/account';
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(resturL);
        request.setMethod('GET');        
        HttpResponse response = http.send(request);
        
        System.debug(response.getBody());
    }
    
 public static void createAccount(string jsonBody){
     
    Http http = new Http();
HttpRequest request = new HttpRequest();
request.setEndpoint('callout:SalesforceA/services/data/v52.0/sobjects/Account');
request.setMethod('POST');
request.setHeader('Content-Type', 'application/json;charset=UTF-8');
// Set the body as a JSON object
request.setBody(jsonBody);
HttpResponse response = http.send(request);
// Parse the JSON response
if(response.getStatusCode() != 201) {
    System.debug('The status code returned was not expected: ' + response.getStatusCode() + ' ' + response.getStatus());
} else {
    System.debug(response.getBody());
}

}
}