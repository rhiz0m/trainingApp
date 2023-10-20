//
//  ListView.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-19.
//

import Foundation
import SwiftUI

struct ProgramListView: View {
    
    @ObservedObject var programViewModel: ProgramViewModel
    
    var body: some View {
        VStack {
            Text("My List View").bold()
            
            if programViewModel.usersExercice.isEmpty {
                Text("No exercises to display")
                    .onAppear {
                        // Fetch data from Firebase when the view appears
                        programViewModel.getDataFromFirestore { programs in
                            programViewModel.usersExercice = programs
                        }
                    }
            } else {
                List(programViewModel.usersExercice) { program in
                    VStack(alignment: .leading) {
                        Text("Program Title: \(program.title)")
                        
                        ForEach(program.exercises, id: \.id) { exercise in
                            VStack(alignment: .leading) {
                                Text("Exercise Name: \(exercise.name)")
                                Text("Date: \(exercise.date)")
                                let muscleGroups = exercise.muscleGroups ?? []
                                Text("Muscle Groups: \(String(describing: muscleGroups))")
                                Text("Weight: \(exercise.weight)")
                                Text("Reps: \(exercise.reps)")
                                Text("Sets: \(exercise.sets)")
                                Text("Total Reps: \(exercise.totalReps)")
                            }
                        }
                    }
                }
            }
        }
    }
}




struct ProgramListView_Previews: PreviewProvider {
    
    static var previews: some View {

     /*   let defaultExercise = UsersExercise(
            name: "testname",
            date: Date(),
            muscleGroups: ["Legs", "Back"],
            weight: 50,
            reps: 10,
            sets: 3,
            totalReps: 30
        )
        
        let viewModel = ProgramViewModel()
        viewModel.usersExercice = [defaultExercise]

        return ProgramListView(programViewModel: viewModel)*/
        
        ProgramListView(programViewModel: ProgramViewModel())
        
    }
}

