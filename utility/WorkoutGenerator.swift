import SwiftUI

class WorkoutGenerator: ObservableObject {
    @Published var userParams: UserInfoModel = UserInfoModel()
    var program: [Workout?] = [nil, nil, nil, nil, nil, nil, nil]
    
    var weekPattern: [String] = []
    var exerciseDatabase: ExerciseDatabase?
    
    var aerobics: [AerobicExercise] = [] 
    
    var legsArr: [ResistanceExercise] = []
    var armsArr: [ResistanceExercise] = []
    var chestArr: [ResistanceExercise] = []
    var backArr: [ResistanceExercise] = []
    var coreArr: [ResistanceExercise] = []
    var shouldersArr: [ResistanceExercise] = []
    init() {
        self.exerciseDatabase = ExerciseDatabase(loadExercises())

    }
    
    func loadExercises() -> [ResistanceExercise] {
        var resistanceArray: [ResistanceExercise] = []
        guard let path = Bundle.main.path(forResource: "ResistanceDataBase", ofType: "csv") else {
            return []
        }
        var data = ""
        do {
            data = try String(contentsOfFile: path)
        }
        catch {
            return[]
        }
        var rows = data.components(separatedBy: "\n")
        rows.removeFirst()

        for row in rows {
            let csvColumns = row.components(separatedBy: ",")
            if csvColumns.count != 10 {
                continue
            }
            else {
                let exercise = ResistanceExercise.init(info: csvColumns)
                resistanceArray.append(exercise)
            }
        }
        return resistanceArray
    }
    
    func arrangeWeek() {
        weekPattern = ["empty", "empty", "empty", "empty", "empty", "empty", "empty"]
        if (userParams.exerciseType == "Both") {
            arrangeWeekAll()
        }
        else {
            arrangeWeekSingle()
        }
    }
    
    private func arrangeWeekSingle() {
        let frequency: Int = userParams.frequency
        let jump: Int = (7/frequency)
        let start: Int = Int(arc4random_uniform(2))
        var count: Int = 0
        
        if frequency == 1 {
            self.weekPattern[1] = userParams.exerciseType
            return
        }
        else {
            for i in stride(from: start, to: 7, by: jump) {
                self.weekPattern[i] = userParams.exerciseType
                count += 1
                if count >= frequency {
                    break
                }
            }
        }
    }
    
    private func arrangeWeekAll() {
        let frequency: Int = userParams.frequency
        let jump: Int = (7/frequency) + 2
        let start: Int = 0
        var count = 0
        
        for i in stride(from: start, to: 7, by: jump) {
            self.weekPattern[i] = "Aerobic"
            count += 1
            
            if count >= frequency {
                break
            }
            
            if frequency <= 3 {
                self.weekPattern[i+2] = "Resistance"
            }
            else {
                self.weekPattern[i+1] = "Resistance"
            }
            count += 1
            
            if count >= frequency {
                break
            }
        }
        
    }

    func populateProgram() {
        
        if (userParams.exerciseType == "Resistance") || (userParams.exerciseType == "Both") {
            legsArr = exerciseDatabase!.fetchAllOfType("Legs", userParams.equipment, userParams.condition).shuffled()
            armsArr = exerciseDatabase!.fetchAllOfType("Arms", userParams.equipment, userParams.condition).shuffled()
            chestArr = exerciseDatabase!.fetchAllOfType("Chest", userParams.equipment, userParams.condition).shuffled()
            backArr = exerciseDatabase!.fetchAllOfType("Back", userParams.equipment, userParams.condition).shuffled()
            coreArr = exerciseDatabase!.fetchAllOfType("Core", userParams.equipment, userParams.condition).shuffled()
            shouldersArr = exerciseDatabase!.fetchAllOfType("Shoulders", userParams.equipment, userParams.condition).shuffled()
            self.padResistanceArrays()  
        }
        
        if (userParams.exerciseType == "Aerobic") || (userParams.exerciseType == "Both") {
            userParams.aerobicChoices.running ? aerobics.append(exerciseDatabase!.aerobicExercises[0]) : ()
            userParams.aerobicChoices.rowing ? aerobics.append(exerciseDatabase!.aerobicExercises[1]) : ()
            userParams.aerobicChoices.cycling ? aerobics.append(exerciseDatabase!.aerobicExercises[2]) : ()
            userParams.aerobicChoices.walking ? aerobics.append(exerciseDatabase!.aerobicExercises[3]) : ()
            userParams.aerobicChoices.skipping ? aerobics.append(exerciseDatabase!.aerobicExercises[4]) : ()
            userParams.aerobicChoices.swimming ? aerobics.append(exerciseDatabase!.aerobicExercises[5]) : ()
            self.padAerobicArray()
        }
        
        for (index, type) in weekPattern.enumerated() {
            if type == "Aerobic" {
                generateAerobicWorkout(index) 
            }
            else if type == "Resistance" {
                generateResistanceWorkout(index)
            }
            else {
                continue
            }
        }
    }
    
    func generateAerobicWorkout(_ index: Int) {
        aerobics = aerobics.shuffled()
        let workout = AerobicWorkout()
        workout.exercise = aerobics.removeFirst()
        program[index] = workout 
    }
    
    func generateResistanceWorkout(_ index: Int) {
        let workout: ResistanceWorkout = ResistanceWorkout()
        var template: [String] = []
        
        if userParams.exerciseType == "Body" {
            template = ResistanceWorkout.bodyTemplate
        }
        else {
            template = ResistanceWorkout.generalTemplate
        }
     
        for group in template {
            workout.exercises.append(fetchResistanceExercise(group)); 
        }
        
        program[index] = workout
        
    }
    
    func fetchResistanceExercise(_ group: String) -> ResistanceExercise {
        var exercise: ResistanceExercise?
        
        switch group {
        case "Legs":
            if legsArr.isEmpty {
                break
            }
            exercise = legsArr.removeFirst()
            break
        case "Arms":
            if armsArr.isEmpty {
                break
            }
            exercise = armsArr.removeFirst()
            break
        case "Core":
            if coreArr.isEmpty {
                break
            }
            exercise = coreArr.removeFirst()
            break
        case "Chest":
            if chestArr.isEmpty {
                break
            }
            exercise = chestArr.removeFirst()
            break
        case "Back":
            if backArr.isEmpty {
                break
            }
            exercise = backArr.removeFirst()
            break
        case "Shoulders":
            if shouldersArr.isEmpty {
                break
            }
            exercise = shouldersArr.removeFirst()
            break
        default:
            print("error")
        }
        return exercise!
    }
    
    func padAerobicArray() {
        aerobics += aerobics + aerobics    
    }
    
    func padResistanceArrays() {
        legsArr += legsArr + legsArr
        armsArr += armsArr + armsArr
        chestArr += chestArr + chestArr
        backArr += backArr + backArr
        coreArr += coreArr + coreArr
        shouldersArr += shouldersArr + shouldersArr
        
    }
    
    func generateProgram() {
        clearProgram()
        arrangeWeek()
        populateProgram()
    }
    
    func clearProgram() {
        program = [nil, nil, nil, nil, nil, nil, nil]
        aerobics = [] 
    }
}
