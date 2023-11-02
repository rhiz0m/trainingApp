//
//  UserData.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-11-02.
//

import Foundation
import FirebaseFirestoreSwift

struct UserData: Codable {
    @DocumentID var id: String?
    //var name: String
    var programs: [UsersPrograms]
}
