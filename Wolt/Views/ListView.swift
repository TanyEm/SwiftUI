import SwiftUI

struct TodoList: View {
    var restaurants: RestaurantResponseData
    var updateRestaurant: ((_ id: Int) -> Void)

    var body: some View {
        List(self.restaurants) { restaurant in
            RestaurantCell(restCellViewModel: RestaurantCellViewModel(restaurant: restaurants), updateTodo: { (id) in
                self.updateRestaurant(id)
            })
        }
    }
}
