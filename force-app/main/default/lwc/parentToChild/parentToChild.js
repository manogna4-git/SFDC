import { LightningElement } from 'lwc';

export default class ParentToChild extends LightningElement {
    selectedRecord = 'message from parent';
    handleUnselected() {
        this.template.querySelector("c-child-sample").unSelectedRecord();
        if (childComponent) {
            childComponent.unSelectedRecord();
        }
    }
}