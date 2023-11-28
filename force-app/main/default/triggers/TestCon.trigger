trigger TestCon on Contact (after insert,after update) {
    
    if((trigger.isInsert||trigger.isUpdate)&&trigger.isAfter)
    {
       
        EmailClass.sendmail(Trigger.old,Trigger.New);
       
    }

}