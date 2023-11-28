import { LightningElement, wire } from 'lwc';
import {  getRecords } from "lightning/uiRecordApi";
import ACCOUNT_NAME_FIELD from "@salesforce/schema/Account.Name";
import CONTACT_NAME_FIELD from "@salesforce/schema/Contact.Name";
export default class GetRecordsDemo extends LightningElement {
outputs;
errors;
@wire(getRecords, {
    records: [
        {
            recordIds: ["0015g0000175k0CAAQ"],
        fields: [ACCOUNT_NAME_FIELD]
        },
            {
            recordIds: ["0035g000007lqSLAAY"],
        fields: [CONTACT_NAME_FIELD]
        }

    ]
            
})
outputFunction({ data, error }) {
    if (data) {
        this.outputs = data;
        this.errors = null;

        console.log(data);
    }
    else if (error) {
        this.errors = error;
        this.data = null;
        console.log(error);
    }
}
}