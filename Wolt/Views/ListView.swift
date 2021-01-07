import SwiftUI
import Combine

struct ListView: View {
    
    @ObservedObject var viewModel = RestaurantCellViewModel()
    
//    @State private var img = ImageEnum.img1
//    @State private var fadeOut = false
    
    @State var imageName = "star"

    
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
                    
                    ImageViewWidget(imageUrl: rest.img)
                    VStack (alignment: .leading) {
                        Text(rest.title)
                            .font(.headline)
                        Text(rest.description)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    
                    VStack {
                        Image(systemName: self.imageName)
//                      Image(systemName: rest.isLiked  ? "star.fill" : "star")
                      Button("tap me") {
                        self.imageName = self.imageName == "star" ? "star.fill" : "star"
                      }
                    }
                    
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


class ImageLoader: ObservableObject {
    var didChange = PassthroughSubject<Data, Never>()
    
    var data = Data() {
        didSet {
            didChange.send(data)
        }
    }
    
    init(imageUrl: String) {
        // fetch image data and then call didChange
        guard let url = URL(string: imageUrl) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            
            DispatchQueue.main.async {
                self.data = data
            }
            
        }.resume()
    }
}

struct ImageViewWidget: View {
    
    @ObservedObject var imageLoader: ImageLoader
    
    init(imageUrl: String) {
        imageLoader = ImageLoader(imageUrl: imageUrl)
    }
    
    var body: some View {
        Image(uiImage: (imageLoader.data.count == 0) ? UIImage(imageLiteralResourceName: "1") : UIImage(data: imageLoader.data)!)
            .resizable()    // resizable image
            .aspectRatio(contentMode: .fill)
            .frame(width: 70, height: 70, alignment: .center) // frame
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(color: .gray, radius: 5, x: 2, y: 2)
            .padding(4)

    }
}

struct List_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
