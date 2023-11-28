public class OpportunityRestCallout {
@future (callout=true)
    public static Void RestCallout(){
        List<Schema.FieldSetMember> fields = 
       Schema.SObjectType.Opportunity.fieldSets.getMap().get('Opportunity_Fields').getFields();
        HttpRequest request = new HttpRequest();
            HttpResponse response = new HttpResponse();
            Http http = new Http();
            request.setEndpoint('callout:SalesforceA/services/data/v52.0/sobjects/Opportunity');
            request.setHeader('Content-Type','application/json'); 
            request.setMethod('POST');
            String JsonString=JSON.serialize(fields);
        system.debug('without pretty'+JsonString);
         
           request.setBody(JsonString);
        //system.debug('kkk'+str);
        request.setCompressed(true);
          response = http.send(request);
            if (response.getStatusCode() == 200) {
                System.debug('Response-' + response);
            }
        }
        
    

}