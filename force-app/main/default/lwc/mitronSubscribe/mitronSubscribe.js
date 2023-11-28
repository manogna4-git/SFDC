import { LightningElement, wire } from 'lwc';

import { subscribe, MessageContext } from 'lightning/messageService';

import MITRON_MESSAGE_CHANNEL from '@salesforce/messageChannel/mitronMessageChannel__c';

export default class MitronSubscribe extends LightningElement {


isRahulStanding = true;

isMitronMsgReceived = false;

subscription = null;

receivedMessage = '';

// Injects the message context into the component

@wire(MessageContext)

messageContext;

// Subscribe to the message channel

subscribeToMessageChannel(){

if(this.subscription==null){

this.subscription = subscribe(

this.messageContext,

MITRON_MESSAGE_CHANNEL,

(message) => this.handleMessage(message)

);

}

}

connectedCallback() {

this.subscribeToMessageChannel();

}

handleMessage(message) {

this.isRahulStanding = false;

this.isMitronMsgReceived = true;

this.receivedMessage = message ? message.message : 'No message received';

}

}