/*when a new opportunity is created with stagename as closed won share the records with student with read acess */

trigger Opty_Share on Opportunity (after insert) {
    User u =[select id from user where alias='jsmit'];
    List<OpportunityShare> share = new List<OpportunityShare>();
    for(Opportunity op: Trigger.New)
    {
        if(op.stageName=='Closed Won')
           {
            OpportunityShare os = new OpportunityShare();
            os.OpportunityId=op.Id;  //Id of the record which we want to share
            os.UserOrGroupId=u.Id;  //Id of the user with whom you want to share
          //  os.TeamMemberRole='Account Manager';  //Role of the user 
            os.OpportunityAccesslevel='Read'; //Type of access we want to give
               os.RowCause='Manual';
            share.add(os);
           }
    }
    insert share;

}