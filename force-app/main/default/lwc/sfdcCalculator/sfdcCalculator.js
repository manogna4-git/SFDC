import { LightningElement } from "lwc";

export default class SfdcCalculator extends LightningElement {
  number1;
  number2;
  num;
  handlechange(event) {
    const val = event.target.value;
    const name = event.target.name;
    if (name === "number1") {
      this.number1 = val;
    } else {
      this.number2 = val;
    }
  }

  handleClick(event) {
    this.num = parseInt(this.number1) + parseInt(this.number2);
    alert(num);
  }
  ChangeClick(event) {
    this.number1 = "";
    this.number2 = "";
  }
}