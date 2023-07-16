import SwiftUI

class AerobicExercise: Exercise {
    
    var multScler: Bool = true
    var scoliosis: Bool = true
    var parkinsons: Bool = true
    var cerebPals: Bool = true
    
    var time: Int = 30 // time in minutes
    var RPE: Int = 5 //rating of perceived exertion
    
    init(_ name: String, _ multScler: Bool, _ scoliosis: Bool, _ parkinsons: Bool, _ cerebPals: Bool, _ time: Int, _ RPE: Int) {
        super.init() 
        super.name = name
        self.multScler = multScler
        self.scoliosis = scoliosis
        self.parkinsons = parkinsons
        self.cerebPals = cerebPals
        self.time = time
        self.RPE = RPE
        
        
    }
}