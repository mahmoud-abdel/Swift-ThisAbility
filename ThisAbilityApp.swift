import SwiftUI

@main
struct MyApp: App {
    let mainFont = Font.custom("Menlo", size: 20)
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.font, Font.custom("Menlo", size: 16))
        }
    }
}
