/*when we insert a new Lead 
 * if Industry is Banking then assign Corporate Team as owner of lead
 * if Industry is other than Banking assign PersonalTeam as Owner of Lead
 * Group g=[select id from Group where name='Corporate_Team' and Type='Queue']
*/
trigger Lead_Assign_Trig on Lead (before insert) {
    Group ct=[select id from Group where name='Corporate Team' and Type='Queue'];
    Group pt=[select id from Group where name='Personal Team' and Type='Queue'];
    List<Lead> leads = Trigger.New;
    for(Lead l: leads )
    {
        if(l.industry=='Banking')
        {
            l.ownerId=ct.Id;
            
        }
        else{
            l.ownerId=pt.Id;
        }
    }

}