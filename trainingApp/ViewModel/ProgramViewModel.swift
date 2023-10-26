import Foundation
import FirebaseFirestore

class ProgramViewModel: ObservableObject {
    @Published var id = ""
    @Published var title = ""
    @Published var date = Date()
    @Published var description = ""
    @Published var name = ""
    @Published var muscleGroups = ""
    @Published var weight = ""
    @Published var reps = 0
    @Published var sets = 0
  
    func createProgram() {
        if !title.isEmpty {
            let muscleGroupsArray = muscleGroups.components(separatedBy: ",")

            // Create a new UsersExercises instance
            let newExercise = UsersExercises(name: name, muscleGroups: muscleGroupsArray, weight: weight, reps: reps, sets: sets, totalReps: reps * sets)

            let newProgram = UsersPrograms(title: title, date: date, description: description, exercises: [newExercise])

            let firebaseDb = Firestore.firestore()

            do {
                // Save the new program to Firestore
                let programsCollectionRef = firebaseDb.collection("users_training_programs")
                try programsCollectionRef.addDocument(from: newProgram) { error in
                    if let error = error {
                        print("Error adding document: \(error.localizedDescription)")
                    } else {
                        print("Document added successfully.")
                    }
                }
            } catch let error {
                print("Error encoding program: \(error.localizedDescription)")
            }
        }
    }

    
    func getPrograms(completion: @escaping ([UsersPrograms]) -> Void) {
        let firebaseDb = Firestore.firestore()

        firebaseDb.collection("users_training_programs").getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error getting training programs: \(error.localizedDescription)")
                completion([])
            } else {
                var programs: [UsersPrograms] = []

                for document in querySnapshot?.documents ?? [] {
                    do {
                        // Use guard to safely unwrap the result
                        guard let program = try? document.data(as: UsersPrograms.self) else {
                            continue
                        }
                        programs.append(program)
                    }
                }
                completion(programs)
            }
        }
    }
}
