import SwiftUI

struct UpdateProgramView: View {
    @ObservedObject var db: DbConnection
    @ObservedObject var viewModel: ExerciseViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            
            Text("Update Exercises").font(.title).bold()
            
            ExerciseFormView(db: db,
                             exerciseName: $viewModel.exerciseName,
                             date: $viewModel.date,
                             type: $viewModel.type,
                             muscleGroups: $viewModel.muscleGroups)
            .onAppear {
                print("UpdateProgramView - ExerciseFormView - exerciseName: \(viewModel.exerciseName)")
            }
            
            TrainingRecordFormView(db: db,
                                   weight: $viewModel.weight,
                                   reps: $viewModel.reps,
                                   sets: $viewModel.sets)
            
            HStack {
                PrimaryBtn(title: "update") {
                    db.updateProgram(exercises: viewModel.exercises)
                }
            }
            .padding(.vertical, GridPoints.x1)
            .padding(.horizontal, GridPoints.x4)
            
            
        }.onAppear {
            if let currentUserData = db.currentUserData {
                viewModel.exercises = currentUserData.usersExercises

                if let firstExercise = currentUserData.usersExercises.first {
                    viewModel.exerciseName = firstExercise.exerciseName
                    viewModel.date = firstExercise.date.formatted()
                    viewModel.type = firstExercise.type
                    viewModel.muscleGroups = firstExercise.muscleGroups.joined(separator: ", ")

                    if let firstTrainingRecord = firstExercise.usersTrainingRecords.first {
                        viewModel.weight = firstTrainingRecord.weight
                        viewModel.sets = firstTrainingRecord.sets
                        viewModel.reps = firstTrainingRecord.reps
                    }
                }

                print("Exercises loaded: \(viewModel.exercises)")
            }
        }
    }
}


/* struct UpdateProgramView_Previews: PreviewProvider {
    static var previews: some View {
    }
} */



