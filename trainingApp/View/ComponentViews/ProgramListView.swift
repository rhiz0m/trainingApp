//
//  ListView.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-19.
//

import Foundation
import SwiftUI

struct TrainingListView: View {
    @ObservedObject var programViewModel: ProgramViewModel

    var body: some View {
        VStack {
            Text("My List View").bold()
            List {
                ForEach($programViewModel.programs) { program in
                    Text(program.name)
                }
            }
        }
        .onAppear {
            programViewModel.readTrainingProgram { programs in
                programViewModel.programs = programs
            }
        }
    }
}
