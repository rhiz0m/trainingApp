//
//  ListView.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-19.
//

import Foundation
import SwiftUI
import FirebaseFirestore

struct ProgramListView: View {
    @ObservedObject var programViewModel: ProgramViewModel

    var body: some View {
        VStack {
            Text("My List View").bold()

            if $programViewModel.usersPrograms.isEmpty {
                Text("Loading...")
                    .onAppear {
                       
                    }
            } else {
               /* List(programViewModel.usersPrograms, id: \.id) { program in
                    VStack(alignment: .leading) {
                        Text("Program Title: \(program.title)")

                        ForEach(program.exercises, id: \.id) { exercise in
                            ExerciseView(exercise: exercise)
                        }
                    }
                }*/
            }
        }
    }
}

struct ExerciseView: View {
    let exercise: UsersExercises

    var body: some View {
        VStack(alignment: .leading) {
            Text("Exercise Name: \(exercise.name)")
            Text("Date: \(exercise.date)")
            let muscleGroups = exercise.muscleGroups 
            Text("Muscle Groups: \(String(describing: muscleGroups))")
            Text("Weight: \(exercise.weight)")
            Text("Reps: \(exercise.reps)")
            Text("Sets: \(exercise.sets)")
            Text("Total Reps: \(exercise.totalReps)")
        }
    }
}


struct ProgramListView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ProgramListView(programViewModel: ProgramViewModel())
        
    }
}

