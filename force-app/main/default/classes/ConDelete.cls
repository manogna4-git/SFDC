Global class ConDelete implements Database.Batchable<SObject>
{
	Global Database.QueryLocator start(Database.BatchableContext bContext)
    {
       string contacts = 'Select id, LastName from Contact'; 
	   return	Database.getQueryLocator(contacts);   
    }
    
    Global void Execute(Database.BatchableContext bContext, List<SObject> recordsToProcess)
    {
        if(! recordsToProcess.isEmpty())
        {
            List<Contact> c = new List<Contact>();
            
            for(SObject obj : recordsToProcess)
            {
                Contact con = (Contact) obj;
                
                con.LastName='k';
                
                c.Add(con);
            }
            
            if(! c.isEmpty())
            {
                delete c;
            }
        }
    }
    
    Global void Finish(Database.BatchableContext bContext)
    {
        
    }
}