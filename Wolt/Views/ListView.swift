import SwiftUI

struct ListView: View {
    
    @ObservedObject var restaurant = RestaurantCellViewModel()

    var body: some View {
        NavigationView {
            List{
                ForEach(restaurant.restaurantsToShow) { rest in
                    Image(systemName: "photo")
                    VStack(alignment: .leading) {
                        Text(rest.title)
                        Text(rest.description)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    
                    if rest.isLiked {
                        ImageView(image: "like", size: 20)
                    } else {
                        ImageView(image: "without_like", size: 20)
                        
                    }
                    
                    ImageView(image: "like", size: 20)
                        .padding(.leading)
                }
            }
            .navigationBarTitle("Restaurants")
        }
    }
}

struct List_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
