//
//  trainingNotes.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-12.
//

import Foundation
import FirebaseFirestoreSwift


struct UsersExercises: Identifiable, Codable {
    @DocumentID var id: String?
    var category = "users_exercises"
    var name: String
    var muscleGroups: [String] = []
    var weight: String
    var reps: Int
    var sets: Int
    var totalReps: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
        enum CodingKeys: String, CodingKey {
            case name
            case muscleGroups = "muscle_groups"
            case weight
            case reps
            case sets
            case totalReps = "total_reps"
        }
    }


