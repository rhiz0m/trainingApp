//
//  ExerciseViewModel.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-11-10.
//

import Foundation

class ExerciseViewModel: ObservableObject {
    @Published var selectedExerciseID: UUID?
    @Published var selectedExercise: UsersExcercise?
    @Published var exerciseName: String = ""
    @Published var date: String = ""
    @Published var type: String = ""
    @Published var muscleGroups: String = ""
    @Published var weight: String = ""
    @Published var reps: Int = 0
    @Published var sets: Int = 0
    @Published var exercises: [UsersExcercise] = []
    
}
