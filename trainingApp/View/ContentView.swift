//
//  ContentView.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-06.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var fireBaseDb = DbConnection()
    @StateObject var authViewAdapter = AuthViewAdapter()
    
    var body: some View {
        
                if let user = fireBaseDb.currentUser {
                    NavigationStack {
                        VStack {
                            HomeView()
                        }
                    }
                } else {
                    NavigationStack {
                    LoginView(database: fireBaseDb, authViewAdapter: authViewAdapter)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(authViewAdapter: AuthViewAdapter())
    }
}

// StateObject = Används när vi skapar en instans första gången. Efter det används ObservedObject.
// ObservedObject

// testar nya grejer så reverta gällande authViewAdapter
