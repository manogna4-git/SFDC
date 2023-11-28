// AccountController.cls
public with sharing class AccountController {
    @AuraEnabled(cacheable=true)
    public static List<MapMarker> getAccountAddresses(Id accountId) {
        try {
            Account acc = [SELECT ShippingStreet, ShippingCity, ShippingState, ShippingPostalCode,BillingStreet, BillingCity, BillingState, BillingPostalCode FROM Account WHERE Id = :accountId WITH SECURITY_ENFORCED];

            // Create map markers
            List<MapMarker> markers = new List<MapMarker>();

            // Shipping Address
            markers.add(new MapMarker(acc.ShippingStreet + ', ' + acc.ShippingCity + ', ' + acc.ShippingState + ' ' + acc.ShippingPostalCode,
                'Shipping Address'));

            // Billing Address
            markers.add(new MapMarker(
                acc.BillingStreet + ', ' + acc.BillingCity + ', ' + acc.BillingState + ' ' + acc.BillingPostalCode,
                'Billing Address'));

            return markers;
        } catch (QueryException e) {
            // Log the exception for debugging purposes
            System.debug('Error in getAccountAddresses: ' + e.getMessage());
            throw new AuraHandledException('An error occurred while fetching account addresses.');
        }
    }

    // Inner class to represent a MapMarker
    public class MapMarker {
        public String location;
        public String title;

        public MapMarker(String location, String title) {
            this.location = location;
            this.title = title;
        }
    }
}
