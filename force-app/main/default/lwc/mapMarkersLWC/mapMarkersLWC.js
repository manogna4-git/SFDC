import { LightningElement, api, wire } from 'lwc';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';

export default class ShippingAddressMap extends LightningElement {
    @api recordId;

    @wire(getRecord, {
        recordId: '$recordId',
        fields: [
            'Account.ShippingStreet',
            'Account.ShippingCity',
            'Account.ShippingState',
            'Account.ShippingPostalCode',
            'Account.ShippingCountry',
            'Account.BillingStreet',
             'Account.BillingState',
            'Account.BillingPostalCode',
            'Account.BillingCountry'

        ]
    })
    account;

    get mapMarkers() {
        const street = getFieldValue(this.account.data, 'Account.ShippingStreet');
        const city = getFieldValue(this.account.data, 'Account.ShippingCity');
        const state = getFieldValue(this.account.data, 'Account.ShippingState');
        const postalCode = getFieldValue(this.account.data, 'Account.ShippingPostalCode');
        const country = getFieldValue(this.account.data, 'Account.ShippingCountry');
        const Bstreet = getFieldValue(this.account.data, 'Account.BillingStreet');
        const Bcity = getFieldValue(this.account.data, 'Account.BillingCity');
        const Bstate = getFieldValue(this.account.data, 'Account.BillingState');
        const BpostalCode = getFieldValue(this.account.data, 'Account.BillingPostalCode');
        const Bcountry = getFieldValue(this.account.data, 'Account.BillingCountry');

        return [
            {
                location: {
                    Street: street,
                    City: city,
                    State: state,
                    PostalCode: postalCode,
                    Country: country
                },
                icon: 'standard:account',
                title: 'Shipping Address',
                description: 'Account Shipping Address'
            },
             {
                location: {
                    Street: Bstreet,
                    City: Bcity,
                    State: Bstate,
                    PostalCode: BpostalCode,
                    Country: Bcountry
                 },
                 icon: 'standard:account',
                title: 'Billing Address',
                description: 'Account Billing Address'
            },
        ];
    }
}