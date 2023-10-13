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
  var reps: Int
  var sets: Int
  var totalReps: Int

  // Init method with parameters
  init(name: String, muscleGroups: [String], reps: Int, sets: Int) {
    // self takes the value of the properties
    self.name = name
    self.muscleGroups = muscleGroups
    self.reps = reps
    self.sets = sets
    self.totalReps = reps * sets
  }
}
