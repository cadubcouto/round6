import { LightningElement, wire, api } from 'lwc';
import iniciaPartida from "@salesforce/apex/partidasContainerController.iniciaProximaPartida";
import simulaPartida from "@salesforce/apex/partidasContainerController.simulaPartidas";


export default class PartidasContainer extends LightningElement {

  handleClickPartida(event){
    console.log("Press Iniciar Partida");
    // iniciaPartida();
    console.log("IniciaPartida >>" + iniciaPartida());
    location.reload(true);
  }

  handleClickSimula(event){
    console.log("Press Iniciar Partida");
    simulaPartida();
    location.reload(true);
  }

}
