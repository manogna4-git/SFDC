public class clsCalculateMarksPdf{
 public Student__c objStudent{get;set;} 
    public clsCalculateMarksPdf(){
         Id stuId = apexpages.currentpage().getparameters().get('id');
        
        objStudent = [SELECT Id, MathsMarks__c, PhysicsMarks__c, ChemistryMarks__c, BiologyMarks__c,
                      Total_Marks__c,Student_first_Name__c,Student_Last_Name__c, Student_Email__c, Student_City__c,Father_s_Name__c from Student__c WHERE Id=:stuId];
            
    
    }
    
}