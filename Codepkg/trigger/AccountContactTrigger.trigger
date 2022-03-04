trigger AccountContactTrigger on Account (before update,after update) {
     
    if(Trigger.isAfter && Trigger.isUpdate)
    {
        AccountContactTriggerHandler.contactUpdate(Trigger.New ,Trigger.oldMap ,Trigger.newMap);
    }

}