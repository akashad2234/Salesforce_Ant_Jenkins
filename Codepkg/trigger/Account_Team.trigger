trigger Account_Team on Account (after insert) {
    //write a query to fetch user Student
    User u =[select id from user where alias='jsmit'];
    List<AccountTeamMember> teams = new List<AccountTeamMember>();
    for(Account a : Trigger.New)
    {
        if(a.ownership=='Private')
        {
            AccountTeamMember atm = new AccountTeamMember();
            atm.AccountId=a.Id;  //Id of account on which we want to create teamMembers
            atm.UserId=u.Id;  //Id of the user whom you want to add as teamMember
            atm.TeamMemberRole='Account Manager';  //Role of the user 
            atm.AccountAccesslevel='Read'; //Type of access we want to give on account
            teams.add(atm);
        }
    }
    insert teams;

}