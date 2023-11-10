import SwiftUI

struct UpdateProgramView: View {
    @ObservedObject var db: DbConnection
    
    @Environment(\.dismiss) private var dismiss
    
    @Binding var exerciseName: String
    @Binding var date: String
    @Binding var type: String
    @Binding var muscleGroups: String

    @Binding var weight: String
    @Binding var reps: Int
    @Binding var sets: Int
    
    @Binding var selectedProgram: UsersExcercise?
    @Binding var selectedExercice: UsersTrainingRecord?
    
    var body: some View {
        VStack {
            ExerciseFormView(db: db, 
                             exerciceName: $exerciseName,
                             date: $date,
                             type: $type,
                             muscleGroups: $muscleGroups)
            
            TrainingRecordFormView(db: db,
                                   weight: $weight,
                                   reps: $reps,
                                   sets: $sets)
            
            HStack {
                
                PrimaryBtn(title: "update") {
                    if let program = selectedProgram {
                        db.updateProgram(exercise: program)
                    }
                }

            }
            .padding(.vertical, GridPoints.x1)
            .padding(.horizontal, GridPoints.x4)
            
            
        }
        .onAppear {
            // Set the title based on the selected program

        }
        
    }
}

struct UpdateProgramView_Previews: PreviewProvider {
        static var previews: some View {
            let db = DbConnection()
            let selectedExercice = Binding<UsersTrainingRecord?>(
                get: { nil },
                set: { _ in }
            )
            
            let selectedProgram = Binding<UsersExcercise?>(
                get: { nil },
                set: { _ in }
            )
            
            return CreateExerciseView(
                db: db
            )
        }
    }


