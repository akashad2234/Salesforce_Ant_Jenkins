trigger ContactAccountTrigger on Contact (before update,after update) {
     if(Trigger.isAfter && Trigger.isUpdate)
    {
        ContactAccountUpdate.accountUpdate(Trigger.New ,Trigger.oldMap ,Trigger.newMap);
    }

}