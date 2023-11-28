import { LightningElement,wire } from 'lwc';

import { publish, MessageContext } from 'lightning/messageService';

import MITRON_MESSAGE_CHANNEL from '@salesforce/messageChannel/mitronMessageChannel__c';


export default class MitronPublish extends LightningElement {


 

// Injects the message context into the component

@wire(MessageContext)

messageContext;

// Method to publish the message

publishMessage() {

const payload = { message: 'MITRON' };

publish(this.messageContext, MITRON_MESSAGE_CHANNEL, payload);

}

}

