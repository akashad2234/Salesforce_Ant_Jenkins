trigger Opty_Update_Example on Opportunity (after update) {

    Map<Id,Opportunity> oldMap = Trigger.oldMap;
    Map<Id,Opportunity> newMap = Trigger.newMap;
    Set<Id> keys =oldMap.keySet();
    User u =[select id from user where alias='jsmit'];
    List<OpportunityTeamMember> teams = new List<OpportunityTeamMember>();
    for(Id k:keys)
    {
        Opportunity old =oldMap.get(k);
        Opportunity newOpt =newMap.get(k);
        if(old.stageName!='Closed Won' && newOpt.StageName=='Closed Won')
        {
            OpportunityTeamMember otm = new OpportunityTeamMember();
            otm.OpportunityId=k;  //Id of the record which we want to share
            otm.userId=u.Id;  //Id of the user with whom you want to share
            otm.TeamMemberRole='Account Manager';  //Role of the user 
            otm.OpportunityAccesslevel='Read'; //Type of access we want to give
               //otm.RowCause='Manual';
            teams.add(otm);
        }
        
    }
    insert teams;
}