public with sharing class batatinhaFritaSimulador {
   
    static FINAL Integer TOTAL_CHANCE = 10; // O jogador tem a probabilidade de ser eliminado de 1 em 10
    
    public static List<Id> getJogadoresEliminadosIds(Partida__c partida) {
        System.debug('Batatinha Frita Simulador Iniciado...');  

        List<ParticipantePartida__c> participantes = ParticipantePartidaSelector.selectParticipanentePartidaDeUmPartida(partida.Id);
        System.debug('Participantes da Partida >> ' + participantes); 

        List<ParticipantePartida__c> participantesEliminados = simulaParticipacao(participantes);
        System.debug('Participantes Eliminado >> ' + participantesEliminados); 

        List<Id> JogadoresEliminadosIds = getJogadoresEliminadosIds(participantesEliminados);
        System.debug('Jpogadores Eliminados Ids >> ' + JogadoresEliminadosIds); 

        return JogadoresEliminadosIds;
    }


    private static List<ParticipantePartida__c> simulaParticipacao(List<ParticipantePartida__c> participantes) {
        List<ParticipantePartida__c> Eliminados = new List<ParticipantePartida__c>();
        System.debug('Total de Participantes >> ' + participantes.Size()); 
        for (ParticipantePartida__c participante: participantes) {
            if (checkEliminacao()) {
                Eliminados.add(participante);
                System.debug('Participantes Eliminado >> ' + participante.Jogador__r.Name); 
            }
        }
        return Eliminados;

    }   


    private static Boolean checkEliminacao() {
        if (Utils.generateRandomIntegerBetween(1, TOTAL_CHANCE) == 1) {
            return true;
        }
        return false;
    }


    private static List<Id> getJogadoresEliminadosIds(List<ParticipantePartida__c> participantesEliminados) {
        List<Id> jogadoresEmilinadosIds = new List<Id>();
        for (ParticipantePartida__c participanteEliminados: participantesEliminados) {
            jogadoresEmilinadosIds.add(participanteEliminados.Jogador__r.Id);
        }
        return jogadoresEmilinadosIds;



    }


}
