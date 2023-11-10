//
//  ExerciseFormView.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-26.
//

import SwiftUI

struct TrainingRecordFormView: View {
    
    @ObservedObject var db: DbConnection
    
    @Binding var weight: String
    @Binding var reps: Int
    @Binding var sets: Int
    //@Binding var selectedExercice: UsersTrainingRecord?
    
    var body: some View {
        
        TextField("Weight: \(weight)",
                  text: $weight)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding(.vertical, GridPoints.x1)
        .padding(.horizontal, GridPoints.x4)
        
        HStack() {
            Stepper("Reps: \(reps)", value: $reps)
            Stepper("Sets: \(sets)", value: $sets)
        }.padding(.vertical, GridPoints.x1)
            .padding(.horizontal, GridPoints.x4)
        
    }
}

struct ExerciseFormView_Previews: PreviewProvider {
    static var previews: some View {
        let db = DbConnection()
        let selectedExercice = Binding<UsersTrainingRecord?>(
            get: { nil },
            set: { _ in }
        )
        
        return TrainingRecordFormView(
            db: db,
            weight: Binding.constant("100"),
            reps: Binding.constant(5),
            sets: Binding.constant(6)
            //selectedExercice: selectedExercice
        )
    }
}
