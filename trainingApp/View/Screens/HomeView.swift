//
//  HomeScreen.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-07.
//

import SwiftUI


struct HomeView: View {

    var body: some View {
        formCell()
    }
}


struct formCell: View {
    @State private var exerciseName = ""
    @State private var weight = 0
    @State private var reps = 0
    @State private var sets = 0

    var body: some View {
        ZStack {
            VStack {
                Text("My Exercises!").padding()

                TextField("Exercise name: ", text: $exerciseName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("Weight: ", text: Binding(
                    get: { String(weight) },
                    set: { if let newValue = Int($0) { weight = newValue } }
                ))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

                Stepper("Reps: \(reps)", value: $reps)
                    .padding()

                Stepper("Sets: \(sets)", value: $sets)
                    .padding()

                Button(action: {
                    if !exerciseName.isEmpty {
                        addToDb(exerciseName: exerciseName, weight: weight, reps: reps, sets: sets, totalReps: reps * sets)
                    }
                }) {
                    Text("Add to Firebase Database")
                }
            }
        }
    }
}




struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
