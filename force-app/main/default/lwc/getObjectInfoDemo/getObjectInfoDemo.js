import { LightningElement, wire } from 'lwc';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import ACCOUNT_OBJECT from "@salesforce/schema/Account";
export default class GetObjectInfoDemo extends LightningElement {
    accountInfo;
    accountError;
    showData = false;
    buttonLabel = 'Show Data';
    @wire(getObjectInfo, {
        objectApiName: ACCOUNT_OBJECT
    }) outputFunction({ data, error }) {
        if (data) {
            console.log("data", data)
            this.accountInfo = data;
            this.accountError = null;
        } else if (error) {
            this.accountError = error;
            this.accountInfo = null;
            console.log("error",error)
        }
    }
     toggleDataVisibility() {
        this.showData = !this.showData;
        this.buttonLabel = this.showData ? 'Hide Data' : 'Show Data';
    }
    }

