import SwiftUI

struct RestaurantCell: View {
    
    @Binding var restaurant: Restaurant
    
    var body: some View {
        HStack {
            ImageView(image: restaurant.img, size: 70)
            VStack(alignment: .leading) {
                Text(restaurant.title)
                    .font(.headline)
                Text(restaurant.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            if restaurant.isLiked {
                ImageView(image: "like", size: 20)
            } else {
                ImageView(image: "without_like", size: 20)
            }

        }
        .padding(10)
    }
}

struct RestaurantCell_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantCell(restaurant: .constant(Restaurant(id: "7", title: "Rest", description: "restRest", isLiked: true, img: "1")))
    }
}
