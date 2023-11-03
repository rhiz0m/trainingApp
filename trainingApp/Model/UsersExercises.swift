
import Foundation
import FirebaseFirestoreSwift


struct UsersExercises: Identifiable, Codable {
    var id = UUID()
    var category = "users_exercises"
    var name: String
    var muscleGroups: [String] = []
    var weight: String
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


