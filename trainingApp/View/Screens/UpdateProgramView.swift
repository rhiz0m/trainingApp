import SwiftUI

struct UpdateProgramView: View {
    @ObservedObject var db: DbConnection
    @ObservedObject var viewModel: ExerciseViewModel
    @Environment(\.dismiss) private var dismiss
    
    var selectedExerciseID: UUID?
    
    var body: some View {
        
        
        VStack {
            
            Text("Update Exercises").font(.title).bold()
            
            ExerciseFormView(db: db,
                             exerciseName: $viewModel.exerciseName,
                             date: $viewModel.date,
                             type: $viewModel.type,
                             muscleGroups: $viewModel.muscleGroups)
            TrainingRecordFormView(db: db,
                                   weight: $viewModel.weight,
                                   reps: $viewModel.reps,
                                   sets: $viewModel.sets)
            
            HStack {
                
                // Inside the closure for the "update" button press
                PrimaryBtn(title: "update") {
                    print("Button Pressed!")
                    
                    print("Before Update - Exercise Name: \(viewModel.exerciseName)")

                    if let currentUserData = db.currentUserData,
                       let selectedExerciseID = viewModel.selectedExerciseID,
                       let selectedExercise = currentUserData.usersExercises.first(where: { $0.id == selectedExerciseID }) {

                        viewModel.selectedExercise = selectedExercise

                        if let selectedExercise = viewModel.selectedExercise {
                            print("Selected Exercise: \(selectedExercise)")
                            
                            db.updateProgram(usersExercise: [selectedExercise]) { error in
                                if let error = error {
                                    print("Update failed with error: \(error.localizedDescription)")
                                } else {
                                    print("Update successful!")
                                    
                                    // After the update
                                    print("After Update - Exercise Name: \(viewModel.exerciseName)")
                                }
                            }
                        } else {
                            print("Selected Exercise is nil!")
                        }
                    }
                }
                .padding(.vertical, GridPoints.x1)
                .padding(.horizontal, GridPoints.x4)
            }
            .onAppear {
                print("UpdateProgramView appeared")
                print("Selected Exercise ID: \(String(describing: viewModel.selectedExerciseID))")
                
                if let currentUserData = db.currentUserData,
                   let selectedExerciseID = viewModel.selectedExerciseID,
                   let selectedExercise = currentUserData.usersExercises.first(where: { $0.id == selectedExerciseID }) {
                    
                    viewModel.selectedExercise = selectedExercise
                    
                    if let selectedExercise = viewModel.selectedExercise {
                        print("Selected Exercise: \(selectedExercise)")
                        
                        viewModel.exerciseName = selectedExercise.exerciseName
                        viewModel.date = selectedExercise.date.formatted()
                        viewModel.type = selectedExercise.type
                        viewModel.muscleGroups = selectedExercise.muscleGroups.joined(separator: ", ")
                        
                        if let firstTrainingRecord = selectedExercise.usersTrainingRecords.first {
                            viewModel.weight = firstTrainingRecord.weight
                            viewModel.sets = firstTrainingRecord.sets
                            viewModel.reps = firstTrainingRecord.reps
                        }
                    } else {
                        print("Selected Exercise is nil!")
                    }
                }
            }
        }
    }
}

/* struct UpdateProgramView_Previews: PreviewProvider {
    static var previews: some View {
    }
} */



/*   .onAppear {
       if let currentUserData = db.currentUserData {
           viewModel.exercises = currentUserData.usersExercises

           // Assuming you want to display details for the first exercise initially
           if let firstExercise = viewModel.exercises.first {
               viewModel.exerciseName = firstExercise.exerciseName
               viewModel.date = firstExercise.date.formatted()
               viewModel.type = firstExercise.type
               viewModel.muscleGroups = firstExercise.muscleGroups.joined(separator: ", ")

               // Assuming you want details of the first training record of the first exercise
               if let firstTrainingRecord = firstExercise.usersTrainingRecords.first {
                   viewModel.weight = firstTrainingRecord.weight
                   viewModel.sets = firstTrainingRecord.sets
                   viewModel.reps = firstTrainingRecord.reps
               }

               // Print details for the current exercise
               print("Exercise Name: \(viewModel.exerciseName)")
           }
       }
   } */
