trigger PartidasTrigger on Partida__c (after insert, after update) {

    if (Trigger.isAfter && Trigger.isUpdate) {
       // PartidasTriggerHandler.afterUpdate(Trigger.new, Trigger.oldMap);
    }

}


