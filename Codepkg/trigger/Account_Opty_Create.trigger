trigger Account_Opty_Create on Account (after insert)
{
List<Account> accounts = Trigger.New;
    List<Opportunity> optyList =new List<Opportunity>();
    for(Account a: accounts)
    {
        Opportunity op =new Opportunity();
        op.Name=a.Name +'_Opt';
        op.StageName='Prospecting';
        op.CloseDate=System.today()+15;
        op.AccountId=a.Id;
        optyList.add(op);
        
    }
    insert optyList;
}