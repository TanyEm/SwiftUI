//
//  Places.swift
//  Wolt
//
//  Created by Tatiana Podlesnykh on 3.1.2021.
//

import SwiftUI

struct Restaurant: Identifiable, Codable {
    var id: String
    var title: String
    var description: String
    var isLiked: Bool
    var img: String
}
