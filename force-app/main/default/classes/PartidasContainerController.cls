public with sharing class PartidasContainerController {
   
   @AuraEnabled(cacheable=true)
   public static List<Partida__c> selectAllPartidas() {
       try {
           return PartidaSelector.selectAllPartidas();
       } catch (Exception e) {
           throw new AuraHandledException(e.getMessage());
       }
  }
  

  @AuraEnabled(cacheable=true)
  public static List<ParticipantePartida__c> selectParticipanentePartidaDeUmaPartida(Id id) {
      try {
          return ParticipantePartidaSelector.selectParticipanentePartidaDeUmaPartida(id);
      } catch (Exception e) {
          throw new AuraHandledException(e.getMessage());
      }
 }

  
  @AuraEnabled()
  public static void iniciaProximaPartida() {
      try {
          PartidaHandler.iniciaProximaPartida();
      } catch (Exception e) {
          throw new AuraHandledException(e.getMessage());
      }
 }
 

 @AuraEnabled()
 public static void simulaPartidas() {
     try {
         PartidaHandler.simulaPartidas();
     } catch (Exception e) {
         throw new AuraHandledException(e.getMessage());
     }
}



}
