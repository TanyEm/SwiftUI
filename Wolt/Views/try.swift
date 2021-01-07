//
//  try.swift
//  Wolt
//
//  Created by Tatiana Podlesnykh on 7.1.2021.
//

import SwiftUI
import Combine

struct ViewList: View {
    
    @ObservedObject var viewModel = RestaurantCellViewModel()
    
    var body: some View {
        NavigationView{
            List(viewModel.restaurantsToShow, id: \.id) { rest in
                Cell(rest: rest)
            }.navigationBarTitle("Restaurants")
        }
    }
}

struct Cell: View {
    
    @ObservedObject var viewModel = RestaurantCellViewModel()
    
    var rest: Restaurant
    @State var imageName = "heart"
    
    @State private var img = ImageEnum.img1
    @State private var fadeOut = false

    
    var body: some View {
        HStack{
            ImageViewWidget(imageUrl: rest.img)
            VStack (alignment: .leading) {
                Text(rest.title)
                    .font(.headline)
                Text(rest.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
//            Image(systemName: img.rawValue)
            Image(systemName: rest.isLiked  ? "heart.fill" : "heart")
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
            
            
            
            
            

            

            
//            ImageView(image: rest.isLiked  ? "like" : "without_like", size: 20)
//                .onTapGesture {
//                    if rest.isLiked {
//                        viewModel.removeLike(id: rest.id)
//                    } else {
//                        let restLike = LikeModel(id: rest.id, isLked: !rest.isLiked)
//                        viewModel.appendLike(likeRest: restLike)
//                    }
//                }

//            VStack {
////                Image(systemName: self.imageName)
//                      Image(systemName: rest.isLiked  ? "heart.fill" : "heart")
//              Button("tap me") {
//                if rest.isLiked{
//                    
//                } else {
//                    
//                }
//                
//                self.imageName = self.imageName == "heart" ? "heart.fill" : "heart"
//              }
//            }
        }
    }
}
