import { LightningElement, wire, api } from 'lwc';
// import selectParticipantes from "@salesforce/apex/partidasContainerController.selectParticipantesPorPartida";


export default class ParticipanteContainer extends LightningElement {
  
  @api participante;
  
  get vivoMorto() {
    return this.participante.EliminadoNestaPartida__c ? "color:red" : "color:blue";
  }

  get forca() {
    console.log("pontuaçãoretorno >>" + this.classifica(this.participante.Jogador__r.Forca__c));
    return "Força: " + this.classifica(this.participante.Jogador__r.Forca__c);
  }

  get velocidade() {
    return "Velocidade: " + this.classifica(this.participante.Jogador__r.Velocidade__c);
  }

  get inteligencia() {
    return "Inteligência: " + this.classifica(this.participante.Jogador__r.Inteligencia__c);
  }

  classifica(pontuacao) {
    if (pontuacao >= 80) {
      return "⭐⭐⭐⭐⭐"
    } else if (pontuacao >= 60) {
      return "⭐⭐⭐⭐"
    } else if (pontuacao >= 40) {
      return "⭐⭐⭐"
    } else if (pontuacao >= 20) {
      return "⭐⭐"
    } else {
      return "⭐"
    return ""
  }
}

}