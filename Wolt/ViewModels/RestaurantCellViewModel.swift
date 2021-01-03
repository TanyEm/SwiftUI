import Foundation
import CoreLocation

public class RestaurantCellViewModel {

    private var place: Places

    public init(place: Places) {
        self.place = place
    }

    public func isCompleted() -> Bool {
        return self.place.isLiked
    }

    public func getTitle() -> String {
        return self.place.title
    }

    public func getId() -> String {
        return self.place.id
    }
}
