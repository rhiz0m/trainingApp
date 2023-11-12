//
//  CreateTrainingView.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-22.
//

import SwiftUI

struct CreateProgramView: View {
    
    @ObservedObject var db: DbConnection
    
    @Environment(\.dismiss) private var dismiss
    
    @State var exerciseName = ""
    @State var date = ""
    @State var type = ""
    @State var muscleGroups = ""
    
    @State var weight = ""
    @State var reps = 0
    @State var sets = 0
    
    @State var selectedProgram: UsersExcercise?
    @State var selectedExercise: UsersTrainingRecord? 
    
    var body: some View {
        
        VStack {
            ExerciseFormView(
                db: db,
                exerciseName: $exerciseName,
                date: $date,
                type: $type,
                muscleGroups: $muscleGroups)
            
            TrainingRecordFormView(
                db: db,
                weight: $weight,
                reps: $reps,
                sets: $sets)
            
            HStack {
                NavigationLink(
                    destination: CreateExerciseView(db: db, exerciseName: exerciseName, date: date, type: type, muscleGroups: muscleGroups, weight: weight, reps: reps, sets: sets, selectedExercise: selectedProgram),
                    label: {
                        PrimaryBtnStyle(title: "Add Exercise",
                                       icon: "plus.circle.fill")
                    }
                )
                
                PrimaryBtn(title: "save", onPress: {
                    
                    if !exerciseName.isEmpty {
                        
                        let weightValue = Double(weight) ?? 0.0
                        
                        let usersTrainingRecord = UsersTrainingRecord(weight: weight, reps: reps, sets: sets, totalReps: reps * sets, totalWeight: reps * sets * Int(weightValue))
                        
                        let trainingRecordsId = selectedExercise?.id ?? UUID()
                        
                        let newExercise = UsersExcercise(
                            id: UUID(),
                            category: "users_exercise",
                            exerciseName: exerciseName,
                            date: Date(),
                            type: type,
                            muscleGroups: [muscleGroups],
                            trainingRecordIds: [trainingRecordsId],
                            usersTrainingRecords: [usersTrainingRecord]
                        )
                        
                        db.addProgramToDb(userExercise: newExercise)
                        
                        dismiss()
                    }
                })
            }
            .padding(.vertical, GridPoints.x1)
            .padding(.horizontal, GridPoints.x4)
            
        }.onAppear { db.clearFeilds() }
    }
}
struct CreateProgramView_Previews: PreviewProvider {
    static var previews: some View {
        CreateProgramView(db: DbConnection())
    }
}

