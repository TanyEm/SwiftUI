import SwiftUI

struct ListView: View {

    var body: some View {
        
        List(0 ..< 15) { item in
            Image(systemName: "photo")
            VStack(alignment: .leading) {
                Text("Restaurant")
                Text("Turning a catastrophe into something delicious!")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            ImageView(image: "like", size: 20)
                .padding(.leading)
        }
    }
}

struct List_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
