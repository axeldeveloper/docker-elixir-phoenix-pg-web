import { Controller } from "stimulus"

export default class extends Controller {
  
  static targets = [ "car_id", "source", "target" ];

  initialize() {
    console.log("Stimulus at your service!")
  }

  connect(){
    console.log("Stimulus foi conectado")
  }



  handleSelectChange() {
    this.populateSelect(this.sourceTarget.value);
  }

  testApi(){
    this.populateSelect()
  }

  //populateSelect(sourceId, targetId = null) {
  populateSelect() {
    fetch(`http://localhost:4000/table/cars`)
      .then(response => response.json())
      .then(data => {
        console.log(data)
      });
  }
}