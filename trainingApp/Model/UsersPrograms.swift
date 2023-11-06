
import Foundation
import FirebaseFirestoreSwift

struct UsersPrograms: Identifiable, Codable {
    var id = UUID()
    var category = "users_programs"
    var exerciseIds: [UUID]
    var title: String
    var date: Date
    var description: String
    var exercises: [UsersExercises]

    enum CodingKeys: String, CodingKey {
        case id // Add this line
        case category
        case exerciseIds = "exercise_ids"
        case title
        case date
        case description
        case exercises
    }
}














