import Foundation
import CoreLocation

class RestaurantsService {
    
    var lat: Double?
    var lon: Double?
    
    var userLocation = CLLocationCoordinate2D()
    
    func getRestaurantList(_ manager: CLLocationManager, _ listed: @escaping ([RestaurantResponseData]) -> ()) {
        let request = RestaurantListRequest()
        
        if manager.location?.coordinate == nil {
            lat = 50.1
            lon = 14.6
        } else {
            userLocation = manager.location!.coordinate
            lat = userLocation.latitude
            lon = userLocation.longitude
        }
        
        request.getStationList(lat: lat!, lon: lon!) { (result) in
            if result.count != nil {
                result.
                
            } else {
                print("Error: failed to get restaurant list")
            }
        }
        
    }
}
