trigger ContactUpdate on Contact (before update ,After update) {
    if(Trigger.isAfter && Trigger.isUpdate)
    {
        Map<String,String> accIdConIdMap=new Map<String,String> ();
       // Set<id> setofAccountId = new Set<id>();
        try{
            for(Contact con :Trigger.New )
            {    
                System.debug('Trigger new:::::' +Trigger.new );
                if(con.AccountId !=null && con.Account_Type__c !=Trigger.oldMap.get(con.Id).Account_Type__c)
                {
                    System.debug('Type..'+ con.Account_Type__c);
                   // setofAccountId.add(con.AccountId);
                    accIdConIdMap.put(con.AccountId,con.id);
                    System.debug('Contactset..'+ accIdConIdMap);
                }
                
            }
            List<Account> accList = [select id,Type from Account where id in :accIdConIdMap.keySet()];
            System.debug('acclist:::::' +accList);        
            if(!accList.isEmpty()){
                for(Account acc : accList)
                {   //System.debug('acclist:::::' +accList);
                     if(accIdConIdMap.containsKey(acc.id)){
                         
                        String contactId = accIdConIdMap.get(acc.id);
                         System.debug('contactId:::::' +contactId);
                              acc.Type=Trigger.newMap.get(contactId).Account_Type__c;
                         System.debug('acclist:::::' +accList);
                     }
                }
            }
            
            if(accList.size()>0){ 
                update accList;   
            }
        }
        
        catch(Exception npe)
        {
            System.debug('following Exception has occurred : ' + npe.getMessage());
            System.debug('following Exception has occurred due to : ' + npe.getCause());
        }
        }
        
        
        
    }