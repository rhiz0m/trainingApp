//
//  usersPrograms.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-15.
//

import Foundation
import FirebaseFirestoreSwift


struct UsersPrograms: Codable {
    @DocumentID var id: String?
    var title: String
    var category = "users_programs"
    var exercises: [UsersExercise] = []
    
}

