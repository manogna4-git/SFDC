import { LightningElement,api } from 'lwc';

export default class RecordPicker extends LightningElement {
    @api recordId;

    filter;
    connectedCallback() {
        this.filter = {
            criteria: [
                {
                    fieldPath: 'AccountId',
                    operator: 'eq',
                    value: this.recordId
                }
            ]
        }
    }
}