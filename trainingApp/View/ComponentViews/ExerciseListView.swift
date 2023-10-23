//
//  ExerciseListView.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-23.
//

import SwiftUI

struct ExerciseListView: View {
    
    @ObservedObject var viewModel = ProgramViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.usersPrograms, id: \.id) { program in
                NavigationLink(destination: UpdateExerciseView(viewModel: viewModel, program: program)) {
                    Text(program.title)
                    
                }
            }
            .navigationTitle("Exercises")
            .onAppear {
                viewModel.getTrainingPrograms { programs in
                    viewModel.usersPrograms = programs
                }
            }
        }
    }
}


struct ExerciseListView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseListView()
    }
}
