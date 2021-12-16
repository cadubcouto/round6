public with sharing class CandidatosCEPAlteradoSchedulable implements Schedulable {
    public CandidatosCEPAlteradoSchedulable() {


        public void execute(SchedulableContext sc) {
           Database.executeBatch(batchable, 200);
           

        }

    }
}
