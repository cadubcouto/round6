@isTeste

public with sharing class SimuladorPartidaTest {
   
    @TestSetup
    static void setup() {
        Round__c r = new Round__c();
        Round__c r2 = new Round__c();  
        List<Round__c> rounds = new List<Round__c>();
        rounds.add(r);
        rounds.add(r2);      
        insert rounds;
    }

    


}
