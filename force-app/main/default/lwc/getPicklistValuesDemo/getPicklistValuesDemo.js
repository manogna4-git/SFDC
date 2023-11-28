import { LightningElement, wire } from 'lwc';
import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import ACCOUNT_OBJECT from "@salesforce/schema/Account";
import ACCOUNT_INDUSTRY from "@salesforce/schema/Account.Industry";

export default class GetPicklistValuesDemo extends LightningElement {
   selectedIndustry;
    @wire(getObjectInfo, {
        objectApiName: ACCOUNT_OBJECT
    }) accountProp;
    @wire(getPicklistValues, {
        recordTypeId: "$accountProp.data.defaultRecordTypeId",
        fieldApiName: ACCOUNT_INDUSTRY
    }) accountindus;
    
     handleIndustryChange(event) {
        this.selectedIndustry = event.target.value;
        // You can add additional logic here if needed
    }
}