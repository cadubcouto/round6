trigger AssassinatosTrigger on Assassinato__c (after insert) {

    if (Trigger.isAfter) {
        if (Trigger.isInsert) {
            // AssassinatosTriggerHandler.afterInsert(Trigger.new);
            AssassinatosTriggerHandler.afterInsert(Trigger.new);
        }
    }


}