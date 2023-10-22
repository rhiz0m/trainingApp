//
//  ContentView.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-06.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                ProgramListView()
                //CreateProgramView()
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProgramListView()
        //CreateProgramView()
    }
}
