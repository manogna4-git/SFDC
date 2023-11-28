Global class DeleteBatch implements Database.Batchable<SObject>
{
	Global Database.QueryLocator start(Database.BatchableContext bContext)
    {
       string accounts = 'Select id, name from Account'; 
	   return	Database.getQueryLocator(accounts);   
    }
    
    Global void Execute(Database.BatchableContext bContext, List<Account> recordsToProcess)
    {
        if(! recordsToProcess.isEmpty())
        {
            List<Account> accountsdel = new List<Account>();
            
            for(SObject obj : recordsToProcess)
            {
                Account acc = (Account) obj;
                
                acc.name='PharmaTS5';
                
                accountsdel.Add(acc);
            }
            
            if(! accountsdel.isEmpty())
            {
                delete accountsdel;
            }
        }
    }
    
    Global void Finish(Database.BatchableContext bContext)
    {
        
    }
}