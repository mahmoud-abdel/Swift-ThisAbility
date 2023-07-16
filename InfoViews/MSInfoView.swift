import SwiftUI

struct MSInfoView: View {
    @Binding var showMSInfo: Bool
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        showMSInfo = false
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
                InfoHeading(text: "Multiple Sclerosis (MS)")
                InfoText(text: "Multiple Sclerosis is a condition that primarily affects the CNS (cental nervous system) and can lead to a range of symptoms which include muscle weakness, fatigue, and balance problems. Exercise can help people with MS manage their symptoms, as well as improve overall physical and mental health")
                InfoSub(text: "Resistance Exercise Considerations")
                InfoText(text: "These individuals should focus on exercises that target the major muscle groups, especially those affected by MS. It is also recommended to use lighter weights and perform more repetitions")
                InfoSub(text: "Aerobic Exercise Considerations")
                InfoText(text: "Try to choose low-impact exercises, for the primary reason of avoiding falls that lead to injury. This is also why it is crucial for individuals with MS to work at improving their balance and stability. Additionally, it has been shown to help for individuals to begin with shorter aerobic sessions and gradually increase the duration as they can tolerate")
                
            }
            .multilineTextAlignment(.leading)
        }
        .background(MyColors.denim)
        
    }
}