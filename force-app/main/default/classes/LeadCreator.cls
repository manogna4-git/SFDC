public class LeadCreator {
@future (callout=true)
    public static Void Rest(){
        List<Schema.FieldSetMember> fields = 
       Schema.SObjectType.Lead.fieldSets.getMap().get('Lead_Fields').getFields();
        HttpRequest request = new HttpRequest();
            HttpResponse response = new HttpResponse();
            Http http = new Http();
            request.setEndpoint('callout:SalesforceA/services/data/v52.0/sobjects/Lead');
            request.setHeader('Content-Type','application/json;charset=UTF-8'); 
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