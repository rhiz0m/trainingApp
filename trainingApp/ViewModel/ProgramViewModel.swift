import Foundation
import FirebaseFirestore

class ProgramViewModel: ObservableObject {
    @Published var usersExercice: [UsersPrograms] = [] 
    @Published var Id = ""
    @Published var name = ""
    @Published var date = Date()
    @Published var muscleGroups = ""
    @Published var weight = ""
    @Published var reps = 0
    @Published var sets = 0

    func createTrainingProgram() {
        
        if !name.isEmpty {
            
            let muscleGroupsArray = muscleGroups.components(separatedBy: ",")
            let weight = Int(weight) ?? 0
            
            let firebaseDb = Firestore.firestore()
            
            let newExercise = UsersExercise(name: name, date: date, muscleGroups: muscleGroupsArray, weight: weight, reps: reps, sets: sets, totalReps: reps * sets)
            
            do {
                let programDocumentRef = firebaseDb.collection("training_programs").document(Id).collection("exercises")
                
                try programDocumentRef.addDocument(from: newExercise)
                
                } catch let error {
                print(error.localizedDescription)
            }
        }
    }
    
  
    func getDataFromFirestore(completion: @escaping ([UsersPrograms]) -> Void) {
        guard !Id.isEmpty else {
            print("Error: Document path cannot be empty.")
            completion([])
            return
        }

        let firebaseDb = Firestore.firestore()

        let programDocumentRef = firebaseDb.collection("training_programs").document(Id).collection("exercises")

        programDocumentRef.getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error.localizedDescription)")
                completion([])
            } else {
                print("Number of documents: \(querySnapshot?.documents.count ?? 0)")

                var programs: [UsersPrograms] = []

                for document in querySnapshot!.documents {
                    do {
                        print("Document data: \(document.data())")

                        let name = document["name"] as? String ?? "Unknown"
                        let muscleGroups = document["muscleGroups"] as? [String] ?? []
                        let sets = document["sets"] as? Int ?? 0
                        let reps = document["reps"] as? Int ?? 0
                        let totalReps = document["totalReps"] as? Int ?? 0

                        print("Decoded values - Name: \(name), Muscle Groups: \(muscleGroups), Sets: \(sets), Reps: \(reps), Total Reps: \(totalReps)")

                        let exercise = UsersExercise(
                            name: name,
                            date: Date(),  // You might want to fetch this from Firestore if it's stored
                            muscleGroups: muscleGroups,
                            weight: 0,  // You might want to add weight if it's stored
                            reps: reps,
                            sets: sets,
                            totalReps: totalReps
                        )

                        var program = UsersPrograms(title: "Unknown", exercises: [exercise])
                        program.title = document.documentID
                        programs.append(program)
                    } catch let error {
                        print("Error decoding document: \(error.localizedDescription)")
                    }
                }

                print("Number of programs: \(programs.count)")
                completion(programs)
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
