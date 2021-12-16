public with sharing class SimuladorPartida {
    
         
    public static List<Id> getJogadoresEliminadosIds(Partida__c partida) {
        List<ParticipantePartida__c> participantes = ParticipantePartidaSelector.selectParticipanentePartidaDeUmaPartida(partida.Id);
        List<ParticipantePartida__c> participantesEliminados = simulaParticipacao(partida, participantes);
        List<Id> JogadoresEliminadosIds = getJogadoresEliminadosIds(participantesEliminados);
        setParticipantesEliminadosNaPartida(participantesEliminados );
        return JogadoresEliminadosIds;
    }


    private static List<ParticipantePartida__c> simulaParticipacao(Partida__c partida, List<ParticipantePartida__c> participantes) {
        List<ParticipantePartida__c> Eliminados = new List<ParticipantePartida__c>();
        System.debug('Total de Participantes >> ' + participantes.Size()); 
        for (ParticipantePartida__c participante: participantes){
            if (checkEliminacao(partida, participante)) {
                Eliminados.add(participante);
                System.debug('Participantes Eliminado >> ' + participante.Jogador__r.Name); 
            }
        }
        return Eliminados;
    }   


    private static Boolean checkEliminacao(Partida__c partida, ParticipantePartida__c participante) {
        double taxaMortalidade = partida.TaxaMortalidade__c;

        double pontosJogador =  (partida.PesoForca__c / 100 * participante.Jogador__r.Forca__c) + 
                                (partida.PesoInteligencia__c / 100 * participante.Jogador__r.Inteligencia__c) + 
                                (partida.PesoVelocidade__c /100 * participante.Jogador__r.Velocidade__c);
        
        double taxaMortalidadeAjustada = 1;

        if (pontosJogador == 0) {
            taxaMortalidadeAjustada = taxaMortalidade; 
        } else {
            taxaMortalidadeAjustada = (taxaMortalidade / 100)  * ((100 - pontosJogador) / 100);
        }

        if (Math.random() < taxaMortalidadeAjustada ) {
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


    private static void setParticipantesEliminadosNaPartida(List<ParticipantePartida__c> participantesEliminados) {
        for (ParticipantePartida__c participanteEliminado: participantesEliminados){
            participanteEliminado.EliminadoNestaPartida__c = true;
        }
        update participantesEliminados;
    }

    
}
