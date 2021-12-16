public with sharing class JogadoresSelector {

    public static List<Jogador__c> selectJogadoresNaoEliminadosDeUmRound(Id id) {
        return [
            SELECT Id, Name, Forca__c, Inteligencia__c, Velocidade__c 
            FROM Jogador__c
            WHERE (Eliminado__c = false AND Round__r.Id = :id)
        ]; 
    }

    public static List<Jogador__c> selectJogadoresNaoEliminados() {
        return [
            SELECT Id, Name, Forca__c, Inteligencia__c, Velocidade__c 
            FROM Jogador__c
            WHERE Eliminado__c = false
        ]; 
    }


    public static List<Jogador__c> selectJogadoresComIds(List<Id> ids) {
        return [
            SELECT Id, Name, Eliminado__c, Forca__c, Inteligencia__c, Velocidade__c  
            FROM Jogador__c
            WHERE Id = :ids
        ]; 
    }

}
