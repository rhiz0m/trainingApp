//
//  CreateExerciseView.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-23.
//

import SwiftUI

struct CreateExerciseView: View {
    @ObservedObject var db: DbViewModel
    @Environment(\.dismiss) private var dismiss
    
    @State var exerciseName = ""
    @State var date = ""
    @State var type = ""
    @State var muscleGroups = ""
    @State var weight = ""
    @State var reps = 0
    @State var sets = 0
    
    @State var selectedExercise: UsersExcercise?
    
    
    var body: some View {
        VStack {
            ExerciseFormView(db: db, exerciseName: $exerciseName, date: $date, type: $type, muscleGroups: $muscleGroups)
            
            TrainingRecordFormView(db: db, weight: $weight, reps: $reps, sets: $sets)
            
            HStack {
                PrimaryBtn(title: "Save", onPress: {
                    
                    let weightValue = Double(weight) ?? 0.0
                    
                    if !exerciseName.isEmpty {
                        let newTrainingRecord = UsersTrainingRecord(
                            weight: weight,
                            reps: reps,
                            sets: sets,
                            totalReps: reps * sets,
                            totalWeight: reps * sets * Int(weightValue))
                        
                        let exerciseId = selectedExercise?.id ?? UUID()
                        
                        let newExercise = UsersExcercise(
                            id: UUID(),
                            category: "users_programs",
                            exerciseName: exerciseName,
                            date: Date(),
                            type: type,
                            muscleGroups: [muscleGroups],
                            trainingRecordIds: [exerciseId],
                            usersTrainingRecords: [newTrainingRecord])
                        
                        db.addProgramToDb(userExercise: newExercise)
                        
                        dismiss()
                    }
                })
                
                PrimaryBtn(title: "Cancel", onPress: {
                    dismiss()
                })
            }
            .padding(.vertical, GridPoints.x1)
            .padding(.horizontal, GridPoints.x4)
            
        }
        .navigationTitle(db.name)
    }
}

struct CreateExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        let db = DbViewModel()
        let selectedExercise = Binding<UsersExcercise?>(
            get: { nil },
            set: { _ in }
        )
        
        return CreateExerciseView(
            db: db,
            exerciseName: "Squats",
            date: "2023",
            type: "strength",
            muscleGroups: "Legs",
            weight: "100",
            reps: 10,
            sets: 3
        )
    }
}
