import SwiftUI

struct RestaurantsListView: View {
    let places = MockData.places()
        
        /// view body
        var body: some View {
            
            // Provides NavigationController
            NavigationView {
            
                    // List inside the navigationController
                    List {
                
                        // loop through all the posts and create a post view for each item
                        ForEach(places) { place in
                            RestaurantView(places: place)
                        }
                    }
                    .padding(.leading, -20)   // this will removes the left spacing (default is 20)
                    .padding(.trailing, -20)  // this will removes the right spacing (default is 20)
                    // set navbar title
                    .navigationBarTitle(Text("Home"))
            }
        }
}

struct RestaurantsListView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantsListView()
    }
}
