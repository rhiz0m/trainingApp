//
//  AddToDb.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-14.
//

import Foundation
import FirebaseFirestore

func addToDb(exerciseName: String, weight: Int, reps: Int, sets: Int, totalReps: Int) {
    
    
    let firebaseDb = Firestore.firestore() // access to the firebase database
    
    firebaseDb.collection("exercice").addDocument(data: [
        "name": exerciseName,
        "weight": weight,
        "reps": reps,
        "sets": sets,
        "totalreps": totalReps
        
    ])

}
