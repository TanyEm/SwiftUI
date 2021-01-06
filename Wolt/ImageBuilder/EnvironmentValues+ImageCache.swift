//
//  EnvironmentValues+ImageCache.swift
//  Wolt
//
//  Created by Tatiana Podlesnykh on 6.1.2021.
//

import Foundation

import SwiftUI

struct ImageCacheKey: EnvironmentKey {
    static let defaultValue: ImageCache = TemporaryImageCache()
}

extension EnvironmentValues {
    var imageCache: ImageCache {
        get { self[ImageCacheKey.self] }
        set { self[ImageCacheKey.self] = newValue }
    }
}
