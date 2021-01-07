import SwiftUI
import Combine

struct ListView: View {
    
    @ObservedObject var viewModel = RestaurantCellViewModel()
        
    @State private var fadeOut = false
    @State private var img = ImageEnum.img1
    
    @State private var imageName = ""

    
    var body: some View {
        NavigationView{
            HStack {
                List(viewModel.restaurantsToShow) { rest in
                
//                    AsyncImage(
//                        url: URL(rest.img),
//                       placeholder: { Text("Loading ...") },
//                       image: { Image(uiImage: $0).resizable() }
//                    )
//                   .frame(idealHeight: UIScreen.main.bounds.width / 2 * 3) // 2:3 aspect ratio
//                    ImageView(image: "3",size: 70)
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


//class ImageLoader: ObservableObject {
//    var didChange = PassthroughSubject<Data, Never>()
//
//    var data = Data() {
//        didSet {
//            didChange.send(data)
//        }
//    }
//
//    init(imageUrl: String) {
//        // fetch image data and then call didChange
//        guard let url = URL(string: imageUrl) else { return }
//        URLSession.shared.dataTask(with: url) { (data, _, _) in
//            print("data", data)
//            guard let data = data else { return }
//
//            DispatchQueue.main.async {
//                self.data = data
//            }
//
//        }.resume()
//    }
//}
//
//struct ImageViewWidget: View {
//
//    @ObservedObject var imageLoader: ImageLoader
//
//    init(imageUrl: String) {
//        imageLoader = ImageLoader(imageUrl: imageUrl)
//    }
//
//    var body: some View {
//        Image(uiImage: (imageLoader.data.count == 0) ? UIImage(imageLiteralResourceName: "1") : UIImage(data: imageLoader.data)!)
//            .resizable()    // resizable image
//            .aspectRatio(contentMode: .fill)
//            .frame(width: 70, height: 70, alignment: .center) // frame
//            .clipShape(RoundedRectangle(cornerRadius: 10))
//            .shadow(color: .gray, radius: 5, x: 2, y: 2)
//            .padding(4)
//
//    }
//}

struct List_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
