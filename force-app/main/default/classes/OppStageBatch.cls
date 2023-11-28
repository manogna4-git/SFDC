Global class OppStageBatch implements Database.Batchable<SObject>
{
	Global Database.QueryLocator start(Database.BatchableContext bContext)
    {
       string opp = 'Select id, name, StageName, Amount  from Opportunity'; 
	   return	Database.getQueryLocator(opp);   
    }
    
    Global void Execute(Database.BatchableContext bContext, List<SObject> recordsToProcess)
    {
        if(! recordsToProcess.isEmpty())
        {
            List<opportunity> OppUdate = new List<opportunity>();
            
            for(SObject obj : recordsToProcess)
            {
                Opportunity opp = (opportunity) obj;
                
                if(opp.Amount >= 1000)
                {
                opp.StageName ='client interact';
                
                OppUdate.Add(opp);
            }
            }
            
            if(!OppUdate.isEmpty())
            {
                Update OppUdate;
            }
        }
    }
    
    Global void Finish(Database.BatchableContext bContext)
    {

       
    }
}