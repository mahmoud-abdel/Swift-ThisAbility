import SwiftUI

struct LoadingView: View {
    
    var body: some View {
        VStack {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .scaleEffect(3.5)
                .tint(MyColors.neonBlue)
                .padding()
            Title(text: "Building you a customized program...")
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .backgroundWithImage(Image("BackgroundHome"))
        
    }
}