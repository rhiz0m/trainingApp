//
//  CreateExerciseView.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-23.
//

import SwiftUI

struct CreateExerciseView: View {
    
    @ObservedObject var db: DbConnection
    
    @Environment(\.dismiss) private var dismiss
    
    @Binding var name: String
    @Binding var muscleGroups: String
    @Binding var weight: String
    @Binding var reps: Int
    @Binding var sets: Int
    
    @Binding var selectedProgram: UsersPrograms?
    @Binding var selectedExercice: UsersExercises?
    
    var body: some View {
        VStack {
            ExerciseFormView(db: db, name: $name, muscleGroups: $muscleGroups, weight: $weight, reps: $reps, sets: $sets, selectedExercice: $selectedExercice)
            
            HStack {
                PrimaryBtn(title: "Add exercice", onPress: {
                    if !name.isEmpty, var currentProgram = selectedProgram {
                        let newExercise = UsersExercises(name: name, muscleGroups: [muscleGroups], weight: weight, reps: reps, sets: sets, totalReps: reps * sets)
                        
                        currentProgram.exercises.append(newExercise)
                        
                        db.addProgramToDb(userProgram: currentProgram)
                        
                        dismiss()
                    }
                })

                Text("test").padding()
                
                PrimaryBtn(title: "Cancel", onPress: {})
            }
            .padding(.vertical, GridPoints.x1)
            .padding(.horizontal, GridPoints.x4)
            
            Button(action: {
                // Handle delete action if needed
            }, label: {
                Text("Delete")
            })
        }
        .navigationTitle(db.name)
    }
}

struct CreateExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        let db = DbConnection()
        let selectedExercice = Binding<UsersExercises?>(
            get: { nil },
            set: { _ in }
        )
        
        let selectedProgram = Binding<UsersPrograms?>(
            get: { nil },
            set: { _ in }
        )
        
        return CreateExerciseView(
            db: db,
            name: Binding.constant("Squats"),  // Adjust the exercise name
            muscleGroups: Binding.constant("Legs"),
            weight: Binding.constant("100"),
            reps: Binding.constant(10),
            sets: Binding.constant(3),
            selectedProgram: selectedProgram,
            selectedExercice: selectedExercice
        )
    }
}

