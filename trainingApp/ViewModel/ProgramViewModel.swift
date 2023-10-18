import Foundation
import FirebaseFirestore

class ProgramViewModel: ObservableObject {
    @Published var Id = ""
    @Published var name = ""
    @Published var muscleGroups = ""
    @Published var weight = ""
    @Published var reps = 0
    @Published var sets = 0

    func createTrainingProgram() {
        
        if !name.isEmpty {
            
            let muscleGroupsArray = muscleGroups.components(separatedBy: ",")
            let weight = Int(weight) ?? 0
            
            let firebaseDb = Firestore.firestore()
            
            let newExercise = UsersExercise(name: name, muscleGroups: muscleGroupsArray, weight: weight, reps: reps, sets: sets, totalReps: reps * sets)
            
            do {
                let programDocumentRef = firebaseDb.collection("training_programs").document(Id).collection("exercises")
                
                try programDocumentRef.addDocument(from: newExercise)
                
                } catch let error {
                print(error.localizedDescription)
            }
        }
    }
    
    func readTrainingProgram(completion: @escaping ([UsersExercise]) -> Void) {
           let firebaseDb = Firestore.firestore()

           firebaseDb.collection("training_programs").document(Id).collection("exercises").getDocuments { (querySnapshot, error) in
               if let error = error {
                   print("Error getting documents: \(error.localizedDescription)")
                   completion([])
               } else {
                   let exercises = querySnapshot?.documents.compactMap { document in
                       try? document.data(as: UsersExercise.self)
                   } ?? []

                   completion(exercises)
               }
           }
       }

       func deleteTrainingProgram(completion: @escaping (Error?) -> Void) {
           let firebaseDb = Firestore.firestore()

           let programDocumentRef = firebaseDb.collection("training_programs").document(Id)

           programDocumentRef.delete { error in
               completion(error)
           }
       }

}
