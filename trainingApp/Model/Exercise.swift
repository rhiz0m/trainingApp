//
//  trainingNotes.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-12.
//

import Foundation


struct Exercise {
  var name: String
  var muscleGroups: [String]
  var weight: Int
  var reps: Int
  var sets: Int


  // Init method with parameters
    init(name: String, muscleGroups: [String], weight: Int, reps: Int, sets: Int, totalReps: Int) {
    // self takes the value of the properties
    self.name = name
    self.muscleGroups = muscleGroups
    self.weight = weight
    self.reps = reps
    self.sets = sets

  }
}
