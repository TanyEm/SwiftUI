//
//  LikeModel.swift
//  Wolt
//
//  Created by Tatiana Podlesnykh on 3.1.2021.
//

import Foundation

struct LikeModel: Codable {
    let id: String
    let isLked: Bool
}

enum ImageEnum: String {
    case img1 = "heart.fill"
    case img2 = "heart"

    func next() -> ImageEnum {
        switch self {
            case .img1: return .img2
            case .img2: return .img1
        }
    }
}
