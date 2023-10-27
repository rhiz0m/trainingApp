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
            ExerciseFormView(viewModel: viewModel)
            
            HStack {
                NavigationLink(
                    destination: CreateExerciseView(viewModel: viewModel),
                    label: {
                        SharedBtnStyle(title: "Add Exercise")
                    }
                )
                
                Button(action: {
                    if let firstProgramId = viewModel.usersPrograms.first?.id {
                        viewModel.id = firstProgramId
                        viewModel.deleteProgram {
                            print("Deleted succesfully!")
                        }
                    } else {
                        print("Error: No programs to delete.")
                    }
                }) {
                    Text("Delete c_p")
                }

                PrimaryBtn(title: "Update") {
                    viewModel.createProgram { documentId in
                        if let documentId = documentId {
                            // Document added successfully, you can use the documentId
                            print("Created program with ID:", documentId)
                        } else {
                            // Error occurred while adding the document
                            print("Failed to create program.")
                        }
                    }
                }
            }
            .padding(.vertical, GridPoints.x1)
            .padding(.horizontal, GridPoints.x4)
            
            ExerciseListView()
            
        }
    }
}
    struct CreateProgramView_Previews: PreviewProvider {
        static var previews: some View {
            CreateProgramView(viewModel: ProgramViewModel())
        }
    }

