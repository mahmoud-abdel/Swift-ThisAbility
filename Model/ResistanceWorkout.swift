import SwiftUI

class ResistanceWorkout: Workout {
    var exercises: [ResistanceExercise] = []
    
    static var bodyTemplate: [String] = ["Legs", "Shoulders", "Chest", "Core", "Core", "Arms"]
    static var generalTemplate: [String] = ["Legs", "Chest", "Back", "Core", "Shoulders", "Arms"] 
}