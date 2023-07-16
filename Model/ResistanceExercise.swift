import SwiftUI

class ResistanceExercise: Exercise {
    var equipment: String = ""
    
    var primaryGroup: String = ""
    
    var multScler: Bool = true
    var scoliosis: Bool = true
    var parkinsons: Bool = true
    var cerebPals: Bool = true
    
    var baselineReps: Int = 10
    var perSideModifier: Bool = false
    var timeModifier: Bool = false //interpret baselineReps in seconds instead of reps
    
    init(info: [String]) {
        super.init() 
        super.name = info[0]
        self.equipment = info[1]
        self.primaryGroup = info[2]
        self.multScler = info[3] == "1"
        self.scoliosis = info[4] == "1"
        self.parkinsons = info[5] == "1"
        self.cerebPals = info[6] == "1"
        self.baselineReps = Int(info[7])!
        self.perSideModifier = info[8] == "1"
        self.timeModifier = info[9].first == "1"
    }
}