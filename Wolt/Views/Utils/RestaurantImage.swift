//
//  RestaurantImage.swift
//  Wolt
//
//  Created by Tatiana Podlesnykh on 3.1.2021.
//

import SwiftUI

struct RestaurantImage: View {
    let image: Image
    
    var body: some View {
        image
        .resizable()
        .frame(width: 70, height: 70)
        .aspectRatio(contentMode: .fit)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: .gray, radius: 10, x: 5, y: 5)
        .padding()
    }

}
