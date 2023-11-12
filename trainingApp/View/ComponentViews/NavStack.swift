//
//  NavStack.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-11-12.
//

import SwiftUI

struct NavStack: View {
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

#Preview {
    NavStack()
}
