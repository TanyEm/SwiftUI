import SwiftUI
import Combine

struct ListView: View {
    
    @ObservedObject var viewModel = RestaurantCellViewModel()
    
    @State private var didTap: Bool = false
    
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
                    ImageView(image: "3",size: 70)
                    
                    VStack (alignment: .leading) {
                        Text(rest.title)
                            .font(.headline)
                        Text(rest.description)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    
                    ImageView(image: rest.isLiked  ? "like" : "without_like", size: 20)
                        //                        .onTapGesture {
                        //                            if rest.isLiked {
                        //                                viewModel.removeLike(id: rest.id)
                        //                            } else {
                        //                                let rest = LikeModel(id: rest.id, isLked: !rest.isLiked)
                        //                                viewModel.appendLike(likeRest: rest)
                        //                            }
                        //
                        //                        }
                        .gesture(TapGesture()
                                    .onEnded {
                                        self.didTap.toggle()
                                        
                                    }
                        )
                        // 4.
                        
                }
                .navigationBarTitle("Restaurants")
            }
        }
    }

}

struct List_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
