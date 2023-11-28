/**
 * @author            : Manogna Kovi
 * @last modified on  : 18-01-2023
 * Class Name         : AccountContactBatch
 * Description        :the method used to get all the account related contacts and all the details will send mail as csv format
 * @last modified by  : Manogna Kovi
**/
public with sharing class AccountContactBatch implements Database.Batchable<sObject>, Database.Stateful {
  public String csv;
  public  Database.QueryLocator start(Database.BatchableContext bc) {
   // creating csv variable as string to create csv data
   csv = system.label.AccountContactBatchCsvHeader + '\n';
    //getting fields from respective field sets using schema
   List<Schema.FieldSetMember> field1 = Schema.SObjectType.Account.fieldSets.getMap().get('Account_Field_Set').getFields();
   List<Schema.FieldSetMember> field2 = Schema.SObjectType.Contact.fieldSets.getMap().get('Contact_Fieldset').getFields();
   List<String> field1Names = new List<String>();
   List<String> field2Names = new List<String>();
      //fetching all the fields from fieldset
   for(Schema.FieldSetMember f : field1) {
        field1Names.add(f.getFieldPath());
   }
   for(Schema.FieldSetMember f : field2) {
        field2Names.add(f.getFieldPath());
    }
     // fetching both the fieldset fields in one query
    String query = 'SELECT Id,' + String.join(field1Names, ',') + ', (SELECT Id,' + String.join(field2Names, ',') + ' FROM Contacts) FROM Account';
    return Database.getQueryLocator(query);
    }
  public void execute(Database.BatchableContext bc, List<sObject> scope) {
    List<Schema.FieldSetMember> field1 = Schema.SObjectType.Account.fieldSets.Account_Field_Set.getFields();
    List<Schema.FieldSetMember> field2 = Schema.SObjectType.Contact.fieldSets.Contact_Fieldset.getFields();
    string localcsv = system.label.AccountContactBatchCsvHeader + '\n';
     //iterating through all the accounts with respective contacts
    for (Account acc : (List<Account>)scope) {
    for (Contact con : acc.Contacts) {
    for (Schema.FieldSetMember f : field1) {
    localcsv += acc.get(f.getFieldPath()) + ','; 
    }
    for (Schema.FieldSetMember f : field2) {
    localcsv += con.get(f.getFieldPath()) + ',';
    }
     localcsv += '\n';
    //assining the data to csv variable 
      csv = localcsv;
     }
     }
    }
  public void finish(Database.BatchableContext bc) {
      // Create the email attachment
        Messaging.EmailFileAttachment attachment = new Messaging.EmailFileAttachment();
        attachment.setFileName(system.label.AccountBatchFileName);
        attachment.setBody(Blob.valueOf(csv));
        attachment.setcontenttype(system.label.AccountBatchFileContenttype);

        // Send the email
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setSubject(System.Label.AccountBatchEmailSubject);
        mail.setTargetObjectId(UserInfo.getUserId());
        mail.setSaveAsActivity(false);
        mail.setPlainTextBody(system.label.AccountBatchEmailText);
        mail.setFileAttachments(new Messaging.EmailFileAttachment[] { attachment });
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
         }
}