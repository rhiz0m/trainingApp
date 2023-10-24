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
    @Published var selectedProgram: UsersPrograms?
    
    private var currentProgramId: String = ""

    func createTrainingProgramWithExercise() {
        if !title.isEmpty {
            let muscleGroupsArray = muscleGroups.components(separatedBy: ",")

            // Create a new UsersExercises instance
            let newExercise = UsersExercises(name: name, muscleGroups: muscleGroupsArray, weight: weight, reps: reps, sets: sets, totalReps: reps * sets)

            // Generate a unique identifier for the program
            let programId = UUID().uuidString

            // Create a new UsersPrograms instance using the generated Id and title
            let newProgram = UsersPrograms(id: programId, title: title, date: date, description: description, exercises: [newExercise])

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
        
    func createTrainingProgram() {
        if !title.isEmpty {
            let muscleGroupsArray = muscleGroups.components(separatedBy: ",")

            // Create a new UsersExercises instance
            let newExercise = UsersExercises(name: name, muscleGroups: muscleGroupsArray, weight: weight, reps: reps, sets: sets, totalReps: reps * sets)

            // Generate a unique identifier for the program
            let programId = UUID().uuidString

            // Create a new UsersPrograms instance using the generated Id and title
            let newProgram = UsersPrograms(id: programId, title: title, date: date, description: description, exercises: [newExercise])

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

        // Now, create a new program with the updated data
        let updatedProgram = UsersPrograms(id: programId, title: updatedTitle, date: date, description: description, exercises: updatedExercises)

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
    
  /*  func createExercise() {
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
    } */
    
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

                print("Exercise saved to users_exercises collection.")

                // Associate the exercise with the selected program
                if let selectedProgram = selectedProgram {
                    // Add the new exercise to the program's array
                    selectedProgram.exercises.append(newExercise)

                    print("Exercise added to program's array.")

                    // Save the updated program to Firestore
                    let programsDocumentRef = firebaseDb.collection("users_training_programs").document(selectedProgram.id ?? "")
                    try programsDocumentRef.setData(from: selectedProgram)

                    print("Updated program saved to users_training_programs collection.")

                    // Update the local array to reflect changes in Firestore
                    if let index = usersPrograms.firstIndex(where: { $0.id == selectedProgram.id }) {
                        usersPrograms[index] = selectedProgram
                    }

                    print("Local array updated.")
                }

            } catch let error {
                print("Error creating exercise: \(error.localizedDescription)")
            }
        }
    }







    
    func getTrainingExercises(completion: @escaping ([UsersExercises]) -> Void) {
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
    }
    
    func deleteExercise(withId id: UUID) {
        let firebaseDb = Firestore.firestore()

        do {
            // Convert UUID to String before creating a document reference
            let idString = id.uuidString
            // Delete the exercise from Firestore
            let exerciseDocumentRef = firebaseDb.collection("users_exercises").document(idString)
            try exerciseDocumentRef.delete()

            // Delete the exercise from the local array
            if let index = usersExercises.firstIndex(where: { $0.id == id }) {
                usersExercises.remove(at: index)
            }
        } catch let error {
            print("Error deleting exercise: \(error.localizedDescription)")
        }
    }

    func updateExerciseProgram(withId id: UUID, updatedName: String, updatedMuscleGroups: [String], updatedWeight: String, updatedReps: Int, updatedSets: Int) {
        let firebaseDb = Firestore.firestore()

        // First, delete the existing exercise
        deleteExercise(withId: id)

        // Now, create a new exercise with the updated data
        let updatedExercise = UsersExercises(id: id, name: updatedName, muscleGroups: updatedMuscleGroups, weight: updatedWeight, reps: updatedReps, sets: updatedSets, totalReps: updatedReps * updatedSets)

        do {
            // Save the updated exercise to Firestore
            let exerciseDocumentRef = firebaseDb.collection("users_exercises").document(id.uuidString)
            try exerciseDocumentRef.setData(from: updatedExercise)

            // Update the local array
            if let index = usersExercises.firstIndex(where: { $0.id == id }) {
                usersExercises[index] = updatedExercise
            }
        } catch let error {
            print("Error updating exercise: \(error.localizedDescription)")
        }
    }


    
}


    











