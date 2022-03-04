public class Schedule_Opportunity implements Schedulable {
    public void execute(SchedulableContext sc)
    {
        List<Opportunity> optyList = [select id,stagename from Opportunity];
        for(Opportunity op : optyList)
        {
            op.StageName='Closed Won';
        }
        update optyList;
    }

}