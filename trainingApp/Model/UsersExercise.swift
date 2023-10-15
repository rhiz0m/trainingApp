//
//  trainingNotes.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-12.
//

import Foundation
import FirebaseFirestoreSwift
import Firebase 


struct UsersExercise: Codable{
  var category = "exercice"
  var name: String
  var muscleGroups: [String]?
  var weight: Int
  var reps: Int
  var sets: Int
  var totalReps: Int
    
    enum CodingKeys: String, CodingKey {
        case name
        case muscleGroups = "muscle_groups"
        case weight
        case reps
        case sets
        case totalReps = "total_reps"
    }

}

