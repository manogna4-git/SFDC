import { LightningElement,api } from 'lwc';

export default class ChildSample extends LightningElement {
    @api selectedRecord;
    @api unSelectedRecord() {
        this.selectedRecord = 'Hey..! I am child';
    }
}