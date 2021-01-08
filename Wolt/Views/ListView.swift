import SwiftUI
import Combine

struct ListView: View {
    
    @ObservedObject var viewModel = RestaurantCellViewModel()
    
    @State private var fadeOut = false
    @State private var img = ImageEnum.img1
    
    @ObservedObject var locationManager = LocationManager()
    
    var userLatitude: String {
        return "\(locationManager.lastLocation?.coordinate.latitude ?? 0)"
    }
    
    var userLongitude: String {
        return "\(locationManager.lastLocation?.coordinate.longitude ?? 0)"
    }
    
    var body: some View {
        NavigationView{
            List(viewModel.restaurantsToShow) { rest in
                ImageLoader(url: rest.img)
                VStack (alignment: .leading) {
                    Text(rest.title)
                        .font(.headline)
                    Text(rest.description)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
                
                // beautiful click, but doesn't change a photo, change rest.id
                Image(rest.isLiked  ? "like" : "without_like")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .opacity(fadeOut ? 0 : 1)
                    .animation(.easeInOut(duration: 0.35))    // animatable fade in/out
                    .onTapGesture {
                        self.fadeOut.toggle()                 // 1) fade out
                        
                        // delayed appear
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
                            withAnimation {
                                self.img = self.img.next()    // 2) change image
                                self.fadeOut.toggle()         // 3) fade in
                                if rest.isLiked {
                                    viewModel.removeLike(id: rest.id)
                                } else {
                                    let restLike = LikeModel(id: rest.id, isLked: !rest.isLiked)
                                    viewModel.appendLike(likeRest: restLike)
                                }
                            }
                        }
                    }
            }.navigationBarTitle("Restaurants")
        }
    }
}

struct Loc: View {
    @ObservedObject var locationManager = LocationManager()
    
    var userLatitude: String {
        return "\(locationManager.lastLocation?.coordinate.latitude ?? 0)"
    }
    
    var userLongitude: String {
        return "\(locationManager.lastLocation?.coordinate.longitude ?? 0)"
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("latitude: \(userLatitude)")
                Text("longitude: \(userLongitude)")
            }
        }
    }
}
