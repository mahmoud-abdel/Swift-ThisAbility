import SwiftUI

struct WorkoutView: View {
    @EnvironmentObject var generator: WorkoutGenerator
    @State private var showRPEInfo: Bool = false
    var workout: Workout
    
    var body: some View {
        VStack {
            if let resistanceWorkout = workout as? ResistanceWorkout {
                VStack {
                    SubTitle(text: "Resistance Workout")
                    Text("Order: Name, Muscle Group, Repetitions, and Sets")
                    ForEach(0..<6, id: \.self) { index in
                        HStack {
                            Text(resistanceWorkout.exercises[index].name)
                                .frame(maxWidth: 200)
                                .padding(10)
                            Text(resistanceWorkout.exercises[index].primaryGroup)
                                .frame(maxWidth: 200)
                            
                            if resistanceWorkout.exercises[index].timeModifier && resistanceWorkout.exercises[index].perSideModifier
                            {
                                Text("\(resistanceWorkout.exercises[index].baselineReps) seconds / side")
                                    .frame(width: 200)    
                            }
                            else if resistanceWorkout.exercises[index].timeModifier {
                                Text("\(resistanceWorkout.exercises[index].baselineReps) seconds")
                                    .frame(width: 200)
                            }
                            else if resistanceWorkout.exercises[index].perSideModifier {
                                Text("\(resistanceWorkout.exercises[index].baselineReps) reps / side")
                                    .frame(width: 200)
                            } 
                            else {
                                Text("\(resistanceWorkout.exercises[index].baselineReps) reps")
                                    .frame(width: 200)
                            }
                            Text("4 sets")
                            
                            
                        }
                        .frame(width: 750)
                        .background(MyColors.spaceGrey).border(.white, width: 2)
                        .cornerRadius(10)
                        .padding(1)
                        .multilineTextAlignment(.center)
                    }
                }
                .listRowBackground(Color.red)
            } 
            else if let aerobicWorkout = workout as? AerobicWorkout {
                SubTitle(text: "Aerobic Workout")
                VStack {
                    Text(aerobicWorkout.exercise.name)
                        .font(.custom("Menlo", size: 20))
                        .fontWeight(.bold)
                        .padding(10)
                    Image(aerobicWorkout.exercise.name)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                        .padding()
                    Text("Duration: \(aerobicWorkout.exercise.time) minutes")
                        .padding()
                    Text("RPE: \(aerobicWorkout.exercise.RPE)")
                        .padding()
                }
                .background(MyColors.spaceGrey)
                .cornerRadius(10)
                .multilineTextAlignment(.center)
                
                VStack{
                    Button("What is RPE?") {
                        showRPEInfo = true 
                    }
                    .foregroundColor(.blue)
                    .fontWeight(.bold)
                    .padding(20)
                }
                .sheet(isPresented: $showRPEInfo) {
                    RPEInfoView(showRPEInfo: $showRPEInfo)
                }
            } 
            }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .backgroundWithImage(Image("BackgroundHome"))
        }
    
    init(workout: Workout) {
        self.workout = workout
    }
}