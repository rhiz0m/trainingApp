//
//  UpdateScreen.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-07.
//

import SwiftUI

struct UpdateExerciseView: View {
    @ObservedObject var viewModel: ProgramViewModel
 
    var body: some View {
        VStack {
            
 
          
            TextField("Name: \(viewModel.name)",
                      text: $viewModel.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Muscle groups: ", text: $viewModel.muscleGroups)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Weight: \(String(viewModel.weight))",
                      text: $viewModel.weight)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Stepper("Reps: \(viewModel.reps)", value: $viewModel.reps)
                .padding()
            
            Stepper("Sets: \(viewModel.sets)", value: $viewModel.sets)
                .padding()
            
            Button(action: {
            }, label: {
                Text("save")
            })

            
            Button(action: {
            }, label: {
                Text("Delete")
            })
        }
        .navigationTitle(viewModel.name)
    }
}

struct UpdateExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateExerciseView(viewModel: ProgramViewModel())
    }
}


