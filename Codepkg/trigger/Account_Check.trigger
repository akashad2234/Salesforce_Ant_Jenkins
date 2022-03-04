trigger Account_Check on Account (before insert,before update,before delete ,after insert) {
    if(Trigger.isBefore){
        if(Trigger.isInsert){
            AccountTriggerHandler.updateRating(Trigger.New);
        }else if(Trigger.isUpdate){
                   AccountTriggerHandler.updatePhoneDescription(Trigger.New,Trigger.oldMap);
        }else if(Trigger.isDelete){
            AccountTriggerHandler.checkAccountStatus(Trigger.old);
        }
    }
    if(Trigger.isAfter){
        if(Trigger.isInsert){
            AccountTriggerHandler.createRelateOpp(Trigger.New);
        }
    }
    
}