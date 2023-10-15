//
//  p.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-15.
//

import Foundation

class ProgramViewModel: ObservableObject {
    @Published var programName = ""
    @Published var exerciseName = ""
    @Published var muscleGroups = ""
    @Published var weight = ""
    @Published var reps = 0
    @Published var sets = 0

    func addExerciseToDatabase() {
        if !exerciseName.isEmpty {
            let muscleGroupsArray = muscleGroups.components(separatedBy: ",")
            let weightValue = Int(weight) ?? 0
            
            // Assuming programName is the unique ID for the program
            let program = UsersPrograms(id: programName, title: programName, category: "exercise", exercises: [])

            addToDb(program: program, Id: programName, exerciseName: exerciseName, muscleGroups: muscleGroupsArray, weight: weightValue, reps: reps, sets: sets, totalReps: reps * sets)
        }
    }
}

