trigger Account_Data on Account (before update,after update) 
{
if(Trigger.isAfter && Trigger.isInsert )
    {
    Account aOld = Trigger.old[0];
    Account aNew = Trigger.New[0];
        System.debug('old Name value: ' +aOld.Name);
        System.debug('New Name value: ' +aNew.Name);
   
    }
}