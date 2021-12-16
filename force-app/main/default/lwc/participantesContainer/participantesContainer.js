import { LightningElement, api } from 'lwc';
import selectParticipantes from "@salesforce/apex/partidasContainerController.selectParticipanentePartidaDeUmaPartida";

export default class ParticipantesContainer extends LightningElement {
    @api partidaid = "a035f000002aweOAAQ";
    loaded = false;
    participantesAux = [];

    
    get participantes() {
      console.log(this.participantesAux);  
      return this.participantesAux;
    }

    
    vivoMortoClass(status) {
      return status ? "destructive" : "sucess";
    }

    connectedCallback() {
        selectParticipantes({ id: this.partidaid })
          .then((result) => {
            this.participantesAux = result;
            this.loaded = true;
            console.log("Par Result >> " + result);
          })
          .catch((error) => {
            console.log("erro da selectParticipantes");
            console.log(JSON.stringify(error));
            console.log(error);
        });
    }


}