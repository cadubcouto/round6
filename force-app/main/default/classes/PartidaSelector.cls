public without sharing class PartidaSelector {

    public static Partida__c selectPartidaFromId(Id id) {
        return [
            SELECT Name, InicioPartida__c, TerminoPartida__c, Round__r.Name, TaxaMortalidade__c 
            FROM Partida__c 
            WHERE Partida__c.id = :id
        ]; 
    }
    

    public static List<Partida__c> selectAllPartidaWithJogadores() {
        return [
            SELECT Name, InicioPartida__c, TerminoPartida__c
            FROM Partida__c 
            WHERE inicioPartida__c = null
        ]; 
    }

    public static Partida__c selectProximaPartidaNaoIniciada() {
        return [
            SELECT Id, Name, InicioPartida__c, TerminoPartida__c, TaxaMortalidade__c, PesoForca__c, PesoInteligencia__c, PesoVelocidade__c,  Round__r.Name 
            FROM Partida__c 
            WHERE inicioPartida__c = null
            ORDER BY Ordem__c
            LIMIT 1
        ]; 
    }

    public static List<Partida__c> selectAllPartidas() {
        return [
            SELECT Name, InicioPartida__c, TerminoPartida__c, TotalJogadores__c, TotalJogadoresEliminados__c
            FROM Partida__c 
            ORDER BY Ordem__c
        ]; 
    }

    public static List<Partida__c> selectAllPartidasIniciadas() {
        return [
            SELECT Id, Name, InicioPartida__c, TerminoPartida__c, TaxaMortalidade__c, PesoForca__c, PesoInteligencia__c, PesoVelocidade__c,  Round__r.Name
            FROM Partida__c 
            WHERE (inicioPartida__c != null and TerminoPartida__c = null)
        ]; 
    }

    public static List<Partida__c> selectAllPartidasIniciadasNoRound(Id IdRound) {
        return [
            SELECT Id, Name, InicioPartida__c, TerminoPartida__c, TaxaMortalidade__c, PesoForca__c, PesoInteligencia__c, PesoVelocidade__c,  Round__r.Name
            FROM Partida__c 
            WHERE (inicioPartida__c != null and TerminoPartida__c = null and Round__r.Id = :IdRound)
        ]; 
    }
     
}
