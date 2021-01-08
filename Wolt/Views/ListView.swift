import SwiftUI
import Combine

struct ListView: View {
    
    @ObservedObject var viewModel = RestaurantCellViewModel()
        
    @State private var fadeOut = false
    @State private var img = ImageEnum.img1
    
    @State private var imageName = ""
    
    @ObservedObject var locationManager = LocationManager()

            var userLatitude: String {
            return "\(locationManager.lastLocation?.coordinate.latitude ?? 0)"
        }

        var userLongitude: String {
            return "\(locationManager.lastLocation?.coordinate.longitude ?? 0)"
        }
    
    var body: some View {
        NavigationView{
            HStack {
                List(viewModel.restaurantsToShow) { rest in
                    ImageLoader(url: rest.img)
                    VStack (alignment: .leading) {
                        VStack {
                            HStack {
                                Text("latitude: \(userLatitude)")
                                Text("longitude: \(userLongitude)")
                            }
                        }

                        Text(rest.title)
                            .font(.headline)
                        Text(rest.description)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                                        
                     // beautiful click, but doesn't change a photo, change rest.id
//                        Image(rest.isLiked  ? "like" : "without_like")
//                        .resizable()
//                        .frame(width: 20, height: 20)
//                        .opacity(fadeOut ? 0 : 1)
//                        .animation(.easeInOut(duration: 0.35))    // animatable fade in/out
//                        .onTapGesture {
//                            self.fadeOut.toggle()                 // 1) fade out
//
//                            // delayed appear
//                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
//                                withAnimation {
//                                    self.img = self.img.next()    // 2) change image
//                                    self.fadeOut.toggle()         // 3) fade in
//                                    if rest.isLiked {
//                                        viewModel.removeLike(id: rest.id)
//                                    } else {
//                                        let restLike = LikeModel(id: rest.id, isLked: !rest.isLiked)
//                                        viewModel.appendLike(likeRest: restLike)
//                                    }
//                                }
//                            }
//                        }
                    
                    // change rest.id at each click but it is invisible
//                    ImageView(image: rest.isLiked  ? "like" : "without_like", size: 20)
//                        .onTapGesture {
//                            if rest.isLiked {
//                                viewModel.removeLike(id: rest.id)
//                            } else {
//                                let rest = LikeModel(id: rest.id, isLked: !rest.isLiked)
//                                viewModel.appendLike(likeRest: rest)
//                            }
//                        }
                }
                .navigationBarTitle("Restaurants")
                
            }
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

struct List_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
