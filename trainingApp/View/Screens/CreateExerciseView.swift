//
//  CreateExerciseView.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-23.
//

import SwiftUI

/* struct CreateExerciseView: View {
    @State private var viewModel = ProgramViewModel()

    var body: some View {
        FormCell(viewModel: viewModel)
    }

    struct FormCell: View {
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

                Button(action: {
                    viewModel.createTrainingProgramWithExercise()
                }) {
                    Text("Save")
                }
            }
        }
    }
} */

struct CreateExerciseView: View {
    @ObservedObject private var viewModel = ProgramViewModel()

    var body: some View {
        FormCell(viewModel: viewModel)
    }

    struct FormCell: View {
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

                Button(action: {
                    viewModel.createExercise()
                }) {
                    Text("Save")
                }
            }
        }
    }
}



struct CreateExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        CreateExerciseView()
    }
}
