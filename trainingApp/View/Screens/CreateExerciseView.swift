//
//  CreateExerciseView.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-23.
//

import SwiftUI

struct CreateExerciseView: View {
    @ObservedObject var viewModel: ProgramViewModel

    var body: some View {
        VStack {
            Text("My Exercises!").padding()

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
        }
        .navigationTitle("Update Exercise")
        .navigationBarItems(
            trailing:
                Button(action: {
                }, label: {
                    Text("Update Exercise")
                })
        )
    }
}

struct CreateExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        CreateExerciseView(viewModel: ProgramViewModel())
    }
}
