global class CreateCSVandSendEmailBatch implements Database.Batchable<sobject> {
  
    global Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator('SELECT Id, Name, Email FROM Contact');
    }

    global void execute(Database.BatchableContext BC, List<sObject> scope) {
        // Build the CSV file
        String csv = 'Id,Name,Email\n';
        for (Contact c : (List<Contact>)scope) {
            csv += c.Id + ',' + c.Name + ',' + c.Email + '\n';
        }

        // Create the email attachment
        Messaging.EmailFileAttachment attachment = new Messaging.EmailFileAttachment();
        attachment.setFileName('Contacts.csv');
        attachment.setBody(Blob.valueOf(csv));

        // Send the email
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setSubject('Contacts CSV');
        mail.setToAddresses(new String[] {'manognachowdary4@gmail.com'});
        mail.setPlainTextBody('Attached is the CSV file of contacts');
        mail.setFileAttachments(new Messaging.EmailFileAttachment[] { attachment });
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }

    global void finish(Database.BatchableContext BC) {
    }
}