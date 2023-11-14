//
//  NavStack.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-11-12.
//

import SwiftUI

struct NavStack: View {
    @StateObject var db = DbConnection()
    @StateObject var authViewAdapter = AuthViewAdapter()
    
    var body: some View {
        
    if let user = db.currentUser {

            NavigationStack {
                VStack {
                    SplashScreen() //Homeview()
                }
            }
    
    } else {
        NavigationStack {
            LoginView(db: db, authViewAdapter: authViewAdapter)
            }
        }
    }
}

#Preview {
    NavStack()
}
