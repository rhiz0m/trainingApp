//
//  DetailsScreen.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-07.
//

import SwiftUI

struct DetailsView: View {
    
        @StateObject private var viewModel = DbConnection()

        var body: some View {
            FormCell(viewModel: viewModel)
        }
    
    
    struct FormCell: View {
        @ObservedObject var viewModel: DbConnection
        
        
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
                
             /*   PrimaryBtn(title: "Save") {
                    viewModel.createProgram { documentId in
                        if let documentId = documentId {
                            // Document added successfully, you can use the documentId
                            print("Created program with ID:", documentId)
                        } else {
                            // Error occurred while adding the document
                            print("Failed to create program.")
                        }
                    }
                } */
            }
        }
    }
}
    struct DetailsView_Previews: PreviewProvider {
        static var previews: some View {
            DetailsView()
        }
    }

