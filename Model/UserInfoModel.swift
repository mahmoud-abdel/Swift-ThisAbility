import SwiftUI

class UserInfoModel: ObservableObject {
    @Published var exerciseType: String = "" {
        didSet {
            self.updateSliderRanges(exerciseType)
        }
    }
    
    @Published var equipment: String = "Body" 
    
    @Published var bottomRange: Int = 0
    @Published var topRange: Int = 10
    @Published var frequency: Int = 3
    
    @Published var age: Int = 18
    @Published var sex: String = ""
    @Published var condition: String = "None"
    @Published var aerobicChoices = aerobicChoices()
    
    struct aerobicChoices {
        var running: Bool = false
        var walking: Bool = false
        var rowing: Bool = false
        var cycling: Bool = false
        var skipping: Bool = false
        var swimming: Bool = false
    }

    
    func updateSliderRanges(_ exerciseTypeParam: String) {
        if exerciseTypeParam == "Both" {
            self.bottomRange = 2
            self.topRange = 5
        }
        else {
            self.bottomRange = 1
            self.topRange = 3
        }
    }
}