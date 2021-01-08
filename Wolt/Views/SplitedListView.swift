//
//  SplitedListView.swift
//  Wolt
//
//  Created by Tatiana Podlesnykh on 8.1.2021.
//

import SwiftUI

struct SplitedListView: View {
    
    @ObservedObject var viewModel = RestaurantCellViewModel()
    
    var body: some View {
        NavigationView{
            List {
                ForEach(viewModel.restaurantsToShow, id: \.id){ rest in
                    Cell(isPressed: rest.isLiked, rest: rest)
                }
            }.navigationTitle("Restaurant")
        }
    }
}

struct Cell: View {
    
    @ObservedObject var viewModel = RestaurantCellViewModel()
            
    @State var isPressed: Bool
    @State var rest: Restaurant
    
    var body: some View {
        HStack{
            ImageLoader(url: rest.img)
            VStack (alignment: .leading) {
                Text(rest.title)
                    .font(.headline)
                Text(rest.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            
            // change a photo, change rest.id only once while the last click,
            // also, a photo changed once, on the second click nothing happened with the photo
            Button(action: {
                self.isPressed = rest.isLiked
                self.isPressed.toggle()

                if rest.isLiked {
                    viewModel.removeLike(id: rest.id)
                } else {
                    let restLike = LikeModel(id: rest.id, isLked: !rest.isLiked)
                    viewModel.appendLike(likeRest: restLike)
                }
            }) {
                Image(self.isPressed ? "like" : "without_like")
                      .resizable()
                      .frame(width: 20, height: 20)
            }
        }
    }
}

