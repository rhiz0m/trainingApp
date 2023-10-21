//
//  usersPrograms.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-15.
//

import Foundation
import FirebaseFirestoreSwift


class UsersPrograms: Identifiable, Codable {
    @DocumentID var id: String?
    var title: String
    var exercises = [UsersExercises]()

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case exercises
    }

    init(id: String? = nil, title: String, exercises: [UsersExercises]) {
        self.id = id
        self.title = title
        self.exercises = exercises
    }
}


