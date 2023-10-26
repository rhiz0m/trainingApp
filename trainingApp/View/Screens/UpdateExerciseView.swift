//
//  UpdateScreen.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-07.
//

import SwiftUI

struct UpdateExerciseView: View {
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

struct UpdateExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateExerciseView(viewModel: ProgramViewModel())
    }
}


