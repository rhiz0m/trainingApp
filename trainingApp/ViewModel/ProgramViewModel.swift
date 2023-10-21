import Foundation
import FirebaseFirestore

class ProgramViewModel: ObservableObject {
    @Published var Id = ""
    @Published var title = ""
    @Published var name = ""
    @Published var date = Date()
    @Published var muscleGroups = ""
    @Published var weight = ""
    @Published var reps = 0
    @Published var sets = 0
    @Published var usersPrograms: [UsersPrograms] = []

    func createTrainingProgram() {
        if !name.isEmpty {
            let muscleGroupsArray = muscleGroups.components(separatedBy: ",")

            // Create a new UsersExercises instance
            let newExercise = UsersExercises(name: name, date: date, muscleGroups: muscleGroupsArray, reps: reps, sets: sets, totalReps: reps * sets)

            // Generate a unique identifier for the program
            let programId = UUID().uuidString

            // Create a new UsersPrograms instance using the generated Id and title
            let newProgram = UsersPrograms(id: programId, title: title, exercises: [newExercise])

            let firebaseDb = Firestore.firestore()

            do {
                // Save the new program to Firestore
                let programsDocumentRef = firebaseDb.collection("users_training_programs").document(programId)
                try programsDocumentRef.setData(from: newProgram)

                // Update the local array
                usersPrograms.append(newProgram)

            } catch let error {
                print(error.localizedDescription)
            }
        }
    }

    func getAllTrainingPrograms(completion: @escaping ([UsersPrograms]) -> Void) {
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











