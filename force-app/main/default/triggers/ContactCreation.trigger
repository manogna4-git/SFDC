trigger ContactCreation on Account (after insert, after update) {
if((trigger.isinsert || trigger.isupdate) && trigger.isafter)
{

      ContactcreationHandler.CreateContact(Trigger.New);                

}
}