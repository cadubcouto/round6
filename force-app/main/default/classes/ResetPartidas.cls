public with sharing class ResetPartidas {
    

    public static void reset() {
        List<partida__c> partidas = PartidaSelector.selectAllPartidas();
        for (partida__c partida: partidas) {
            partida.InicioPartida__c = null;
            partida.TerminoPartida__c = null;
            delete [SELECT Id FROM ParticipantePartida__c where partida__r.Id = :partida.Id];
        }
        update partidas;
        

        List<Jogador__c> jogadores = [SELECT id, Eliminado__c FROM Jogador__c];
        for (jogador__c jogador: jogadores) {
            Jogador.Eliminado__c = false;
        }
        
        update jogadores;

    }  
}









