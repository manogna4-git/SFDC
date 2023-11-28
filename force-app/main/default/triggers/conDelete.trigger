Trigger conDelete on Contact(Before Delete){

if(trigger.isdelete && trigger.isbefore)
{
    PreventCONdeltion.condel(Trigger.old);
   }
}