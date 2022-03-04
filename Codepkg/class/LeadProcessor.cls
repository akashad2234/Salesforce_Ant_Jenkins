global class LeadProcessor implements Database.Batchable<sObject> {
     global Database.QueryLocator start(Database.BatchableContext bc){
        String query = 'select id,LeadSource from Lead Limit 5';
        return Database.getQueryLocator(query);
    }
     global void execute(Database.BatchableContext bc,List<Lead> scope){
        for(Lead l : scope)
        {
            l.LeadSource='Salesforce';
        }
        update scope;
    }
    
    global void finish(Database.BatchableContext bc){
        AsyncApexJob job = [select id ,status,Jobtype from AsyncApexJob  where id=:bc.getJobId()];
        System.debug('Status' +job.status);
    } 

}