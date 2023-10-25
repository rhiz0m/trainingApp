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
    @Published var usersPrograms: [UsersPrograms] = []
    @Published var usersExercises: [UsersExercises] = []
    @Published var updatedExercises: [UsersExercises] = []
 


    func createTrainingProgramWithExercises(title: String, date: Date, description: String, exercises: [UsersExercises]) {
        guard !title.isEmpty else {
            return
        }

        // Create a new UsersPrograms instance using the generated title, date, description, and exercises
        let newProgram = UsersPrograms(title: title, date: date, description: description, exercises: exercises)

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
        print("Title: \(title)")
        print("Date: \(date)")
        print("Description: \(description)")
        print("Exercises: \(exercises)")
    }


        
    func createTrainingProgram() {
        if !title.isEmpty {
            let muscleGroupsArray = muscleGroups.components(separatedBy: ",")

            // Create a new UsersExercises instance
            let newExercise = UsersExercises(name: name, muscleGroups: muscleGroupsArray, weight: weight, reps: reps, sets: sets, totalReps: reps * sets)

            // Create a new UsersPrograms instance without providing the ID
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

    
    func getTrainingPrograms(completion: @escaping ([UsersPrograms]) -> Void) {
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
    
    func deleteTrainingProgram(withId id: String) {
            let firebaseDb = Firestore.firestore()

            do {
                // Delete the program from Firestore
                let programDocumentRef = firebaseDb.collection("users_training_programs").document(id)
                try programDocumentRef.delete()

                // Delete the program from the local array
                if let index = usersPrograms.firstIndex(where: { $0.id == id }) {
                    usersPrograms.remove(at: index)
                }
            } catch let error {
                print("Error deleting training program: \(error.localizedDescription)")
            }
        }
    
    func updateTrainingProgram(programId: String, updatedTitle: String, updatedExercises: [UsersExercises]) {
        let firebaseDb = Firestore.firestore()

        // First, delete the existing program
        deleteTrainingProgram(withId: programId)
        
        // Store the updated exercises
        self.updatedExercises = updatedExercises

        // Now, create a new program with the updated data
        let updatedProgram = UsersPrograms(title: updatedTitle, date: date, description: description, exercises: updatedExercises)

        do {
            // Save the updated program to Firestore
            let programsDocumentRef = firebaseDb.collection("users_training_programs").document(programId)
            try programsDocumentRef.setData(from: updatedProgram)

            // Update the local array
            if let index = usersPrograms.firstIndex(where: { $0.id == programId }) {
                usersPrograms[index] = updatedProgram
            }
        } catch let error {
            print("Error updating training program: \(error.localizedDescription)")
        }
    }
    
    
   /* func updateTrainingProgram(programId: String, updatedTitle: String, updatedExercises: [UsersExercises]) {
        let firebaseDb = Firestore.firestore()

        // First, delete the existing program
        deleteTrainingProgram(withId: programId)

        // Now, create a new program with the updated data
        let updatedProgram = UsersPrograms(id: programId, title: updatedTitle, date: date, description: description, exercises: updatedExercises)

        do {
            // Save the updated program to Firestore
            let programsDocumentRef = firebaseDb.collection("users_training_programs").document(programId)
            try programsDocumentRef.setData(from: updatedProgram)

            // Update the local array
            usersPrograms.append(updatedProgram)
        } catch let error {
            print("Error updating training program: \(error.localizedDescription)")
        }
    }*/
    
    // Exercises
    
   func createExercise() {
        if !name.isEmpty {
            let muscleGroupsArray = muscleGroups.components(separatedBy: ",")

            // Create a new UsersExercises instance
            let newExercise = UsersExercises(name: name, muscleGroups: muscleGroupsArray, weight: weight, reps: reps, sets: sets, totalReps: reps * sets)

            let firebaseDb = Firestore.firestore()

            do {
                // Save the new exercise to Firestore
                let exerciseDocumentRef = firebaseDb.collection("users_exercises").document()
                try exerciseDocumentRef.setData(from: newExercise)

                // Update the local array
                usersExercises.append(newExercise)

            } catch let error {
                print("Error creating exercise: \(error.localizedDescription)")
            }
        }
    }
    
    
  /*  func getTrainingExercises(completion: @escaping ([UsersExercises]) -> Void) {
        let firebaseDb = Firestore.firestore()

        firebaseDb.collection("users_exercises").getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error getting training exercises: \(error.localizedDescription)")
                completion([])
            } else {
                var exercises: [UsersExercises] = []

                for document in querySnapshot?.documents ?? [] {
                    do {
                        // Use guard to safely unwrap the result
                        guard let exercise = try? document.data(as: UsersExercises.self) else {
                            continue
                        }
                        exercises.append(exercise)
                    }
                }

                completion(exercises)
            }
        }
    } */
    
    func getTrainingExercises(completion: @escaping ([UsersExercises]) -> Void) {
        let firebaseDb = Firestore.firestore()

        firebaseDb.collection("users_training_programs").getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error getting exercises: \(error.localizedDescription)")
                completion([])
            } else {
                var exercises: [UsersExercises] = []

                for document in querySnapshot?.documents ?? [] {
                    guard let exerciseArray = document["exercises"] as? [[String: Any]] else {
                        continue
                    }

                    for exerciseData in exerciseArray {
                        do {
                            if let exercise = try? Firestore.Decoder().decode(UsersExercises.self, from: exerciseData) {
                                exercises.append(exercise)
                            }
                        }
                    }
                }

                completion(exercises)
            }
        }
    }
    
}


    











