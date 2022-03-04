trigger Account_Rating on Account (before insert,after insert,before update,after update) {
    
    if(Trigger.isBefore && Trigger.isInsert )
    {
      //  System.debug('new '+trigger.new);
        //List<Account> accounts = Trigger.New;
        for(Account a :Trigger.New )
        {
            if(a.type=='Prospect')
            {
                a.rating='Hot';
                a.ownership='Public';
            }
        }
    }
    
    if(Trigger.isAfter && Trigger.isInsert){
        // List<Account> acc = Trigger.New;
        List<Opportunity> optyList =new List<Opportunity>();    
        for(Account ac: Trigger.New)
        {
            Opportunity op =new Opportunity();
            op.Name=ac.Name +'_Opt';
            op.StageName='Prospecting';
            op.CloseDate=System.today()+15;
            op.AccountId=ac.Id;
            optyList.add(op);
            
        }
        insert optyList;
    }
    if(Trigger.isBefore && Trigger.isUpdate )
    {
           
                for(Account a :Trigger.New )
                {   
                    System.debug('old value'+Trigger.old);
                    System.debug('new value'+Trigger.new);
                    if(  a.type !=Trigger.oldMap.get(a.Id).type )
                    {
                        a.rating='Cold';
                        a.ownership='Private';
                    }
                
            
        }
    }
    
    if(Trigger.isAfter && Trigger.isUpdate)
    {
        // List<Account> acc = Trigger.New;
        // Map<Id,Opportunity> oldMap=new Map<Id,Opportunity>();
        Set<id> AccountIds = new Set<id>();
        for(Account a: trigger.new)
        {  
            System.debug('NewList1'+trigger.new);
            if(a.BillingCity !=trigger.oldMap.get(a.id).BillingCity)
            {
                System.debug('BillingCity'+a.BillingCity);
                AccountIds.add(a.id);
            }
        }
        List<Opportunity> opport=[select id ,City__c,Accountid from Opportunity where accountid in:AccountIds];
        System.debug('opportList1'+ opport);
        for(Opportunity opp : opport)
        {
          opp.City__c =trigger.newmap.get(opp.accountid).BillingCity;  
        }
        update opport;
        
    }
}