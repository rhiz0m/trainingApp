//
//  ExerciseListView.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-23.
//

import SwiftUI

struct ExerciseListView: View {
    @ObservedObject var viewModel = ProgramViewModel()
    @State private var selectedExercise: UsersExercises?
    
    var body: some View {
        NavigationView {
            List(viewModel.updatedExercises, id: \.id) { exercise in
                Button(action: {
                    // Set the selected exercise when the button is tapped
                    selectedExercise = exercise
                }) {
                    Text(exercise.name)
                }
            }
            .navigationTitle("Exercises")
            .onAppear {
                // Fetch the stored exercises from Firebase
                viewModel.getTrainingExercises { exercises in
                    viewModel.updatedExercises = exercises
                }
            }
            .sheet(item: $selectedExercise) { exercise in
                // Present the modal with the selected exercise
                UpdateExerciseView(viewModel: viewModel, reps: viewModel.reps, sets: viewModel.sets)
            }
        }
    }
}



struct ExerciseListView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseListView()
    }
}
