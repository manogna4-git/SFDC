/*Author: Manogna Kovi
 * Created Date: 3-Jan-2023
 * BeforeUpdate trigger
 */
trigger AccountControllerTrigger on Account (before update)
{
    // Trigger gets fire on Account object if it is before insert
    //if(trigger.isUpdate && trigger.isBefore){
        switch on Trigger.operationType {
            when BEFORE_UPDATE {
        // Exectuing the trigger by passing context variables
        AccountControllerUtill.handleUpdate(Trigger.new, Trigger.oldMap);
    }
}
}