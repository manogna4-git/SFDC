public class Opp {
    Public static void opp1(){
        for(integer i=0;i>=10;i++){
Opportunity oppty = new Opportunity();
        	oppty.Name = 'Test Opportunity'+i;
        	oppty.StageName = 'Needs Analysis';
        	oppty.CloseDate = system.today().AddDays(2);
        	oppty.Amount = 2000+i;
        
insert oppty;
    if(oppty.id != null)
        {
            system.debug('Lead Record has been created successfully. Id is...: '+ oppty.id);
        }
        }
    }
}