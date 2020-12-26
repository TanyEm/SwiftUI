import SwiftUI

struct Place: Identifiable {
    var id: String = UUID().uuidString
    let name: Restaurant!
    let image: String?
    let content: String?
    
    init(name: Restaurant, image: String?, content: String?) {
        self.name = name
        self.image = image
        self.content = content
    }
}
