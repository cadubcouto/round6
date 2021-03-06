
public without sharing class RoundsSelector {

    public static List<Round__c> selectByRoundsIdsWithJogadores(Set<Id> ids) {
        return [
            SELECT  Id, TotalJogadoresEliminados__c, PremioTotal__c,
                    (
                        SELECT Id, ValorPagar__c, RecordTypeId, RecordType.DeveloperName, Candidato__r.Email__c
                        FROM Jogadores__r 
                        WHERE Eliminado__c = true
                    )
            FROM Round__c 
            WHERE Id IN :ids
        ];
    }

    public static List<Round__c> selectRoundsByIdStatusJogadoresVivos(Set<Id> roundsIds, Set<String> statusList) {
        return [
            SELECT 
                Id,
                Vencedor__c,
                (SELECT Id FROM Jogadores__r WHERE Eliminado__c = false)
            FROM Round__c
            WHERE 
                    Id = :roundsIds          
                AND Status__c IN :statusList
        ];
    }

    public static List<Round__c> selectRoundEmAndamentoComJogadoresNaoEliminados() {
        return [
            SELECT Id, Name, (SELECT Id, Forca__c, Inteligencia__c, Velocidade__c FROM Jogadores__r WHERE Eliminado__c = false)
            FROM Round__c 
            WHERE Status__c = 'Em Andamento'
        ]; 
    }

    public static List<Round__c> selectAllRoundsWithJogadores() {
        return [
            SELECT  Id, Name, TotalJogadoresEliminados__c, PremioTotal__c,
                    (
                        SELECT Id, Nick__c, Candidato__r.Name
                        FROM Jogadores__r 
                        WHERE Eliminado__c = true
                    )
            FROM Round__c
        ];
    }

    public static List<Round__c> selectJogadoresNaoEliminadosFromSpecificRoundEmAndamento(Id id) {
        return [
            SELECT Id, Name, (SELECT Id, Forca__c, Inteligencia__c, Velocidade__c FROM Jogadores__r WHERE Eliminado__c = false)
            FROM Round__c 
            WHERE (Status__c = 'Em Andamento' AND Round__c.Id = :id)
        ]; 
    }



  

}