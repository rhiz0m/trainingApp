//
//  ExerciseFormView.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-26.
//

import SwiftUI

struct ExerciseFormView: View {
    
    @ObservedObject var viewModel: DbViewModel
    
    var body: some View {
        TextField("Name: \(viewModel.name)",
                  text: $viewModel.name)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding(.vertical, GridPoints.x1)
        .padding(.horizontal, GridPoints.x4)
        
        TextField("Muscle groups: \(viewModel.muscleGroups)",
                  text: $viewModel.muscleGroups)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding(.vertical, GridPoints.x1)
        .padding(.horizontal, GridPoints.x4)
        
        TextField("Weight: \(viewModel.weight)",
                  text: $viewModel.weight)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding(.vertical, GridPoints.x1)
        .padding(.horizontal, GridPoints.x4)
        
        HStack() {
            Stepper("Reps: \(viewModel.reps)", value: $viewModel.reps)
            Stepper("Sets: \(viewModel.sets)", value: $viewModel.sets)
        }.padding(.vertical, GridPoints.x1)
            .padding(.horizontal, GridPoints.x4)
        
    }
}
#Preview {
    ExerciseFormView(viewModel: DbViewModel())
}
