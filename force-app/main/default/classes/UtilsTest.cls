@isTest
public with sharing class UtilsTest {
    
    @isTest
    static void testSetValueException() {
        Jogador__c jog = new Jogador__c();
        String errorMessage;
        
        Test.startTest();
        try {
            Utils.setValue(jog, Jogador__c.Name, 'Renato');
        } catch (Exception e) {
            errorMessage = e.getMessage();
        }
        Test.stopTest();

        System.assert(errorMessage.contains('Field Name is not editable'), 'O campo name não deveria ser editável');
    }

    @isTest
    static void testSetValue() {
        Jogador__c jog = new Jogador__c();
        Integer vel = 10;
        Integer frc = 30;

        
        Test.startTest();
        Utils.setValue(jog, Jogador__c.Velocidade__c, vel);
        Utils.setValue(jog, Jogador__c.Forca__c, frc);
        Test.stopTest();

        System.assertEquals(jog.Velocidade__c, vel, 'A velocidade deveria ser ' + vel);
        System.assertEquals(jog.Forca__c, frc, 'A força deveria ser ' + frc);
    }
    

    @isTest
    static void testGenerateRandomIntegerBetween() {
        Test.startTest();
        Integer min;
        Integer max;
        Integer resultado;
        Boolean isOK = true;
        for (Integer i = 0, j = 0; i < 1000; i++) {
            min = Integer.valueof(Math.random() * 1000);
            max = Integer.valueof(Math.random() * 1000);
            resultado = Utils.generateRandomIntegerBetween(min, max);
            
            if (min > max) {
                isOK = (max == resultado) ? true : false;
            } else if (min == max) {
                isOK = (min == resultado) ? true : false;
            } else {
                isOK = (resultado >= min && resultado <= max) ? true : false;
            }
            if (!isOk) {
                break;
            }  
        }
        Test.stopTest();
        System.assertEquals(true, isOk, 'O Resultado >> ' + resultado + ' não esta entre >> ' + min + ' e ' + max);
    }


    @isTest
    static void testeGetRondomJogadorOfListAndRemove() {
        Jogador__c jog1 = new Jogador__c(); 
        Jogador__c jog2 = new Jogador__c(); 
        Jogador__c jog3 = new Jogador__c(); 
        List<Jogador__c> jogadores = new List<Jogador__c>{jog1, jog2, jog3};

        Integer jogadoresSizeOriginal = jogadores.size();
        Test.startTest();
        Jogador__c jogadorTemp = Utils.getRondomJogadorOfListAndRemove(jogadores);
        Test.stopTest();

        System.assertEquals(    jogadorTemp.getSObjectType(), 
                                jog1.getSObjectType(), 
                            '   A função não está retornando tipo Jogador__c');
            
        System.assertEquals((   jogadoresSizeOriginal  - 1),
                                jogadores.size(), 
                                'A jogador não está sendo retirado da lista');
    }

    @isTest
    static void testeGetRondomJogadorOfListAndRemoveWithListNull() {
        List<Jogador__c> jogadores = new List<Jogador__c>();

        Test.startTest();
        Jogador__c jogadorTemp = Utils.getRondomJogadorOfListAndRemove(jogadores);
        Test.stopTest();

        System.assertEquals(    jogadorTemp, 
                                null, 
                            '   A função não está null para lista vazia');

    }

  
}
