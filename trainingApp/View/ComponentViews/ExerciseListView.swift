//
//  ExerciseListView.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-23.
//

import SwiftUI

struct ExerciseListView: View {
    
    @ObservedObject var db = DbConnection()
    
    @State var name = ""
    @State var muscleGroups = ""
    @State var weight = ""
    @State var reps = 0
    @State var sets = 0
    
    @State var selectedProgram: UsersPrograms?
    @State var selectedExercice: UsersExercises?
 
            var body: some View {
                VStack {
                    Text("Your Exercises").font(.title).bold()
                    
                    if let userData = db.currentUserData {
                        if userData.programs.isEmpty {
                            Text("No programs yet")
                        } else {
                            ForEach(userData.programs) { program in
                                ForEach(program.exercises, id: \.id) { exercise in
                                    VStack(alignment: .leading) {
                                        Text(exercise.name)
                                       // Text(exercise.muscleGroups.joined(separator: ", "))
                                    }
                                    .padding()
                                }
                            }
                        }
                    } else {
                        Text("An unexpected error occurred")
                    }
                }
            }

}

struct ExerciseListView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseListView()
    }
}

