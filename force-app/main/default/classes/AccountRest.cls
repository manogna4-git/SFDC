global class AccountRest {
@future (callout=true)
 public static void Integrationccupdate(string name) {
   //Construct HTTP request and response
    //Http request method,Endpoint and setBody
    HttpRequest req = new HttpRequest();
    req.setHeader('Content-Type', 'application/json;charset=UTF-8');
    String endpoint = 'callout:SalesforceA/services/data/v52.0/sobjects/account';
    req.setMethod('POST');
    req.setEndpoint(endpoint); 
    //system.debug('CC ID' +ccid);
    //SOQL to construct JSON string in set body
    Account cc=[select Name, Rating from Account where name=:name];
     system.debug('----'+cc);
    system.debug('without pretty'+JSON.serialize(cc.Name));
     string str = '{"Name":"'+cc.Name+'"}';
     system.debug('###'+str);
    String JsonString=JSON.serialize(cc.Name);
    req.setBody(str);
    
    //Http response method 
    Http http = new Http();
    HTTPResponse res = http.send(req);
    System.debug(res.getBody());

  }
    @future (callout=true)
 public static void integrationput(string name) {
   //Construct HTTP request and response
    //Http request method,Endpoint and setBody
    HttpRequest req = new HttpRequest();
    req.setHeader('Content-Type', 'application/json;charset=UTF-8');
    String endpoint = 'callout:SalesforceA/services/data/v52.0/sobjects/account/id';
    req.setMethod('PUT');
    req.setEndpoint(endpoint); 
    //system.debug('CC ID' +ccid);
    //SOQL to construct JSON string in set body
   Account cc=[select Id, Name, Rating from Account where name=:name];
     system.debug('----'+cc);
   string str = '{"Name":"'+cc.Name+'"}';
     system.debug('###'+str);
    String JsonString=JSON.serialize(cc.Name);
    req.setBody(str);
       
    //Http response method 
    Http http = new Http();
    HTTPResponse res = http.send(req);
    System.debug(res.getBody());

  }
       @future (callout=true)
 public static void deleteintegration() {
     set<id> accid = new set<id>();
   //Construct HTTP request and response
    //Http request method,Endpoint and setBody
    HttpRequest req = new HttpRequest();
    req.setHeader('Content-Type', 'application/json;charset=UTF-8');
    String endpoint = 'callout:SalesforceA/services/data/v52.0/sobjects/account/id';
    req.setMethod('Delete');
    req.setEndpoint(endpoint); 
    //system.debug('CC ID' +ccid);
    //SOQL to construct JSON string in set body
   Account cc=[select Id from Account where Id in:accid];
   req.setBody(cc.id);
       
    //Http response method 
    Http http = new Http();
    HTTPResponse res = http.send(req);
    System.debug(res.getBody());

  }
}