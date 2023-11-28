import { LightningElement,api } from 'lwc';

export default class MapMarkers extends LightningElement {
    @api Street;
    @api City;
    @api Country;
    @api Title;
    @api Description
    get mapMarkers() {
        return [
            {
                location: {
                    Street: this.Street,
                    City: this.City,
                    Country: this.Country,
                },
                Title: this.Title,
                Description: this.Description,
            },
        ];
    }
    get isMapLoaded() {
        if (this.Street && this.City && this.Country) {
            return true
        } else {
            return false;
        }
    }
}