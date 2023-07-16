import SwiftUI

struct TrainingTypeView: View {
    @EnvironmentObject var generator: WorkoutGenerator
    @State private var exerciseType: String = "" {
        didSet {
            equipmentVM.type = exerciseType 
        }
    }
    
    @State private var typeSelected: Bool = false
    @State private var showResistanceInfo: Bool = false
    @State private var showAerobicInfo: Bool = false
    @ObservedObject var equipmentVM: EquipmentViewModel 
    
    var body: some View {
        NavigationStack {
            VStack {
                Title(text: "Select Exercise Type: ")

                Button(action: {
                    generator.userParams.exerciseType = "Aerobic"
                    exerciseType = "Aerobic"
                    typeSelected = true
                }) {
                    Text("Aerobic Exercise")
                        .foregroundColor(exerciseType == "Aerobic" ? .white : .green )
                        .padding()
                        .background(exerciseType == "Aerobic" ? .orange : MyColors.spaceGrey).border(Color.white, width: 2)
                        .cornerRadius(10)
                }
                Button(action: {
                    generator.userParams.exerciseType = "Resistance"
                    exerciseType = "Resistance"
                    typeSelected = true
                }) {
                    Text("Resistance Exercise")
                        .foregroundColor(exerciseType == "Resistance" ? .white : .green )
                        .padding()
                        .background(exerciseType == "Resistance" ? .orange : MyColors.spaceGrey).border(Color.white, width: 2)
                        .cornerRadius(10)
                }
                Button(action: {
                    generator.userParams.exerciseType = "Both"
                    exerciseType = "Both"
                    typeSelected = true
                }) {
                    Text("Aerobic and Resistance Exercise")
                        .foregroundColor(exerciseType == "Both" ? .white : .green )
                        .padding()
                        .background(exerciseType == "Both" ? .orange : MyColors.spaceGrey).border(Color.white, width: 2)
                        .cornerRadius(10)
                }
                NavigationLink(destination: EquipmentView(equipmentVM: equipmentVM)) {
                    NavigateText(text: "Continue").onlyIf($typeSelected)
                }
                .onDisappear(perform: {
                    if exerciseType == "Both" { 
                        generator.userParams.frequency = 3
                    }
                    else {
                        generator.userParams.frequency = 2
                    }
                })
                HStack {
                    Button("Resistance Info") {
                        showResistanceInfo = true
                    }
                    .foregroundColor(.blue)
                    .fontWeight(.bold)
                    .padding(20)
                    
                    Button("Aerobic Info") {
                        showAerobicInfo = true
                    }
                    .foregroundColor(.blue)
                    .fontWeight(.bold)
                    .padding(20)
                }
            }
            .navigationBarHidden(true)
            .sheet(isPresented: $showResistanceInfo) {
                ResistanceInfoView(showResistanceInfo: $showResistanceInfo)
            }
            .sheet(isPresented: $showAerobicInfo) {
                AerobicInfoView(showAerobicInfo: $showAerobicInfo)
            }
        }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .backgroundWithImage(Image("BackgroundHome"))
    }
}