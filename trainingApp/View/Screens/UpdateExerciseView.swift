//
//  UpdateScreen.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-07.
//

import SwiftUI

struct UpdateExerciseView: View {
    @ObservedObject var viewModel: ProgramViewModel
 
    
    @State private var reps: Int
    @State private var sets: Int
    
    public init(viewModel: ProgramViewModel, reps: Int, sets: Int) {
        self.viewModel = viewModel
        self._reps = State(initialValue: reps)
        self._sets = State(initialValue: sets)
    }

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
                viewModel.updateTrainingProgram(programId: viewModel.id,
                                                    updatedTitle: viewModel.title,
                                                    updatedExercises: [UsersExercises(
                                                        name: viewModel.name,
                                                        muscleGroups: viewModel.muscleGroups.components(separatedBy: ","),
                                                        weight: viewModel.weight,
                                                        reps: viewModel.reps,
                                                        sets: viewModel.sets,
                                                        totalReps: viewModel.reps * sets
                                                    )]
                                                )

            }, label: {
                Text("save")
            })

            
            Button(action: {
                if let firstProgramId = viewModel.usersPrograms.first?.id {
                    viewModel.deleteTrainingProgram(withId: firstProgramId)
                }
            }, label: {
                Text("Delete")
            })
        }
        .navigationTitle(viewModel.name)
    }
}

struct UpdateExerciseView_Previews: PreviewProvider {
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
                    weight: "80",
                    reps: 10,
                    sets: 3,
                    totalReps: 30
                )
            ]
        )

        return UpdateExerciseView(viewModel: viewModel, reps: 10, sets: 3)
            .environmentObject(viewModel) // Assuming ProgramViewModel is an ObservableObject
    }
}


