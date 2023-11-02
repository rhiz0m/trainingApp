//
//  usersPrograms.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-15.
//

import Foundation
import FirebaseFirestoreSwift


struct UsersPrograms: Identifiable, Codable {
    var id = UUID()
    var title: String
    var date: Date
    var description: String
    var exercises: [UsersExercises]

    enum CodingKeys: String, CodingKey {
        case title
        case date
        case description
        case exercises
    }
}




