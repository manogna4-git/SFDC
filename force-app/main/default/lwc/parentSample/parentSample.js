import { LightningElement,track } from 'lwc';

export default class ParentSample extends LightningElement {
    @track message;
    handleSampleEvent(event) {
        this.message = "hey..! Iam invoked";
        console.log('data',event.detail);
    }
}