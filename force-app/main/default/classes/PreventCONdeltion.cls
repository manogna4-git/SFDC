public class PreventCONdeltion {
public static void condel(List<Contact> conlist)
{
    for(Contact con:conlist)
{
    if(con.AccountId!=null)
    {
        con.addError('You can not delete this contact because it is associated with account');
    }
}
}
}