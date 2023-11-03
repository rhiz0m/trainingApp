import Foundation
//import FirebaseFirestore
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
    @Published var usersPrograms: [UsersPrograms] = []
    @Published var usersExercises: [UsersExercises] = []
    
    @Published var currentUser: User?
    @Published var currentUserData: UserData?
    
    
    
    
    var db = Firestore.firestore()
    var auth = Auth.auth()
    let USER_DATA_COLLECTION = "user_data"
    var dbListener: ListenerRegistration?
    
    
    init() {
        auth.addStateDidChangeListener { auth, user in
            if let user = user {
                // A user is logged in
                print("A user has been logged in \(user.email ?? "No Email")")

                self.currentUser = user
                self.startListningToDb()

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
        usersPrograms = []
        usersExercises = []
    }
    
    
    func addProgramToDb(userProgram: UsersPrograms) {
        
        if let currentUser = currentUser {
            do {
                try db.collection(USER_DATA_COLLECTION)
                    .document(currentUser.uid)
                    .updateData(["programs": FieldValue.arrayUnion([Firestore.Encoder().encode(userProgram)])])
            } catch {
                
            }
        }
    }
    
    func addExercisesToDb(userExercises: UsersExercises) {
        if let currentUser = currentUser {
            do {
                try db.collection(USER_DATA_COLLECTION)
                    .document(currentUser.uid)
                    .updateData(["exercises": FieldValue.arrayUnion([Firestore.Encoder().encode(userExercises)])])
            } catch {
                // Handle error
                print(error.localizedDescription)
            }
        }
    }

   
    func startListningToDb() {
        guard let user = currentUser else { return }
        
        dbListener = db.collection(self.USER_DATA_COLLECTION).document(user.uid).addSnapshotListener {
            snapshot, error in
            
            if let error = error {
                print("error occured \(error.localizedDescription)")
                return
            }
            
            guard let documentSnapshot = snapshot else { return }
            
            let result = Result {
                try documentSnapshot.data(as: UserData.self)
            }
            
            switch result {
            case .success(let UserData):
                self.currentUserData = UserData
            case .failure(let error):
                print("\(error.localizedDescription)")
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
                
                let newUserData = UserData(programs: [])
                
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
}
