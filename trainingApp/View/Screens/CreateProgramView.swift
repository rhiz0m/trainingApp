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
    @State var dateString = ""
    
    @State var name = ""
    @State var muscleGroups = ""
    @State var weight = ""
    @State var reps = 0
    @State var sets = 0
    
    @State var selectedProgram: UsersPrograms?
    @State var selectedExercice: UsersExercises?
    
    
    var body: some View {
        
        VStack {
            ProgramFormView(db: db,  title: $title, description: $description, dateString: $dateString, selectedProgram: $selectedProgram)
            ExerciseFormView(db: db, name: $name, muscleGroups: $muscleGroups, weight: $weight, reps: $reps, sets: $sets, selectedExercice: $selectedExercice)
            
            HStack {
                NavigationLink(
                    destination: CreateExerciseView(db: db, name: $name, muscleGroups: $muscleGroups, weight: $weight, reps: $reps, sets: $sets, selectedExercice: $selectedExercice),
                    label: {
                        SharedBtnStyle(title: "Add Exercise")
                    }
                )
                
                
                PrimaryBtn(title: "Add", onPress: {
                    
                    if !title.isEmpty {
                        
                        let newExercise = UsersExercises(name: name, muscleGroups: [muscleGroups], weight: weight, reps: reps, sets: sets,  totalReps: reps * sets)
                        let newProgram = UsersPrograms(title: title, date: Date(), description: description, exercises: [newExercise])
                        
                        db.addProgramToDb(userProgram: newProgram)
                       // db.addExercisesToDb(userExercises: newExercise)

                        dismiss()
                    }
                })
            }
            .padding(.vertical, GridPoints.x1)
            .padding(.horizontal, GridPoints.x4)
            
            ExerciseListView()
            
        }.onAppear { db.clearFeilds() }
    }
}
struct CreateProgramView_Previews: PreviewProvider {
    static var previews: some View {
        CreateProgramView(db: DbConnection())
    }
}

