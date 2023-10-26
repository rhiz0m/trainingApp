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
            ExerciseFormView(viewModel: ProgramViewModel())
            
            HStack {
                NavigationLink(
                    destination: CreateExerciseView(viewModel: viewModel),
                    label: {
                        SharedBtnStyle(title: "Save")
                    }
                )
                Text("test").padding()
                
                PrimaryBtn(title: "Cancel", onPress: {})
            }
            .padding(.vertical, GridPoints.x1)
            .padding(.horizontal, GridPoints.x4)
            
            Button(action: {
            }, label: {
                Text("Delete")
            })
        }
        .navigationTitle(viewModel.name)
    }
}

struct CreateExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        CreateExerciseView(viewModel: ProgramViewModel())
    }
}
