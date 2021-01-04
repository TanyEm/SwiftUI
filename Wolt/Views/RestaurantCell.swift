import SwiftUI

struct RestaurantCell: View {
    var restaurant: Restaurants 
    
    var body: some View {
        HStack {
            ImageView(image: restaurant.img, size: 70)
            
            VStack(alignment: .leading) {
                Text(restaurant.title).font(.headline)
                Text(restaurant.description).font(.subheadline).foregroundColor(.gray)
                Spacer().frame(height: 15)
            }
            if restaurant.isLiked {
                ImageView(image: "like", size: 70)
            }
            
        }
    }
}

struct RestaurantCell_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantCell(restaurant: Restaurants(id:"7", title: "Creativity, Inc.", description: "Ed Catmull", isLiked: true, img: "like"))
    }
}
