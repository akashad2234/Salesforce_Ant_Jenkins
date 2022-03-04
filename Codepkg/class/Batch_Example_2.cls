global class Batch_Example_2 implements Database.Batchable<sObject>,Database.Stateful ,Database.AllowsCallouts {
    
    global Integer count =0;
    global static Integer size =0;
    
     global Database.QueryLocator start(Database.BatchableContext bc){
        String query = 'select id,name from Account';
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext bc,List<Account> scope){
        for(Account a:scope)
        {
           count =count+1;
            size = size+1;
        }
    }
    
    global void finish(Database.BatchableContext bc){
        Account acc = new Account();
        acc.Name='Batch Call';
        acc.Description='count' +count + 'Size:' +size;
        insert acc;
    }

}