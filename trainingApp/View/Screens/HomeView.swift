//
//  HomeScreen.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-07.
//

import SwiftUI


struct HomeView: View {
    
    @StateObject private var viewModel = ProgramViewModel()


    var body: some View {
        FormCell(viewModel: viewModel)
    }
}

struct FormCell: View {
    @ObservedObject var viewModel: ProgramViewModel
  
    
    var body: some View {
  
        VStack {
            Text("My Exercises!").padding()

            TextField("Program name: ", text: $viewModel.Id)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Exercise name: ", text: $viewModel.exerciseName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Muscle groups (comma-separated): ", text: $viewModel.muscleGroups)
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
                viewModel.createProgramAndAddToFirestore()
            }) {
                Text("Add to Firebase Database")
            }
        }
    }
}




struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
