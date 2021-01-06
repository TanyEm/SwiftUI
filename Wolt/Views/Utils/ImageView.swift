import SwiftUI

struct ImageView: View {
    
    let image: String
    let size: CGFloat
    
    var body: some View {
        Image(image)
            .resizable()    // resizable image
            .aspectRatio(contentMode: .fill)
            .frame(width: size, height: size, alignment: .center) // frame
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(color: .gray, radius: 5, x: 2, y: 2)
            .padding(4)
    }
}
