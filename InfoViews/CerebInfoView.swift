import SwiftUI

struct CerebInfoView: View {
    @Binding var showCerebInfo: Bool 
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        showCerebInfo = false
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
                InfoHeading(text: "Cerebral Palsy")
                InfoText(text: "Cerebral Palsy is a condition that affects movement and coordination, caused by damage sustained during brain development for a variety of reasons. Physical activity is important for people wih cerebral palsy as it can help improve mobility, coordination, and strength - and it can additionally boost self-esteem and confidence!")
                InfoSub(text: "Resistance Exercise Considerations")
                InfoText(text: "Individuals should focus on exercises that improve strength and flexibility in the afflicted muscles, and can also use variations of exercises that can be performed seated or laying down, if standing is difficult. Use of bodyweight and resistance bands has been found to be an excellent strategy for avoiding injury when you're just getting started!")
                InfoSub(text: "Aerobic Exercise Considerations")
                InfoText(text: "Individuals with cerebral palsy should choose low-impact aerobic exercises that are tailored towards their abilities and strengths. If lower body movement is excessively difficult, consider cardio activities that are upper-body dominant")
                
            }
            .multilineTextAlignment(.leading)
        }
        .background(MyColors.denim)
    }
}
        