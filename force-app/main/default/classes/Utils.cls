public without sharing class Utils {
    public static void setValue(SObject record, Schema.SObjectField field, Object value) {
        record.put(field, value);
    }

    public static Set<Id> getSetIds(List<SObject> sObjs, Schema.SObjectField field) {
        Set<Id> ids = new Set<Id>();

        for (SObject sObj : sObjs) {
            ids.add(Id.valueOf(String.valueOf(sObj.get(field))));
        }

        return ids;
    }


    public static Integer generateRandomIntegerBetween(Integer min, Integer max) {
        return ( Integer.valueof(Math.random() * (max - min + 1) + min));
    }


    public static SObject getRondomElementOfListAndRemove(List<SObject> sObjs) {
        Integer index;
        
        if (sObjs.size() == 0) {
            return null;
        } else if (sObjs.size() == 1) {
            index = 0;
        } else {
            index = generateRandomIntegerBetween(0, (sObjs.size() - 1));
        } 
        
        SObject myObj = sObjs.get(index);
        sObjs.remove(index);
        
        return myObj;
    }

    public static Jogador__c getRondomJogadorOfListAndRemove(List<Jogador__c> jogadores) {
        Integer index;
        
        if (jogadores.size() == 0) {
            return null;
        } else if (jogadores.size() == 1) {
            index = 0;
        } else {
            index = generateRandomIntegerBetween(0, (jogadores.size() - 1));
        } 
        
        Jogador__c jogador = jogadores.get(index);
        jogadores.remove(index);
        
        return jogador;
    }


    

}