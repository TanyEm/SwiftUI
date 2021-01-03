import SwiftUI

struct RestaurantCell: View {
    var restCellViewModel: RestaurantCellViewModel
    var updateTodo: ((_ id: Int) -> Void)

    var body: some View {
        HStack {
            Image(systemName: (self.restCellViewModel.isCompleted() ? "checkmark.square" : "like")).tapAction {
                self.updateTodo(self.restCellViewModel.getId())
            }

            Text(self.restCellViewModel.getTitle())
        }
        .padding()
    }
}
