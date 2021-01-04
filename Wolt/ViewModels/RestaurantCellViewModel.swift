import Foundation
import CoreLocation

public class RestaurantCellViewModel {
    
    private let service: RestaurantsService
    

    init(service: RestaurantsService) {
        self.service = service
    }

//    func isCompleted() -> Bool {
//        return self.place.isLiked
//    }
    
    func getRestaurants(_ manager: CLLocationManager, _ result: @escaping ([RestaurantResponseData]) -> ()) {
        self.service.getRestaurantList(manager) { (list) in
            result(list)
        }
    }

//
//    func getTitle() -> String {
//        self.service.getList(manager) { (list) in
//            result(stationList)
//        }
//    }
//
//    func getId() -> String {
//        return self.place.id
//    }
}
