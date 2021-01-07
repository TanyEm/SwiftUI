//
//  EnvironmentValues+ImageCache.swift
//  Wolt
//
//  Created by Tatiana Podlesnykh on 6.1.2021.
//

import SwiftUI

struct ImageLoader: View {
    private enum LoadState {
        case loading, success, failure
    }

    private class Loader: ObservableObject {
        var data = Data()
        var state = LoadState.loading

        init(url: String) {
            guard let parsedURL = URL(string: url) else {
                fatalError("Invalid URL: \(url)")
            }

            URLSession.shared.dataTask(with: parsedURL) { data, response, error in
                if let data = data, data.count > 0 {
                    self.data = data
                    self.state = .success
                } else {
                    self.state = .failure
                }

                DispatchQueue.main.async {
                    self.objectWillChange.send()
                }
            }.resume()
        }
    }
    
    @StateObject private var loader: Loader
    var loading: Image
    var failure: Image
    var size: CGFloat = 70.0

    var body: some View {
        selectImage()
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: size, height: size, alignment: .center) // frame
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(color: .gray, radius: 5, x: 2, y: 2)
            .padding(4)
    }
    
    init(url: String, loading: Image = Image(systemName: "photo"), failure: Image = Image(systemName: "multiply.circle")) {
            _loader = StateObject(wrappedValue: Loader(url: url))
            self.loading = loading
            self.failure = failure
        }

        private func selectImage() -> Image {
            switch loader.state {
            case .loading:
                return loading
            case .failure:
                return failure
            default:
                if let image = UIImage(data: loader.data) {
                    return Image(uiImage: image)
                } else {
                    return failure
                }
            }
        }
}
