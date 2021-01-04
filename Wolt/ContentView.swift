import SwiftUI

struct ContentView: View {

    var body: some View {
        NavigationView {
            List(0..<10) {_ in
            Image(systemName: "photo")
            VStack {
                Text("Resthgfuhjhg")
                Text("Disc")
            }
            Spacer()
            ImageView(image: "like", size: 20)
        }
    }
        
    }
}

struct RestaurantsListView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
