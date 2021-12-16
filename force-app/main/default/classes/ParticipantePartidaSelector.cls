public with sharing class ParticipantePartidaSelector {
    

    public static List<ParticipantePartida__c> selectParticipanentePartidaDeUmaPartida(Id id) {
        return [
            SELECT Id, Jogador__r.Id, Jogador__r.Name, Jogador__r.Forca__c, Jogador__r.Velocidade__c, Jogador__r.Inteligencia__c, ParticipantePartida__c.EliminadoNestaPartida__c 
            FROM ParticipantePartida__c
            WHERE Partida__r.Id = :id
            ORDER BY Jogador__r.Name
        ]; 
    }

    public static List<ParticipantePartida__c> selectAllParticipanentePartida() {
        return [
            SELECT Id, Jogador__r.Id, Jogador__r.Name, Jogador__r.Forca__c, Jogador__r.Velocidade__c, Jogador__r.Inteligencia__c, Jogador__r.Eliminado__c 
            FROM ParticipantePartida__c
        ]; 
    }






}
