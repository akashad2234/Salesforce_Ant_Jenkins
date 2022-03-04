public class soql {
public static void main()
{
    List<Account> accList = [Select Name, NumberOfEmployees from account];
    for(integer i=0 ; i<accList.size() ; i++)
    {
        System.debug(accList[i].NumberOfEmployees);
    } 
    for(Account a:accList)
    {
        System.debug('Acc Name =' +a.Name+  'NumofEmp = '+a.NumberOfEmployees);
    }
}
}