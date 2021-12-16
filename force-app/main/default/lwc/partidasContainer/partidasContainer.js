import { LightningElement, wire, api } from 'lwc';
import selectPartidas from "@salesforce/apex/partidasContainerController.selectAllPartidas";
import iniciaPartida from "@salesforce/apex/partidasContainerController.iniciaProximaPartida";
import simulaPartida from "@salesforce/apex/partidasContainerController.simulaPartidas";


export default class PartidasContainer extends LightningElement {
  loaded = false;
  partidasAux = [];
 
  get partidas() {
    console.log("Partidas >>" + this.partidasAux);
    return this.partidasAux;
  }


  connectedCallback() {
    this.atualizaSelectPartida();
  }


  atualizaSelectPartida() {
    this.loaded = false;
    selectPartidas()
      .then((result) => {
        this.partidasAux = result;
        this.loaded = true;
        console.log("Result >> " + result);
      })
      .catch((error) => {
        console.log(JSON.stringify(error));
        console.log(error);
      });
  }
  
  handleClickPartida(event){
    console.log("Press Iniciar Partida");
    iniciaPartida()
      .then((result) => {
        if (result) {
          const erro = result.Erro;
          const msg = result.Msg;
          console.log('Msg de retorno Inicia Partida >> ' + erro + msg);
        }
      })
      .catch((error) => {
        console.log(JSON.stringify(error));
        console.log(error);
      });
    location.reload(true);
  }

  handleClickSimula(event){
    console.log("Press Iniciar Partida");
    simulaPartida();
    location.reload(true);
  }

}
