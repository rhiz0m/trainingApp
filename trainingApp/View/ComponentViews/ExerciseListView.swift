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
    
    @State var selectedProgram: UsersExcercise?
    @State var selectedExercice: UsersTrainingRecord?
 
            var body: some View {
                VStack {
                    if let userData = db.currentUserData {
                        if userData.usersExercises.isEmpty {
                            Text("No programs yet")
                        } else {
                            List(userData.usersExercises) { program in
                                VStack {
                                    Text(program.exerciseName)
                                }

                                    }
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

