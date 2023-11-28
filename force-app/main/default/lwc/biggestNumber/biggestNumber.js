import { LightningElement } from "lwc";

export default class BiggestNumber extends LightningElement {
  inputNumber1;
  inputNumber2;
  inputNumber3;

  firstInputFunction(Event) {
    this.inputNumber1 = Event.target.value;
  }
  secondInputFunction(Event) {
    this.inputNumber2 = Event.target.value;
  }
  thirdInputFunction(Event) {
    this.inputNumber3 = Event.target.value;
  }

  handleClick(event) {
    const num1 = parseInt(this.inputNumber1);
    const num2 = parseInt(this.inputNumber2);
    const num3 = parseInt(this.inputNumber3);
    if (num1 > num2 && num1 > num3) {
      alert("num1 is biggest number");
    } else if (num2 > num1 && num2 > num3) {
      alert("num2 is biggest number");
    } else if (num3 > num1 && num3 > num2) {
      alert("num3 is biggest number");
    }
  }
  ChangeClick(event) {
    this.inputNumber1 = "";
    this.inputNumber2 = "";
    this.inputNumber3 = "";
  }
}