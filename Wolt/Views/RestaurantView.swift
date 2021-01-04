import SwiftUI

//struct RestaurantView: View {
//    
//    let places: Place
//    
//    var body: some View {
//        // main vertical stack view - contains upper stackview and image
//        VStack(alignment: .leading, spacing: 10) {
//            
//            // Upper Stackview - Contains Horizontal stack and post content
//            VStack(alignment: .leading) {
//                
//                HStack(spacing: 10) {
//                    
//                    // avatar
//                    ImageView(image: places.name.img, size: 70)
//                    
//                    VStack(alignment: .leading, spacing: 3) {
//                        
//                        // name
//                        Text(places.name.restaurant).font(.headline)
//                    }
//                }
//                
//                // post content - specify nil for multi-line text
//                Text(places.content ?? "").lineLimit(nil).font(.body)
//            }
//            .padding(.leading, 15)  // spacing from left edge of the view
//            .padding(.trailing, 15) // spacing from right edge of the view
//            
//            // post image
//            Image(places.image ?? "")
//                .resizable()  // creates resizable image
//                // this will allow image to fit the screen width maintaining aspect ratio
//                .aspectRatio(3/2, contentMode: .fit)
//        }
//        .padding(.top, 5)
//    }
//}
