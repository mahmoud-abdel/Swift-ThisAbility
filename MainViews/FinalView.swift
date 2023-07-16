import SwiftUI



struct FinalView: View {
    @EnvironmentObject var generator: WorkoutGenerator
    @State private var isLoading: Bool = true
    

    var body: some View {
        ZStack {
            if isLoading {
                LoadingView()
                    .onAppear {
                        generator.generateProgram()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                            self.isLoading = false 
                        }
                    }
            }
            else {
                GenProgramView()
            }
        }
    }
}

