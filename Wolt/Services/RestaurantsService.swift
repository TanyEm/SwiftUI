import Foundation
import CoreLocation

class RestaurantsService {
    
    func getStationList (_ manager: CLLocationManager, _ listed: @escaping ([Places]) -> ()) {
        
        var lat: Float?
        var lon: Float?
        var userLocation = CLLocationCoordinate2D()
        
        var components = URLComponents()
            components.scheme = "https"
            components.host = "restaurant-api.wolt.fi"
            components.path = "/v3/venues"
            components.queryItems = [
                URLQueryItem(name: "lat", value: "\(lat)"),
                URLQueryItem(name: "lon", value: "\(lon)")
            ]

        guard let restaurantDataURL = components.url else { return }
        
        var request = URLRequest(url: restaurantDataURL)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            if error != nil {
                print("error=\(String(describing:error))")
                return
            }

            do {
                let response = try JSONDecoder().decode(Places.self, from: data!)
                    callback(response.results as! [Places])
                } catch {
                    print(error)
                }
            }
        task.resume()
    }
}
