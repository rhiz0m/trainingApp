//
//  CreateTrainingView.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-22.
//

import SwiftUI

struct CreateTrainingProgramView: View {

    @ObservedObject var viewModel: ProgramViewModel
    

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
                
            /*   Button(action: {
                    viewModel.createTrainingProgramWithExercises(title: viewModel.title, date: viewModel.date, description: viewModel.description,exercises: [UsersExercises(name: viewModel.name, muscleGroups: viewModel.muscleGroups.components(separatedBy: ","), weight: viewModel.weight, reps: viewModel.reps, sets: viewModel.sets, totalReps: viewModel.reps * viewModel.sets)])
                }) {
                    Text("Save Exercise")
                }
                */
            }
        }
    }

    struct CreateTrainingProgramView_Previews: PreviewProvider {
        static var previews: some View {
            CreateTrainingProgramView(viewModel: ProgramViewModel())
        }
    }

