import SwiftUI

struct RPEInfoView: View {
    @Binding var showRPEInfo: Bool
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        showRPEInfo = false
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.red)
                            .font(.title)
                    }
                    .padding(5)
                }
                Spacer()
            }
            
            VStack {
                InfoText(text: "This is an RPE scale, it is a tool for individuals to self-assess their effort during strenous exercise")
                Image("RPE")
            }
    
        }
        .background(MyColors.denim)
        
    }
}