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
            List {
                ForEach(programViewModel.programs) { program in
               
                }
            }
            Text("Building a list")
        }
    }
}

struct ProgramListView_Previews: PreviewProvider {
    static var previews: some View {
        ProgramListView(programViewModel: ProgramViewModel())
    }
}
