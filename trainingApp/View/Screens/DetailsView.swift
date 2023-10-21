//
//  DetailsScreen.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-07.
//

import SwiftUI

struct DetailsView: View {
        @StateObject private var viewModel = ProgramViewModel()

        
        var body: some View {
            FormCell(viewModel: viewModel)
        }
    
    
    struct FormCell: View {
        @ObservedObject var viewModel: ProgramViewModel
        
        
        var body: some View {
            
            VStack {
                Text("My Exercises!").padding()
                
                TextField("Program name: ", text: $viewModel.title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("Exercise name: ", text: $viewModel.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("Muscle groups: ", text: $viewModel.muscleGroups)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("Weight: ", text: $viewModel.weight)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Stepper("Reps: \(viewModel.reps)", value: $viewModel.reps)
                    .padding()
                
                Stepper("Sets: \(viewModel.sets)", value: $viewModel.sets)
                    .padding()
                
                Button(action: {
                    viewModel.createTrainingProgram()
                }) {
                    Text("Save")
                }
            }
        }
    }
    
}
    struct DetailsView_Previews: PreviewProvider {
        static var previews: some View {
            DetailsView()
        }
    }

