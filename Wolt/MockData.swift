import SwiftUI

struct MockData {
    
    // Restaurants
    
    static let restaurantMomotoko = Restaurant(restaurant: "Momotoko", img: "1")
    static let restaurantFatLizard = Restaurant(restaurant: "Fat Lizard", img: "2")
    static let restaurantChalupa = Restaurant(restaurant: "Chalupa", img: "3")
    static let restaurantTasteOfThailand = Restaurant(restaurant: "Taste of Thailand", img: "4")

    static func places() -> [Place] {
        let place1 = Place(name: restaurantMomotoko, image: "1",
                         content: "Ramen restaurant with variety of small snacks such as dumplings, takoyaki")
        
        let place2 = Place(name: restaurantFatLizard, image: "2",
                         content: "Restaurant Fat Lizard is a cosy laid back and same time a chic meeting point restaurant just a stone's throw from Aalto-yliopisto subway station")
        
        let place3 = Place(name: restaurantChalupa, image: "3",
                         content: "The hallmarks of Mexican cuisine are fresh ingredients, strong flavors and fresh portions")
        
        let place4 = Place(name: restaurantTasteOfThailand, image: "4",
                         content: "Authentic Thai food and cozy restaurant. Serving fresh and healthy food with no MSG. Gluten free menu available")
        
        return [place1, place2, place3, place4]
    }
}
