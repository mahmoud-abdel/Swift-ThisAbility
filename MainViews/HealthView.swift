import SwiftUI


struct HealthView: View {
    @EnvironmentObject var generator: WorkoutGenerator
    @State private var selection: String = ""
    @State var typeSelected: Bool = false
    @State var showMSInfo = false
    @State var showParkInfo = false
    @State var showScolInfo = false
    @State var showCerebInfo = false
    

    var body: some View {
        NavigationStack {
            VStack {
                Title(text: "Do you have any of the following conditions?")
                HStack {
                    ResistanceChoice(
                        displayName: "Multiple Sclerosis",
                        toCompare: "MultScler",
                        equipment: selection,
                        onTap: {
                            selection = "MultScler"
                            generator.userParams.condition = selection
                            typeSelected = true
                        }
                    )
                    ResistanceChoice(
                        displayName: "Scoliosis",
                        toCompare: "Scoliosis",
                        equipment: selection,
                        onTap: {
                            selection = "Scoliosis"
                            generator.userParams.condition = selection
                            typeSelected = true
                        }
                    )
                }
                HStack {
                    ResistanceChoice(
                        displayName: "Parkinson's",
                        toCompare: "Parkinsons",
                        equipment: selection,
                        onTap: {
                            selection = "Parkinsons"
                            generator.userParams.condition = selection
                            typeSelected = true
                        }
                    )
                    

                    ResistanceChoice(
                        displayName: "Cerebral Palsy",
                        toCompare: "CerebPals",
                        equipment: selection,
                        onTap: {
                            selection = "CerebPals"
                            generator.userParams.condition = selection
                            typeSelected = true
                        }
                    )
                }
                ResistanceChoice(
                    displayName: "None",
                    toCompare: "None",
                    equipment: selection,
                    onTap: {
                        selection = "None"
                        generator.userParams.condition = selection
                        typeSelected = true
                    }
                )
                
                
                NavigationLink(destination: FinalView()) {
                    NavigateText(text: "GENERATE PROGRAM!").onlyIf($typeSelected)  
                }
                
                HStack {
                    Button("Scoliosis Info") {
                        showScolInfo = true
                    }
                    .foregroundColor(.blue)
                    .fontWeight(.bold)
                    .padding(20)
                    
                    Button("MS Info") {
                        showMSInfo = true
                    }
                    .foregroundColor(.blue)
                    .fontWeight(.bold)
                    .padding(20)
                    
                    Button("Cerebral Palsy Info") {
                        showCerebInfo = true
                    }
                    .foregroundColor(.blue)
                    .fontWeight(.bold)
                    .padding(20)
                    
                    Button("Parkinsons Info") {
                        showParkInfo = true
                    }
                    .foregroundColor(.blue)
                    .fontWeight(.bold)
                    .padding(20)
                }
                
            }
            .sheet(isPresented: $showMSInfo) {
                MSInfoView(showMSInfo: $showMSInfo)
            }
            .sheet(isPresented: $showParkInfo) {
                ParkInfoView(showParkInfo: $showParkInfo)
            }
            .sheet(isPresented: $showCerebInfo) {
                CerebInfoView(showCerebInfo: $showCerebInfo)
            }
            .sheet(isPresented: $showScolInfo) {
                ScolInfoView(showScolInfo: $showScolInfo)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .backgroundWithImage(Image("BackgroundHome"))
    }
}

