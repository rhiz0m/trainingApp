//
//  UpdateTrainingView.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-22.
//

import SwiftUI

struct UpdateTrainingProgramView: View {
    
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
        
            TextField("Title: \(program.title)",
                      text: $viewModel.title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Date: \(program.date)",
                      text: $viewModel.id)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Description: \(program.description)",
                      text: $viewModel.description)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
          /*
            TextField("Name: \(program.exercises.map { String($0.name) }.joined(separator: ", "))",
                      text: $viewModel.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Muscle groups: \(program.exercises.map { $0.muscleGroups.joined(separator: ", ") }.joined(separator: ", "))", 
                      text: $viewModel.muscleGroups)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Weight: \(program.exercises.map { String($0.weight) }.joined(separator: ", "))",
                      text: $viewModel.weight)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Stepper("Reps: \(viewModel.reps)", value: $viewModel.reps)
                .padding()
            
            Stepper("Sets: \(viewModel.sets)", value: $viewModel.sets)
                .padding()
            */
            
            NavigationLink(destination: CreateExerciseView(), label: {
                SharedBtnStyle(title: "Add Exercise")
            }).padding()
            
            ExerciseListView()
            
            Button(action: {
                   viewModel.updateTrainingProgram(
                       programId: program.id ?? "",
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
                Text("Update")
            })
            
            Button(action: {
                viewModel.deleteTrainingProgram(withId: program.id ?? "")
            }, label: {
                Text("Delete")
            })
        }
        .navigationTitle(program.title)
    }
}

struct UpdateTrainingView_Previews: PreviewProvider {
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
                    weight: "100",
                    reps: 10,
                    sets: 3,
                    totalReps: 30
                )
            ]
        )

        return UpdateTrainingProgramView(viewModel: viewModel, program: placeholderProgram)
    }
}
