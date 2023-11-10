// ProgramListView.swift


import SwiftUI

struct ProgramListView: View {
    @ObservedObject var db: DbConnection    
    @StateObject private var viewModel = ExerciseViewModel()

    var body: some View {
        VStack {
            Text("Your Exercises").font(.title).bold()
            
            if let userData = db.currentUserData {
                if userData.usersExercises.isEmpty {
                    Text("No programs yet")
                } else {
                    NavigationLink(
                       destination: UpdateProgramView(
                            db: db,
                            viewModel: viewModel
                        ), label: {
                                
                                List(userData.usersExercises) { exercise in
                                    VStack(alignment: .leading) {
                                        Text(exercise.exerciseName).bold()
                                        Text("\(formatDate(exercise.date))")
                                        Text(exercise.type)
                                        Text("\(exercise.muscleGroups.joined(separator: " "))")
                                    }
                                    ForEach(exercise.usersTrainingRecords) { trainingRecord in
                                        VStack(alignment: .leading) {
                                            Text("Weight: \(trainingRecord.weight)")
                                            Text("Sets: " + String(trainingRecord.sets))
                                            Text("Reps: " + String(trainingRecord.reps))
                                            Text("Total Reps: " + String(trainingRecord.totalReps))
                                            Text("Total Weight: " + String(trainingRecord.totalWeight))
                                        }
                                    }
                                    
                                    Button(action: {
                                        db.deleteProgram(exercise: exercise)
                                    }, label: {
                                        Text("delete")
                                    })
                                }
                            }
                    )}
            }
        }
    }
}

private func formatDate(_ date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .short
    dateFormatter.timeStyle = .short
    return dateFormatter.string(from: date)
}


struct ProgramListView_Previews: PreviewProvider {
    static var previews: some View {
        ProgramListView(db: DbConnection())
    }
}
