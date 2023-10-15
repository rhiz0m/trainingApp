//
//  AddToDb.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-14.
//

import Foundation
import FirebaseFirestore

func addToDb(program: UsersPrograms, Id: String, exerciseName: String, muscleGroups: [String], weight: Int, reps: Int, sets: Int, totalReps: Int) {
    let firebaseDb = Firestore.firestore()

    let newExercise = UsersExercise(name: exerciseName, muscleGroups: muscleGroups, weight: weight, reps: reps, sets: sets, totalReps: totalReps)
    do {
        // Assuming you have a document ID for your program, replace "your_program_id" with the actual ID
        let programDocumentRef = firebaseDb.collection("training_programs").document(Id).collection("exercises")
        
        try programDocumentRef.addDocument(from: newExercise)
    } catch let error {
        print(error.localizedDescription)
    }
}

