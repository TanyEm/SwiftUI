import SwiftUI

struct TodoList: View {
    var restaurants: Places
    var updateRestaurant: ((_ id: Int) -> Void)

    var body: some View {
        List(self.restaurants) { restaurant in
            RestaurantCell(todoCellViewModel: RestaurantCellViewModel(restaurant: restaurants), updateTodo: { (id) in
                self.updateRestaurant(id)
            })
        }
    }
}
