import { LightningElement,api } from 'lwc';

export default class OtpGenerator extends LightningElement {
    @api otplength;
    generatedotpvalue = "";
    @api timeDuration;
    disableButton = false;
    showTimer = false;
    timerTesxt = "";
    handleClick() {
        let otpArray =[];
for(let i=0;i<this.otplength;i++){
    otpArray.push(Math.floor(Math.random() * 10));
}
        this.generatedotpvalue = otpArray.join("");
        this.disableButton = true;
        this.showTimer = true;
        let secondsRemaining = this.timeDuration;
        let countDown =setInterval(() => {
            secondsRemaining--;
            this.timerTesxt = `To generate next otp wait for ${secondsRemaining} seconds`;
            if (secondsRemaining <= 0) {
                clearInterval(countDown);
                  this.disableButton = false;
            this.showTimer = false;
            }
          

        }, 1000);
    
    }
}