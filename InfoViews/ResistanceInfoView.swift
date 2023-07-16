import SwiftUI

struct ResistanceInfoView: View {
    @Binding var showResistanceInfo: Bool
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        showResistanceInfo = false
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
                InfoHeading(text: "Resistance Exercise")
                InfoText(text: "Resistance exercise (also called strength training or weight lifting), involves using resistance of all kings to build both muscle strength and mass. Examples of resistance training include lifting weights, using resistance bands, and doing pushups. There are so many benefits to consistent resistance exercise!")
                InfoSub(text: "Muscle Strength and Mass")
                InfoText(text: "Resistance training is great for building muscle mass, and muscle strength. Both of which are critical components in your longevity and overall physical performance and functionality")
                InfoSub(text: "Bone Health")
                InfoText(text: "Resistance workouts can help you increase your bone-density. This is crucial as increased bone density is often associated with better long-term outcomes")
                InfoSub(text: "Slowing Muscle Loss")
                InfoText(text: "As we get older, we begin to lose 1% of our muscle mass per year. Resistance exercise the one of the most effective tools we have to combat this and often, completely reverse the loss")
                
            }
            .multilineTextAlignment(.leading)
        
        }
        .background(MyColors.denim)
    }
}