//
//  HomeScreen.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-07.
//

import SwiftUI
import FirebaseFirestore

struct HomeView: View {
    
    var firebaseDb = Firestore.firestore() // access to the firebase database
    
    var body: some View {
        VStack {
            Text("Home View!")
                .padding()
            Button(action: {
                firebaseDb.collection("exercice").addDocument(data: [
                    "name": "deadlift",
                    "musclegroups": ["back", "core", "trapetiuz"]
                ])
            },
                   label: {
                Text("Add to Firebase Database")
            })
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
