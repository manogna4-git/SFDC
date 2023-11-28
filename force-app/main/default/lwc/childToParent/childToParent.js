import { LightningElement,wire } from 'lwc';

export default class ChildToParent extends LightningElement {
    sendData() {
        const selectedEvent = new CustomEvent("sampleevent", {
            detail: { name: "Mano", industry: "Energy" }
        });
        this.dispatchEvent(selectedEvent);
    }
}