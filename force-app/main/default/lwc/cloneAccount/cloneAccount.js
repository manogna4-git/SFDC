import { LightningElement,api } from 'lwc';
import { CloseActionScreenEvent } from 'lightning/actions';
import { createRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { NavigationMixin } from 'lightning/navigation';

export default class CloneAccount extends NavigationMixin(LightningElement) {
    @api recordId;
    formMode ='edit';
    
    closeAction(){
        this.dispatchEvent(new CloseActionScreenEvent());
    }
    handleSubmit(event){
        event.preventDefault();
        const fields = event.detail.fields;
        console.log('_____________',JSON.stringify(fields));
        fields.Name = fields.Name + ' - Cloned';
        fields.ParentId =this.recordId;
      
        console.log('2_____________',JSON.stringify(fields));

        var objRecordInput = {'apiName' : 'Account', fields};
        
        // LDS method to create record.
        createRecord(objRecordInput).then(response => {
            console.log('----',JSON.stringify(response.id));
            const accId = response.id;
            this[NavigationMixin.Navigate]({
                type: 'standard__recordPage',
                attributes: {
                    recordId:accId,
                    objectApiName: 'Account',
                    actionName: 'view'
                }
            });
            const evt = new ShowToastEvent({
                title: 'Success',
                message: 'Account Record cloned - ' + response.id,
                variant: 'success',
                mode : 'pester',
            });
            this.dispatchEvent(evt);
            this.dispatchEvent(new CloseActionScreenEvent());
           
          //  alert('Account created with Id: ' +response.id);
        }).catch(error => {
            this.formMode ='edit';
            console.log('----',JSON.stringify(error));
            const evt = new ShowToastEvent({
                title: 'Error',
                message: error,
                variant: 'error',
                mode : 'dismissable',
            });
            this.dispatchEvent(evt);
           // alert('Error: ' +JSON.stringify(error));
        });
    }
}