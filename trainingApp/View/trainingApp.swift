//
//  trainingAppApp.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-06.
//

import SwiftUI
import FirebaseCore

// Copy of appdeligate, then inside run firebase configure.
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct trainingApp: App {
    
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

    }
}
