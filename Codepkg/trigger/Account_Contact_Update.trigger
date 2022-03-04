trigger Account_Contact_Update on Account (before update,after update) {
    if(Trigger.isAfter && Trigger.isUpdate)
    {
        Set<id> Accountset = new Set<id>();
        
        for(Account acc :Trigger.New )
        {    
           System.debug('Trigger new:::::' +Trigger.new );
         if(acc.type !=Trigger.oldMap.get(acc.Id).type )
         {
             Accountset.add(acc.id);
         }
         
        }
        List<Contact> conList = [select id,Account_Type__c,Accountid from Contact where accountid in:Accountset];
        System.debug('Conlist:::::' +conList);
        for(Contact con : conList)
        {
            con.Account_Type__c=Trigger.newMap.get(con.AccountId).Type;
            System.debug('Conlist:::::' +conList);
        }
        update conList;
    }    
    
    
}