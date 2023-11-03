//
//  UpdateScreen.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-07.
//

import SwiftUI

struct UpdateExerciseView: View {
    @ObservedObject var db: DbConnection
    
    @Binding var name: String
    @Binding var muscleGroups: String
    @Binding var weight: String
    @Binding var reps: Int
    @Binding var sets: Int
    @Binding var selectedExercice: UsersExercises?
 
    var body: some View {
        VStack {
            
            ExerciseFormView(db: db, name: $name, muscleGroups: $muscleGroups, weight: $weight, reps: $reps, sets: $sets, selectedExercice: $selectedExercice)
            
            HStack {
                NavigationLink(
                    destination: CreateExerciseView(db: db, name: $name, muscleGroups: $muscleGroups, weight: $weight, reps: $reps, sets: $sets, selectedExercice: $selectedExercice),
                    label: {
                        SharedBtnStyle(title: "Save")
                    }
                )
                Text("test").padding()
                
                PrimaryBtn(title: "Cancel", onPress: {})
            }
            .padding(.vertical, GridPoints.x1)
            .padding(.horizontal, GridPoints.x4)
            
            Button(action: {
            }, label: {
                Text("Delete")
            })
        }
        .navigationTitle(db.name)
    }
}

struct UpdateExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        let db = DbConnection()
        let selectedExercice = Binding<UsersExercises?>(
            get: { nil },
            set: { _ in }
        )
            let dateString = Binding.constant("2023-11-02")
                
                return UpdateExerciseView(
                         db: db,
                         name: Binding.constant("ovning"),
                         muscleGroups: Binding.constant("core,back,legs"),
                         weight: Binding.constant("100"),
                         reps: Binding.constant(5),
                         sets: Binding.constant(6),
                         selectedExercice: selectedExercice
                     )
    }
}


