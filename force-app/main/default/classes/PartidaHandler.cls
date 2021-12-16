public with sharing class PartidaHandler {
   
    public static ErroWrapper iniciaProximaPartida() {
        partida__c partida;
        ErroWrapper ew = New ErroWrapper();
        try {
            partida = PartidaSelector.selectProximaPartidaNaoIniciada();
        } catch(System.QueryException e) {
            System.debug('The following exception has occurred: ' + e.getMessage());
            System.debug('Partida não iniciada, porque não ná partidas disponíveis (não iniciadas).');
            ew.Erro = 'TRUE';
            ew.Msg = 'Partida não iniciada, porque não ná partidas disponíveis (não iniciadas).';
            return ew;
        }

        /*
        if (verifiacaSemJaTemPartidaIniciadaNoRound(partida.Round__r.Id)) {
            ew.Erro = 'TRUE';
            ew.Msg = 'Já existe uma partida iniciada.';
            return ew;
        } 

        if (verificaQuantidaInsuficienteJogadoresNoRound(partida.Round__r.Id)) {
            ew.Erro = 'TRUE';
            ew.Msg = 'Já temos um vencedor!!!';
            return ew;
        }
        */

        setInicioPartida(partida);
        insertParticipantesNaPartida(partida, JogadoresSelector.selectJogadoresNaoEliminadosDeUmRound(partida.Round__r.Id));
        ew.Erro = 'FALSE';
        ew.Msg = '';
        return ew;
    }


    public class ErroWrapper {
        @AuraEnabled
        public String Erro;
        @AuraEnabled
        public String Msg;
    }


    private static Boolean verifiacaSemJaTemPartidaIniciadaNoRound(Id idRound) {
        return (PartidaSelector.selectAllPartidasIniciadasNoRound(idRound).size() > 0);  
    }


    private static Boolean verificaQuantidaInsuficienteJogadoresNoRound(Id idRound) {
        return (JogadoresSelector.selectJogadoresNaoEliminadosDeUmRound(idRound).size() < 2);
    }
  

    private static void insertParticipantesNaPartida(partida__c partida, List<Jogador__c> jogadoresNaoEliminados) {
        List<ParticipantePartida__c> participantes = new List<ParticipantePartida__c>();
        for (Jogador__c jogador: jogadoresNaoEliminados) {
            ParticipantePartida__c participantePartida = new ParticipantePartida__c ( Jogador__c = jogador.Id, Partida__c = partida.Id);
            System.debug('Participante Partida Criado  >> ' + participantePartida); 
            update 
        }  
        update participantes;
        System.debug('Participantes >>' + participantes);
    }


    public static void simulaPartidas() {
        List<partida__c> partidas = PartidaSelector.selectAllPartidasIniciadas();
        for (partida__c partida: partidas) {
            List<Id> jogadoresElimindadosIds = SimuladorPartida.getJogadoresEliminadosIds(partida);
            eliminarJogadores(jogadoresElimindadosIds);
            setTerminoPartida(partida);
        }
    }


    private static void eliminarJogadores(List<Id> jogadoresIds) {
        List<Jogador__c> jogadores = JogadoresSelector.selectJogadoresComIds(jogadoresIds);
        for (Jogador__c jogador: jogadores) {
            jogador.Eliminado__c = true;
        }
        update jogadores;
    }


    private static void setInicioPartida(Partida__c partida) {
        if (partida.InicioPartida__c == null) {
            partida.InicioPartida__c = System.now();
            update partida;
        }
    }
    

    private static void setTerminoPartida(Partida__c partida) {
        partida.TerminoPartida__c = System.now();
        update partida;
    }



}


