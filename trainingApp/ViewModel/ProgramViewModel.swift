import Foundation
import FirebaseFirestore

class ProgramViewModel: ObservableObject {
    @Published var Id = ""
    @Published var name = ""
    @Published var muscleGroups = ""
    @Published var weight = ""
    @Published var reps = 0
    @Published var sets = 0

    func createProgramAndAddToFirestore() {
        
        if !name.isEmpty {
            
            let muscleGroupsArray = muscleGroups.components(separatedBy: ",")
            let weight = Int(weight) ?? 0
            
            let firebaseDb = Firestore.firestore()
            
            let newProgram = UsersPrograms(id: Id, title: Id, category: "exercise", exercises: [])
            
            let newExercise = UsersExercise(name: name, muscleGroups: muscleGroupsArray, weight: weight, reps: reps, sets: sets, totalReps: reps * sets)
            
            do {
                let programDocumentRef = firebaseDb.collection("training_programs").document(Id).collection("exercises")
                
                try programDocumentRef.addDocument(from: newExercise)
                
                } catch let error {
                print(error.localizedDescription)
            }
        }
    }
    
    func deleteTrainingProgram() {
        
    }
    
    func updateTrainingProgram() {
        
    }
    
}
