//
//  UpdateScreen.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-07.
//

import SwiftUI

struct UpdateExerciseView: View {
    @ObservedObject var db: DbViewModel
    
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
            
            ExerciseFormView(db: db, exerciseName: $exerciseName, date: $date, type: $type, muscleGroups: $muscleGroups)
            
            HStack {
                NavigationLink(
                    destination: CreateExerciseView(db: db, exerciseName: exerciseName, date: date, type: type, muscleGroups: muscleGroups, weight: weight, reps: reps, sets: sets, selectedExercise: selectedProgram),
                    label: {
                        PrimaryBtnStyle(title: "Save",
                                       icon: "plus.circle.fill")
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
        let db = DbViewModel()
        let selectedExercice = Binding<UsersTrainingRecord?>(
            get: { nil },
            set: { _ in }
        )
        
        let selectedProgram = Binding<UsersExcercise?>(
            get: { nil },
            set: { _ in }
        )
            let dateString = Binding.constant("2023-11-02")
                
                return UpdateExerciseView(
                         db: db,
                         exerciseName: Binding.constant("ovning"),
                         date:  Binding.constant("2023"),
                         type: Binding.constant("strenth"),
                         muscleGroups: Binding.constant("core,back,legs"),
                         weight: Binding.constant("100"),
                         reps: Binding.constant(5),
                         sets: Binding.constant(6),
                         selectedProgram: selectedProgram,
                         selectedExercice: selectedExercice
                     )
    }
}


