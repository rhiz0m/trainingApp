//
//  trainingAppApp.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-06.
//

import SwiftUI
import SwiftData

@main
struct trainingAppApp: App {
    let container: ModelContainer = {
        let schema = Schema([TrainingNote.self])
        let container = try! ModelContainer(for: schema, configurations: [])
        return container
    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.modelContainer(for: [TrainingNote.self])
    }
}
