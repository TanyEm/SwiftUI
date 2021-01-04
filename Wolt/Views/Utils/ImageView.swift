import SwiftUI

struct ImageView: View {
    
    let image: String
    let size: CGFloat
    
    var body: some View {
        Image(image)
            .resizable()    // resizable image
            .frame(width: size, height: size) // frame
            .clipShape(Circle())    // make rounded
            .overlay(Circle().stroke(Color.white.opacity(0.5), lineWidth: 5)) // create rounded border
    }
}
