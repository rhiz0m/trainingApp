//
//  ExerciceAPI.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-11-09.
//

import Foundation

struct ExerciseAPI: Codable, Identifiable {
    var id: UUID?
    let name: String
    let type: String
    let muscle: String
    let equipment: String
    let difficulty: String
    let instructions: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, type, muscle, equipment, difficulty, instructions
    }
    
   /* init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        // If "id" is present in the JSON, decode it; otherwise, set it to a default UUID
        id = try? container.decode(UUID.self, forKey: .id) ?? UUID()
        name = try container.decode(String.self, forKey: .name)
        type = try container.decode(String.self, forKey: .type)
        muscle = try container.decode(String.self, forKey: .muscle)
        equipment = try container.decode(String.self, forKey: .equipment)
        difficulty = try container.decode(String.self, forKey: .difficulty)
        instructions = try container.decode(String.self, forKey: .instructions)
    } */
}

