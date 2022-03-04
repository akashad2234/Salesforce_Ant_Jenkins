public class AccountTriggerHandler {
    public static void updateRating(List<Account> newList)
    {
        for(Account acc : newList)
        {
            if(acc.Industry == null){
                acc.addError('Please populate Industry');
            }else if(acc.Industry!= null && acc.Industry =='Media'){
                acc.Rating ='Hot';
            }else{
                acc.Rating ='Cold';
            }
        }
    }
    public static void updatePhoneDescription(List<Account> newList,Map<Id,Account> oldMap)
    {
        for(Account acc : newList)
        {
            if(oldMap!=null && acc.Phone!=oldMap.get(acc.Id).Phone && acc.Phone==null){
                acc.addError('you can not make phone blank');
            }else{
                acc.Description='phone is modified on ' + acc.Phone;
            }
        }
    }
    public static void checkAccountStatus(List<Account> oldList){
        for(Account acc : oldList){
            if(acc.Active__c =='Yes'){
                acc.addError('sorry! you cannot delete account which are in Active Status');
            }
        }
    }
    public static void createRelateOpp(List<Account> newList){
        List<Opportunity> oppToBeInserted =new List<Opportunity>();    
        for(Account acc: newList)
        {
            if(acc.Active__c!='Yes')
            {
                acc.addError('Ypu cannot create Account is Inactive');
            }else{
            Opportunity opp =new Opportunity();
            opp.Name=acc.Name;
            opp.StageName='Prospecting';
            opp.CloseDate=System.today();
            opp.AccountId=acc.Id;
            oppToBeInserted.add(opp);
            }
        }
        if(!oppToBeInserted.isEmpty()){
            insert oppToBeInserted;
        }
    }
    
}