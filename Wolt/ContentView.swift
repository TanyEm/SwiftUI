import SwiftUI
//
//let posters = [
//    "https://image.tmdb.org/t/p/original//pThyQovXQrw2m0s9x82twj48Jq4.jpg",
//    "https://image.tmdb.org/t/p/original//vqzNJRH4YyquRiWxCCOH0aXggHI.jpg",
//    "https://image.tmdb.org/t/p/original//6ApDtO7xaWAfPqfi2IARXIzj8QS.jpg",
//    "https://image.tmdb.org/t/p/original//7GsM4mtM0worCtIVeiQt28HieeN.jpg"
//].map { URL(string: $0)! }
//
//struct ContentView: View {
//    var body: some View {
//         List(posters, id: \.self) { url in
//             AsyncImage(
//                url: url,
//                placeholder: { Text("Loading ...") },
//                image: { Image(uiImage: $0).resizable() }
//             )
//            .frame(idealHeight: UIScreen.main.bounds.width / 2 * 3) // 2:3 aspect ratio
//         }
//    }
//    
////    var body: some View {
////        VStack {
////            HStack {
////                AsyncImage(
////                    url: URL("https://image.tmdb.org/t/p/original//pThyQovXQrw2m0s9x82twj48Jq4.jpg"),
////                    placeholder: { Text("Loading ...") },
////                    image: { Image(uiImage: $0).resizable() }
////                )
////                .frame(idealHeight: UIScreen.main.bounds.width / 2 * 3) // 2:3 aspect ratio
////            }
////        }
////    }
//}
//
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}


struct QuickTest: View {
    @State private var img = ImageEnum.img1
    @State private var fadeOut = false
    var body: some View {
        Image(systemName: img.rawValue)
            .resizable()
            .frame(width: 300, height: 300)
            .opacity(fadeOut ? 0 : 1)
            .animation(.easeInOut(duration: 0.25))    // animatable fade in/out
            .onTapGesture {
                self.fadeOut.toggle()                 // 1) fade out

                // delayed appear
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                    withAnimation {
                        self.img = self.img.next()    // 2) change image
                        self.fadeOut.toggle()         // 3) fade in
                    }
                }
            }
    }
}

struct V: View {
  @State var imageName = "star"

  var body: some View {
    VStack {
      Image(systemName: self.imageName)
      Button("tap me") {
        self.imageName = self.imageName == "star" ? "star.fill" : "star"
      }
    }
  }
}
