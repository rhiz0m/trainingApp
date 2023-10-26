//
//  UpdateTrainingView.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-22.
//

import SwiftUI

struct UpdateProgramView: View {
    
    @ObservedObject var viewModel: ProgramViewModel
    
    var body: some View {
        VStack {
            TextField("Title: \(viewModel.title)", text: $viewModel.title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.vertical, GridPoints.x1)
                .padding(.horizontal, GridPoints.x4)
            
            TextField("Date: \(viewModel.date)", text: $viewModel.id)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.vertical, GridPoints.x1)
                .padding(.horizontal, GridPoints.x4)
            
            TextField("Description: \(viewModel.description)", text: $viewModel.description)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.vertical, GridPoints.x1)
                .padding(.horizontal, GridPoints.x4)
            
            Stepper("Reps: \(viewModel.reps)", value: $viewModel.reps)
                .padding(.vertical, GridPoints.x1)
                .padding(.horizontal, GridPoints.x4)
            
            Stepper("Sets: \(viewModel.sets)", value: $viewModel.sets)
                .padding(.vertical, GridPoints.x1)
                .padding(.horizontal, GridPoints.x4)
            
            NavigationLink(destination: CreateExerciseView(viewModel: viewModel), label: {
                SharedBtnStyle(title: "Add Exercise")
            }).padding()
            
            ExerciseListView()
            
            Button(action: {

            }, label: {
                Text("Update")
            })
            
            Button(action: {
                
            }, label: {
                Text("Delete")
            })
        }
        .navigationTitle(viewModel.title)
    }
}

struct UpdateTrainingView_Previews: PreviewProvider {
    static var previews: some View {
 let viewModel = ProgramViewModel()
 return CreateExerciseView(viewModel: viewModel)
    }
}

