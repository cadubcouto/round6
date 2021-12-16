public without sharing class PartidasTriggerHandler {

    
    public static void afterUpdate(List<Partida__c> records,  Map<Id, Partida__c> oldMap) {
        System.debug('Trigger Partida AfterUpdate');
        
        for (Partida__c record : records) {
            afterUpdate(record);
        }      
    }


    private static Boolean partidaFoiIniciada(Partida__c partida) {
        if (partidaOld.InicioPartida__c == null && partida.InicioPartida__c != null) {
            return true;
        }
        return false;
    }
    


 
}
