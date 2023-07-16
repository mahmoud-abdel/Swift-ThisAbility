import SwiftUI

extension View {
    
//    func overlayMain() -> some View {
//        ZStack {
//            GeometryReader { geo in
//                RoundedRectangle(cornerRadius: 50) 
//                    .foregroundColor(Color.gray.opacity(0.8))
//                    //.frame(maxWidth: 150, maxHeight: 200)    
//                    .frame(width: geo.size.width - 100, height: geo.size.height - 100)
//                    
//                self    
//            }
//        }
//        
//    }
    
    func backgroundWithImage(_ image: Image) -> some View {
        self
            .background(
                ZStack {
                    image
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                        .colorMultiply(Color.gray.opacity(1))   
                }
            )
    }   

}