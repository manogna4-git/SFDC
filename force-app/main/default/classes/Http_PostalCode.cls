public class Http_PostalCode {
    public List<string> places{get;set;}
    public string pincode{get;set;}
    public string body{get;set;}
    public void requestData(){
        places=new List<string>();
        Http http = new Http();
HttpRequest request = new HttpRequest();
request.setEndpoint('http://postalpincode.in/api/pincode/'+pincode);
request.setMethod('GET');
HttpResponse response = http.send(request);
       body=response.getBody();
        system.JSONParser jp = json.createParser(body);
        while(jp.nextToken()!=null){
            if(jp.getText()=='Name'){
                jp.nextToken();
                places.add(jp.getText());
            }
        }
    }

}