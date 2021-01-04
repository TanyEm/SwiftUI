import Foundation
import CoreLocation

public class RestaurantCellViewModel: ObservableObject {
    
    private let restService: RestaurantsService
    private let likeService: LikeStatusManager
    
    var restaurantsToShow = [Restaurant]()
    
    @Published var rest = [
        Restaurant(id: "1", title: "Rest1", description: "Desc1", isLiked: true, img: "1"),
        Restaurant(id: "2", title: "Rest2", description: "Desc2", isLiked: false, img: "2"),
        Restaurant(id: "3", title: "Rest3", description: "Desc3", isLiked: false, img: "3"),
        Restaurant(id: "4", title: "Rest4", description: "Desc4", isLiked: true, img: "4")
    ]
    
    init() {
        self.restService = RestaurantsService()
        self.likeService = LikeStatusManager()
    }
    
    func getRestaurantsWithLikes(_ manager: CLLocationManager, _ result: @escaping ([Restaurant]) -> ()) {
        restService.getRestaurantList(manager) { (restaurantsList) in
            
            print(restaurantsList)
            
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
                    description: restaurant.description[0].value,
                    isLiked: isLiked,
                    img: restaurant.listImage
                )
                
                self.restaurantsToShow.append(restaurantToShow)
            }
            
            result(self.restaurantsToShow)
        }
    }
}
