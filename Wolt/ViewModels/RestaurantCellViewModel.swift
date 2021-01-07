import Foundation
import CoreLocation
import Combine

public class RestaurantCellViewModel: ObservableObject {
    
    private let restService: RestaurantsService
    private let likeService: LikeStatusManager
    private let location: LocationManager
    
    let manager = CLLocationManager()
        
    @Published var restaurantsToShow = [Restaurant]()
        
//    @Published var rest: [Restaurant?] = Array(repeating: nil, count: 15)
    
    init() {
        self.restService = RestaurantsService()
        self.likeService = LikeStatusManager()
        self.location = LocationManager()
        
        getRestaurantsWithLikes(location.locationManager) { [self] (list) in
            restaurantsToShow = list
        }
    }
    
    func appendLike(likeRest: LikeModel) {
        likeService.appendLike(likeRest: likeRest)
    }

    func getRestaurantsWithLikes(_ manager: CLLocationManager, _ result: @escaping ([Restaurant]) -> ()) {
        restService.getRestaurantList(manager) { (restaurantsList) in
            for restaurant in restaurantsList {
                var isLiked = false
                
                do {
                    let likeStatus = try self.likeService.getLikeStatus(id: restaurant.id.oid)
                    isLiked = likeStatus.isLked
                } catch {
                    print(error.localizedDescription)
                }

                let restaurantToShow = Restaurant(
                    id: restaurant.id.oid,
                    title: restaurant.name[0].value,
                    description: (!restaurant.description.isEmpty) ? restaurant.description[0].value : "",
                    isLiked: isLiked,
                    img: (!restaurant.listImage.isEmpty) ? restaurant.listImage : ""
                )
                
                self.restaurantsToShow.append(restaurantToShow)
            }
            
            result(self.restaurantsToShow)
        }
    }
    
    func removeLike(id: String){
        do {
            try likeService.removeLike(id: id)
        } catch {
            print("Unexpected error: \(error.localizedDescription).")
        }
    }
}
