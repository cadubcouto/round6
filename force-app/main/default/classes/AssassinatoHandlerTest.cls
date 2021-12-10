@isTest
public with sharing class AssassinatoHandlerTest {
  
     
    @isTest
    static void testgetPointsAtaque() {
        Jogador__c jogadorAtaque = new Jogador__c(Forca__c=10);
        Integer valorDado = 5; 
        Test.startTest();
        double pontos = AssassinatoHander.getPointsAtaque(jogadorAtaque, valorDado);
        Test.stopTest();

        System.assertEquals(    15, 
                                pontos, 
                            '   Valor Esperado do Ataque é 15, geraddo >> ' + pontos);
    }

    @isTest
    static void testgetPointsDefesa() {
        Jogador__c jogadorDefesa = new Jogador__c(Inteligencia__c=5, Velocidade__c=6);
        Integer valorDado1 = 10;
        Integer valorDado2 = 1;  
        Test.startTest();
        double pontos = AssassinatoHander.getPointsDefesa(jogadorDefesa, valorDado1, valorDado2);
        Test.stopTest();

        System.assertEquals(    22, 
                                pontos, 
                            '   Valor Esperado do defesa é 22, geraddo >> ' + pontos);
    }


    
    /*
    @TestSetup
    static void setup() {
        Round__c round = new Round__c();
        insert round;
        Id roundId = round.Id;
        
        Jogador__c jog1 = new Jogador__c(Round__c = roundId, Eliminado__c = true);
        Jogador__c jog2 = new Jogador__c(Round__c = roundId, Eliminado__c = true);        
        Jogador__c jog3 = new Jogador__c(Round__c = roundId, Eliminado__c = true);
        List<Jogador__c> jogadores = new List<Jogador__c>{jog1,jog2,jog3};
        insert jogadores;
    }
    
    @isTest
    static void testTryKill() {
        List<Round__c> rounds = [SELECT Id FROM Round__c];
        Test.startTest();
        AssassinatoHander.tryKill(rounds[0]);
        Test.stopTest();
        // System.debug(rounds[0]);
    }
    */



}




