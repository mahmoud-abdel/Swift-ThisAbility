import SwiftUI

struct AerobicInfoView: View {
    @Binding var showAerobicInfo: Bool
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        showAerobicInfo = false
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
                InfoHeading(text: "Aerobic Exercise")
                InfoText(text: "Aerobic workouts (also known as 'cardio'), are defined as any form of exercise that increases your heart rate, and your rate of breathing. This includes a broad range of exercises, such as running, biking, jumping jacks, and even a walk! Now what might some of the benefits of aerobic exercise be?")
                InfoSub(text: "Cardiovascular Health")
                InfoText(text: "Aerobic exercise is essential in strengthening both your heart and your lungs - which improves your overall cardiovascular health. As this improves, your risk of heart disease, stroke, and cancer decrease significantly!")
                InfoSub(text: "Endurance")
                InfoText(text: "As you perform aerobic workouts consisently over time, the heart becomes better at stretching and supplying blood to the parts of your body that need it! You'll notice this as you'll be able to perform physical activities of all kinds for longer periods of time!")
                InfoSub(text: "Mental Health")
                InfoText(text: "Aerobic exercise can also have many positive effects on your mental health. When you exercise, your body releases endorphins - which are checmicals that can help reduce stress and anxiety. Additionally, aerobic exercise has been shown to improve mood, cognitive function, and self-esteem!")
                
            }
            .multilineTextAlignment(.leading)
         }
        .background(MyColors.denim)
        
    }
}