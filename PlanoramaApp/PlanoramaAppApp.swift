//
//  PlanoramaAppApp.swift
//  PlanoramaApp
//
//  Created by Sergio Acosta on 5/11/22.
//

import SwiftUI
import Firebase
import FirebaseAuth

@main
struct PlanoramaAppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject var firestoreManager = AppViewModel()

    var body: some Scene {
        WindowGroup {
            let viewModel = AppViewModel()
            ContentView()
                .environmentObject(viewModel)
            
            
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:[UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
    
        FirebaseApp.configure()
        return true
    }
}
