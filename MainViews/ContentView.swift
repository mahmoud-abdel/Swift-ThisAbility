import SwiftUI


struct ContentView: View {
    @StateObject var generator = WorkoutGenerator()
    @StateObject var equipmentVM = EquipmentViewModel()


    var body: some View {
        NavigationStack{
            ZStack {
                Image("BackgroundHome")  
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Image("Logo")
                        .resizable()
                        .padding()
                        .scaledToFit()
                        .frame(width: 400) 

                    NavigationLink(destination: TrainingTypeView(equipmentVM: equipmentVM)){
                        Text("Tap me to enter an inclusive workout generator!")
                            .foregroundColor(.orange)
                            .padding()
                            .background(MyColors.spaceGrey).border(Color.white, width: 4)
                            .cornerRadius(5)
                            .frame(width: 280, height: 100)
                            .padding(100)
                    }
                }

            }
        }
        .environmentObject(generator) 
    }
}

