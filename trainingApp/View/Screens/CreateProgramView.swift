//
//  CreateTrainingView.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-22.
//

import SwiftUI

struct CreateProgramView: View {
    
    @ObservedObject var viewModel: ProgramViewModel
    
    var body: some View {
        
        VStack {
            ProgramFormView(viewModel: viewModel)
            
            HStack {
                NavigationLink(
                    destination: CreateExerciseView(viewModel: viewModel),
                    label: {
                        SharedBtnStyle(title: "Add Exercise")
                    }
                )
                
                PrimaryBtn(title: "Update", onPress: {})
            }
            .padding(.vertical, GridPoints.x1)
            .padding(.horizontal, GridPoints.x4)
            
            ExerciseListView()
            
        }
    }
}
    struct CreateTrainingProgramView_Previews: PreviewProvider {
        static var previews: some View {
            CreateProgramView(viewModel: ProgramViewModel())
        }
    }

