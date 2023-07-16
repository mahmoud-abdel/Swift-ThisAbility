import SwiftUI


struct EquipmentView: View {
    @EnvironmentObject var generator: WorkoutGenerator
    @ObservedObject var equipmentVM: EquipmentViewModel
    @State private var aerobicCheck: Bool = false
    @State private var resistanceCheck: Bool = false
    

    var body: some View {
        NavigationStack{
            VStack {
                if equipmentVM.type == "Aerobic" {
                    AerobicEquipmentView(aerobicCheck: $aerobicCheck)
                    NavigationLink(destination: FrequencyView()) {
                        NavigateText(text: "Continue")
                    }
                    .onlyIf($aerobicCheck)
                }
                else if equipmentVM.type == "Resistance" {
                    ResistanceEquipmentView(resistanceCheck: $resistanceCheck)
                    NavigationLink(destination: FrequencyView()) {
                        NavigateText(text: "Continue")
                    }
                }
                else if equipmentVM.type == "Both"{
                    AerobicEquipmentView(aerobicCheck: $aerobicCheck)
                    ResistanceEquipmentView(resistanceCheck: $resistanceCheck)
                    NavigationLink(destination: FrequencyView()) {
                        NavigateText(text: "Continue")
                    }
                    .onlyIf($aerobicCheck)
                }
                else {
                    Text("Something has gone horribly wrong")
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .backgroundWithImage(Image("BackgroundHome"))
    }
}