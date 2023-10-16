import Foundation
import FirebaseFirestore

class ProgramViewModel: ObservableObject {
    @Published var Id = ""
    @Published var exerciseName = ""
    @Published var muscleGroups = ""
    @Published var weight = ""
    @Published var reps = 0
    @Published var sets = 0

    func createProgramAndAddToFirestore() {
        
        if !exerciseName.isEmpty {
            
            let muscleGroupsArray = muscleGroups.components(separatedBy: ",")
            let weightValue = Int(weight) ?? 0
            
            let firebaseDb = Firestore.firestore()
            
            let newProgram = UsersPrograms(id: Id, title: Id, category: "exercise", exercises: [])
            
            let newExercise = UsersExercise(name: exerciseName, muscleGroups: muscleGroupsArray, weight: weightValue, reps: reps, sets: sets, totalReps: reps * sets)
            
            do {
                let programDocumentRef = firebaseDb.collection("training_programs").document(Id).collection("exercises")
                
                try programDocumentRef.addDocument(from: newExercise)
                
                } catch let error {
                print(error.localizedDescription)
            }
        }
    }
}
