//
//  Places.swift
//  Wolt
//
//  Created by Tatiana Podlesnykh on 3.1.2021.
//

import SwiftUI

struct Restaurant: Identifiable {
    var id: String
    var title: String
    var description: String
    var isLiked: Bool
    var img: String
    
    init(id: String, title: String, description: String, isLiked: Bool, img: String) {
        self.id = id
        self.title = title
        self.description = description
        self.isLiked = isLiked
        self.img = img
    }

}
