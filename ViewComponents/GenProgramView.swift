import SwiftUI

struct GenProgramView: View {
    @EnvironmentObject var generator: WorkoutGenerator 
    
    var body: some View {
        NavigationStack {
            VStack {
                Title(text: "Your Program")
                Text("Consult with a doctor before beginning a new exercise regiment!").foregroundColor(.red)
                List {
                    ForEach(0..<7, id: \.self) { index in
                        let day = Calendar.current.weekdaySymbols[index]
                        HStack {
                            Day(text: "\(day): ")
                                .fontWeight(.bold)
                            if generator.program[index] is ResistanceWorkout {
                                NavigationLink(destination: WorkoutView(workout: generator.program[index]!)) {
                                    NavigateText(text: "Resistance Workout")
                                }
                            }
                            else if generator.program[index] is AerobicWorkout {
                                NavigationLink(destination: WorkoutView(workout: generator.program[index]!)) {
                                    Text("Aerobic Workout")
                                        .padding()
                                        .background(Color.red)
                                        .foregroundColor(.white)
                                        .cornerRadius(20)
                                        .padding(20)
                                }
                            }
                            else {
                                Text("Today is a rest day")
                                    .padding()
                                    .background(Color.green)
                                    .foregroundColor(.white)
                                    .cornerRadius(20)
                                    .padding(20)
                            }
                        }
                    }
                    .listRowBackground(MyColors.spaceGrey)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .backgroundWithImage(Image("BackgroundHome"))
        }
    }
}