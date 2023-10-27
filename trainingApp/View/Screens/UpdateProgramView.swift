//
//  UpdateTrainingView.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-22.
//

// UpdateTrainingView.swift
// trainingApp
//
// Created by Andreas Antonsson on 2023-10-22.


import SwiftUI

// UpdateProgramView.swift

import SwiftUI

struct UpdateProgramView: View {
    
    @ObservedObject var viewModel: ProgramViewModel
    @Binding var selectedTitle: String?
    
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

                Button(action: {
                    if let firstProgramId = viewModel.usersPrograms.first?.id {
                        viewModel.id = firstProgramId
                        viewModel.deleteProgram {
                            print("Deleted successfully!")
                        }
                    } else {
                        print("Error: No programs to delete.")
                    }
                }) {
                    Text("Delete u_p")
                }

                PrimaryBtn(title: "Update") {
                    // Validate that the title is not empty
                    guard let selectedTitle = selectedTitle else {
                        print("Error: No program selected.")
                        return
                    }
                    print("Selected Program Title:", selectedTitle)

                    guard let firstProgram = viewModel.usersPrograms.first else {
                        print("Error: No programs to update.")
                        return
                    }

                    // Set viewModel.id with the ID of the first program
                    viewModel.id = firstProgram.id ?? ""

                    let updatedExercises = [UsersExercises(
                        name: viewModel.name,
                        muscleGroups: viewModel.muscleGroups.components(separatedBy: ","),
                        weight: viewModel.weight,
                        reps: viewModel.reps,
                        sets: viewModel.sets,
                        totalReps: viewModel.reps * viewModel.sets
                    )]

                    // Call the updateProgram function
                    viewModel.updateProgram(programId: viewModel.id, updatedTitle: selectedTitle, updatedExercises: updatedExercises)
                }
            }
            .padding(.vertical, GridPoints.x1)
            .padding(.horizontal, GridPoints.x4)
            
            ExerciseListView()
        }
        .onAppear {
            // Initialize
            viewModel.title = selectedTitle ?? ""
            viewModel.description = viewModel.description
        }
    }
}

struct UpdateProgramView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateProgramView(viewModel: ProgramViewModel(), selectedTitle: .constant("Example Title"))
    }
}



