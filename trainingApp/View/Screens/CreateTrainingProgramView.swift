//
//  CreateTrainingView.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-22.
//

import SwiftUI

struct CreateTrainingProgramView: View {

        @ObservedObject private var viewModel = ProgramViewModel()

        var body: some View {
            FormCell(viewModel: viewModel)
        }
    
    
    struct FormCell: View {
        @ObservedObject var viewModel: ProgramViewModel
        @Environment(\.presentationMode) var presentationMode
        
        
        var body: some View {
            
            VStack {
                Text("My programs!").padding()
                
                TextField("Program title: ", text: $viewModel.title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("Date: ", text: $viewModel.id)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("Description: ", text: $viewModel.description)
                 .textFieldStyle(RoundedBorderTextFieldStyle())
                 .padding()
                
                Button(action: {
                    viewModel.createTrainingProgramWithExercise()
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Save")
                }
                
            }
        }
    }
}
    struct CreateTrainingProgramView_Previews: PreviewProvider {
        static var previews: some View {
            CreateTrainingProgramView()
        }
    }

