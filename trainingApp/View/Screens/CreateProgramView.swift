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
    
    @State var title = ""
    @State var description = ""
    @State var date = ""
    
    @State var name = ""
    @State var muscleGroups = ""
    @State var weight = ""
    @State var reps = 0
    @State var sets = 0
    
    @State var selectedProgram: UsersPrograms?
    @State var selectedExercise: UsersExercises? 
    
    var body: some View {
        
        VStack {
            ProgramFormView(db: db, title: $title, date: $date)
            ExerciseFormView(db: db, name: $name, muscleGroups: $muscleGroups, weight: $weight, reps: $reps, sets: $sets, selectedExercice: $selectedExercise)
            
            HStack {
                NavigationLink(
                    destination: CreateExerciseView(db: db, name: $name, muscleGroups: $muscleGroups, weight: $weight, reps: $reps, sets: $sets, selectedProgram: $selectedProgram, selectedExercice: $selectedExercise),
                    label: {
                        SharedBtnStyle(title: "Add Exercise")
                    }
                )
                
                PrimaryBtn(title: "save", onPress: {
                    
                    if !title.isEmpty {
                        
                        let newExercise = UsersExercises(name: name, muscleGroups: [muscleGroups], weight: weight, reps: reps, sets: sets, totalReps: reps * sets)
                        
                        let exerciseId = selectedExercise?.id ?? UUID()
                        
                        let newProgram = UsersPrograms(
                            id: UUID(),
                            category: "users_programs",
                            exerciseIds: [exerciseId],
                            title: title,
                            date: Date(),
                            description: description,
                            exercises: [newExercise]
                        )
                        
                        db.addProgramToDb(userProgram: newProgram)
                        
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

