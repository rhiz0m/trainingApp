import Foundation
//import FirebaseFirestore
import Firebase

class DbViewModel: ObservableObject {
    @Published var id = ""
    @Published var title = ""
    @Published var date = Date()
    @Published var dateString: String = ""
    @Published var description = ""
    @Published var name = ""
    @Published var muscleGroups = ""
    @Published var weight = ""
    @Published var reps = 0
    @Published var sets = 0
    @Published var usersPrograms: [UsersPrograms] = []
    @Published var usersExercises: [UsersExercises] = []
    
    @Published var currentUser: User?
    
    var fireBaseDB = Firestore.firestore()
    var firebaseAuth = Auth.auth()
    
    
    init() {
        firebaseAuth.addStateDidChangeListener { auth, user in
            if let user = user {
                // A user is logged in
                print("A user have been logged in \(user.email ?? "No Email")")
                
                self.currentUser = user
                
            } else {
                self.currentUser = nil
                print("A user have logged out")
            }
            
        }
        updateDateString()
    }
    
    func updateDateString() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        dateString = dateFormatter.string(from: date)
    }
    
    func clearFeilds() {
        id = ""
        title = ""
        date = Date()
        dateString = ""
        description = ""
        name = ""
        muscleGroups = ""
        weight = ""
        reps = 0
        sets = 0
        usersPrograms = []
        usersExercises = []
    }
    
    func createProgram(completion: @escaping (String?) -> Void) {
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
                        completion(nil)
                    } else {
                        // Document added successfully, extract the ID and set it to viewModel.id
                        let documentId = programsCollectionRef.document().documentID
                        self.id = documentId
                        
                        print("Document added successfully with ID: \(documentId)")
                        completion(documentId)
                    }
                }
            } catch let error {
                print("Error encoding program: \(error.localizedDescription)")
                completion(nil)
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
    
    func deleteProgram(completion: @escaping () -> Void) {
        print("Program ID before delete: \(self.id)")
        guard !self.id.isEmpty else {
            print("Error: Program ID is nil or empty.")
            completion()
            return
        }
        
        let firebaseDb = Firestore.firestore()
        
        do {
            // Delete the program from Firestore
            let programDocumentRef = firebaseDb.collection("users_training_programs").document(self.id)
            try programDocumentRef.delete()
            
            // Delete the program from the local array
            if let index = usersPrograms.firstIndex(where: { $0.id == self.id }) {
                usersPrograms.remove(at: index)
                print("Program deleted with ID: \(self.id)")
            } else {
                print("Error: Program not found in the local array.")
            }
            
            completion()
        } catch let error {
            print("Error deleting program: \(error.localizedDescription)")
            completion()
        }
    }
    
    func updateProgram(programId: String, updatedTitle: String, updatedExercises: [UsersExercises]) {
        guard let index = usersPrograms.firstIndex(where: { $0.id == programId }) else {
            print("Error: Program not found in the local array.")
            return
        }
        let firebaseDb = Firestore.firestore()
        
        var updatedProgram = usersPrograms[index]
        updatedProgram.title = updatedTitle
        updatedProgram.exercises = updatedExercises
        
        do {
            // Save the updated program to Firestore with merge option
            let programsDocumentRef = firebaseDb.collection("users_training_programs").document(programId)
            try programsDocumentRef.setData(from: updatedProgram, merge: true)
            
            // Update the local array
            usersPrograms[index] = updatedProgram
            print("Local array updated successfully.")
            print("Updated Title:", updatedTitle)
        } catch let error {
            print("Error updating training program: \(error.localizedDescription)")
        }
    }
    
    func registerUser(email: String, password: String, completion: @escaping (Bool) -> Void) {
        firebaseAuth.createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print(error.localizedDescription)
                completion(false)
            } else if authResult != nil {
                print("Account successfully created!")
                completion(true)
            } else {
                completion(false)
            }
        }
    }


    func loginUser(email: String, password: String) -> Bool {
        var success = false
        
        firebaseAuth.signIn(withEmail: email, password: password) { AuthDataResult, error in
            if let error = error {
                print("error logging in")
                success = false
            }
            
            if let _ = AuthDataResult {
                print("You are logged in!")
                success = true
            }
        }
        return success
    }
}
