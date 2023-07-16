import SwiftUI

class ExerciseDatabase {
    var resistanceExercises: [ResistanceExercise] = []
    var aerobicExercises: [AerobicExercise] = []
    
    var legsArr: [ResistanceExercise] = []
    var armsArr: [ResistanceExercise] = []
    var chestArr: [ResistanceExercise] = []
    var backArr: [ResistanceExercise] = []
    var coreArr: [ResistanceExercise] = []
    var shouldersArr: [ResistanceExercise] = []
    
    init(_ resistanceExercises: [ResistanceExercise]) {
        self.resistanceExercises = resistanceExercises
        self.aerobicExercises = loadAerobicExercises()

    }
    
    func fetchAllOfType(_ group: String, _ equipment: String, _ condition: String) -> [ResistanceExercise] {
        var filtered = resistanceExercises.filter {$0.primaryGroup == group}
        if equipment != "All" {
            filtered = filtered.filter {$0.equipment == equipment || $0.equipment == "Body"}
        }
        
        if condition != "None" {
            if condition == "MultScler" {
                filtered = filtered.filter {$0.multScler}
            }
            else if condition == "Parkinsons" {
                filtered = filtered.filter {$0.parkinsons}
            }
            else if condition == "CerebPals" {
                filtered = filtered.filter {$0.cerebPals}
            }
            else if condition == "Scoliosis"{
                filtered = filtered.filter {$0.scoliosis}
            }
        }
        return filtered
     
      }
    
    func loadAerobicExercises() -> [AerobicExercise] {
        var aerobicExercises: [AerobicExercise] = []
        var exercise: AerobicExercise
     
        exercise = AerobicExercise("Running", false, false, false, false, 45, 6)
        aerobicExercises.append(exercise)
        exercise = AerobicExercise("Rowing", true, false, true, true, 25, 6)
        aerobicExercises.append(exercise)
        exercise = AerobicExercise("Cycling", true, true, true, true, 45, 6)
        aerobicExercises.append(exercise)
        exercise = AerobicExercise("Walking", true, true, true, true, 45, 4)
        aerobicExercises.append(exercise)
        exercise = AerobicExercise("Skipping", false, false, false, false, 15, 7)
        aerobicExercises.append(exercise)
        exercise = AerobicExercise("Swimming", true, true, true, true, 35, 6)
        aerobicExercises.append(exercise)
        
        return aerobicExercises
    }
}