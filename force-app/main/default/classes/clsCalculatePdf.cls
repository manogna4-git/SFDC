public class clsCalculatePdf { 
@auraEnabled
public static void sendMailWithPDF(String recordId){
      Student__c[] stud = [SELECT Id, Father_s_Email__c, Student__C.OwnerId FROM Student__c WHERE Id =: recordId];
  contact ct = new contact();
    ct.LastName='test';
    ct.Email='test@gmail.com';
 insert ct;
    List<Messaging.SingleEmailMessage> mail = new List<Messaging.SingleEmailMessage>();
        for(Student__c objStu : stud){
            Messaging.SingleEmailMessage semail = new Messaging.SingleEmailMessage();
            Messaging.EmailFileAttachment attach = new Messaging.EmailFileAttachment();
            PageReference pref = page.CalculateMarksPDFPage; // Visualforce Page Name
            pref.getParameters().put('Id',recordId);
            pref.setRedirect(true);
            Blob b;
            b = pref.getContent();
            attach.setFileName(System.label.TotalMarks);
            attach.setBody(b);
            semail.setTemplateId([select id from EmailTemplate where Name='MarksDetails'].Id);
            semail.setTargetObjectId(ct.Id);
            semail.setWhatId(objstu.Id);
            semail.setTreatTargetObjectAsRecipient(false);
            List<String> sendTo = new List<String>();
            sendTo.add(objStu.Father_s_Email__c);
            semail.setToAddresses(sendTo);
            //semail.setPlainTextBody('Please find the attached student total marks details');
            semail.setFileAttachments(new Messaging.EmailFileAttachment[]{attach});
            mail.add(semail);
       }
        Messaging.sendEmail(mail);
           delete ct;
    }    
}