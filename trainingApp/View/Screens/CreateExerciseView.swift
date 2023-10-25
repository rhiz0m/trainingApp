//
//  CreateExerciseView.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-23.
//

import SwiftUI

struct CreateExerciseView: View {
    @ObservedObject var viewModel: ProgramViewModel
    var program: UsersPrograms

    @State private var reps: Int
    @State private var sets: Int

    init(viewModel: ProgramViewModel, program: UsersPrograms) {
        self.viewModel = viewModel
        self.program = program
        _reps = State(initialValue: program.exercises.first?.reps ?? 0)
        _sets = State(initialValue: program.exercises.first?.sets ?? 0)
    }

    var body: some View {
        VStack {
            Text("My Exercises!").padding()

            TextField("Exercise name: ", text: $viewModel.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .onChange(of: viewModel.name) { newValue in
                    print("Name changed: \(newValue)")
                }

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

            // Move the button outside the VStack
        }
        .navigationTitle("Update Exercise")
        .navigationBarItems(
            trailing:
                Button(action: {
                    viewModel.updateTrainingProgram(
                        programId: program.id ?? "",
                        updatedTitle: viewModel.title,
                        updatedExercises: [UsersExercises(
                            name: viewModel.name,
                            muscleGroups: viewModel.muscleGroups.components(separatedBy: ","),
                            weight: viewModel.weight,
                            reps: reps,
                            sets: sets,
                            totalReps: reps * sets
                        )]
                    )
                }, label: {
                    Text("Update Exercise")
                })
        )
    }
}

struct CreateExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = ProgramViewModel()

        let placeholderProgram = UsersPrograms(
            title: "Sample Program",
            date: Date(),
            description: "A description",
            exercises: [
                UsersExercises(
                    name: "Exercise 1",
                    muscleGroups: ["Legs"],
                    weight: "100",
                    reps: 10,
                    sets: 3,
                    totalReps: 30
                )
            ]
        )

        return CreateExerciseView(viewModel: viewModel, program: placeholderProgram)
    }
}
