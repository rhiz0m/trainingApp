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
            List() {
                Button(action: {

                }) {
                    Text("test")
                }
            }
            .navigationTitle("Exercises")
            .onAppear {
           
                }
            }
        }
    }



struct ExerciseListView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseListView()
    }
}
