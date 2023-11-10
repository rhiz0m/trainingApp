import Foundation
import Firebase

class DbConnection: ObservableObject {
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
    @Published var usersExercises: [UsersExcercise] = []
    @Published var usersTrainingRecord: [UsersTrainingRecord] = []
    
    @Published var currentUser: User?
    @Published var currentUserData: UserData?
    
    
    
    
    var db = Firestore.firestore()
    var auth = Auth.auth()
    let USER_DATA_COLLECTION = "user_data"
    let USER_EXERCISES = "usersExercises"
    var dbListener: ListenerRegistration?
    
    
    init() {
        auth.addStateDidChangeListener { auth, user in
            if let user = user {
                // A user is logged in
                print("A user has been logged in \(user.email ?? "No Email")")

                self.currentUser = user
                self.startListeningToDb()

            } else {
                // A user has logged out. Clear all data
                self.dbListener?.remove()
                self.dbListener = nil
                self.currentUserData = nil
                self.currentUser = nil

                print("A user has logged out")
            }
            
        }
        //updateDateString()
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
        usersExercises = []
        usersExercises = []
    }
    
    
   
    func startListeningToDb() {
        guard let user = currentUser else { return }
        
        
        let documentPath = "\(USER_DATA_COLLECTION)/\(user.uid)"
        print("Listening to Firestore document: \(documentPath)")
        
        dbListener = db.collection(self.USER_DATA_COLLECTION).document(user.uid).addSnapshotListener { snapshot, error in

            if let error = error {
                print("Error occurred: \(error.localizedDescription)")
                return
            }
            
            guard let documentSnapshot = snapshot else { return }
            
            let result = Result {
                try documentSnapshot.data(as: UserData.self)
            }
            
            switch result {
            case .success(let userData):
                self.currentUserData = userData
                
                // Update local data
                self.usersExercises = userData.usersExercises
            case .failure(let error):
                print("Error decoding data: \(error.localizedDescription)")
            }
        }
    }

    
    func addProgramToDb(userExercise: UsersExcercise) {
        if let currentUser = currentUser {
            do {
                // Update Firestore with arrayUnion to add the new exercise
                try db.collection(USER_DATA_COLLECTION)
                    .document(currentUser.uid)
                    .updateData([
                        USER_EXERCISES: FieldValue.arrayUnion([try Firestore.Encoder().encode(userExercise)])
                    ])
            } catch {
                // Handle error
                print("Error updating Firestore: \(error.localizedDescription)")
            }
        }
    }

    func deleteProgram(exercise: UsersExcercise) {
        if let currentUser = currentUser {
            do {
         
                var currentPrograms = currentUserData?.usersExercises ?? []

                // Remove the program from the local array
                currentPrograms.removeAll { $0.id == exercise.id }

                // Update Firestore with the modified array
                try db.collection(USER_DATA_COLLECTION)
                    .document(currentUser.uid)
                    .updateData([
                        USER_EXERCISES: try currentPrograms.map { try Firestore.Encoder().encode($0) }
                    ])
            } catch {
                // Handle error
                print("Error updating Firestore: \(error.localizedDescription)")
            }
        }
    }
    
    func updateProgram(exercises: [UsersExcercise]) {
        if let currentUser = currentUser {
            do {
                var updateData: [String: Any] = [:]

                for exercise in exercises {
                    // Convert each exercise to a dictionary using Firestore encoder
                    let exerciseData = try Firestore.Encoder().encode(exercise)

                    // Add the exercise data to the update dictionary
                    updateData["programs.\(exercise.id.uuidString)"] = exerciseData
                }

                // Update Firestore with the modified program data
                try db.collection(USER_DATA_COLLECTION)
                    .document(currentUser.uid)
                    .updateData(updateData)
            } catch {
                // Handle error
                print("Error updating Firestore: \(error.localizedDescription)")
            }
        }
    }


    
    func registerUser(email: String, password: String, completion: @escaping (Bool) -> Void) {
        
        var success = false
    
        auth.createUser(withEmail: email, password: password) { authResult, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(false)
                
            }
            
            if let authResult = authResult {
                print("Account successfully created!")
                
                // create a user in database
                
                let newUserData = UserData(usersExercises: [])
                
                // create a doc in database
                
                do {
                    try self.db.collection(self.USER_DATA_COLLECTION).document(authResult.user.uid).setData(from: newUserData)
                } catch {
                    print(error.localizedDescription)
                }
                
                completion(true)
            } else {
                completion(false)
            }
        }
    }

    func loginUser(email: String, password: String) -> Bool {
        var success = false
        
        auth.signIn(withEmail: email, password: password) { AuthDataResult, error in
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
    
    func logout() {
        do {
            try Auth.auth().signOut()
            print("User logged out")
        } catch let error as NSError {
            print("Error logout: \(error.localizedDescription)")
        }
    }
}
