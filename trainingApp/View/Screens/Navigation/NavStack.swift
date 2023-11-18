//
//  NavStack.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-11-12.
//

import SwiftUI

struct NavStack: View {
    @StateObject var db = DbViewModel()
    @StateObject var authViewAdapter = AuthViewAdapter()
    
    var body: some View {
        
    if let user = db.currentUser {

            NavigationStack {
                VStack {
                    SplashScreen()
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
