import Foundation
import FirebaseFirestore

// ProgramViewModel.swift
import FirebaseFirestore
import Combine

class ProgramViewModel: ObservableObject {
    @Published var Id = ""
    @Published var name = ""
    @Published var date = Date()
    @Published var muscleGroups = ""
    @Published var weight = ""
    @Published var reps = 0
    @Published var sets = 0
    @Published var usersPrograms: [UsersExercises] = []
    
    
    func createTrainingProgram() {
        if !name.isEmpty {
            
            let muscleGroupsArray = muscleGroups.components(separatedBy: ",")
            //let weight = Int(weight) ?? 0
            
            let firebaseDb = Firestore.firestore()
            
            let newExercise = UsersExercises(name: name, date: date, muscleGroups: muscleGroupsArray, reps: reps, sets: sets, totalReps: reps * sets)
            
            do {
                let programDocumentRef = firebaseDb.collection("users_training_programs").document(Id).collection("users_exercises")
                
                try programDocumentRef.addDocument(from: newExercise)
                
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
}

