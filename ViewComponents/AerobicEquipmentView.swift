import SwiftUI

struct AerobicEquipmentView: View { 
    @EnvironmentObject var generator: WorkoutGenerator
    @State private var isRunning = false
    @State private var isWalking = false
    @State private var isSkipping = false
    @State private var isSwimming = false
    @State private var isRowing = false
    @State private var isCycling = false
    @Binding var aerobicCheck: Bool
    
    var body: some View {
        NavigationStack{
            VStack {
                SubTitle(text: "What kind of aerobics do you like?")
                HStack {
                    AerobicChoice(
                        displayName: "Walking",
                        isSelected: isWalking,
                        onTap: {
                            isWalking.toggle()
                            generator.userParams.aerobicChoices.walking = isWalking
                        }
                    )
                    AerobicChoice(
                        displayName: "Running",
                        isSelected: isRunning,
                        onTap: {
                            isRunning.toggle()
                            generator.userParams.aerobicChoices.running = isRunning
                        }
                    )
                    AerobicChoice(
                        displayName: "Swimming",
                        isSelected: isSwimming,
                        onTap: {
                            isSwimming.toggle()
                            generator.userParams.aerobicChoices.swimming = isSwimming
                        }
                    )
                }
                HStack { 
                    AerobicChoice(
                        displayName: "Rowing",
                        isSelected: isRowing,
                        onTap: {
                            isRowing.toggle()
                            generator.userParams.aerobicChoices.rowing = isRowing
                        }
                    )
                    AerobicChoice(
                        displayName: "Cycling",
                        isSelected: isCycling,
                        onTap: {
                            isCycling.toggle()
                            generator.userParams.aerobicChoices.cycling = isCycling
                        }
                    )
                    AerobicChoice(
                        displayName: "Skipping",
                        isSelected: isSkipping,
                        onTap: {
                            isSkipping.toggle()
                            generator.userParams.aerobicChoices.skipping = isSkipping
                        }
                    )
                }
            }
            .onChange(of: [isSkipping, isRunning, isRowing, isCycling, isWalking, isSwimming]) { _ in
                aerobicCheck = isRunning || isWalking || isRowing || isCycling || isSwimming || isSkipping
            }
        }
    }
}