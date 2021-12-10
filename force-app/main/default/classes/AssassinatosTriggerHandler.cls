public with sharing class AssassinatosTriggerHandler {
    

    public static void afterInsert(List<Assassinato__c> records) {
        System.debug('Trigger afterupdate Assassinatos');
        List<String> idsJoradoresAssassinados = new List<String>();

        for (Assassinato__c assassinato : records) { 
            idsJoradoresAssassinados.add(assassinato.Assassinado__c);
        }

        List<Jogador__c> jogadores = [SELECT Id FROM Jogador__c WHERE Id IN :idsJoradoresAssassinados];

        System.debug('Lista de Jogadores Assassinados >> ' + jogadores);

        for (Jogador__c jogador : jogadores) {
            afterInsert(jogador);
        }      
        update jogadores;

    }

    private static void afterInsert(Jogador__c jogador) {
        // Corrigir somente incluir morte (já tratado na trigger Jogador)
        Utils.setValue(jogador, Jogador__c.DataMorte__c, System.now());
        Utils.setValue(jogador, Jogador__c.Eliminado__c, true);
    }
    

}
