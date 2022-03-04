public class AccountContactTriggerHandler {
    public static void contactUpdate(List<Account> newList,Map<Id,Account> oldMap,Map<Id,Account> newMap)
    {
        Set<id> Accountset = new Set<id>();
        
        for(Account acc :newList )
        {    
            System.debug('Trigger new:::::' +newList);
            if(acc.type !=oldMap.get(acc.Id).type)
            {
                System.debug('Type..'+ acc.type);
                Accountset.add(acc.id);
                System.debug('Accountset..'+ Accountset);
            }
            
        }
        List<Contact> conList = [select id,Account_Type__c,Accountid from Contact where accountid in:Accountset];
        if(conList.size()>0)
        {
            System.debug('Conlist:::::' +conList);
            for(Contact con : conList)
            {
                
                con.Account_Type__c=newMap.get(con.AccountId).type;
                System.debug('Conlist:::::' +conList);
            }
            update conList;
        }
        
    }    
    
}