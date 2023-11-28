import { LightningElement, api, wire } from 'lwc';
import Account_NAME from "@salesforce/schema/Account.Name";
import Account_Rating from "@salesforce/schema/Account.Rating";
import Account_Revenue from "@salesforce/schema/Account.AnnualRevenue";
import { getFieldDisplayValue, getFieldValue, getRecord } from 'lightning/uiRecordApi';
export default class GetRecordLwc extends LightningElement {
    @api recordId;
    accName;
    accRating;
    accRevenue;
    @wire(getRecord, {
        recordId: "$recordId",
        fields :[Account_NAME,Account_Rating,Account_Revenue]
    })
    output({ data, error }) {
        if (data) {
            console.log(data)
            //this.accName = data.fields.Name.value;
            this.accName = getFieldValue(data, Account_Name);
            this.accrating = data.fields.Rating.value;
            // this.accRevenue = data.fields.AnnualRevenue.value;
            this.accRevenue = getFieldDisplayValue(data, Account_Revenue);
        } else if (error) {
            console.log(error)
        }
    }
}