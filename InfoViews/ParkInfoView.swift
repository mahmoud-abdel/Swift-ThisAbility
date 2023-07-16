import SwiftUI

struct ParkInfoView: View {
    @Binding var showParkInfo: Bool
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        showParkInfo = false
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
                InfoHeading(text: "Parkinson's Disease")
                InfoText(text: "Parkinson's Disease is a progressive neurological disorder that affects movement, causing tremors, stiffness, and difficulty with balance and coordination. Regular exercise has been shown to improve motor symptoms, balance, and overall quality of life for people with Parkinson's")
                InfoSub(text: "Resistance Exercise Considerations")
                InfoText(text: "Individuals should focus on exercises that improve both strength and flexibility in the major muscle groups. Such as the chest, legs, and back. These individuals should also choose to work through exercises that incorporate balance and stability. A consensus piece of advice rooted in the science asks these individuals to consider working with bodyweight and/or resistance bands in order to minimize the risk of injury")
                InfoSub(text: "Aerobic Exercise Considerations")
                InfoText(text: "Individuals with Parkinson's should choose low-impact aerobics with low risk of injury from falling or losing balance; such as swimming or cycling. You should also be monitoring heart rate and exertion levels (RPE) closely, and modify the intensity of your workout as needed")
                
            }
            .multilineTextAlignment(.leading)
        }
        .background(MyColors.denim)
        
    }
}