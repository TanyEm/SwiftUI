import SwiftUI

struct ListView: View {
    
    @ObservedObject var restaurant = RestaurantCellViewModel()
    
    @ObservedObject var locationManager = LocationManager()

    var userLatitude: String {
        return "\(locationManager.lastLocation?.coordinate.latitude ?? 0)"
    }

    var userLongitude: String {
        return "\(locationManager.lastLocation?.coordinate.longitude ?? 0)"
    }

//    var body: some View {
//            VStack {
//                HStack {
//                    Text("latitude: \(userLatitude)")
//                    Text("longitude: \(userLongitude)")
//                }
//            }
//        }

    var body: some View {
//        NavigationView {
//            List{
//                ForEach(restaurant.rest) { index in
//                    RestaurantCell(restaurant: self.$restaurant.rest[index])
//                }
//            }
//            .navigationBarTitle("Restaurants")
//        }
        ForEach(restaurant, id: \.self) { rest in
          HStack {
            Text(rest.name)
            Spacer()
            if rest.isChecked {
              Text("✅")
            } else {
              Text("🔲") }
            }
        }
    }
}

struct List_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
