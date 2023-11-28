public class Job_application {
    @AuraEnabled
    Public static String sendmail(Id parentId, String fileName, String base64Data, String contentType){
        String response = '';
        system.debug('parentId'+parentId);
        system.debug('fileName'+fileName);
        system.debug('base64Data'+base64Data);
        system.debug('contentType'+contentType);
        base64Data = EncodingUtil.urlDecode(base64Data, 'UTF-8');
        Attachment attach = new Attachment();
        attach.parentId = parentId;
        attach.Body = EncodingUtil.base64Decode(base64Data);
        attach.Name = fileName;
        attach.ContentType = contentType;
        Insert attach;
        system.debug('attach'+attach.id);
        contact ct = new contact();
        ct.LastName='test1';
        ct.Email='manognachowdary@gmail.com';
        insert ct;
        
        Position__c pos =  [select id,  HR_Email__c from Position__c where id =:parentId LIMIT 1];
        system.debug('______________'+pos);
        OrgWideEmailAddress[] org = [select Id from OrgWideEmailAddress where Address = 'manognachowdary4@gmail.com'];
        
        List<Messaging.EmailFileAttachment> attachments = new List<Messaging.EmailFileAttachment>();
        Messaging.EmailFileAttachment efa = new Messaging.EmailFileAttachment();
        efa.setFileName(attach.Name);
        efa.setBody(attach.Body);
        efa.setContentType(attach.ContentType);
        attachments.add(efa);
        
        
        Messaging.SingleEmailMessage semail = new Messaging.SingleEmailMessage();
        semail.setTemplateId([select id from EmailTemplate where Name='Job application'].Id);
        semail.setTargetObjectId(ct.Id);
        semail.setWhatId(pos.id);
        semail.setFileAttachments(attachments);
        semail.setTreatTargetObjectAsRecipient(false);
        List<String> sendTo = new List<String>();
        sendTo.add(pos.HR_Email__c);
        semail.setToAddresses(sendTo);
        
        
        try{            
            Messaging.SendEmailResult[] resultMail = Messaging.sendEmail(new Messaging.SingleEmailMessage[] { semail });
            
            if(resultMail[0].isSuccess()){
                // email sent successfully
               response = 'Applied Sucessfully';
            }
            else{
                response = resultMail[0].getErrors().get(0).getMessage();
            }
            
        }catch(System.EmailException ex){
            response = ex.getMessage();
        } 
        
        delete attach;
        delete ct;
        //Post Mail sent will update this Mail Sent field to true
        Position__c objPos = new Position__c();
        objPos.Id = parentId;
        objPos.Mail_Sent__c = true;
        update objPos;
        
        return response;
    }
}