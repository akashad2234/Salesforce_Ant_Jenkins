trigger Opportunity_Update on Opportunity (before update) {
    
   // Map<Id,Opportunity> oMap=new Map<Id,Opportunity>();
   // oMap=trigger.oldMap;
    for(Opportunity newOpp : trigger.New)
    {
        //Opportunity oldOpp = new Opportunity();
        //oldOpp = oMap.get(newOpp.Id);
        if(newOpp.Amount!=Trigger.oldMap.get(newOpp.Id).Amount)
        {
            newOpp.Amount.addError('Amount cannot be changed');
        }
    }

}