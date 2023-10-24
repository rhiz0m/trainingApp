//
//  UpdateScreen.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-07.
//

import SwiftUI

struct UpdateExerciseView: View {
    @ObservedObject var viewModel: ProgramViewModel


    var exercise: UsersExercises
    
    @State private var reps: Int
    @State private var sets: Int
    
    init(viewModel: ProgramViewModel, exercise: UsersExercises) {
        self.viewModel = viewModel
        self.exercise = exercise
        _reps = State(initialValue: exercise.reps)
        _sets = State(initialValue: exercise.sets)
    }

    var body: some View {
        VStack {
            
         /*   TextField("Title: \(program.title)",
                      text: $viewModel.title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding() */
          
            TextField("Name: \(exercise.name)",
                      text: $viewModel.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Muscle groups: \(exercise.muscleGroups.joined(separator: ", "))",
                      text: $viewModel.muscleGroups)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Weight: \(String(exercise.weight))",
                      text: $viewModel.weight)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Stepper("Reps: \(viewModel.reps)", value: $viewModel.reps)
                .padding()
            
            Stepper("Sets: \(viewModel.sets)", value: $viewModel.sets)
                .padding()
            
            Button(action: {
                viewModel.updateExerciseProgram(
                    withId: UUID(), // Replace UUID() with the actual UUID you want to update
                    updatedName: viewModel.name,
                    updatedMuscleGroups: viewModel.muscleGroups.components(separatedBy: ","),
                    updatedWeight: viewModel.weight,
                    updatedReps: viewModel.reps,
                    updatedSets: viewModel.sets
                )
            }, label: {
                Text("Update")
            })

            
            Button(action: {
                if let firstProgramId = viewModel.usersPrograms.first?.id {
                    viewModel.deleteTrainingProgram(withId: firstProgramId)
                }
            }, label: {
                Text("Delete")
            })
        }
        .navigationTitle(exercise.name)
    }
}
/*
struct UpdateView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = ProgramViewModel()
        
        let placeholderProgram = UsersPrograms(
            id: "1",
            title: "Sample Program",
            date: Date(),
            description: "A description",
            exercises: [
                UsersExercises(
                    name: "Exercise 1",
                    muscleGroups: ["Legs"],
                    reps: 10,
                    sets: 3,
                    totalReps: 30
                )
            ]
        )

        return UpdateTrainingProgramView(viewModel: viewModel, program: placeholderProgram)
    }
}
*/
