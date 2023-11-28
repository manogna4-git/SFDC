import { LightningElement,track } from 'lwc';
export default class MyFirstWebComponent extends LightningElement {
    @track
    contacts = [
        {
            Id: 1,
            Name: 'Amy Taylor',
            Title: 'VP of Engineering',
            Phone: '5987654321',
        },
        {
            Id: 2,
            Name: 'Michael Jones',
            Title: 'VP of Sales',
            Phone: '5987654381',
        },
        {
            Id: 3,
            Name: 'Jennifer Wu',
            Title: 'CEO',
            Phone: '9987654321',
        },
    ];
}