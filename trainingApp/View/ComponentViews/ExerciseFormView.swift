import SwiftUI

struct ExerciseFormView: View {
    
    @ObservedObject var db: DbConnection
    
    @Binding var exerciceName: String
    @Binding var date: String
    @Binding var type: String
    @Binding var muscleGroups: String
    
    var selectedProgram: UsersExcercise?
    
    var body: some View {
        TextField("Name", text: $exerciceName)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.vertical, GridPoints.x1)
            .padding(.horizontal, GridPoints.x4)
        
        TextField("Date",
                  text: $date)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding(.vertical, GridPoints.x1)
        .padding(.horizontal, GridPoints.x4)
        
        TextField("Type", text: $type)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.vertical, GridPoints.x1)
            .padding(.horizontal, GridPoints.x4)
        
        TextField("Muscle Groups: \(muscleGroups)",
                  text: $muscleGroups)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding(.vertical, GridPoints.x1)
        .padding(.horizontal, GridPoints.x4)
    }
}

struct ProgramFormView_Previews: PreviewProvider {
    static var previews: some View {
        let db = DbConnection()
        let selectedProgram = UsersExcercise(id: UUID(), 
                                             exerciseName: "Test",
                                             date: Date(),
                                             type: "strength",
                                             trainingRecordIds: [],
                                             usersTrainingRecords: [])
        
        let date = Binding.constant("2023-11-02")
        
        return ExerciseFormView(db: db,
                                exerciceName: .constant("my exercise"),
                                date: date,
                                type: Binding.constant("strength"),
                                muscleGroups:
                                    Binding.constant("core,back,legs"),
                                selectedProgram: selectedProgram)
    }
}
