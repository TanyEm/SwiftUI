//
//  RestaurantsService.swift
//  Wolt-Kit
//
//  Created by Tatiana Podlesnykh on 4.1.2021.
//

import Foundation
import CoreLocation

class RestaurantsService {
    
    var list = [RestaurantResponseData]()
        
    func getRestaurantList(_ manager: CLLocationManager, _ listed: @escaping ([RestaurantResponseData]) -> ()) {
        let request = RestaurantListRequest()

        guard let lat = manager.location?.coordinate.latitude else {return}
        guard let lon = manager.location?.coordinate.longitude else {return}
        
        request.getRestaurantsList(lat: lat, lon: lon) { (result) in
            DispatchQueue.main.async {
                if result.count != 0 {
                    self.list = result
                    listed(result)
                } else {
                    print("Error: failed to get restaurant list")
                }
            }
        }
        
    }
}
