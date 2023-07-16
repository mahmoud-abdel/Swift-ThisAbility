import SwiftUI


struct FrequencyView: View {
    @EnvironmentObject var generator: WorkoutGenerator
    

    var body: some View {
        NavigationStack{
            VStack {
                Title(text: "How many times per week?")
                SubTitle(text: "Pick between \(generator.userParams.bottomRange) and \(generator.userParams.topRange)")
                Stepper(value: $generator.userParams.frequency, in: generator.userParams.bottomRange...generator.userParams.topRange) {
                    Text("Current: \(generator.userParams.frequency)") 
                }
                .padding(30)
                NavigationLink(destination: HealthView()) {
                    NavigateText(text: "Continue")
                } 
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .backgroundWithImage(Image("BackgroundHome"))
    }
}