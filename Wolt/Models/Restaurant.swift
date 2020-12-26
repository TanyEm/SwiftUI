import SwiftUI

struct Restaurant: Identifiable {
    
    var id: String = UUID().uuidString
    let restaurant: String
    let img: String
    
    init(restaurant: String, img: String) {
        self.restaurant = restaurant
        self.img = img
    }
}
