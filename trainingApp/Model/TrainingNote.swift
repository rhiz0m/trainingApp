//
//  trainingNotes.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-12.
//

import Foundation


struct TrainingNote {
    var exercise: String
    var date: Date
    var exerciseInfo: String
    
    init(exercise: String, date: Date, exerciseInfo: String) {
        self.exercise = exercise
        self.date = date
        self.exerciseInfo = exerciseInfo
    }
}
