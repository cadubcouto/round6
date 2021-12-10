public with sharing class AssassinatoHander {

    public static void execute() {
        List<Round__c> rounds = RoundsSelector.selectRoundEmAndamentoComJogadoresNaoEliminados();
        for (Round__c round: rounds) {
            tryKill(round); // Uma tentativa de assassinato por round.
        }
    }

    @TestVisible private static void tryKill(Round__c round) {
         List<Jogador__c> jogadoresVivos = round.Jogadores__r;
         System.debug('Round > '+  round.Name + ' Quantidade do Jogadores Vivos no Round >> ' + jogadoresVivos.size());

        if (jogadoresVivos.size() >= 2) { // Mínimo de 2 jogadores não eliminados no round para tentativa de assassinato.
            Jogador__c jogadorAtaque = Utils.getRondomJogadorOfListAndRemove(jogadoresVivos);
            Jogador__c jogadorDefesa = Utils.getRondomJogadorOfListAndRemove(jogadoresVivos);
            
            System.debug('Jogador Ataque >> '+ jogadorAtaque.Id);
            System.debug('Jogador Defesa >> '+ jogadorDefesa.Id);
            
            checkWinner(jogadorAtaque, jogadorDefesa, true);
        }
    }

    @TestVisible private static void checkWinner(Jogador__c jogadorAtaque, Jogador__c jogadorDefesa, Boolean permitirContraAtaque) {
        Integer valorDado1Ataque = Utils.generateRandomIntegerBetween(20, 20);
        Integer valorDado1Defesa = Utils.generateRandomIntegerBetween(1, 10);
        Integer valorDado2Defesa = Utils.generateRandomIntegerBetween(1, 10);

        System.debug('valorDado1Ataque >> ' + valorDado1Ataque);
        System.debug('valorDado1Defesa >> ' + valorDado1Defesa);
        System.debug('valorDado2Defesa >> ' + valorDado2Defesa);
        System.debug('Pontos de Ataque >> ' + getPointsAtaque(jogadorAtaque, valorDado1Ataque));
        System.debug('Pontos de Defesa >> ' + getPointsDefesa(jogadorAtaque, valorDado1Defesa, valorDado2Defesa));

        if  (getPointsAtaque(jogadorAtaque, valorDado1Ataque) > getPointsdefesa(jogadorDefesa, valorDado1Defesa, valorDado2Defesa)) {
            killBy(jogadorAtaque, jogadorDefesa);
        } else if (valorDado1Ataque == 1 && permitirContraAtaque) {
            System.debug('Contra Ataque');
            
            Jogador__c jogadorTemp = jogadorAtaque;
            jogadorAtaque = jogadorDefesa;
            jogadorDefesa = jogadorTemp;

            System.debug('Jogador Ataque >> '+ jogadorAtaque.Id);
            System.debug('Jogador Defesa >> '+ jogadorDefesa.Id);

            checkWinner(jogadorAtaque, jogadorDefesa, false);         
        }
    }
        
    @TestVisible private static double getPointsAtaque(Jogador__c jogadorAtaque, Integer valorDado) {
        return (valorDado + jogadorAtaque.Forca__c); // tratar null
    }

    @TestVisible private static double getPointsDefesa(Jogador__c jogadorDefesa, Integer valorDado1jogadorDefesa, Integer valorDado2jogadorDefesa) {
        return (   valorDado1jogadorDefesa + 
                    valorDado2jogadorDefesa + 
                    jogadorDefesa.Inteligencia__c +
                    jogadorDefesa.Velocidade__c); // tratar null
    }

    @TestVisible private static void killBy(Jogador__c assassino, Jogador__c vitima) {
        // Ajustar criar lista
        System.debug('Assassino >> ' + assassino.Id +  '   Vítima >> ' + vitima.Id);
        Assassinato__c assassinato = new Assassinato__c (   Assassino__c = assassino.Id, 
                                                            Assassinado__c = vitima.Id, 
                                                            DataHora__c =datetime.now());
        insert assassinato;
    }
   
}
