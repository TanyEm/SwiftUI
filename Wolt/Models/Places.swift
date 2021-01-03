//
//  Places.swift
//  Wolt
//
//  Created by Tatiana Podlesnykh on 3.1.2021.
//

import Foundation

public class Places: Codable, Identifiable {
    public let id: String
    public var title: String
    public var isLiked: Bool
    public var lat: Float
    public var lon: Float
    
    func toggleChecked() {
        isLiked = !isLiked
    }
}
