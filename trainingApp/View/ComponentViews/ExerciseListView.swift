//
//  ExerciseListView.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-23.
//

import SwiftUI

struct ExerciseListView: View {
    
    @ObservedObject var viewModel = DbConnection()
 
    var body: some View {
        
            List() {
                Button(action: {

                }) {
                    Text("test")
                }
            }.navigationTitle(viewModel.title)
            .onAppear {
        }
    }
}



struct ExerciseListView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseListView()
    }
}
