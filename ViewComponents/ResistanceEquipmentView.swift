import SwiftUI

struct ResistanceEquipmentView: View {
    @EnvironmentObject var generator: WorkoutGenerator 
    @State private var selection: String = "Body" {
        didSet {
            if !selection.isEmpty {
                resistanceCheck = true
            }
        }
    }
    @Binding var resistanceCheck: Bool 
    
    var body: some View {
        NavigationStack {
            VStack {
                SubTitle(text: "What equipment do you have access to?")
                HStack {
                    ResistanceChoice(
                        displayName: "Bodyweight",
                        toCompare: "Body",
                        equipment: selection,
                        onTap: {
                            selection = "Body"
                            generator.userParams.equipment = selection
                        }
                    )
                    ResistanceChoice(
                        displayName: "Dumbbells",
                        toCompare: "Dumbell",
                        equipment: selection,
                        onTap: {
                            selection = "Dumbell"
                            generator.userParams.equipment = selection
                        }
                    )
                    ResistanceChoice(
                        displayName: "Full Gym",
                        toCompare: "All",
                        equipment: selection,
                        onTap: {
                            selection = "All"
                            generator.userParams.equipment = selection
                        } 
                    )
                }
            }
        }
    }
}